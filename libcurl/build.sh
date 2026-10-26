#!/bin/sh
set -eu

wget https://curl.se/download/curl-8.23.0.tar.xz
tar -xf curl-8.23.0.tar.xz
cd curl-8.23.0

CC=clang ./configure \
  --prefix=/usr \
  --with-openssl \
  --with-zlib \
  --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
  --without-libpsl \
  --without-brotli \
  --without-zstd \
  --without-libidn2 \
  --disable-static \
  --enable-shared \
  --disable-tool

make
make DESTDIR="$1" install
