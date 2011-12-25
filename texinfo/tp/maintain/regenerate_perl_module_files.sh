#! /bin/sh

# Regenerate files required for perl

# This regenerate files in t/include_dir/
make
rm -rf LocaleData

for dir in po po_document; do
  rm -rf $dir
  mkdir $dir
  cp maintain/Makefile_perl_po $dir/Makefile
  grep '^tp\/' ../$dir/POTFILES.in | sed -e 's/^tp/../' > $dir/POTFILES.in
  cp maintain/package_name $dir/PACKAGE
  cat ../$dir/Makevars >> $dir/PACKAGE
  linguas_str=
  for lingua in `cat ../$dir/LINGUAS`; do
    linguas_str="$linguas_str $lingua"
    cp -p ../$dir/$lingua.po $dir
  done
  echo "LINGUAS = $linguas_str" >> $dir/PACKAGE

  (cd $dir && make all && make clean)
done

find LocaleData po_document po t/include_dir -type f | sort > maintain/MANIFEST_generated_files
