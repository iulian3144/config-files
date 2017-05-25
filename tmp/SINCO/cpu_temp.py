import platform
import serial
import time
import glob
import os


def main():
    os = platform.system()
    ser = None
    cpu_temp = [0, 0]

    port = glob.glob("/dev/ttyACM?")[0]
    temp_files = sorted(glob.glob("/sys/class/hwmon/hwmon2/temp[2-3]_input"))

    if os == "Windows":
        ser = serial.Serial("COM3", 115200)
    elif os == "Linux":
        ser = serial.Serial(port, 115200)
    else:
        raise ValueError("Unsupported OS")

    print("Sending data to arduino...")
    while True:
        try:
            i = 0
            for f in temp_files:
                fd = open(f, 'r')
                temp = fd.read()
                cpu_temp[i] = (int(temp)/1000)
                # print("CPU%d: %d" %(i, int(temp)/1000))
                ser.write(chr(i))
                ser.write(chr(cpu_temp[i]))
                time.sleep(0.01)
                i += 1
            time.sleep(0.5)
        except KeyboardInterrupt:
            break
    print("\rDone!")

if __name__ == "__main__":
    main()