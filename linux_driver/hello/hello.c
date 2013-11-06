// Defining __KERNEL__ and MODULE allows us to access kernel-level code not usually available to userspace programs.
#undef __KERNEL__
#define __KERNEL__
 
#undef MODULE
#define MODULE
 
// Linux Kernel/LKM headers: module.h is needed by all modules and kernel.h is needed for KERN_INFO.
/* Necessary includes for device drivers */
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h> /* printk() */
#include <linux/slab.h> /* kmalloc() */
#include <linux/fs.h> /* everything... */
#include <linux/errno.h> /* error codes */
#include <linux/types.h> /* size_t */
#include <linux/proc_fs.h>
#include <linux/fcntl.h> /* O_ACCMODE */
#include <asm/system.h> /* cli(), *_flags */
#include <asm/uaccess.h> /* copy_from/to_user */


#define MY_MAJOR 233
#define NAME "hello"


MODULE_LICENSE("Dual BSD/GPL");
char *memory_buffer;

//
// file ops
//
int hello_open(struct inode *inode, struct file *filp) {

    printk(KERN_INFO "open!\n");
    /* Success */
    return 0;
}
int hello_release(struct inode *inode, struct file *filp) {
    printk(KERN_INFO "release!\n");
    /* Success */
    return 0;
}

ssize_t hello_read(struct file *filp, char *buf,
                    size_t count, loff_t *f_pos) {
    printk(KERN_INFO "read!\n");
    /* Transfering data to user space */
      copy_to_user(buf,memory_buffer,1);

      /* Changing reading position as best suits */
      if (*f_pos == 0) {
        *f_pos+=1;
        return 1;
      } else {
        return 0;
      }

}

ssize_t hello_write( struct file *filp, char *buf,
                      size_t count, loff_t *f_pos) {
    char *tmp;
    printk(KERN_INFO "write!\n");
    /* Success *
     */


     tmp=buf+count-1;
     copy_from_user(memory_buffer,tmp,1);
     return 1;

}

int hello_ioctl(
    struct inode *inode,
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


struct file_operations hello_fops = {
        .owner = THIS_MODULE,
        .read = hello_read,
        .write = hello_write,
        .open = hello_open,
        .release = hello_release,
        .unlocked_ioctl = hello_ioctl
};

//
// init and cleanup
//


static void __exit hello_exit(void)
{
    printk(KERN_INFO "Cleaning up module.\n");
    /* Freeing the major number */
    unregister_chrdev(MY_MAJOR, NAME);
    /* Freeing buffer memory */
      if (memory_buffer) {
        kfree(memory_buffer);
      }

      printk("<1>Removing memory module\n");
}
static int __init hello_init(void)
{
    int result;
    printk(KERN_INFO "Hello world!\n");


    /* Registering device */
    result = register_chrdev(MY_MAJOR, NAME, &hello_fops);
    if (result < 0) {
        printk("<1>hello: cannot obtain major number %d\n", MY_MAJOR);
        return result;
    }

    /* Allocating memory for the buffer */
     memory_buffer = kmalloc(1, GFP_KERNEL);
     if (!memory_buffer) {
       result = -ENOMEM;
       goto fail;
     }
     memset(memory_buffer, 0, 1);

     printk("<1>Inserting memory module\n");
     return 0;

     fail:
       hello_exit();
       return result;


}

module_init(hello_init);
module_exit(hello_exit);




