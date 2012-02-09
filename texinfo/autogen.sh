#!/bin/sh
# $Id: autogen.sh,v 1.10 2012-02-09 23:51:50 pertusus Exp $
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

# Generates another include file for tp/Makefile.am.
cmd="tp/maintain/regenerate_document_strings_make_rules.sh"
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
echo "  ./configure CFLAGS='-g'"
