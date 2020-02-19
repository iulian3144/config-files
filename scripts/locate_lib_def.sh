#!/bin/bash
#
# file: locate_lib_def.sh
#
# This utility helps locating symbol definitions in library files (lib or dll).
# It works by searching for files ending in lib or dll in a specified directory
# ($1) with the option to pass an additional include pattern for files ($3).
# After the file list is built, it's content is passed to xargs which runs
# a command for each line - in our case, a function that searches for the given
# symbol string ($2) in the output of 'dumpbin -exports'.
# The file/s where the symbol/s was found will be displayed and followed by the
# the symbols on individual lines. Each line containing the symbol is prepended
# by an index.
# Exact matches will be highlighted with a green foreground.


ARGV=("$@")

# Specifies whether the script should use a demangler (demangler.com) to unmangle
# C++ names.
use_demangler='N'

if [[ -t 1 && -t 2 ]] ; then
    export C_RED="\033[0;31m"
    export C_GREEN="\033[0;32m"
    export C_MAGENTA="\033[0;35m"
    export C_RESET="\033[0m"

    # Erase terminal line - clear from cursor to the end of line
    export TERM_EL="\033[K"
fi

parse_arguments() {
    if ! [[ ${#ARGV[@]} -eq 2 || ${#ARGV[@]} -eq 3 ]] ; then
        usage
        error_exit "See usage!"
    fi
    export WDIR="${ARGV[0]}"
    export SYMBOL="${ARGV[1]}"
    export inc_pattern="${ARGV[2]:-*}"

    # echo "Working directory: $WDIR"
    # echo " Symbol to search: $SYMBOL"
    [[ -d "$WDIR" ]] || error_exit "Please provide a valid directory!"
    [[ -n "$SYMBOL" ]] || error_exit "Please provide a valid string!"

}


initialize() {
    echo -n "Initializing..." >&2
    declare vs_path
    declare tmpfile="$(mktemp)"
    trap "rm -f $tmpfile" SIGINT EXIT
    export results_file="$(mktemp)"
    vs_path="$(reg query 'HKLM\SOFTWARE\WOW6432Node\Microsoft\VisualStudio\SxS\VS7' -s -f '15.0' | perl -ne 's/^.*(?=c:)//i and print')"
    find "$vs_path/VC/Tools" -iname "dumpbin*" | grep "Hostx64" > "$tmpfile"
    export dumpbin_x86="$(grep x86 "$tmpfile" | head -1)"
    export dumpbin_x64="$(grep x64 "$tmpfile" | head -1)"

    export -f locate_symbol
    export -f print_red
    export -f print_green
    export -f print_magenta

    if [[ "$use_demangler" = 'Y' ]] ; then
        # check that demangler works as expected
        declare test_input="hello_world"
        declare test_output
        test_output="$(curl --data-urlencode input="$test_input" 'https://demangler.com/raw' 2>/dev/null)"
        if [[ "$test_output" = "$test_input" ]] ; then
            use_demangler='Y'
        else
            use_demangler='N'
        fi
    fi

    # echo "      dumpbin_x86: $dumpbin_x86"
    # echo "      dumpbin_x64: $dumpbin_x64"
    rm "$tmpfile"
}


sym_demangle() {
    if [[ "$use_demangler" = 'Y' ]] ; then
        curl --data-urlencode input@- 'https://demangler.com/raw' 2>/dev/null
    else
        cat
    fi
}


print_red() {
    echo -e "${C_RED}$@${C_RESET}"
}

print_green() {
    echo -e "${C_GREEN}$@${C_RESET}"
}

print_magenta() {
    echo -e "${C_MAGENTA}$@${C_RESET}"
}


locate_symbol() {
    declare lib="$1"
    declare tmp_res="$(mktemp)"
    echo -ne "${TERM_EL}Scanning $lib...\r"
    if "$dumpbin_x64" -exports "$lib" | grep -i "$SYMBOL" > "$tmp_res" ; then
        {
            print_magenta "$lib"
            perl -pne 's/^\s+//' "$tmp_res" |
                perl -e 'while(<STDIN>) {/\b$ARGV[0]\b/i and ( chomp and $_="\033[0;32m$_\033[0m\n"); print;}' $SYMBOL | cat -n
        } >> "$results_file"
    fi
    rm -f "$tmp_res"
}


find_symbol() {
    library_list="$(mktemp)"
    trap "rm -f $library_list $results_file" SIGINT EXIT

    find "$WDIR" \( -iname "*.lib" -or -iname "*.dll" \) -and -iname "$inc_pattern" > "$library_list"
    export FILES_COUNT=$(wc -l "$library_list" | cut -d' ' -f1)
    NUM_THREADS=4
    if command -v nproc >/dev/null ; then
        NUM_THREADS=$(nproc)
    fi

    start=`date +%s`

    cat "$library_list" | xargs -L 1 -I '{}' -P "$NUM_THREADS" sh -c 'locate_symbol "{}"'
    echo -ne "${TERM_EL}"

    end=`date +%s`
    runtime=$((end-start))

    if [[ -s "$results_file" ]] ; then
        cat "$results_file" | sym_demangle
        echo -e "${TERM_EL}Scanned $FILES_COUNT files in $runtime seconds."
    else
        echo -e "\nSymbol was not found."
    fi
}


error_exit() {
    echo "$@"
    exit 1
}


usage() {
    echo "Usage:"
    echo "$0 <DIR> <SYM> [include_pattern]"
    echo "  DIR - directory to search for libraries"
    echo "  SYM - symbol to search for"
    echo "  include_pattern - optional include pattern"
    echo "Note: string (symbol) search is case insensitive"
}


main() {
    {
        parse_arguments
        { time initialize; } 2>/dev/null
    } >&2
    find_symbol
}

main
