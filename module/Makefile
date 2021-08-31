MODULE_NAME = sample
KERNEL_PATH = /root/kern/linux-source-5.8.0
MODULE_SOURCES = $(shell find $(PWD) -type f -name '*.c' -exec realpath --relative-to $(PWD) {} \;)
$(MODULE_NAME)-y = $(patsubst %.c, %.o ,$(MODULE_SOURCES))
INC_FLAGS = -I$(KERNEL_PATH)

obj-m += $(MODULE_NAME).o
ccflags-y += $(INC_FLAGS)

ifdef DEBUG
ccflags-y += -g -DDEBUG -O0
else
ccflags-y += -s -O2
endif

.PHONY: kernel release debug
kernel:
	@echo $(DEBUG)
	@echo $(ccflags-y)
	@echo $(MODULE_SOURCES)
	@echo $($(MODULE_NAME)-y)
	make -C $(KERNEL_PATH) M=$(PWD) modules
release: 
	$(MAKE) kernel
	strip --strip-unneeded $(MODULE_NAME).ko
	strip --strip-debug $(MODULE_NAME).ko
	strip --strip-dwo $(MODULE_NAME).ko
	echo "Binary striped"
debug: 
	DEBUG=1 $(MAKE) kernel

