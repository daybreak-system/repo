#!/bin/sh
set -eu

wget https://zlib.net/zlib-1.3.2.tar.xz
tar -xf zlib-1.3.2
cd zlib-1.3.2

CC=clang ./configure --prefix=/usr --shared
make
make DESTDIR="$1" install
