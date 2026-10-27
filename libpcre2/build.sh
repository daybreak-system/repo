#!/bin/sh
set -eu

wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.49/pcre2-10.49.tar.gz
tar -xf pcre2-10.49.tar.gz
cd pcre2-10.49.tar.gz

./configure \
  CC="clang" \
  CFLAGS="-O2 -target x86_64-unknown-linux-musl -Qunused-arguments" \
  LDFLAGS="-fuse-ld=lld -target x86_64-unknown-linux-musl" \
  --enable-jit \
  --enable-pcre2-16 \
  --enable-pcre2-32

make
make DESTDIR="$1" install
