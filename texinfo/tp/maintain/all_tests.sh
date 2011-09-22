#! /bin/sh

command=$1
if [ $# -gt 0 ]; then 
 shift
 test_name=$1
fi

if [ z"$command" = 'z' ]; then
  echo "Need an arg"
  exit 1
fi

if [ "$command" = 'clean' ]; then
  rm -f t/results/*/*.pl.new
elif [ "$command" = 'generate' ]; then
  for file in t/*.t; do
    perl $file -g
  done
elif [ "$command" = 'output' ]; then
  for file in t/*.t; do
    perl $file -o
  done
elif [ "$command" = 'diff' ]; then
  if [ z"$test_name" = 'z' ]; then
    for result in t/results/*/*.pl; do
      diff -U 3 $result $result.new
    done
  else
    for result in t/results/$test_name/*.pl; do
      diff -u $result $result.new
    done
  fi 
else
  echo "Unknown command"
  exit 1
fi
