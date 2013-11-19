#include <stdint.h>
#include <stdlib.h>
#include "soc_api.h"


int main(int argc, char *argv[])
{
    if(argc != 3)
    {
        printf("Usage: %s <device> <address>\n", argv[0]);
        printf("Example: %s /dev/soc_miner 0x0\n", argv[0]);
        return 1;
    }
    char *ptr;
    uint32_t address = strtoul(argv[2], &ptr, 16);
    //printf("reading from addr: 0x%x\n", address);
    //uint32_t value   = strol(argv[2], &ptr, 0);
    uint32_t value = 0xbabeface;
    //printf("addr: 0x%x value: 0x%x\n", address,value);

    int fileDesc_ = open(argv[1], 0);
    if (fileDesc_ < 0)
    {
        printf("Can't open device file: %s\n", argv[1]);
        return 4;
    }
    uint32_t asicId = 0;
    int32_t res;
    res = socStartup(fileDesc_, asicId,NULL,0);
    if(res) {
        printf("error in startup\n");
        goto exit;
    }
    res = socReadRegister32(fileDesc_, 0,address,1, &value);
    if(res) {
        printf("error in readRegister32");
        goto exit;
    }
    printf("@0x%x: 0x%x\n", address,value);
    res = socStop(fileDesc_, asicId);
    if(res) {
        printf("error in stop");
        goto exit;
    }

exit:
    if (fileDesc_) close(fileDesc_);
   
    return res;
}

