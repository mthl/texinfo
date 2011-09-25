#! /bin/sh

if [ z"$srcdir" = 'z' ]; then
  srcdir='.'
fi

prove -I "$srcdir" -I "$srcdir"/../texi2html/lib/Unicode-EastAsianWidth/lib/ -I "$srcdir"/../texi2html/lib/libintl-perl/lib -I "$srcdir"/../texi2html/lib/Text-Unidecode/lib/ "$srcdir"/t/*.t
