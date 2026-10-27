#!/bin/sh
set -eu

wget https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.4/llvm-project-23.1.4.src.tar.xz
tar -xf llvm-project-23.1.4.src.tar.xz
cd llvm-project-23.1.4.src

cmake -G Ninja -S runtimes -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
  -DLIBCXX_ENABLE_SHARED=ON \
  -DLIBCXX_ENABLE_STATIC=OFF \
  -DLIBCXXABI_ENABLE_SHARED=ON \
  -DLIBCCABI_ENABLE_STATIC=OFF \
  -DLIBUNWIND_ENABLE_SHARED=ON \
  -DLIBUNWIND_ENABLE_STATIC=OFF

cmake --build build
DESTDIR="$1" cmake --install build
