#! /bin/sh
# Copyright (C) 2010 Free Software Foundation, Inc.
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

if [ z"$srcdir" = 'z' ]; then
  srcdir=.
fi

if test "z$LONG_TESTS" != z'yes' -a "z$ALL_TESTS" != z'yes'; then
  echo "Skipping long tests that take a lot of time to run"
  exit 77
fi

"$srcdir"/parser_tests.sh "$@" \
 sectioning coverage indices nested_formats contents layout
