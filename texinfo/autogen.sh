#!/bin/sh
# $Id: autogen.sh,v 1.3 2008-02-25 23:39:32 karl Exp $
# Created 2003-08-29, Karl Berry.  Public domain.

if test "x$1" = x-n; then
  chicken=true
  echo "Ok, playing chicken; not actually running any commands."
else
  chicken=
fi

echo "Preparing CVS Texinfo infrastructure:"

# This overwrites lots of files with older versions.
# I keep the newest versions of files common between distributions up to
# date in CVS (see util/srclist.txt), because it's not trivial for every
# developer to do this.
#cmd="autoreconf --verbose --force --install --include=m4"

: ${ACLOCAL=aclocal}
: ${AUTOHEADER=autoheader}
: ${AUTOMAKE=automake}
: ${AUTOCONF=autoconf}

# So instead:
cmd="$ACLOCAL -I gnulib/m4 && $AUTOCONF && $AUTOHEADER && $AUTOMAKE"
echo "  $cmd"
$chicken eval $cmd || exit 1

echo
echo "Now run configure with your desired options, for instance:"
echo "  ./configure CFLAGS=-g --enable-maintainer-mode"
echo
echo "You MUST use --enable-maintainer-mode when building Texinfo"
echo "from the CVS sources, or the build will fail."
