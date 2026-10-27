#!/bin/sh
set -eu

wget http://pyyaml.org/download/libyaml/yaml-0.2.5.tar.gz
tar -xf yaml-0.2.5.tar.gz
cd yaml-0.2.5

./configure CC=clang CFLAGS="-O2" LDFLAGS="-fuse-ld=lld"

make
make DESTDIR="$1" install
