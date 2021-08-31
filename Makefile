MODULE_DIR = module
BUILD_DIR = build
TMP_DIR = $(BUILD_DIR)/tmp
QEMU_DIR = qemu
ARCHIVE_PATH = archive.tar.gz
ARCHIVE_CONTENT = $(QEMU_DIR)/bzImage $(QEMU_DIR)/rootfs $(QEMU_DIR)/boot.sh
KERNEL_PATH = /root/kern/linux-source-5.8.0
USER_DIR = user
USER_BUILD_DIR = $(USER_DIR)/build

export

.PHONY: all run clean move release debug

release: build_release
	cd $(QEMU_DIR) && $(MAKE) release && cd $(PWD)

debug: build_debug
	cd $(QEMU_DIR) && $(MAKE) debug && cd $(PWD)

move:
	$(info Move MODULE binaries to $(BUILD_DIR)/)
	-mv $(MODULE_DIR)/*.o $(TMP_DIR)
	-mv $(MODULE_DIR)/*.symvers $(TMP_DIR)
	-mv $(MODULE_DIR)/*.mod $(TMP_DIR)
	-mv $(MODULE_DIR)/*.mod.c $(TMP_DIR)
	-mv $(MODULE_DIR)/modules.order $(TMP_DIR)
	-mv $(MODULE_DIR)/.*.cmd $(TMP_DIR)
	-mv $(MODULE_DIR)/*.ko $(BUILD_DIR)
	$(info Move USER binaries to $(BUILD_DIR)/)
	-mv $(USER_BUILD_DIR)/*.o $(BUILD_DIR)

compress:
	tar -czhf $(ARCHIVE_PATH) $(ARCHIVE_CONTENT)

clean:
	-rm -rf $(BUILD_DIR)
	-mkdir -p $(BUILD_DIR) $(TMP_DIR)
	-rm -f $(ARCHIVE_PATH)
	-rm -f .vscode/*.log
	cd $(QEMU_DIR) && $(MAKE) clean && cd $(PWD)
	cd $(USER_DIR) && $(MAKE) clean && cd $(PWD)
	# cd $(MODULE_DIR) && $(MAKE) clean && cd $(PWD)


build_release: clean
	cd $(MODULE_DIR) && $(MAKE) release && cd $(PWD)
	cd $(USER_DIR) && $(MAKE) release && cd $(PWD)
	$(MAKE) move
	cd $(QEMU_DIR) && $(MAKE) rootfs && cd $(PWD)
	$(MAKE) compress

build_debug: clean
	cd $(MODULE_DIR) && $(MAKE) debug && cd $(PWD)
	cd $(USER_DIR) && $(MAKE) debug && cd $(PWD)
	$(MAKE) move
	cd $(QEMU_DIR) && $(MAKE) rootfs && cd $(PWD)
