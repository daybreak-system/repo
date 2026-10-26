#!/bin/sh
set -eu

mkdir -m 755 -p \
  "$1/bin"
  "$1/sbin"
  "$1/lib"
  "$1/usr/bin" \
  "$1/usr/sbin" \
  "$1/usr/include" \
  "$1/usr/lib" \
  "$1/usr/share" \
  "$1/usr/local" \
  "$1/usr/src" \
  "$1/etc" \
  "$1/home" \
  "$1/boot" \
  "$1/mnt" \
  "$1/opt" \
  "$1/run" \
  "$1/run/lock" \
  "$1/var/cache" \
  "$1/var/lib" \
  "$1/var/log" \
  "$1/var/opt" \
  "$1/var/spool"

mkdir -m 555 -p \
  "$1/proc" \
  "$1/sys"

mkdir -m 750 -p "$1/root"

mkdir -m 1777 -p \
  "$1/tmp" \
  "$1/var/tmp"

ln -s ../run "$1/var/run"
ln -s ../run/lock "$1/var/lock"

ln -s /proc/self/mounts "$1/etc/mtab"

cat << "EOF" > "$1/etc/group"
root:x:0:
bin:x:1:daemon
daemon:x:2:
sys:x:3:
adm:x:4:
tty:x:5:
disk:x:6:
lp:x:7:
mem:x:8:
kmem:x:9:
wheel:x:10:
cdrom:x:11:
mail:x:12:
kvm:x:61:
nobody:x:99:
nogroup:x:65534:
EOF

cat << "EOF" > "$1/etc/host.conf"
multi on
EOF

cat << "EOF" > "$1/etc/hosts"
127.0.0.1    localhost
::1          localhost
EOF

cat << "EOF" > "$1/etc/issue"
daybreak \r (\l)
EOF

cat << "EOF" > "$1/etc/os-release"
NAME="daybreak"
PRETTY_NAME="daybreak"
ID=daybreak
BUILD_ID=rolling
HOME_URL="https://github.com/rudyon/daybreak-repo"
SUPPORT_URL="https://github.com/rudyon/daybreak-repo"
BUG_REPORT_URL="https://github.com/rudyon/daybreak-repo"
EOF

cat << "EOF" > "$1/etc/passwd"
root:x:0:0:root:/root:/bin/sh
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF

cat << "EOF" > "$1/etc/profile"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
umask 022
EOF

cat << "EOF" > "$1/etc/securetty"
console
vc/1
vc/2
vc/3
vc/4
vc/5
vc/6
vc/7
vc/8
vc/9
vc/10
vc/11
tty1
tty2
tty3
tty4
tty5
tty6
tty7
tty8
tty9
tty10
tty11
ttyS0
ttyAMA0
ttyUSB0
EOF

cat << "EOF" > "$1/etc/shells"
/bin/sh
EOF
