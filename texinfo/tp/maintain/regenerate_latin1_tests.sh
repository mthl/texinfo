#! /bin/sh

iconv -f utf8 -t latin1 < t/input_files/char_latin1_utf8_in_refs.texi > t/input_files/char_latin1_latin1_in_refs.texi
sed -i -e 's/@documentencoding utf-8/@documentencoding iso-8859-1/' t/input_files/char_latin1_latin1_in_refs.texi
