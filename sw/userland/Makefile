FILES = user.c soc_api.c
all: user socreadregister32 socwriteregister32 mem socreaddma socwritedma

user: user.c
	arm-xilinx-linux-gnueabi-gcc -Wall -o user user.c

socreadregister32: socreadregister32.c soc_api.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../linux_driver -o socreadregister32 socreadregister32.c soc_api.c

socwriteregister32: socwriteregister32.c soc_api.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../linux_driver -o socwriteregister32 socwriteregister32.c soc_api.c

socreaddma: socreaddma.c soc_api.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../linux_driver -o socreaddma socreaddma.c soc_api.c

socwritedma: socwritedma.c soc_api.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../linux_driver -o socwritedma socwritedma.c soc_api.c

mem: mem.c
	arm-xilinx-linux-gnueabi-gcc -Wall -I../linux_driver -o mem mem.c
