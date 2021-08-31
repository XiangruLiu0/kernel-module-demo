ROOTFS_DIR = rootfs.d
OS_MODULE_DIR = $(ROOTFS_DIR)/usr/lib/modules
OS_DATA_DIR = $(ROOTFS_DIR)/data
ROOTFS_BIN = rootfs
IMAGE_BIN = bzImage
BUILD_DIR = ../build

.PHONY: rootfs release clean

rootfs: clean
	cp $(BUILD_DIR)/*.ko $(OS_MODULE_DIR)
	cp $(BUILD_DIR)/*.o $(OS_DATA_DIR)
	cd $(ROOTFS_DIR) && /bin/bash -c "find . | cpio -o --format=newc > ../$(ROOTFS_BIN)" && cd ..

release: rootfs
	qemu-system-x86_64 -nographic -kernel $(IMAGE_BIN) -initrd $(ROOTFS_BIN) -append "nokaslr console=ttyS0" $(EXTRA_OPTIONS)

debug:
	EXTRA_OPTIONS="-s -S" $(MAKE) release

clean:
	-rm -rf $(ROOTFS_BIN)
	-rm -rf $(OS_DATA_DIR)
	-mkdir -p $(OS_DATA_DIR)
