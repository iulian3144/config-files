execute pathogen#infect()
filetype plugin indent on
syntax on
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set number
set autoindent
set shiftwidth=4
set tabstop=4
set cursorline
set linebreak
set hlsearch
set splitbelow
set splitright
set listchars=tab:––,trail:·,extends:>,precedes:<,nbsp:·
set list

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-L>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


augroup cpp
	au BufNewFile *.c 0r ~/.vim/skeletons/c.skel
	au BufNewFile *.cpp 0r ~/.vim/skeletons/c.skel
augroup end

augroup shell
	au BufNewFile *.sh 0r ~/.vim/skeletons/sh.skel
augroup end


autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
	"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
	"Escaping out of the string
		return "\<Right>"
	else
	"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf
