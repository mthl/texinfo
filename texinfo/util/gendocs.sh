#!/bin/sh

prog="`basename \"$0\"`"
srcdir=`pwd`
: ${MAKEINFO="/home/fsf/mohit/bin/makeinfo"}
: ${TEXI2DVI="/home/fsf/mohit/bin/texi2dvi"}
DVIPS="/usr/bin/dvips"
TEXI2HTML="/home/fsf/mohit/bin/texi2html"

calcsize()
{
  size="`ls -ksl $1 | awk '{print $1}'`"
  echo $size
}

curdate="`date '+%B %d, %Y'`"

if test $# -eq 2 ;
then
  PACKAGE=$1
  MANUAL_TITLE=$2
  echo Generating the manual for ${PACKAGE}
else
  echo usage: $prog package_name manual_title
  echo example: $prog emacs \"GNU Emacs Manual\"
  exit 1
fi

if test -s $srcdir/$PACKAGE.texinfo; then
  srcfile=$srcdir/$PACKAGE.texinfo
elif test -s $srcdir/$PACKAGE.texi; then
  srcfile=$srcdir/$PACKAGE.texi
elif test -s $srcdir/$PACKAGE.txi; then
  srcfile=$srcdir/$PACKAGE.txi
else
  echo "$0: cannot find .texinfo or .texi or .txi for $PACKAGE in $srcdir." >&2
  exit 1
fi

echo Creating manual for the package $PACKAGE

echo Generating info files...
${MAKEINFO} -o ${PACKAGE}.info $srcfile
tar zcf ${PACKAGE}-info.tar.gz ${PACKAGE}.info*
mkdir -p ${srcdir}/manual/info/
info_tgz_size="`calcsize ${srcdir}/${PACKAGE}-info.tar.gz`"
mv ${srcdir}/${PACKAGE}-info.tar.gz ${srcdir}/manual/info/

echo Generating dvi from texinfo sources...
${TEXI2DVI} $srcfile
echo Generating postscript...
${DVIPS} ${srcdir}/${PACKAGE} -o
gzip -f -9 ${srcdir}/${PACKAGE}.dvi
dvi_gz_size="`calcsize ${srcdir}/${PACKAGE}.dvi.gz`"
mkdir -p -p ${srcdir}/manual/dvi
mv ${srcdir}/${PACKAGE}.dvi.gz ${srcdir}/manual/dvi/
gzip -f -9 ${srcdir}/${PACKAGE}.ps
ps_gz_size="`calcsize ${srcdir}/${PACKAGE}.ps.gz`"
mkdir -p ${srcdir}/manual/ps/
mv ${srcdir}/${PACKAGE}.ps.gz ${srcdir}/manual/ps/

echo Generating ASCII...
${MAKEINFO} --no-split --no-headers $srcfile > ${srcdir}/${PACKAGE}.txt
ascii_size="`calcsize ${srcdir}/${PACKAGE}.txt`"
gzip -f -9 ${srcdir}/${PACKAGE}.txt
gzip -dc ${srcdir}/${PACKAGE}.txt.gz > ${srcdir}/${PACKAGE}.txt
ascii_gz_size="`calcsize ${srcdir}/${PACKAGE}.txt.gz`"
mkdir -p ${srcdir}/manual/text
mv ${srcdir}/${PACKAGE}.txt* ${srcdir}/manual/text/

echo Generating monolithic HTML...
rm -rf $PACKAGE.html  # in case a directory is left over
${MAKEINFO} --no-split --html $srcfile
html_mono_size="`calcsize ${srcdir}/${PACKAGE}.html`"
gzip -f -9 ${srcdir}/${PACKAGE}.html
gzip -dc ${srcdir}/${PACKAGE}.html.gz > ${srcdir}/${PACKAGE}.html
html_mono_gz_size="`calcsize ${srcdir}/${PACKAGE}.html.gz`"
mkdir -p ${srcdir}/manual/html_mono/
mv ${PACKAGE}.html* ${srcdir}/manual/html_mono/

# echo Generating HTML by chapter...
# ${TEXI2HTML} -split_chapter $srcfile
# cd ${srcdir}; tar zcf ${PACKAGE}_html_chapter.tar.gz *.html
# html_chapter_tgz_size="`calcsize ${srcdir}/${PACKAGE}_html_chapter.tar.gz`"
# mkdir -p manual/html_chapter/
# mv *.html ${PACKAGE}_html_chapter.tar.gz manual/html_chapter/

echo Generating HTML by node...
${MAKEINFO} --html $srcfile
if test -d $PACKAGE; then
  split_html_dir=$PACKAGE
elif test -d $PACKAGE.html; then
  split_html_dir=$PACKAGE.html
else 
  echo "$0: can't find split html dir for $srcfile." >&2
fi
cd ${split_html_dir}
tar -zcf ${PACKAGE}_html_node.tar.gz -- *.html
mv ${PACKAGE}_html_node.tar.gz ${srcdir}/ ; cd ${srcdir}
html_node_tgz_size="`calcsize ${srcdir}/${PACKAGE}_html_node.tar.gz`"
mkdir -p manual/html_node/
mv ${split_html_dir}/*.html ${PACKAGE}_html_node.tar.gz manual/html_node/
rmdir ${split_html_dir}

echo Making .tar.gz for sources...
srcfiles=`ls *.texinfo *.texi *.txi 2>/dev/null`
tar zcfh ${PACKAGE}.texi.tar.gz $srcfiles
mkdir -p manual/texi/
texi_tgz_size="`calcsize ${PACKAGE}.texi.tar.gz`"
mv ${PACKAGE}.texi.tar.gz manual/texi/

echo Writing index file...
cat /home/m/mohit/gnudoc/gnudoc_template | sed \
   -e "s/%%TITLE%%/$MANUAL_TITLE/g" \
   -e "s/%%DATE%%/$curdate/g" \
   -e "s/%%PACKAGE%%/$PACKAGE/g" \
   -e "s/%%HTML_MONO_SIZE%%/$html_mono_size/g" \
   -e "s/%%HTML_MONO_GZ_SIZE%%/$html_mono_gz_size/g" \
   -e "s/%%HTML_NODE_TGZ_SIZE%%/$html_node_tgz_size/g" \
   -e "s/%%INFO_TGZ_SIZE%%/$info_tgz_size/g" \
   -e "s/%%ASCII_SIZE%%/$ascii_size/g" \
   -e "s/%%ASCII_GZ_SIZE%%/$ascii_gz_size/g" \
   -e "s/%%DVI_GZ_SIZE%%/$dvi_gz_size/g" \
   -e "s/%%PS_GZ_SIZE%%/$ps_gz_size/g" \
   -e "s/%%TEXI_TGZ_SIZE%%/$texi_tgz_size/g" \
  > ${srcdir}/manual/${PACKAGE}.html

echo Done!
