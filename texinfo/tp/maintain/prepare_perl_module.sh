#! /bin/sh

./maintain/regenerate_perl_module_files.sh
make MANIFEST
perl Makefile.PL
VERSION=`grep '^VERSION = ' Makefile | sed 's/^VERSION = *//'`
[ z"$VERSION" = 'z' ] && exit 1
rm -f Texinfo-$VERSION.tar.gz
cp -p ../COPYING .
make && make dist
rm COPYING
tar xzvf Texinfo-$VERSION.tar.gz
(cd Texinfo-*.*/ && perl Makefile.PL && make && make test && \
                 ./maintain/all_tests.sh clean && make distcheck) || exit 1
rm -rf Texinfo-$VERSION/
(cd ../ && ./config.status)
