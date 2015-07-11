#!/bin/sh
# $Id$
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
cmd="(cd tp/tests && ../maintain/regenerate_cmd_tests.sh Makefile.onetst . -base 'formatting' -long 'sectioning coverage indices nested_formats contents layout' -tex_html 'tex_html')"
echo "  $cmd"
$chicken eval $cmd || exit 1

# Generates an include file for each of tp/tests/htmlxref*/Makefile.am.
for dir in htmlxref htmlxref-only_mono htmlxref-only_split; do
  cmd="(cd tp/tests/$dir && ../../maintain/regenerate_cmd_tests.sh Makefile.onetst $dir -base .)"
  echo "  $cmd"
  $chicken eval $cmd || exit 1
done

# This overwrites lots of files with older versions.
# I keep the newest versions of files common between distributions up to
# date in CVS (see util/srclist.txt), because it's not trivial for every
# developer to do this.
#cmd="autoreconf --verbose --force --install --include=m4"

# So instead:
: ${LIBTOOLIZE=libtoolize}
: ${ACLOCAL=aclocal}
: ${AUTOHEADER=autoheader}
: ${AUTOMAKE=automake}
: ${AUTOCONF=autoconf}
cmd="$LIBTOOLIZE && $ACLOCAL -I gnulib/m4 && $AUTOCONF && $AUTOHEADER && $AUTOMAKE"
echo "  $cmd $*"
$chicken eval $cmd "$@" || exit 1

cmd="(cd tp/Texinfo/Convert/XSParagraph && autoreconf --install)"
echo "  $cmd"
$chicken eval $cmd || exit 1

echo
echo "Now run configure with your desired options, for instance:"
echo "  ./configure CFLAGS='-g'"
