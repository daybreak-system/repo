#!/bin/sh
set -eu

wget https://github.com/emersion/mrsh/archive/refs/heads/master.tar.gz
tar -xf master.tar.gz
cd mrsh-master

CC=clang ./configure  --without-readline
make
mkdir -p "$1/usr/bin"
cp ./mrsh "$1/usr/bin"
