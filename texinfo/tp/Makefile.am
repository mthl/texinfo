# $Id: Makefile.am,v 1.13 2011-10-28 23:51:27 karl Exp $
# Makefile.am for texinfo/tp.
#
# Copyright 2011 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# A long list of files that we generate.
include $(srcdir)/Makefile.tres

$(srcdir)/Makefile.tres: maintain/regenerate_file_lists.pl
	cd $(srcdir)/ && $(PERL) ./maintain/regenerate_file_lists.pl

bin_SCRIPTS = texi2any

do_subst = sed \
  -e 's,[@]PACKAGE_VERSION[@],$(PACKAGE_VERSION),g' \
  -e 's,[@]PACKAGE_NAME[@],$(PACKAGE_NAME),g' \
  -e 's,[@]sysconfdir[@],$(sysconfdir),g' \
  -e 's,[@]prefix[@],$(prefix),g' \
  -e 's,[@]datarootdir[@],$(datarootdir),g' \
  -e 's,[@]datadir[@],$(datadir),g' \
  -e 's,[@]PACKAGE[@],$(PACKAGE),g' \
  -e 's,[@]USE_EXTERNAL_LIBINTL[@],$(USE_EXTERNAL_LIBINTL),g' \
  -e 's,[@]USE_EXTERNAL_EASTASIANWIDTH[@],$(USE_EXTERNAL_EASTASIANWIDTH),g' \
  -e 's,[@]USE_EXTERNAL_UNIDECODE[@],$(USE_EXTERNAL_UNIDECODE),g'

texi2any: texi2any.pl
	$(do_subst) $(srcdir)/$< >$@
	chmod a+x $@

makeinfo: texi2any
	rm -f $@
	-$(LN_S) texi2any $@

modulesdir = $(pkgdatadir)/Texinfo
dist_modules_DATA = \
 Texinfo/Parser.pm \
 Texinfo/Report.pm \
 Texinfo/Common.pm \
 Texinfo/Encoding.pm \
 Texinfo/Structuring.pm \
 Texinfo/Documentlanguages.pm

convertersdir = $(pkgdatadir)/Texinfo/Convert
dist_converters_DATA = \
 Texinfo/Convert/Texinfo.pm \
 Texinfo/Convert/Info.pm \
 Texinfo/Convert/NodeNameNormalization.pm \
 Texinfo/Convert/Converter.pm \
 Texinfo/Convert/XML.pm \
 Texinfo/Convert/Plaintext.pm \
 Texinfo/Convert/HTML.pm \
 Texinfo/Convert/DocBook.pm \
 Texinfo/Convert/Text.pm \
 Texinfo/Convert/UnFilled.pm \
 Texinfo/Convert/Paragraph.pm \
 Texinfo/Convert/Line.pm \
 Texinfo/Convert/Unicode.pm

debugmodulesdir = $(pkgdatadir)/DebugTexinfo
dist_debugmodules_DATA = \
 DebugTexinfo/DebugCount.pm \
 DebugTexinfo/DebugTree.pm

initdir = $(datadir)/texinfo/init
dist_init_DATA = \
 init/book.pm \
 init/chm.pm \
 init/html32.pm \
 init/tex4ht.pm

test_files = \
 t/01use.t \
 t/02coverage.t \
 t/03coverage_braces.t \
 t/04verb.t \
 t/05paragraph.t \
 t/06columnfractions.t \
 t/08misc_commands.t \
 t/09indices.t \
 t/10menu.t \
 t/16raw.t \
 t/181quotation.t \
 t/18itemize.t \
 t/19def.t \
 t/21multitable.t \
 t/22xtable.t \
 t/27float.t \
 t/28heading.t \
 t/30sectioning.t \
 t/50value.t \
 t/55conditionals.t \
 t/57invalid_nestings.t \
 t/58alias.t \
 t/60macro.t \
 t/70value_and_macro.t \
 t/README \
 t/accents.t \
 t/html_tests.t \
 t/include/a.txt \
 t/include/aa.txt \
 t/include/count_image.png \
 t/include/count_image.txt \
 t/include/count_image_text.txt \
 t/include/f.txt \
 t/include/fdotext.ext \
 t/include/fdotext.png \
 t/include/fdotext.txt \
 t/include/fext.ext \
 t/include/fext.png \
 t/include/fext.txt \
 t/include/fextext \
 t/include/file_with_xml_chars.texi \
 t/include/image.txt \
 t/include/inc_@f--ile.texi \
 t/include/included_file_with_setfilename.texi \
 t/include/this_is_a_long_unknown_file.png \
 t/include/words.txt \
 t/include_reference/f--ile.png \
 t/include_reference/f--ile.txt \
 t/include_reference/inc_file.texi \
 t/include_reference/incl-incl.txi \
 t/include_reference/macro_included.texi \
 t/include_reference/section_file.texi \
 t/info_tests.t \
 t/init/redefine_need.init \
 t/init/test_directions.init \
 t/init/test_renamed_nodes.init \
 t/languages.t \
 t/manual_tree.pl \
 t/nodenormalization.t \
 t/paragraph.t \
 t/plaintext_tests.t \
 t/test_count.t \
 t/test_sort.t \
 t/test_utils.pl \
 #

relative_include_dir = t/include_dir
document_domain = $(PACKAGE)_document
all-local:
	rm -rf t/locales
	for file in $(srcdir)/../po_document/*.gmo; do \
	  cat=`basename "$$file"` ; \
	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
	  $(MKDIR_P) "t/locales/$$lang/LC_MESSAGES/" ; \
	  $(INSTALL_DATA) $$file t/locales/$$lang/LC_MESSAGES/$(document_domain).mo; \
	done
	$(MKDIR_P) $(relative_include_dir); \
	for file in $(srcdir)/t/include_reference/*.*; do \
	  bfile=`basename "$$file"`; \
	  $(INSTALL_DATA) "$$file" "$(relative_include_dir)/$$bfile"; \
	done

tp_tests = prove.sh

if TP_TESTS
TESTS = $(tp_tests)
endif

EXTRA_DIST = \
  texi2any.pl \
  $(test_results) \
  $(test_files) \
  $(tp_tests) \
  maintain/regenerate_file_lists.pl \
  maintain/lib

libsrcdir = $(srcdir)/maintain/lib

install-data-local:
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/Recode \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/RecodeData
	$(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale
	$(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/Recode/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/Recode
	$(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/RecodeData/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/RecodeData
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode
	$(INSTALL_DATA) $(libsrcdir)/Unicode-EastAsianWidth/lib/Unicode/EastAsianWidth.pm \
	 $(DESTDIR)$(pkgdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/lib/Text-Unidecode/lib/Text/Unidecode
	$(INSTALL_DATA) $(libsrcdir)/Text-Unidecode/lib/Text/Unidecode.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/Text-Unidecode/lib/Text
	$(INSTALL_DATA) $(libsrcdir)/Text-Unidecode/lib/Text/Unidecode/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/Text-Unidecode/lib/Text/Unidecode

install-exec-hook:
	-$(LN_S) texi2any $(DESTDIR)$(bindir)/makeinfo

dist-hook:
	rm -rf `find $(distdir)/maintain/lib -name CVS`

uninstall-local:
	rm -rf $(DESTDIR)$(pkgdatadir)/lib/

distclean-local:
	rm -rf t/locales
	rm -f t/results/*/*.pl.new
	rm -rf $(relative_include_dir)

CLEANFILES = texi2any
