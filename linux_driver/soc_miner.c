#include <linux/module.h>
#include <linux/string.h>
#include <linux/fs.h>
#include <asm/uaccess.h>

// module attributes
MODULE_LICENSE("GPL"); // this avoids kernel taint warning
MODULE_DESCRIPTION("");
MODULE_AUTHOR("");

static char msg[100]={0};
static short readPos=0;
static int times = 0;

// protoypes,else the structure initialization that follows fail
static int soc_miner_open(struct inode *, struct file *);
static int soc_miner_release(struct inode *, struct file *);
static ssize_t soc_miner_read(struct file *, char *, size_t, loff_t *);
static ssize_t soc_miner_write(struct file *, const char *, size_t, loff_t *);

// structure containing callbacks
static struct file_operations fops = {
    .read = soc_miner_read, // address of soc_miner_read
    .open = soc_miner_open,  // address of soc_miner_open
    .write = soc_miner_write, // address of soc_miner_write
    .release = soc_miner_release, // address of soc_miner_rls
};


// called when module is loaded, similar to main()
int init_module(void) {
    int t = register_chrdev(234,"soc_driver",&fops); //register driver with major:89
	
	if (t<0) printk(KERN_ALERT "Device registration failed..\n");
	else printk(KERN_ALERT "Device registered...\n");

	return t;
}


// called when module is unloaded, similar to destructor in OOP
void cleanup_module(void) {
	unregister_chrdev(89,"myDev");
}


// called when 'open' system call is done on the device file
static int soc_miner_open(struct inode *inod,struct file *fil) {
	times++;
	printk(KERN_ALERT"Device opened %d times\n",times);
	return 0;
}

// called when 'read' system call is done on the device file
static ssize_t soc_miner_read(struct file *filp,char *buff,size_t len,loff_t *off) {
    printk(KERN_ALERT"soc_miner_read");
    return 0;
}

// called when 'write' system call is done on the device file
static ssize_t soc_miner_write(struct file *filp,const char *buff,size_t len,loff_t *off) {
    printk(KERN_ALERT"soc_miner_write\n");
    return 0;
}

// called when 'close' system call is done on the device file
static int soc_miner_release(struct inode *inod,struct file *fil) {
	printk(KERN_ALERT"Device closed\n");
	return 0;
}


