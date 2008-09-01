#! /bin/sh

basename=indices
diffs_dir=diffs
logfile=$basename.log
stdout_file=$basename.out

[ "z$srcdir" = 'z' ] && srcdir=.

[ -d $diffs_dir ] || mkdir $diffs_dir

echo "$basename" > $logfile
: > $stdout_file

[ -d index_split ] && rm -rf index_split
[ -d $basename ] && rm -rf $basename
mkdir $basename
echo "perl -w -x $srcdir/../../texi2html.pl -conf-dir $srcdir/../indices/ -test -split chapter -init index_test.init --out $basename/ $srcdir/../indices/index_table.texi $srcdir/../indices/index_split.texi >> $stdout_file 2>$basename/${basename}.2" >> $logfile
perl -w -x $srcdir/../../texi2html.pl -conf-dir $srcdir/../indices/ -test -split chapter -init index_test.init --out $basename/ $srcdir/../indices/index_table.texi $srcdir/../indices/index_split.texi >> $stdout_file 2>$basename/${basename}.2

ret=$?
if [ $ret != 0 ]; then
  echo "F: $basename/$basename.2"
  exit 1
fi

return_code=0
for dir in ${basename} index_split; do
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

exit $return_code
