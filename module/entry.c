#include <linux/module.h>

int init_module(void) {
#ifdef DEBUG
  printk(KERN_INFO "Simple_LKM has been loaded!\n");
#endif
  return 0;
}
void cleanup_module(void) {
#ifdef DEBUG
  printk(KERN_INFO "Simple_LKM has been removed!\n");
#endif
}
MODULE_LICENSE("GPL");
