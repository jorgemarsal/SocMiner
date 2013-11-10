#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/platform_device.h>
#include <linux/seq_file.h>
#include <linux/proc_fs.h>
#include <linux/err.h>
#include <linux/slab.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/dma-mapping.h>
#include <linux/dmapool.h>

//#include <linux/mutex.h>
#include <linux/semaphore.h>

#include <linux/sched.h>
#include <linux/wait.h>
#include <asm/uaccess.h>
#include <asm/sizes.h>
#include <asm/dma.h>
#include <asm/io.h>
#include <linux/of.h>

#include "soc_miner.h"
#include "soc_miner_ioctl.h"


/* Define debugging for use during our driver bringup */
#undef PDEBUG
#define PDEBUG(fmt, args...) printk(KERN_INFO fmt, ## args)



#define SOC_MINER_MAJOR 234U
#define SOC_MINER_MINOR 0
#define MODULE_NAME "soc_miner"
#define SOC_DEVICE_NAME        "soc_miner"
//#define SOC_FULL_DEVICE_NAME   "/dev/soc_miner"


//module_param(SOC_MINER_MAJOR, int, 0);


struct soc_miner_dev {
        dev_t devno;
        //struct mutex mutex;
        struct semaphore sem; /* mutual exclusion semaphore */
        struct cdev cdev;
        struct platform_device *pdev;

        /* Hardware device constants */
        u32 dev_physaddr;
        void *dev_virtaddr;
        u32 dev_addrsize;

        /* Driver reference counts */
        u32 writers;

        int busy;

        /* Driver statistics */
        u32 bytes_written;
        u32 writes;
        u32 opens;
        u32 closes;
        u32 errors;
};

/*
 * variables
 */

struct soc_miner_dev *soc_miner_dev;


/*
 * ioctls
 */
int32_t (*ioctlFunctionArray[])(IoctlArgument ioctlArgument) =
{

    0, //declareIoctl,                      // 0
    startupIoctl,                      // 1
    stopIoctl,                         // 2
    0, //readRegister8Ioctl,                // 3
    0, //readRegister16Ioctl,               // 4
    readRegister32Ioctl,               // 5
    0, //writeRegister8Ioctl,               // 6
    0, //writeRegister16Ioctl,              // 7
    writeRegister32Ioctl,              // 8
    readMemoryIoctl,                   // 9
    writeMemoryIoctl,                  // 10
    dmaReadIoctl,                      // 11
    dmaWriteIoctl,                     // 12
    0, //interruptPrepareIoctl,             // 13
    0, //interruptWaitIoctl,                // 14
    0, //fillMemoryIoctl,                   // 15
    0, //readRegisterSetIoctl,              // 16
    0, //writeRegisterSetIoctl,             // 17
    0, //undefinedIoctl,                    // 18
    0, //undefinedIoctl,                    // 19
    0, //undefinedIoctl,                    // 20
    0, //undefinedIoctl,                    // 21
    0, //dmaReadToAsicIoctl,                // 22
    0, //dmaWriteFromAsicIoctl,             // 23
    0, //messageIoctl,                      // 24
    0, //statisticsIoctl,                   // 25
    0, //getParameterIoctl,                 // 26
    0, //resetIoctl,                        // 27
    0, //undefinedIoctl,                    // 28
    0, //multipleDmaWriteIoctl,             // 29
    0, //interruptCancelIoctl,              // 30
    0
};

//
// soc functions
//
int32_t socStartup         (int32_t   asicId,
                                   void        * param, uint32_t paramLen, void * (*defaults)(uint32_t, uint32_t)){
    return 0;
}

int32_t socStop            (int32_t asicId){
    return 0;
}

int32_t socReset           (int32_t asicId,
                                   uint32_t int_on_off ){
    return 0;
}

int32_t socReadRegister8   (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint8_t * value){
    return 0;
}
int32_t socReadRegister16  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint16_t * value){
    return 0;
}
int32_t socReadRegister32  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint32_t * value){
    int i;
    for(i = 0; i < nreg; i++) {
        printk(KERN_INFO "Reading from address 0x%x\n", address + i);
        value[i] = ioread32(soc_miner_dev->dev_virtaddr + address + i);
        printk(KERN_INFO "Read value 0x%x!\n", value[i]);
    }
    return 0;
}

