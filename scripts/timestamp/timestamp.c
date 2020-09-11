#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h>


static void usage(void) {
    printf("Print timestamp for each line of input.\n"
    "You can use this by piping another's command output to it, e.g.:\n"
    "command | ./timestamp\n");
}


int main(int argc, char *argv[]) {
    ssize_t ret;
    size_t len = 0;
    char *line = NULL;

    struct timeval first_timestamp;
    struct timeval curr_timestamp;
    double timestamp = 0.0;

    if (argc > 1)
    {
        if (strcmp(argv[1], "-h") == 0 ||
            strcmp(argv[1], "--help") == 0) {
            usage();
            return 0;
        }
    }

    gettimeofday(&first_timestamp, NULL);
    while((ret = getline(&line, &len, stdin)) != -1) {
        gettimeofday(&curr_timestamp, NULL);
        timersub(&curr_timestamp, &first_timestamp, &curr_timestamp);
        timestamp = (double)curr_timestamp.tv_sec + (double)curr_timestamp.tv_usec / 1000000;
        printf("[%7.2f] %s", timestamp, line);
    }

    free(line);

    return 0;
}
