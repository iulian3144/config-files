import sys
import time

TIMESTAMP_FORMAT = "[{:7.2f}] "

def main():
    try:
        first_timestamp = time.perf_counter()
        print(TIMESTAMP_FORMAT.format(0) + "begin")
        for ix, line in enumerate(sys.stdin):
            # we want the time difference
            curr_timestamp = time.perf_counter() - first_timestamp

            print(TIMESTAMP_FORMAT.format(curr_timestamp) + f"{line}", end="")
    except KeyboardInterrupt as e:
        return
    finally:
        curr_timestamp = time.perf_counter() - first_timestamp
        print(TIMESTAMP_FORMAT.format(curr_timestamp) + "end")


if __name__ == '__main__':
    main()
