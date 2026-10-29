#!/bin/sh
set -eu

CUSTAGE=$1
CUROOT=$2

wget https://musl.libc.org/releases/musl-1.2.6.tar.gz
gzip -d musl-1.2.6.tar.gz
tar -xf musl-1.2.6.tar
cd musl-1.2.6

CC=clang \
CFLAGS="-target x86_64-unknown-linux-musl -fuse-ld=lld" \
AR=llvm-ar \
RANLIB=llvm-ranlib \
./configure \
  --target=x86_64-unknown-linux-musl \
  --prefix=/usr \
  --syslibdir=/lib

make
make DESTDIR="$CUSTAGE" install
