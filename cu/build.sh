#!/bin/sh
set -eu

git clone https://github.com/rudyon/cu
cd cu

CC="clang -fuse-ld=lld -rtlib=compiler-rt -lunwind" \
  crystal build src/cu.cr \
  --release --target=x86_64-unknown-linux-musl

mkdir -p "$1/bin"
cp ./cu "$1/bin"
