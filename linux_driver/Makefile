# Cross compiler makefile for FIFO DMA example
KERN_SRC=/p/iss/users/jorgem/bitcoin/linux-xlnx/
#obj-m := xfifo_dma.o
#obj-m := hello.o
obj-m := soc_miner.o

#ARCH=arm
all:
	make -C $(KERN_SRC) ARCH=arm M=`pwd` modules
clean:
	make -C $(KERN_SRC) ARCH=arm M=`pwd=` clean
