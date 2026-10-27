#!/bin/sh
set -eu

wget https://github.com/openssl/openssl/releases/download/openssl-4.1.0/openssl-4.1.0.tar.gz
tar -xf openssl-4.1.0.tar.gz
cd openssl-4.1.0

CC=clang ./Configure linux-x86_64 \
  --openssldir=/etc/ssl \
  shared

make
make DESTDIR="$1" install_sw
