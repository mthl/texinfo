#! /bin/sh

# This script should be run when t/input_files/char_latin1_utf8_in_refs.texi
# is modified

iconv -f utf8 -t latin1 < t/input_files/char_latin1_utf8_in_refs.texi > t/input_files/char_latin1_latin1_in_refs.texi
sed -e 's/@documentencoding utf-8/@documentencoding iso-8859-1/' t/input_files/char_latin1_latin1_in_refs.texi > t/input_files/char_latin1_latin1_in_refs.texi.$$.tmp
mv t/input_files/char_latin1_latin1_in_refs.texi.$$.tmp t/input_files/char_latin1_latin1_in_refs.texi
