#! /bin/sh

command=$1

if [ "z$command" = 'z' ]; then
  echo "Need something to do (pack/unpack/get)"
  exit 1
fi

VERSION=`grep '^VERSION = ' ../../Makefile | sed 's/^VERSION = *//'`
if [ z"$VERSION" = 'z' ]; then
  echo "Cannot find version"
  exit 1
fi

texi2html_tests_name=t2h_tests_results-$VERSION
tp_tests_name=tp_tests_results-$VERSION
manuals=t2h_tests_big_manuals-$VERSION

if [ $command = 'pack' ]; then
  rm -f $texi2html_tests_name.tar.gz $tp_tests_name.tar.gz $manuals.tar.gz
  (
  cd ..
  tar c --exclude-vcs -z -f test/$texi2html_tests_name.tar.gz test/*/res/ test/*/res_all/ test/*/res_info/ test/*/res_html/ test/*/res_docbook/ test/*/res_xml/ test/many_input_files/*_res/
  tar c --exclude-vcs -z -f test/$manuals.tar.gz test/manuals/*.texi test/tar_manual/*.texi test/singular_manual/*.tex* test/singular_manual/d2t_singular/
  tar c --exclude-vcs -z -f test/$tp_tests_name.tar.gz test/*/res_parser*/
  )
elif [ $command = 'get' ]; then :
  #wget  ??
elif [ $command = 'unpack' ]; then
  (
  cd ..
  tar x -z -f test/$texi2html_tests_name.tar.gz
  tar x -z -f test/$manuals.tar.gz
  tar x -z -f test/$tp_tests_name.tar.gz
  )
else
  echo "Unknown command (pack/unpack/get)"
  exit 1
fi

