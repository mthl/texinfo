#! /bin/sh

if [ z"$srcdir" = 'z' ]; then
  srcdir=.
fi

arg=
if [ z"$1" = 'z-clean' ]; then
  arg='-clean'
  shift
elif [ z"$1" = 'z-copy' ]; then
  arg='-copy'
  shift
fi

failed=0
while [ z"$1" != 'z' ]; do
  dir=$1
  shift
  [ -d "$dir" ] || mkdir $dir
  (export srcdir_test=$dir; cd "$dir" && ../"$srcdir"/run_test.sh $arg)
  result=$?
  echo "$dir: $result"
  [ $result != 0 ] && failed=1
done

exit $failed
