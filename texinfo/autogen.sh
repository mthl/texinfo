#!/bin/sh
# $Id: autogen.sh,v 1.13 2013-02-10 15:14:11 pertusus Exp $
# Created 2003-08-29, Karl Berry.  Public domain.

if test "x$1" = x-n; then
  chicken=true
  echo "Ok, playing chicken; not actually running any commands."
else
  chicken=
fi

echo "Preparing Texinfo development infrastructure:"

# Generates an include file for tp/Makefile.am.
cmd="./tp/maintain/regenerate_file_lists.pl"
echo "  $cmd"
$chicken eval $cmd || exit 1

# Generates another include file for tp/Makefile.am.
cmd="(cd tp && ./maintain/regenerate_docstr.sh Makefile.docstr)"
echo "  $cmd"
$chicken eval $cmd || exit 1

# Generates an include file for tp/tests/Makefile.am.
cmd="(cd tp/tests && ../maintain/regenerate_cmd_tests.sh Makefile.onetst -base 'formatting htmlxref htmlxref-only_mono htmlxref-only_split' -long 'sectioning coverage indices nested_formats contents layout' -tex_html 'tex_html')"
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
