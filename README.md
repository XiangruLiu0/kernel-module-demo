# Kernel Module Demo
- This is a kernel module project demo for those who wanna develop your own LKM.

## How to get started
- Download the source code of linux kernel, compile it, and copy vmlinux & bzImage to `./qemu` (or you can use `ls -s` command).
- Change the `KERNEL_PATH` variable in `module/Makefile`.
- Change the `env` property of `.vscode/c_cpp_properties.json` for better intellisense (for now, just the `kernelSourcePath` property).
- Write your own module in `module` subdirectory.
- Enjoy!
