#!/bin/sh
# $Id: autogen.sh,v 1.8 2011-10-25 23:22:07 karl Exp $
# Created 2003-08-29, Karl Berry.  Public domain.

if test "x$1" = x-n; then
  chicken=true
  echo "Ok, playing chicken; not actually running any commands."
else
  chicken=
fi

echo "Preparing Texinfo development infrastructure:"

# Generates an include file for tp/Makefile.am.
cmd="tp/maintain/regenerate_file_lists.pl"
echo "  $cmd"
$chicken eval $cmd || exit 1

# This overwrites lots of files with older versions.
# I keep the newest versions of files common between distributions up to
# date in CVS (see util/srclist.txt), because it's not trivial for every
# developer to do this.
#cmd="autoreconf --verbose --force --install --include=m4"

# So instead:
: ${ACLOCAL=aclocal}
: ${AUTOHEADER=autoheader}
: ${AUTOMAKE=automake}
: ${AUTOCONF=autoconf}
cmd="$ACLOCAL -I gnulib/m4 && $AUTOCONF && $AUTOHEADER && $AUTOMAKE"
echo "  $cmd $*"
$chicken eval $cmd "$@" || exit 1

echo
echo "Now run configure with your desired options, for instance:"
echo "  ./configure --enable-maintainer-mode CFLAGS='-g'"
