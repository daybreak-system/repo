#!/bin/sh
set -eu

wget https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.4/llvm-project-23.1.4.src.tar.xz
tar -xf llvm-project-23.1.4.src.tar.xz
cd llvm-project-23.1.4.src

cmake -G Ninja -S runtimes -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_C_COMPILER_TARGET="x86_64-unknown-linux-musl" \
  -DCMAKE_CXX_COMPILER_TARGET="x86_64-unknown-linux-musl" \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-D_LIBCPP_PROVIDES_DEFAULT_RUNE_TABLE" \
  -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
  -DLIBCXX_ENABLE_SHARED=ON \
  -DLIBCXX_ENABLE_STATIC=OFF \
  -DLIBCXXABI_ENABLE_SHARED=ON \
  -DLIBCXXABI_ENABLE_STATIC=OFF \
  -DLIBUNWIND_ENABLE_SHARED=ON \
  -DLIBUNWIND_ENABLE_STATIC=OFF \
  -DLIBCXX_INCLUDE_TESTS=OFF
  
cmake --build build
DESTDIR="$1" cmake --install build
