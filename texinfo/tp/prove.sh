#! /bin/sh

if [ z"$srcdir" = 'z' ]; then
  srcdir='.'
fi

prove -I "$srcdir" -I "$srcdir"/maintain/lib/Unicode-EastAsianWidth/lib/ -I "$srcdir"/maintain/lib/libintl-perl/lib -I "$srcdir"/maintain/lib/Text-Unidecode/lib/ "$srcdir"/t/*.t