int32_t socWriteRegister8  (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint8_t * value){
    return 0;
}
int32_t socWriteRegister16 (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint16_t * value){
    return 0;
}
int32_t socWriteRegister32 (int32_t asicId,
                                   uint32_t address, uint32_t nreg, uint32_t * value){
    int i;
    for(i = 0; i < nreg; i++) {

        printk(KERN_INFO "Writing 0x%x to address 0x%x\n", value[i], address + i);
        iowrite32(value[i], soc_miner_dev->dev_virtaddr + address + i);
        printk(KERN_INFO "Written!\n");
    }
    return 0;
}

int32_t socReadMemory      (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value){
    return 0;
}
int32_t socWriteMemory     (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value){
    return 0;
}
int32_t socClearMemory     (int32_t asicId,
                                   uint32_t address, uint32_t nbyte){
    return 0;
}

int32_t socDmaRead         (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian){
    return 0;
}
int32_t socDmaWrite        (int32_t asicId,
                                   uint32_t address, uint32_t nbyte, uint8_t * value, uint32_t endian){
    return 0;
}

int32_t socIsrRegister     (int32_t asicId,
                                   uint32_t inum, uint32_t ipl, void (*handler)(void*, uint32_t), void * param){
    return 0;
}
int32_t socIsrUnregister   (int32_t asicId,
                                   uint32_t inum){
    return 0;
}

int32_t socInterruptEnable (int32_t asicId,
                                   uint32_t inum){
    return 0;
}
int32_t socInterruptDisable(int32_t asicId,
                                   uint32_t inum){
    return 0;
}

int32_t socInterruptPrepare(int32_t asicId,
                                   uint32_t inum, uint32_t reg, uint32_t value){
    return 0;
}
int32_t socInterruptWait   (int32_t asicId,
                                   uint32_t inum, uint32_t timeout){
    return 0;
}
int32_t socInterruptCancel (int32_t asicId,
                                   uint32_t inum){
    return 0;
}

/*
 * File Operations
 *
 */

int soc_miner_open(struct inode *inode, struct file *filp)
{
        //struct soc_miner_dev *dev;
        int retval;

        PDEBUG("Open called!\n");

        retval = 0;
        //dev = container_of(inode->i_cdev, struct soc_miner_dev, cdev);
        PDEBUG("after container of!\n");
        //filp->private_data = dev;       /* For use elsewhere */

        if (down_interruptible(&soc_miner_dev->sem)) {
            return -ERESTARTSYS;
        }
        //if (mutex_lock_interruptible(&dev->mutex)) {
        //        return -ERESTARTSYS;
        //}
        PDEBUG("after mutex lock!\n");

        /* We're only going to allow one write at a time, so manage that via
         * reference counts
         */
        switch (filp->f_flags & O_ACCMODE) {
        case O_RDONLY:
                break;
        case O_WRONLY:
                if (soc_miner_dev->writers || soc_miner_dev->busy) {
                        retval = -EBUSY;
                        PDEBUG("Open busy!\n");
                        goto out;
                }
                else {
                        soc_miner_dev->writers++;
                }
                break;
        case O_RDWR:
        default:
                if (soc_miner_dev->writers || soc_miner_dev->busy) {
                        retval = -EBUSY;
                        PDEBUG("Open busy 2!\n");
                        goto out;
                }
                else {
                        soc_miner_dev->writers++;
                }
        }

        soc_miner_dev->opens++;
        PDEBUG("Open successful!\n");

out:
        up(&soc_miner_dev->sem);
        return retval;
}


int soc_miner_release(struct inode *inode, struct file *filp)
{
        //struct soc_miner_dev *dev = filp->private_data;

        PDEBUG("Release called!\n");
        //if (mutex_lock_interruptible(&dev->mutex)) {
        //        return -EINTR;
        //}
        if (down_interruptible(&soc_miner_dev->sem)) {
            return -EINTR;
        }

        /* Manage writes via reference counts */
        switch (filp->f_flags & O_ACCMODE) {
        case O_RDONLY:
                break;
        case O_WRONLY:
                soc_miner_dev->writers--;
                break;
        case O_RDWR:
        default:
                soc_miner_dev->writers--;
        }

        soc_miner_dev->closes++;

        //mutex_unlock(&dev->mutex);
        up(&soc_miner_dev->sem);

        return 0;
}

