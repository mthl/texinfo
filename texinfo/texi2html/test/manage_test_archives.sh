#! /bin/sh

user=pertusus

command=$1

if [ "z$command" = 'z' ]; then
  echo "Need something to do (pack/packt2h/unpack/get/clean/upload)"
  exit 1
fi
shift;

if [ z"$1" != 'z' ]; then
  user=$1
fi

download_dir="download-mirror.savannah.gnu.org/releases/texinfo"

VERSION=`grep '^VERSION = ' ../../Makefile | sed 's/^VERSION = *//'`
if [ z"$VERSION" = 'z' ]; then
  echo "Cannot find version"
  exit 1
fi

tp_tests_name=tp_tests_results-$VERSION
texi2html_tests_name=t2h_tests_results
#manuals=t2h_tests_big_manuals

if [ $command = 'packt2h' ]; then
  rm -f $texi2html_tests_name.tar.gz #$manuals.tar.gz
  (
  cd ..
  tar c --exclude-vcs -z -f test/$texi2html_tests_name.tar.gz test/*/res/ test/*/res_all/ test/*/res_info/ test/*/res_html/ test/*/res_docbook/ test/*/res_xml/ test/many_input_files/*_res/
  #tar c --exclude-vcs -z -f test/$manuals.tar.gz test/manuals/*.texi test/tar_manual/*.texi test/singular_manual/*.tex* test/singular_manual/d2t_singular/
  )
elif [ $command = 'pack' ]; then
  rm -f $tp_tests_name.tar.gz
  (
  cd ..
  tar c --exclude-vcs -z -f test/$tp_tests_name.tar.gz test/*/res_parser*/
  )
elif [ $command = 'get' ]; then :
  wget -N -r -np -A '*.tar.gz*' http://$download_dir/ || exit 1
  for file in $texi2html_tests_name $tp_tests_name; do
    if [ -f  $download_dir/$file.tar.gz ]; then
      cp -a $download_dir/$file.tar.gz .
    fi
  done
elif [ $command = 'clean' ]; then
  rm -rf download-mirror.savannah.gnu.org
  rm -f $texi2html_tests_name.tar.gz $tp_tests_name.tar.gz
elif [ $command = 'unpack' ]; then
  (
  cd ..
  for file in $texi2html_tests_name $tp_tests_name; do
    if [ -f test/$file.tar.gz ]; then
      tar x -z -f test/$file.tar.gz
    fi
  done
  #tar x -z -f test/$manuals.tar.gz
  )
elif [ $command = 'upload' ]; then
  mkdir -p upload
  #cp -a $texi2html_tests_name.tar.gz upload
  #gpg -b --use-agent upload/$texi2html_tests_name.tar.gz
  cp -a $tp_tests_name.tar.gz upload
  gpg -b --use-agent upload/$tp_tests_name.tar.gz
  rsync -a --delete -essh upload/ $user@dl.sv.gnu.org:/releases/texinfo/
else
  echo "Unknown command (pack/packt2h/unpack/get/clean/upload)"
  exit 1
fi

