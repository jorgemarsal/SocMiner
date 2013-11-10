#include <stdint.h>
#include <stdlib.h>
#include "soc_api.h"


int main(int argc, char *argv[])
{
    if(argc != 4)
    {
        printf("Usage: %s <device> <address> <value>\n", argv[0]);
        printf("Example: %s /dev/soc_miner 0x4 0xbabeface\n", argv[0]);
        return 1;
    }
    char *ptr;
    uint32_t address = strtoul(argv[2], &ptr, 16);
    uint32_t value   = strtoul(argv[3], &ptr, 16);
    printf("addr: 0x%x value: 0x%x\n", address,value);

    int fileDesc_ = open(argv[1], 0);
    if (fileDesc_ < 0)
    {
        printf("Can't open device file: %s\n", argv[1]);
        return 4;
    }
    uint32_t asicId = 0;
    int32_t res;
    uint32_t readValue = 0xbabeface;
    res = socStartup(fileDesc_, asicId,NULL,0);
    if(res) {
        printf("Error in startup!\n");
        goto exit;
    }
    res = socWriteRegister32(fileDesc_, 0,address,1, &value);
    if(res) {
        printf("Error in write register!\n");
        goto exit;
    }
    res = socReadRegister32(fileDesc_, 0,address,1, &readValue);
    if(res) {
        printf("Error in read register!\n");
        goto exit;
    }
    printf("@0x%x: 0x%x\n", address,readValue);
    res = socStop(fileDesc_, asicId);
    if(res) {
        printf("Error in stop!\n");
        goto exit;
    }

exit:
    if (fileDesc_) close(fileDesc_);
   
    return res;
}

