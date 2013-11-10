#ifndef __SOC_MINER_IOCTL_H__
#define __SOC_MINER_IOCTL_H__

#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <asm/uaccess.h>

#include "soc_miner_defines.h"
#include "soc_miner.h"

//#define SOC_MAX_ASIC_NAME_LEN  80
//#define SOC_PARAMETER_LEN      (100*4)

#define DRIVER_MAX_BUFFER_SIZE   (128*1024)
#define DRIVER_MAX_LOCAL_REGS    (128)
#define PARAMETER_LEN      (100*4)

typedef u64 uint64_t ;
typedef s64 int64_t ;
typedef u32 uint32_t ;
typedef s32 int32_t ;
typedef u16 uint16_t ;
typedef s16 int16_t ;
typedef u8 uint8_t ;
typedef s8 int8_t ;


 int32_t undefinedIoctl(IoctlArgument ioctlArgument);
 int32_t declareIoctl(IoctlArgument ioctlArgument);
 int32_t startupIoctl(IoctlArgument ioctlArgument);
 int32_t stopIoctl(IoctlArgument ioctlArgument);
 int32_t resetIoctl(IoctlArgument ioctlArgument);
 int32_t readRegister8Ioctl(IoctlArgument ioctlArgument);
 int32_t readRegister16Ioctl(IoctlArgument ioctlArgument);
 int32_t readRegister32Ioctl(IoctlArgument ioctlArgument);
 int32_t writeRegister8Ioctl(IoctlArgument ioctlArgument);
 int32_t writeRegister16Ioctl(IoctlArgument ioctlArgument);
 int32_t writeRegister32Ioctl(IoctlArgument ioctlArgument);
 int32_t readMemoryIoctl(IoctlArgument ioctlArgument);
 int32_t writeMemoryIoctl(IoctlArgument ioctlArgument);
 int32_t dmaReadIoctl(IoctlArgument ioctlArgument);
 int32_t dmaWriteIoctl(IoctlArgument ioctlArgument);
 int32_t dmaReadToAsicIoctl(IoctlArgument ioctlArgument);
 int32_t dmaWriteFromAsicIoctl(IoctlArgument ioctlArgument);
 int32_t interruptPrepareIoctl(IoctlArgument ioctlArgument);
 int32_t interruptWaitIoctl(IoctlArgument ioctlArgument);
 int32_t fillMemoryIoctl(IoctlArgument ioctlArgument);
 int32_t readRegisterSetIoctl(IoctlArgument ioctlArgument);
 int32_t writeRegisterSetIoctl(IoctlArgument ioctlArgument);
 int32_t messageIoctl(IoctlArgument ioctlArgument);
 int32_t statisticsIoctl(IoctlArgument ioctlArgument);
 int32_t getParameterIoctl(IoctlArgument ioctlArgument);
 int32_t multipleDmaWriteIoctl(IoctlArgument ioctlArgument);
 int32_t interruptCancelIoctl(IoctlArgument ioctlArgument);

#if 0
#define atlasAsicReadRegister32 obelixReadRegister32
#define atlasAsicWriteRegister32 obelixWriteRegister32
#define atlasAsicWriteMemory obelixWriteMemory
#define atlasAsicReadMemory obelixReadMemory
#define atlasAsicStartup obelixStartup
#define atlasAsicStop obelixStop
#define atlasAsicDmaWrite obelixDmaWrite
#define atlasAsicDmaRead obelixDmaRead
#endif
#endif // __SOC_MINER_IOCTL_H__
