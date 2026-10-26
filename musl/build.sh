#!/bin/sh
set -eu

wget https://musl.libc.org/releases/musl-1.2.6.tar.gz
tar -xf musl-1.2.6.tar.gz
cd musl-1.2.6

CC=clang ./configure \
  --prefix=/usr \
  --syslibdir=/usr/lib

make
make DESTDIR="$1" install
