FILES = user.c soc_api.c
all: user socreadregister32 socwriteregister32 mem

user: user.c
	arm-xilinx-linux-gnueabi-gcc -Wall -o user user.c

socreadregister32: socreadregister32.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../ -o socreadregister32 socreadregister32.c soc_api.c

socwriteregister32: socwriteregister32.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../ -o socwriteregister32 socwriteregister32.c soc_api.c
mem: mem.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../ -o mem mem.c
