all: libhello.so app

app: app.c libhello.so
	arm-xilinx-linux-gnueabi-gcc -Wall -o app app.c -lhello -L.

libhello.so: lib.c
	arm-xilinx-linux-gnueabi-gcc -Wall -shared -fPIC -o libhello.so lib.c

