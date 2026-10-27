#!/bin/sh
set -eu

wget https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.4/llvm-project-23.1.4.src.tar.xz
tar -xf llvm-project-23.1.4.src.tar.xz
cd llvm-project-23.1.4.src

cmake -G Ninja -S llvm -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-stdlib=libc++" \
  -DLLVM_ENABLE_PROJECTS="clang;lld" \
  -DLLVM_TARGETS_TO_BUILD=X86 \
  -DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-unknown-linux-musl \
  -DLLVM_ENABLE_LIBCXX=ON \
  -DLLVM_USE_LINKER=lld \
  -DCLANG_DEFAULT_CXX_STDLIB=libc++ \
  -DCLANG_DEFAULT_LINKER=lld \
  -DLLVM_ENABLE_ZLIB=ON

cmake --build build
DESTDIR="$1" cmake --install build
