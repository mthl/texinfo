#! /bin/sh

# Get error messages in English
LC_ALL=C; export LC_ALL

srcdir=${srcdir:-.}

# to regenerate the reference:
# ../texi2any.pl -o - --plaintext formatting/simplest.texi > reference/stdout.txt 2>&1

$srcdir/../texi2any.pl -o - --plaintext $srcdir/formatting/simplest.texi 2>&1 | diff - $srcdir/reference/stdout.txt

