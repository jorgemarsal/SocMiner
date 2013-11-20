#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "soc_api.h"
//#include "FileWriter.h"
//#include "FileReader.h"
//#include "PreciseTimer.h"

int main(int argc, char *argv[])
{
    if(argc != 5)
    {
        printf("Usage: %s <device> <address> <size> <dump_file>\n", argv[0]);
        printf("Example: %s /dev/soc_miner 0x0 8 test.bin\n", argv[0]);
        return 1;
    }
    int i;
    const uint32_t size = atoi(argv[3]);
    char *ptr;
    uint32_t address = strtoul(argv[2], &ptr, 0);
    //uint32_t value   = strtol(argv[2], &ptr, 0);
    printf("addr: 0x%x binary_file: %s dump_file: %s\n", address,argv[3], argv[4]);

    int fileDesc_ = open(argv[1], 0);
    if (fileDesc_ < 0)
    {
        printf("Can't open device file: %s\n", argv[1]);
        return 4;
    }
    uint32_t asicId = 0;
    int32_t res;
    res = socStartup(fileDesc_, asicId,NULL,0);
    if(res)
    {
        printf("error in startup\n");
        if (fileDesc_) close(fileDesc_);
        return res;
    }
    uint32_t bytesInAPage = getpagesize();

    printf("bytesInAPage: %d\n", bytesInAPage);
    //uint8_t *buffer = (uint8_t *)malloc(size);
    uint8_t *buffer;
    posix_memalign((void **)&buffer, bytesInAPage, size);
    if(!buffer) {
	    printf("unable to allocate buffer of size %d\n", size);
	    return 10;
    }
    for(i=0; i < 8; i++) buffer[i] = 0xff;
    //PreciseTimer timer;
    res = socDmaRead(fileDesc_, 0,address,size, buffer,0);
    if(res)
    {
        printf("error in socdmaread\n");
        if (fileDesc_) close(fileDesc_);
        return res;
    }
    
    //res = 0;
    //double seconds = timer.elapsed();
    //printf("dma -> %f Mbytes/s\n", size/seconds/1024.0/1024.0);
    
    uint32_t *ptr2 = (uint32_t *)buffer;
    for(i = 0; i < size/4; i++) printf("0x%x\n",ptr2[i]);

    res = socStop(fileDesc_, asicId);
    if (fileDesc_) close(fileDesc_);
    if(buffer) free(buffer);
    return 0;
}

