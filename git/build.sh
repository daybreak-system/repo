#!/bin/sh
set -eu

wget https://www.kernel.org/pub/software/scm/git/git-2.56.0.tar.gz
tar -xf git-2.56.0.tar.gz
cd git-2.56.0

make \
  CC=clang \
  prefix=/usr \
  NO_PERL=YesPlease \
  NO_GETTEXT=YesPlease \
  NO_EXPAT=YesPlease \
  NO_TCLTK=YesPlease \
  REG_STARTEND=NeedsStartEnd \
  all

make \
  CC=clang \
  prefix=/usr \
  NO_PERL=YesPlease \
  NO_GETTEXT=YesPlease \
  NO_EXPAT=YesPlease \
  NO_TCLTK=YesPlease \
  REG_STARTEND=NeedsStartEnd \
  DESTDIR="$1" \
  install
