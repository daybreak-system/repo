#!/bin/sh
set -eu

wget https://www.hboehm.info/gc/gc_source/gc-8.2.8.tar.gz
tar -xf gc-8.2.8.tar.gz
cd gc-8.2.7

cmake -B build_cmake \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_C_FLAGS="-target x86_64-unknown-linux-musl" \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld -target x86_64-unknown-linux-musl -lucontext" \
  -DCMAKE_INSTALL_PREFIX="/usr/local"

cmake --build build_cmake
cmake --install build_cmake --destdir "$1"
