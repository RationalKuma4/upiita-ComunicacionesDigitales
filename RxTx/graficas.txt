import atexit
import serial
from drawnow import *

values = []
values1 = []
values2 = []
plt.ion()
plt.close("all")
cnt = 0
serialArduino = serial.Serial('COM3', 9600)

for i in range(0, 30):
    values.append(0)
    values1.append(0)
    values2.append(0)


def plotValues():
    plt.subplot(3, 1, 1)
    plt.xlabel('t')
    plt.ylabel('v')
    plt.plot(values, 'rx-', label='Potenciometro 1')
    # plt.legend(loc='upper right')
    plt.grid(True)
    plt.title('Potenciometro 1')

    plt.subplot(3, 1, 2)
    plt.xlabel('t')
    plt.ylabel('v')
    plt.plot(values1, 'gx-', label='Potenciometro 2')
    # plt.legend(loc='upper right')
    plt.grid(True)
    plt.title('Potenciometro 2')

    plt.subplot(3, 1, 3)
    plt.xlabel('t')
    plt.ylabel('v')
    plt.plot(values2, 'bx-', label='Potenciometro 1')
    # plt.legend(loc='upper right')
    plt.grid(True)
    plt.title('Potenciometro 3')


def doAtExit():
    serialArduino.close()
    print("Close serial")
    print("serialArduino.isOpen() = " + str(serialArduino.isOpen()))


atexit.register(doAtExit)

print("serialArduino.isOpen() = " + str(serialArduino.isOpen()))

while True:
    while (serialArduino.inWaiting() == 0):
        pass
    valueRead = serialArduino.readline(500)
    vas = str(valueRead)
    vass = vas.replace("\\n", "").replace("\\r", "").replace("b", "").replace("\'", "").split(",")
    try:
        pone = int(vass[0])
        ptwo = int(vass[1])
        pthre = int(vass[2])
        values.append(pone)
        values.pop(0)
        values1.append(ptwo)
        values1.pop(0)
        values2.append(pthre)
        values2.pop(0)
        drawnow(plotValues)
    except ValueError:
        print("Invalido!")
