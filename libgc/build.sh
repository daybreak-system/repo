#!/bin/sh
set -eu

wget https://www.hboehm.info/gc/gc_source/gc-8.2.8.tar.gz
tar -xf gc-8.2.8.tar.gz
cd gc-8.2.7

./configure \
  CC="clang" \
  CFLAGS="-O2 -target x86_64-unknown-linux-musl -Qunused-arguments" \
  LDFLAGS="-fuse-ld=lld -target x86_64-unknown-linux-musl" \
  --enable-threads=posix \
  --enable-parallel-mark

make
make DESTDIR="$1" install
