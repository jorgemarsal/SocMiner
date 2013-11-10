#include "soc_miner_ioctl.h"

int32_t startupIoctl(IoctlArgument ioctlArgument)
{
    char        data[PARAMETER_LEN];
    int32_t rc;

    if (ioctlArgument.data != 0)
    {
        if (ioctlArgument.datalen > PARAMETER_LEN)
        {
            printk(KERN_ERR "AAD Startup(0x%x): invalid datalen\n", ioctlArgument.par);
            return -EINVAL;
        }

        if (copy_from_user((void*)data, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
        {
            printk(KERN_ERR "AAD Startup(0x%x): copy_from_user failed\n", ioctlArgument.par);
            return -EFAULT;
        }

        rc = socStartup(ioctlArgument.par, data, ioctlArgument.datalen,0);
    }
    else
    {
        rc = socStartup(ioctlArgument.par, 0, 0,0);
    }
    printk(KERN_DEBUG "inside startupIoctl\n");
    rc = socStartup(ioctlArgument.par, 0, 0,0);
    return (rc == 0) ? 0 : -EFAULT;
}   /* startupIoctl */

int32_t stopIoctl(IoctlArgument ioctlArgument)
{
    int32_t rc;

    rc = socStop(ioctlArgument.par);
    return (rc == 0) ? 0 : -EFAULT;

}   /* stopIoctl */

int32_t readRegister32Ioctl(IoctlArgument ioctlArgument)
{
    int             r = 0;
    int             freeit;
    TransferBlock   reg;
    uint32_t        i;
    uint32_t        loops;
    uint32_t        nreg;
    uint32_t        size;
    uint8_t *       pt;
    uint32_t        lreg[DRIVER_MAX_LOCAL_REGS];

    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        printk(KERN_ERR "%s: data sizes don't match: datalen = %d, sizeof() = %d\n",
               __FUNCTION__, ioctlArgument.datalen, sizeof(TransferBlock));
        return -EINVAL;
    }

    if (copy_from_user((void *) &reg,
                       (void *) ioctlArgument.data,
                       ioctlArgument.datalen) != 0)
    {
        printk(KERN_ERR "%s: copy_from_user failed\n",
               __FUNCTION__);
        return -EFAULT;
    }


    if (reg.count > DRIVER_MAX_LOCAL_REGS)
    {
        size = (reg.count * 4 > DRIVER_MAX_BUFFER_SIZE) ? DRIVER_MAX_BUFFER_SIZE : reg.count * 4;
        //pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
        pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
        if (pt == 0)
        {

            return -ENOMEM;
        }
        freeit = 1;
    }
    else
    {
        size   = reg.count * 4;
        pt     = (uint8_t *)&lreg[0];
        freeit = 0;
    }

    loops = (reg.count * 4 + size - 1) / size;
    for (i = 0; i < loops; i++)
    {
        nreg = (size > reg.count * 4) ? reg.count : size / 4;
        if (socReadRegister32 (ioctlArgument.par, reg.address, nreg, (uint32_t*)pt) != 0)
        {
            r = -EFAULT;
            break;
        }
        if (copy_to_user ((void*)reg.value, (void*)pt, nreg * 4))
        {
            r = -EFAULT;
            break;
        }
        reg.address += nreg * 4;
        reg.value   += nreg * 4;
        reg.count   -= nreg;
    }

    if (freeit)
    {
        //kfree (pt);
        kfree(pt);
    }
    return r;

}   /* readRegister32Ioctl */

int32_t writeRegister32Ioctl(IoctlArgument ioctlArgument)
{
    int             r = 0;
    int             freeit;
    TransferBlock   reg;
    uint32_t        i;
    uint32_t        loops;
    uint32_t        nreg;
    uint32_t        size;
    uint8_t *       pt;
    uint32_t        lreg[DRIVER_MAX_LOCAL_REGS];

    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        return -EINVAL;
    }
    if (copy_from_user((void*)&reg, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
    {
        return -EFAULT;
    }

    if (reg.count > DRIVER_MAX_LOCAL_REGS)
    {
        size = (reg.count * 4 > DRIVER_MAX_BUFFER_SIZE) ? DRIVER_MAX_BUFFER_SIZE : reg.count * 4;
        //pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
        pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
        if (pt == 0)
        {

            return -ENOMEM;
        }
        freeit = 1;
    }
    else
    {
        size   = reg.count * 4;
        pt     = (uint8_t *)&lreg[0];
        freeit = 0;
    }

    loops = (reg.count * 4 + size - 1) / size;
    for (i = 0; i < loops; i++)
    {
        nreg = (size > reg.count * 4) ? reg.count : size / 4;
        if (copy_from_user ((void*)pt, (void*)reg.value, nreg * 4))
        {
            r =-EFAULT;
            break;
        }
        if (socWriteRegister32 (ioctlArgument.par, reg.address, nreg, (uint32_t*)pt) != 0)
        {
            r =-EFAULT;
            break;
        }
        reg.address += nreg * 4;
        reg.value   += nreg * 4;
        reg.count   -= nreg;
    }

    if (freeit)
    {
        //kfree (pt);
        kfree(pt);
    }
    return r;

}   /* writeRegister32Ioctl */

int32_t readMemoryIoctl(IoctlArgument ioctlArgument)
{
    TransferBlock   mem;
    uint32_t        i;
    uint32_t        loops;
    uint32_t        nbyte;
    uint32_t        size;
    uint8_t *       pt;


    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        return -EINVAL;
    }
    if (copy_from_user((void*)&mem, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
    {
        return -EFAULT;
    }

    size = (mem.count > DRIVER_MAX_BUFFER_SIZE) ? DRIVER_MAX_BUFFER_SIZE : mem.count;
    if (size == 0)
    {
        return -EINVAL;
    }
    pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
    if (pt == 0)
    {

        return -ENOMEM;
    }
    loops = (mem.count + size - 1) / size;
    for (i = 0; i < loops; i++)
    {
        nbyte = (size > mem.count) ? mem.count : size;
        if (socReadMemory(ioctlArgument.par, mem.address, nbyte, pt) != 0)
        {
            kfree (pt);
            return -EFAULT;
        }
        if (copy_to_user((void*)mem.value, (void*)pt, nbyte))
        {
            kfree (pt);
            return -EFAULT;
        }
        mem.address += nbyte;
        mem.value += nbyte;
        mem.count -= nbyte;
    }
    kfree (pt);
    return 0;

}   /* readMemoryIoctl */

int32_t writeMemoryIoctl(IoctlArgument ioctlArgument)
{
    TransferBlock   mem;
    uint32_t        i;
    uint32_t        loops;
    uint32_t        nbyte;
    uint32_t        size;
    uint8_t *       pt;
    uint32_t        remaining;

    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        return -EINVAL;
    }
    if (copy_from_user((void*)&mem, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
    {
        return -EFAULT;
    }

    size = (mem.count > DRIVER_MAX_BUFFER_SIZE) ? DRIVER_MAX_BUFFER_SIZE : mem.count;
    pt = (uint8_t*)kmalloc (size, GFP_KERNEL);
    if (pt == 0)
    {

        return -ENOMEM;
    }
    loops = (mem.count + size - 1) / size;
    for (i = 0; i < loops; i++)
    {
        nbyte     = (size > mem.count) ? mem.count : size;
        remaining = copy_from_user((void*)pt, (void*)mem.value, nbyte);

        if (remaining != 0)
        {

            kfree (pt);
            return -EFAULT;
        }

        if (socWriteMemory(ioctlArgument.par, mem.address, nbyte, pt) != 0)
        {
            kfree (pt);
            return -EFAULT;
        }
        mem.address += nbyte;
        mem.value += nbyte;
        mem.count -= nbyte;
    }
    kfree (pt);
    return 0;

}   /* writeMemoryIoctl */

int32_t dmaReadIoctl(IoctlArgument ioctlArgument)
{
    TransferBlock   mem;


    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        return -EINVAL;
    }
    if (copy_from_user((void*)&mem, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
    {
        return -EFAULT;
    }


    if (socDmaRead(ioctlArgument.par, mem.address, mem.count, (void*)mem.value, mem.endian) != 0)
    {
        return -EFAULT;
    }
    return 0;

}   /* dmaReadIoctl */

int32_t dmaWriteIoctl(IoctlArgument ioctlArgument)
{
    TransferBlock   mem;


    if (ioctlArgument.datalen != sizeof(TransferBlock))
    {
        return -EINVAL;
    }
    if (copy_from_user((void*)&mem, (void*)ioctlArgument.data, ioctlArgument.datalen) != 0)
    {
        return -EFAULT;
    }


    if (socDmaWrite(ioctlArgument.par, mem.address, mem.count, (void*)mem.value, mem.endian) != 0)
    {
        return -EFAULT;
    }
    return 0;

}   /* dmaWriteIoctl */
