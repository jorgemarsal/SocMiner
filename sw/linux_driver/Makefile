# Cross compiler makefile for FIFO DMA example
KERN_SRC=../../../linux-xlnx/
#obj-m := xfifo_dma.o
#obj-m := hello.o
obj-m := soc.o
soc-y := soc_miner.o soc_miner_ioctl.o

#ARCH=arm
all:
	make -C $(KERN_SRC) CROSS_COMPILE=arm-xilinx-linux-gnueabi- ARCH=arm M=`pwd` modules
clean:
	make -C $(KERN_SRC) CROSS_COMPILE=arm-xilinx-linux-gnueabi- ARCH=arm M=`pwd=` clean
