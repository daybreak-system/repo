#!/bin/sh
set -eu

wget https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.3.tar.xz
tar -xf linux-7.3.tar.xz
cd linux-7.3

echo "-daybreak" > localversion
yes "" | make LLVM=1 localmodconfig
./scripts/config --file .config -d DEBUG_INFO \
  -d DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT -d DEBUG_INFO_DWARF4 \
  -d DEBUG_INFO_DWARF5 -e CONFIG_DEBUG_INFO_NONE
make LLVM=1 olddefconfig


make LLVM=1

make LLVM=1 INSTALL_MOD_PATH="$1" modules_install
mkdir -p $1/boot
install -m 0600 $(make LLVM=1 -s image_name) $1/boot/vmlinuz-$(make -s kernelrelease)
install -m 0600 System.map $1/boot/System.map-$(make LLVM=1 -s kernelrelease)
