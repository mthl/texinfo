#! /bin/sh

dir=`echo $0 | sed 's,/[^/]\+$,,'`
outfile=Makefile.documents_strings_mo_files

(
cd $dir/..

if [ -f ../po_document/LINGUAS ]; then :
else
  echo "no ../po_document/LINGUAS" 1>&2
  exit 1
fi

: > $outfile
for lingua in `cat ../po_document/LINGUAS`; do
  echo '$(srcdir)/../po_document/'"$lingua.gmo"': $(srcdir)/../po_document/'"$lingua.po"'
	cd $(srcdir)/../po_document/ && $(MAKE) $(AM_MAKEFLAGS) '"$lingua.gmo"'

LocaleData/'"$lingua"'/LC_MESSAGES/$(document_domain).mo: $(srcdir)/../po_document/'"$lingua"'.gmo LocaleData/'"$lingua"'/LC_MESSAGES
	$(INSTALL_DATA) $< $@

LocaleData/'"$lingua"'/LC_MESSAGES: LocaleData/'"$lingua"'
	$(MKDIR_P) $@

LocaleData/'"$lingua"': LocaleData
	$(MKDIR_P) $@
' >> $outfile
  dependencies="$dependencies "'LocaleData/'"$lingua"'/LC_MESSAGES/$(document_domain).mo'
done

echo 'LocaleData:
	$(MKDIR_P) $@

document_strings_mo_files = '"$dependencies" >> $outfile
)

