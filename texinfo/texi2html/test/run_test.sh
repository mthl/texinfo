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

no_latex2html=yes
if which latex2html > /dev/null 2>&1; then
  no_latex2html=no
fi

no_tex4ht=yes
if which httexi > /dev/null 2>&1; then
  no_tex4ht=no
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
    remaining=`echo $line | sed 's/[a-zA-Z0-9_./-]\+ \+[a-zA-Z0-9_./-]\+ *//'`
    [ "z$dir" = 'z' -o "$zfile" = 'z' ] && continue
    basename=`basename $file .texi`
    if [ "z$dir" = 'ztexi' ]; then
      dir="texi_${basename}"
    fi
    if [ "z$clean" = 'zyes' ]; then
      [ -d "$out_dir/$dir" ] && rm -rf "$out_dir/$dir"
    else
      do_info=no
      if echo "$remaining" | grep -qs -- '-init info.init'; then
         do_info=yes
      fi
      if [ -d "$out_dir/$dir" ]; then
        if [ -d "$res_dir/$dir" ]; then
          # ugly hack to avoid CVS
          rm "$res_dir/$dir/"*.*
        else
           mkdir "$res_dir/$dir/"
        fi
        cp -r "$out_dir/$dir/"* "$res_dir/$dir/"
        rm -f "$res_dir/$dir/"*.png "$res_dir/$dir/"*_l2h.css
        [ z"$do_info" = z'yes' ] && rm "$res_dir/$dir/$basename.2"
      else
        echo "No dir $out_dir/$dir" 1>&2
      fi
    fi
  done < "$driving_file"
  exit 0
fi

[ -d "$diffs_dir" ] || mkdir "$diffs_dir"
[ -d "$out_dir" ] || mkdir "$out_dir"

if tmp_dir=`mktemp -p /tmp -d l2h_t2h_XXXXXXXX`; then
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
    use_latex2html=no
    use_tex4ht=no
    if echo "$remaining" | grep -qs -- '-l2h'; then
      if [ "$no_latex2html" = 'yes' ]; then
        echo "S: (no latex2html) $dir"
        continue
      fi
      use_latex2html=yes
    elif echo "$remaining" | grep -qs -- '-init tex4ht.init'; then
      if [ "$no_tex4ht" = 'yes' ]; then
        echo "S: (no tex4ht) $dir"
        continue
      fi
      use_tex4ht=yes
    elif echo "$remaining" | grep -qs -- '-init info.init'; then
      do_info=yes
    fi
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
    sed -i -e 's/^texexpand.*/texexpand /' "$out_dir/$dir/$basename.2"
    sed -i '/is no longer supported at.*line/d' "$out_dir/$dir/$basename.2"
    if [ "$use_latex2html" = 'yes' ]; then
      sed -i -e 's/CONTENT="LaTeX2HTML.*/CONTENT="LaTeX2HTML">/' -e \
       's/with LaTeX2HTML.*/with LaTeX2HTML/' "$out_dir/$dir/"*"_l2h.html"
      # "*"_images.pl" files are not guaranteed to be present
      for file in "$out_dir/$dir/"*"_images.pl" "$out_dir/$dir/"*"_labels.pl"; do
       if [ -f "$file" ]; then
        sed -i -e 's/^# LaTeX2HTML.*/# LaTeX2HTML/' "$file"
       fi
      done
      rm -f "$out_dir/$dir/"*".aux"  "$out_dir/$dir/"*"_images.out"
    fi
    if [ -d "$results_dir/$dir" ]; then
      exclude_info=
      [ z"$do_info" = z'yes' ] && exclude_info="--exclude=$basename.2"
      diff -a -u --exclude=CVS --exclude='*.png' --exclude='*_l2h.css' $exclude_info -r "$results_dir/$dir" "$out_dir/$dir" 2>>$logfile > "$diffs_dir/$dir.diff"
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
