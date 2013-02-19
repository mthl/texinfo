#! /bin/sh
# Copyright (C) 2010 Free Software Foundation, Inc.
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

if [ z"$srcdir" = 'z' ]; then
  srcdir=.
fi

command=run_test.sh

if [ z"$1" = 'zall' ]; then
  command=run_test_all.sh
  shift
fi

arg=
if [ z"$1" = 'z-clean' ]; then
  arg='-clean'
  shift
elif [ z"$1" = 'z-copy' ]; then
  arg='-copy'
  shift
fi

if [ z"$1" = 'zall' ]; then
  command=run_test_all.sh
  shift
fi

failed=0
while [ z"$1" != 'z' ]; do
  dir=$1
  shift
  [ -d "$dir" ] || mkdir $dir
  (export srcdir_test=$dir; cd "$dir" && ../"$srcdir"/"$command" $arg)
  result=$?
  echo "$dir: $result"
  [ $result != 0 ] && failed=1
done

exit $failed
