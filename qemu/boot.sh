#!/bin/bash
qemu-system-x86_64 -nographic -kernel bzImage -initrd rootfs -append "nokaslr console=ttyS0"
