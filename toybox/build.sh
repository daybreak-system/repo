wget https://landley.net/toybox/downloads/toybox-0.8.9.tar.gz
tar -xf toybox-0.8.9.tar.gz
cd toybox-0.8.9
make defconfig
make
PREFIX=$1 make install
