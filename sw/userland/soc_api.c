#include "soc_api.h"

int32_t socReadRegister32 (int32_t handler, int32_t asicId, uint32_t address, uint32_t nreg, uint32_t * value)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = (int32_t)sizeof(transferBlock);

    //printf("obelix_api::readRegister32 par:%d data:%lu datalen: %d\n", ioctlArgument.par, ioctlArgument.data, ioctlArgument.datalen);
    transferBlock.address = address;
    transferBlock.count   = nreg;
    transferBlock.value   = (uint64_t) ((unsigned long) value);

    rc = ioctl (handler, SOC_READ_REGISTER32, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socReadRegister32 */

int32_t socWriteRegister32 (int32_t handler, int32_t asicId, uint32_t address, uint32_t nreg, uint32_t * value)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = (int32_t)sizeof(transferBlock);

    transferBlock.address = address;
    transferBlock.count   = nreg;
    transferBlock.value   = (uint64_t) ((unsigned long) value);

    rc = ioctl (handler, SOC_WRITE_REGISTER32, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socWriteRegister32 */

int32_t socReadMemory (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = (int32_t)sizeof(transferBlock);

    transferBlock.address = address;
    transferBlock.count   = nbyte;
    transferBlock.value   = (uint64_t) ((unsigned long) value);

    rc = ioctl (handler, SOC_READ_MEMORY, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socReadMemory */

int32_t socWriteMemory (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = (int32_t)sizeof(transferBlock);

    transferBlock.address = address;
    transferBlock.count   = nbyte;
    transferBlock.value   = (uint64_t) ((unsigned long) value);

    rc = ioctl (handler, SOC_WRITE_MEMORY, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socWriteMemory */

int32_t socStartup (int32_t handler,int32_t asicId, void *param, uint32_t paramLen)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    //int32_t         handler = getHandler (asicId);

    if (paramLen > PARAMETER_LEN)
    {
        return -1;
    }

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) param);
    ioctlArgument.datalen = paramLen;

    //printf("calling startup ioctl\n");
    rc = ioctl (handler, SOC_STARTUP, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socStartup */
/*---------------------------------------------------------------------------*/



int32_t socStop (int32_t handler, int32_t asicId)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par = asicId;
    rc = ioctl (handler, SOC_STOP, &ioctlArgument);


    return (rc < 0) ? -1 : 0;

}   /* socStop */

int32_t socDmaRead (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian)
{
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = sizeof(transferBlock);

    transferBlock.address = address;
    transferBlock.count   = nbyte;
    transferBlock.value   = (uint64_t) ((unsigned long) value);
    transferBlock.endian  = endian;

    rc = ioctl (handler, SOC_DMA_READ, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socDmaRead */

int32_t socDmaWrite (int32_t handler, int32_t asicId, uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian)
{
    int i;
    printf("addr of buffer is 0x%x\n", (uint32_t)value);
    int32_t         rc;
    IoctlArgument   ioctlArgument;
    TransferBlock   transferBlock;
    //int32_t         handler = getHandler (asicId);

    ioctlArgument.par     = asicId;
    ioctlArgument.data    = (uint64_t) ((unsigned long) &transferBlock);
    ioctlArgument.datalen = sizeof(transferBlock);

    transferBlock.address = address;
    transferBlock.count   = nbyte;
    transferBlock.value   = (uint64_t) ((unsigned long) value);
    transferBlock.endian   = endian;

    uint8_t *newptr = (uint8_t *)transferBlock.value;
    for(i = 0; i < 8; i++) {
        printf("0x%02x\n", newptr[i]);
    }
    for(i = 0; i < 8; i++) {
        printf("0x%02x\n", value[i]);
    }

    rc = ioctl (handler, SOC_DMA_WRITE, &ioctlArgument);
    return (rc < 0) ? -1 : 0;

}   /* socDmaWrite */