ssize_t soc_miner_read(struct file *filp, char __user *buf, size_t count,
        loff_t *f_pos)
{
    //struct soc_miner_dev *dev = filp->private_data;
    PDEBUG("Read!\n");
    return 1;
}


ssize_t soc_miner_write(struct file *filp, const char __user *buf, size_t count,
        loff_t *f_pos)
{
    //struct soc_miner_dev *dev = filp->private_data;
    PDEBUG("Write\n");
    return 1;
}

#if 0
//struct inode *inode,
int soc_miner_ioctl(

    struct file *file,
    unsigned int ioctl_num,/* The number of the ioctl */
    unsigned long ioctl_param) /* The parameter to it */
{
//  int i;
  char *temp;

  printk(KERN_INFO "received ioctl number %d\n", ioctl_num);

  /* Switch according to the ioctl called */
  switch (ioctl_num) {
    case 0:
      /* Receive a pointer to a message (in user space)
       * and set that to be the device's message. */

      /* Get the parameter given to ioctl by the process */
      temp = (char *) ioctl_param;
     break;
  default:
      break;
  }
  return 0;
}
#endif

long soc_miner_ioctl(
         struct file *pfile,	/* ditto */
         unsigned int cmd,	/* number and param for ioctl */
         unsigned long arg)
{
    IoctlArgument ioctlArgument;
    int           result;

    if (_IOC_TYPE(cmd) != SOC_MINER_MAJOR)
    {
        printk(KERN_ERR "AAD ioctl(%u) (major mismatch)\n", _IOC_NR(cmd));
        return -EINVAL;
    }
    cmd = _IOC_NR(cmd);
    if (cmd >= 31)
    {
        printk(KERN_ERR "AAD ioctl(%u) (cmd out of range)\n", cmd);
        return -ENOSYS;
    }

    if (copy_from_user((void*)&ioctlArgument, (void*)arg, sizeof(IoctlArgument)))
    {
        printk(KERN_ERR "AAD ioctl(%u) (copy_from_user failed)\n", cmd);
        return -EFAULT;
    }

    result = ioctlFunctionArray[cmd](ioctlArgument);


    return 0;
}


struct file_operations soc_miner_fops = {
        .owner = THIS_MODULE,
        .read = soc_miner_read,
        .write = soc_miner_write,
        .open = soc_miner_open,
        .release = soc_miner_release,
        .unlocked_ioctl = soc_miner_ioctl
};

/*
 * Driver /proc filesystem operations so that we can show some statistics
 *
 */

static void *soc_miner_proc_seq_start(struct seq_file *s, loff_t *pos)
{
        if (*pos == 0) {
                return soc_miner_dev;
        }

        return NULL;
}

static void *soc_miner_proc_seq_next(struct seq_file *s, void *v, loff_t *pos)
{
        (*pos)++;
        return NULL;
}

static void soc_miner_proc_seq_stop(struct seq_file *s, void *v)
{
}

static int soc_miner_proc_seq_show(struct seq_file *s, void *v)
{
        //struct soc_miner_dev *dev;

        //dev = v;

        //if (mutex_lock_interruptible(&dev->mutex)) {
        //        return -EINTR;
        //}
        if (down_interruptible(&soc_miner_dev->sem)) {
            return -EINTR;
        }


        seq_printf(s, "\nSocMiner:\n\n");
        seq_printf(s, "Device Physical Address: 0x%0x\n", soc_miner_dev->dev_physaddr);
        seq_printf(s, "Device Virtual Address:  0x%0x\n",
                (u32)soc_miner_dev->dev_virtaddr);
        seq_printf(s, "Device Address Space:    %d bytes\n", soc_miner_dev->dev_addrsize);
        seq_printf(s, "\n");
        seq_printf(s, "Opens:                   %d\n", soc_miner_dev->opens);
        seq_printf(s, "Writes:                  %d\n", soc_miner_dev->writes);
        seq_printf(s, "Bytes Written:           %d\n", soc_miner_dev->bytes_written);
        seq_printf(s, "Closes:                  %d\n", soc_miner_dev->closes);
        seq_printf(s, "Errors:                  %d\n", soc_miner_dev->errors);
        seq_printf(s, "Busy:                    %d\n", soc_miner_dev->busy);
        seq_printf(s, "\n");

        //mutex_unlock(&dev->mutex);
        up(&soc_miner_dev->sem);
        return 0;
}

