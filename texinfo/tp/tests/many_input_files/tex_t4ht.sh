#! /bin/sh

if test "z$TEX_HTML_TESTS" != z'yes'; then
  echo "Skipping HTML TeX tests that are not easily reproducible"
  exit 77
fi

basename=tex_t4ht
diffs_dir=diffs
logfile=$basename.log
stdout_file=$basename.out

[ "z$srcdir" = 'z' ] && srcdir=.

if which httexi > /dev/null 2>&1; then
  :
else
  exit 77
fi

[ -d $diffs_dir ] || mkdir $diffs_dir

echo "$basename" > $logfile
: > $stdout_file

if tmp_dir=`mktemp -d l2h_t2h_XXXXXXXX`; then
  :
else
  exit 1
fi

[ -d $basename ] && rm -rf $basename
mkdir $basename
echo "perl -I $srcdir/../.. -I $srcdir/../../maintain/lib/Unicode-EastAsianWidth/lib/ -I $srcdir/../../maintain/lib/libintl-perl/lib -I $srcdir/../../maintain/lib/Text-Unidecode/lib/ -w $srcdir/../../texi2any.pl --set-customization-variable 'TEXI2HTML 1' --set-customization-variable 'TEST 1' --set-customization-variable L2H_TMP=$tmp_dir --conf-dir $srcdir/../../init --init-file tex4ht.pm --iftex --out $basename/ $srcdir/../tex_html/tex_complex.texi $srcdir/../tex_html/tex.texi --force >> $stdout_file 2>$basename/${basename}.2" >> $logfile
perl -I $srcdir/../.. -I $srcdir/../../maintain/lib/Unicode-EastAsianWidth/lib/ -I $srcdir/../../maintain/lib/libintl-perl/lib -I $srcdir/../../maintain/lib/Text-Unidecode/lib/ -w $srcdir/../../texi2any.pl --set-customization-variable 'TEXI2HTML 1' --set-customization-variable 'TEST 1' --set-customization-variable L2H_TMP=$tmp_dir --conf-dir $srcdir/../../init --init-file tex4ht.pm --iftex --out $basename/  $srcdir/../tex_html/tex_complex.texi $srcdir/../tex_html/tex.texi --force >> $stdout_file 2>$basename/${basename}.2

return_code=0
ret=$?
if [ $ret != 0 ]; then
  echo "F: $basename/$basename.2"
  return_code=1
else
  rm -f $basename/*_tex4ht_*.log \
      $basename/*_tex4ht_*.idv $basename/*_tex4ht_*.dvi \
      $basename/*_tex4ht_tex.html #$basename/*.png

  for dir in ${basename}; do
    if [ -d $srcdir/${dir}_res ]; then
      diff -u --exclude=CVS --exclude='*.png' -r "$srcdir/${dir}_res" "${dir}" 2>>$logfile > "$diffs_dir/$dir.diff"
      dif_ret=$?
      if [ $dif_ret != 0 ]; then
        echo "D: $diffs_dir/$dir.diff"
        return_code=1
      else
        rm "$diffs_dir/$dir.diff"
      fi
    else
      echo "no res: ${dir}_res"
    fi
  done
fi

rm -rf $tmp_dir

exit $return_code
