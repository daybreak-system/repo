#!/bin/sh
set -eu

CUSTAGE=$1
CUROOT=$2

mkdir -m 755 -p \
  "$CUSTAGE/bin" \
  "$CUSTAGE/sbin" \
  "$CUSTAGE/lib" \
  "$CUSTAGE/usr/bin" \
  "$CUSTAGE/usr/sbin" \
  "$CUSTAGE/usr/lib" \
  "$CUSTAGE/etc" \
  "$CUSTAGE/home" \
  "$CUSTAGE/var" \
  "$CUSTAGE/run/lock" \
  "$CUSTAGE/dev" \
  "$CUSTAGE/proc" \
  "$CUSTAGE/sys"
mkdir -m 700 -p \
  "$CUSTAGE/root"
mkdir -m 1777 -p \
  "$CUSTAGE/tmp" \
  "$CUSTAGE/var/tmp"

chmod 755 \
  "$CUSTAGE/bin" \
  "$CUSTAGE/sbin" \
  "$CUSTAGE/lib" \
  "$CUSTAGE/usr" \
  "$CUSTAGE/usr/bin" \
  "$CUSTAGE/usr/sbin" \
  "$CUSTAGE/usr/lib" \
  "$CUSTAGE/etc" \
  "$CUSTAGE/home" \
  "$CUSTAGE/var" \
  "$CUSTAGE/run" \
  "$CUSTAGE/run/lock" \
  "$CUSTAGE/dev" \
  "$CUSTAGE/proc" \
  "$CUSTAGE/sys"
chmod 700 \
  "$CUSTAGE/root"
chmod 1777 \
  "$CUSTAGE/tmp" \
  "$CUSTAGE/var/tmp"

ln -s ../run "$CUSTAGE/var/run"
ln -s ../run/lock "$CUSTAGE/var/lock"

cat << "EOF" > "$CUSTAGE/etc/passwd"
root:x:0:0:root:/root:/bin/sh
EOF

cat << "EOF" > "$CUSTAGE/etc/group"
root:x:0:
EOF

cat << "EOF" > "$CUSTAGE/etc/hosts"
127.0.0.1    localhost
::1          localhost
EOF

cat << "EOF" > "$CUSTAGE/etc/os-release"
NAME="daybreak"
ID=daybreak
PRETTY_NAME="daybreak"
EOF

chmod 644 \
  "$CUSTAGE/etc/passwd" \
  "$CUSTAGE/etc/group" \
  "$CUSTAGE/etc/hosts" \
  "$CUSTAGE/etc/os-release"