/* SEQ operations for /proc */
static struct seq_operations soc_miner_proc_seq_ops = {
        .start = soc_miner_proc_seq_start,
        .next = soc_miner_proc_seq_next,
        .stop = soc_miner_proc_seq_stop,
        .show = soc_miner_proc_seq_show
};

static int soc_miner_proc_open(struct inode *inode, struct file *file)
{
        return seq_open(file, &soc_miner_proc_seq_ops);
}

static struct file_operations soc_miner_proc_ops = {
        .owner = THIS_MODULE,
        .open = soc_miner_proc_open,
        .read = seq_read,
        .llseek = seq_lseek,
        .release = seq_release
};

static int soc_miner_remove(struct platform_device *pdev)
{
        cdev_del(&soc_miner_dev->cdev);

        remove_proc_entry("driver/soc_miner", NULL);

#if 0
        unregister_chrdev_region(soc_miner_dev->devno, 1);
#else
        unregister_chrdev(SOC_MINER_MAJOR, MODULE_NAME);
#endif

        /* Unmap the I/O memory */
        if (soc_miner_dev->dev_virtaddr) {
                iounmap(soc_miner_dev->dev_virtaddr);
                release_mem_region(soc_miner_dev->dev_physaddr,
                        soc_miner_dev->dev_addrsize);
        }
#if 0
        /* Free the PL330 buffer client data descriptors */
        if (soc_miner_dev->client_data) {
                kfree(soc_miner_dev->client_data);
        }
#endif
        if (soc_miner_dev) {
                kfree(soc_miner_dev);
        }

        return 0;
}

static int soc_miner_probe(struct platform_device *pdev)
{
        int status;
        struct proc_dir_entry *proc_entry;
        struct resource *soc_miner_resource;

        /* Get our platform device resources */
        PDEBUG("Probe called!\n");
        PDEBUG("We have %d resources\n", pdev->num_resources);
        soc_miner_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
        if (soc_miner_resource == NULL) {
                dev_err(&pdev->dev, "No resources found\n");
                return -ENODEV;
        }

        /* Allocate a private structure to manage this device */
        soc_miner_dev = kmalloc(sizeof(struct soc_miner_dev), GFP_KERNEL);
        if (soc_miner_dev == NULL) {
                dev_err(&pdev->dev,
                        "unable to allocate device structure\n");
                return -ENOMEM;
        }
        memset(soc_miner_dev, 0, sizeof(struct soc_miner_dev));

        /* Get our device properties from the device tree, if they exist */
        if (pdev->dev.of_node) {
#if 0
                if (of_property_read_u32(pdev->dev.of_node, "dma-channel",
                        &soc_miner_dev->dma_channel) < 0) {
                        dev_warn(&pdev->dev,
                                "DMA channel unspecified - assuming 0\n");
                        soc_miner_dev->dma_channel = 0;
                }
                dev_info(&pdev->dev,
                        "read DMA channel is %d\n", soc_miner_dev->dma_channel);
                if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
                        &soc_miner_dev->fifo_depth) < 0) {
                        dev_warn(&pdev->dev,
                                "depth unspecified, assuming 0xffffffff\n");
                        soc_miner_dev->fifo_depth = 0xffffffff;
                }
                dev_info(&pdev->dev,
                        "DMA fifo depth is %d\n", soc_miner_dev->fifo_depth);
                if (of_property_read_u32(pdev->dev.of_node, "burst-length",
                        &soc_miner_dev->burst_length) < 0) {
                        dev_warn(&pdev->dev,
                                "burst length unspecified - assuming 1\n");
                        soc_miner_dev->burst_length = 1;
                }
                dev_info(&pdev->dev,
                        "DMA burst length is %d\n",
                        soc_miner_dev->burst_length);
#endif
        }

        soc_miner_dev->pdev = pdev;

        soc_miner_dev->devno = MKDEV(SOC_MINER_MAJOR, SOC_MINER_MINOR);
        PDEBUG("devno is 0x%0x, pdev id is %d\n", soc_miner_dev->devno, SOC_MINER_MINOR);

