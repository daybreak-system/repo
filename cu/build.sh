#!/bin/sh
set -eu

git clone https://github.com/rudyon/cu
cd cu

CC="clang++" \
  crystal build src/cu.cr \
  --release --target=x86_64-unknown-linux-musl \
  --link-flags="-fuse-ld=lld -stdlib=libc++ --rtlib=compiler-rt"

mkdir -p "$1/bin"
cp ./cu "$1/bin"
