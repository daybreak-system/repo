#!/bin/sh
set -eu

wget https://landley.net/toybox/downloads/toybox-0.8.15.tar.gz
tar -xf toybox-0.8.15.tar.gz
cd toybox-0.8.15

TARGET_FLAGS="--target=x86_64-unknown-linux-musl --sysroot=$2"
export CFLAGS="${CFLAGS:-} $TARGET_FLAGS"
export LDFLAGS="${LDFLAGS:-} $TARGET_FLAGS"

make defconfig
sed -i 's/# CONFIG_TOYBOX_LIBCRYPTO is not set/CONFIG_TOYBOX_LIBCRYPTO=y/' .config
make CC=clang
make PREFIX="$1" install
