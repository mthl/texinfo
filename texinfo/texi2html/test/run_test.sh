#! /bin/sh

#set -x

#echo "SRCDIR $srcdir srcdir_test $srcdir_test"

export LANG=C

res_dir=res
out_dir=out
diffs_dir=diffs

logfile=tests.log
stdout_file=tests.out

clean=no
if [ z"$1" = 'z-clean' ]; then
  clean=yes
  shift
fi

copy=no
if [ z"$1" = 'z-copy' ]; then
  [ -d "$res_dir" ] || mkdir "$res_dir"
  copy=yes
  shift
fi

one_test=no
if [ z"$1" != 'z' ]; then
  one_test=yes
  the_test=$1
  if [ "z$the_test" = "ztexi" ]; then
    the_file=$2
    [ "z$the_file" != "z" ] && the_basename=`basename $the_file .texi`
  fi
fi

if [ "z$srcdir_test" = 'z' ]; then
  testdir=.
  srcdir_test=.
else
  if [ "z$srcdir" = 'z' ]; then
     testdir=..
  else
     testdir=../$srcdir
  fi
fi

results_dir="$testdir/$srcdir_test/$res_dir"
test_file='tests.txt'
driving_file="$testdir/$srcdir_test/$test_file"

if [ -f "$driving_file" ]; then
  :
else
  echo "Cannot find test driving file $driving_file" 1>&2
  exit 1
fi

if [ "z$clean" = 'zyes' -o "z$copy" = 'zyes' ]; then
  while read line
  do
    if echo $line | grep -qs '^ *#'; then continue; fi
# there are better ways
    dir=`echo $line | awk '{print $1}'`
    file=`echo $line | awk '{print $2}'`
    [ "z$dir" = 'z' -o "$zfile" = 'z' ] && continue
    basename=`basename $file .texi`
    if [ "z$dir" = 'ztexi' ]; then
      dir="texi_${basename}"
    fi
    if [ "z$clean" = 'zyes' ]; then
      [ -d "$out_dir/$dir" ] && rm -rf "$out_dir/$dir"
    else
      if [ -d "$out_dir/$dir" ]; then
        if [ -d "$res_dir/$dir" ]; then
          # ugly hack to avoid CVS
          rm "$res_dir/$dir/"*.*
        else
           mkdir "$res_dir/$dir/"
        fi
        cp -r "$out_dir/$dir/"* "$res_dir/$dir/"
      else
        echo "No dir $out_dir/$dir" 1>&2
      fi
    fi
  done < "$driving_file"
  exit 0
fi

[ -d "$diffs_dir" ] || mkdir "$diffs_dir"
[ -d "$out_dir" ] || mkdir "$out_dir"

if tmp_dir=`mktemp --tmpdir -d l2h_t2h_XXXXXXXX`; then
  echo "\$L2H_TMP = '$tmp_dir';" > l2h_tmp_dir.init
  echo "1;" >> l2h_tmp_dir.init
else
  exit 1
fi

echo "result_dir $results_dir, driving_file $driving_file" > $logfile
echo "" > $stdout_file

return_code=0

while read line
do
  if echo $line | grep -qs '^ *#'; then continue; fi
# there are better ways
  dir=`echo $line | awk '{print $1}'`
  file=`echo $line | awk '{print $2}'`
  [ "z$dir" = 'z' -o "$zfile" = 'z' ] && continue
  basename=`basename $file .texi`
  remaining=`echo $line | sed 's/[a-zA-Z0-9_./-]\+ \+[a-zA-Z0-9_./-]\+ *//'`
  src_file="$testdir/$srcdir_test/$file"
  if [ $one_test = 'yes' -a "z$dir" != "z$the_test" ]; then
    continue
  fi
  if [ "z$dir" = 'ztexi' ]; then
    if [ $one_test = 'yes' -a "z$the_basename" != 'z' -a "z$basename" != "z$the_basename" ]; then
      continue
    fi
    one_test_done=yes
    dir="texi_${basename}"
    [ -d "$out_dir/$dir" ] && rm -rf "$out_dir/$dir"
    mkdir "$out_dir/$dir"
    # -I $testdir/$srcdir_test/ is useful when file name is found using 
    # @setfilename
    echo "$dir" >> $logfile
    echo "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -test --out $out_dir/$dir/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ -dump-texi $remaining $src_file 2>$out_dir/$dir/$basename.2" >> $logfile
    eval "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -test --out $out_dir/$dir/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ -dump-texi $remaining $src_file 2>$out_dir/$dir/$basename.2"
    echo "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -test --out $out_dir/$dir/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ --macro-expand=$out_dir/$dir/$basename.texi $remaining $src_file 2>>$out_dir/$dir/$basename.2" >> $logfile
    eval "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -test --out $out_dir/$dir/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ --macro-expand=$out_dir/$dir/$basename.texi $remaining $src_file 2>>$out_dir/$dir/$basename.2" 
    ret=$?
  else
    one_test_done=yes
    [ -d "$out_dir/$dir" ] && rm -rf "$out_dir/$dir"
    mkdir "$out_dir/$dir"
    echo "$dir" >> $logfile
    echo >> $stdout_file
    echo "  ----> $dir" >> $stdout_file
    echo "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ -test --out $out_dir/$dir/ $remaining $src_file >> $stdout_file 2>$out_dir/$dir/$basename.2" >> $logfile
    eval "perl -w -x $testdir/$srcdir_test/../../texi2html.pl -conf-dir $testdir/$srcdir_test/../../examples -conf-dir $testdir/$srcdir_test/ -I $testdir/$srcdir_test/ -I $testdir/$srcdir_test/../ -test --out $out_dir/$dir/ $remaining $src_file >> $stdout_file 2>$out_dir/$dir/$basename.2"
    ret=$?
    rm -f $out_dir/$dir/*_l2h_images.log $out_dir/$dir/*_tex4ht_*.log \
      $out_dir/$dir/*_tex4ht_*.idv $out_dir/$dir/*_tex4ht_*.dvi \
      $out_dir/$dir/*_tex4ht_tex.html
  fi
  if [ $ret = 0 ]; then
    if [ -d "$results_dir/$dir" ]; then
      diff -u --exclude=CVS --exclude='*.png' -r "$results_dir/$dir" "$out_dir/$dir" 2>>$logfile > "$diffs_dir/$dir.diff"
      dif_ret=$?
      if [ $dif_ret != 0 ]; then
        echo "D: $diffs_dir/$dir.diff"
        return_code=1
      else
        rm "$diffs_dir/$dir.diff"
      fi
    else
      echo "no res: $dir"
    fi
  else
    echo "F: $out_dir/$dir/$basename.2"
    return_code=1
  fi
done < "$driving_file"

rm -rf $tmp_dir

if [ "$one_test" = 'yes' -a "z$one_test_done" != "zyes" ]; then
  echo "$the_test $the_file test not found"
fi

exit $return_code
