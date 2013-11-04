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
#include <linux/mutex.h>
#include <linux/sched.h>
#include <linux/wait.h>
#include <asm/uaccess.h>
#include <asm/sizes.h>
#include <asm/dma.h>
#include <asm/io.h>
#include <linux/of.h>


/* Define debugging for use during our driver bringup */
#undef PDEBUG
#define PDEBUG(fmt, args...) printk(KERN_INFO fmt, ## args)

#define SOC_MINER_MAJOR 234
#define SOC_MINER_MINOR 0

#define MODULE_NAME "soc_miner"

//module_param(SOC_MINER_MAJOR, int, 0);


struct soc_miner_dev {
        dev_t devno;
        struct mutex mutex;
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
 * File Operations
 *
 */

int soc_miner_open(struct inode *inode, struct file *filp)
{
        struct soc_miner_dev *dev;
        int retval;

        retval = 0;
        dev = container_of(inode->i_cdev, struct soc_miner_dev, cdev);
        filp->private_data = dev;       /* For use elsewhere */

        if (mutex_lock_interruptible(&dev->mutex)) {
                return -ERESTARTSYS;
        }

        /* We're only going to allow one write at a time, so manage that via
         * reference counts
         */
        switch (filp->f_flags & O_ACCMODE) {
        case O_RDONLY:
                break;
        case O_WRONLY:
                if (dev->writers || dev->busy) {
                        retval = -EBUSY;
                        goto out;
                }
                else {
                        dev->writers++;
                }
                break;
        case O_RDWR:
        default:
                if (dev->writers || dev->busy) {
                        retval = -EBUSY;
                        goto out;
                }
                else {
                        dev->writers++;
                }
        }

        dev->opens++;

out:
        mutex_unlock(&dev->mutex);
        return retval;
}


int soc_miner_release(struct inode *inode, struct file *filp)
{
        struct soc_miner_dev *dev = filp->private_data;

        if (mutex_lock_interruptible(&dev->mutex)) {
                return -EINTR;
        }

        /* Manage writes via reference counts */
        switch (filp->f_flags & O_ACCMODE) {
        case O_RDONLY:
                break;
        case O_WRONLY:
                dev->writers--;
                break;
        case O_RDWR:
        default:
                dev->writers--;
        }

        dev->closes++;

        mutex_unlock(&dev->mutex);

        return 0;
}

ssize_t soc_miner_read(struct file *filp, char __user *buf, size_t count,
        loff_t *f_pos)
{
    //struct soc_miner_dev *dev = filp->private_data;
    PDEBUG("Write\n!");
    return 0;
}


ssize_t soc_miner_write(struct file *filp, const char __user *buf, size_t count,
        loff_t *f_pos)
{
    //struct soc_miner_dev *dev = filp->private_data;
    PDEBUG("Read\n!");
    return 0;
}

struct file_operations soc_miner_fops = {
        .owner = THIS_MODULE,
        .read = soc_miner_read,
        .write = soc_miner_write,
        .open = soc_miner_open,
        .release = soc_miner_release
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
        struct soc_miner_dev *dev;

        dev = v;
        if (mutex_lock_interruptible(&dev->mutex)) {
                return -EINTR;
        }

        seq_printf(s, "\nSocMiner:\n\n");
        seq_printf(s, "Device Physical Address: 0x%0x\n", dev->dev_physaddr);
        seq_printf(s, "Device Virtual Address:  0x%0x\n",
                (u32)dev->dev_virtaddr);
        seq_printf(s, "Device Address Space:    %d bytes\n", dev->dev_addrsize);
        seq_printf(s, "\n");
        seq_printf(s, "Opens:                   %d\n", dev->opens);
        seq_printf(s, "Writes:                  %d\n", dev->writes);
        seq_printf(s, "Bytes Written:           %d\n", dev->bytes_written);
        seq_printf(s, "Closes:                  %d\n", dev->closes);
        seq_printf(s, "Errors:                  %d\n", dev->errors);
        seq_printf(s, "Busy:                    %d\n", dev->busy);
        seq_printf(s, "\n");

        mutex_unlock(&dev->mutex);
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

        unregister_chrdev_region(soc_miner_dev->devno, 1);

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

        status = register_chrdev_region(soc_miner_dev->devno, 1, MODULE_NAME);
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
        mutex_init(&soc_miner_dev->mutex);

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
        PDEBUG("soc_miner: mapped 0x%0x to 0x%0x\n", soc_miner_dev->dev_physaddr,
                (unsigned int)soc_miner_dev->dev_virtaddr);

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