#if 0
        status = register_chrdev_region(soc_miner_dev->devno, 1, MODULE_NAME);
#else
        status = register_chrdev(SOC_MINER_MAJOR, MODULE_NAME, &soc_miner_fops);
#endif
        if (status < 0) {
                dev_err(&pdev->dev, "unable to register chrdev %d\n",
                        SOC_MINER_MAJOR);
                goto fail;
        }

        /* Register with the kernel as a character device */
        cdev_init(&soc_miner_dev->cdev, &soc_miner_fops);
        soc_miner_dev->cdev.owner = THIS_MODULE;
        soc_miner_dev->cdev.ops = &soc_miner_fops;

        /* Initialize our device mutex */
        //mutex_init(&soc_miner_dev->mutex);
        sema_init(&soc_miner_dev->sem, 1);

        soc_miner_dev->dev_physaddr = soc_miner_resource->start;
        soc_miner_dev->dev_addrsize = soc_miner_resource->end -
                soc_miner_resource->start + 1;
        if (!request_mem_region(soc_miner_dev->dev_physaddr,
                soc_miner_dev->dev_addrsize, MODULE_NAME)) {
                dev_err(&pdev->dev, "can't reserve i/o memory at 0x%08X\n",
                        soc_miner_dev->dev_physaddr);
                status = -ENODEV;
                goto fail;
        }
        soc_miner_dev->dev_virtaddr = ioremap(soc_miner_dev->dev_physaddr,
                soc_miner_dev->dev_addrsize);
        PDEBUG("soc_miner: mapped 0x%0x to 0x%0x size:%x\n", soc_miner_dev->dev_physaddr,
                (unsigned int)soc_miner_dev->dev_virtaddr, soc_miner_dev->dev_addrsize);

#if 0
        soc_miner_dev->client_data = kmalloc(sizeof(struct pl330_client_data),
                GFP_KERNEL);
        if (!soc_miner_dev->client_data) {
                dev_err(&pdev->dev, "can't allocate PL330 client data\n");
                goto fail;
        }
        memset(soc_miner_dev->client_data, 0, sizeof(struct pl330_client_data));

        soc_miner_dev->client_data->dev_addr =
                soc_miner_dev->dev_physaddr + AXI_TXFIFO;
        soc_miner_dev->client_data->dev_bus_des.burst_size = 4;
        soc_miner_dev->client_data->dev_bus_des.burst_len =
                soc_miner_dev->burst_length;
        soc_miner_dev->client_data->mem_bus_des.burst_size = 4;
        soc_miner_dev->client_data->mem_bus_des.burst_len =
                soc_miner_dev->burst_length;

        status = cdev_add(&soc_miner_dev->cdev, soc_miner_dev->devno, 1);
#endif
        /* Create statistics entry under /proc */
        proc_entry = create_proc_entry("driver/soc_miner", 0, NULL);
        if (proc_entry) {
                proc_entry->proc_fops = &soc_miner_proc_ops;
        }
#if 0
        soc_miner_reset_fifo();
#endif
        dev_info(&pdev->dev, "added soc_miner successfully\n");

        return 0;

        fail:
        soc_miner_remove(pdev);
        return status;
}




#ifdef CONFIG_OF
//static struct of_device_id soc_miner_of_match[] __devinitdata = {
static struct of_device_id soc_miner_of_match[]  = {
        { .compatible = "soc_miner", },
        { /* end of table */}
};
MODULE_DEVICE_TABLE(of, soc_miner_of_match);
#else
#define soc_miner_of_match NULL
#endif /* CONFIG_OF */



static struct platform_driver soc_miner_driver = {
        .driver = {
                .name = MODULE_NAME,
                .owner = THIS_MODULE,
                .of_match_table = soc_miner_of_match,
        },
        .probe = soc_miner_probe,
        .remove = soc_miner_remove,
};

static void __exit soc_miner_exit(void)
{
        platform_driver_unregister(&soc_miner_driver);
}

static int __init soc_miner_init(void)
{
        int status;

        status = platform_driver_register(&soc_miner_driver);

        return status;
}

module_init(soc_miner_init);
module_exit(soc_miner_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("SocMiner");
MODULE_AUTHOR("");
MODULE_VERSION("");
