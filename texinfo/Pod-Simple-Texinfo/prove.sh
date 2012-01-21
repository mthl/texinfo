#! /bin/sh

if [ z"$srcdir" = 'z' ]; then
  srcdir='.'
fi

tpdir=$srcdir/../tp

prove -I "$tpdir" -I "$tpdir"/maintain/lib/Unicode-EastAsianWidth/lib/ -I "$tpdir"/maintain/lib/libintl-perl/lib -I "$tpdir"/maintain/lib/Text-Unidecode/lib/ -I "$srcdir"/lib "$srcdir"/t/*.t
#prove -I "$tpdir" -I "$srcdir"/lib "$srcdir"/t/*.t
