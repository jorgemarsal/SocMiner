#ifndef __OBELIX_API_H__
#define __OBELIX_API_H__

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <stdint.h>

#include "soc_miner_defines.h"

int32_t socReadRegister32 (int32_t handler, int32_t asicId, uint32_t address, uint32_t nreg, uint32_t * value);
int32_t socWriteRegister32 (int32_t handler, int32_t asicId, uint32_t address, uint32_t nreg, uint32_t * value);
int32_t socReadMemory (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value);
int32_t socWriteMemory (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value);
int32_t socStartup (int32_t handler,int32_t asicId, void *param, uint32_t paramLen);
int32_t socStop (int32_t handler, int32_t asicId);

int32_t socDmaWrite (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian);
int32_t socDmaRead (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian);
#endif //__OBELIX_API_H__
