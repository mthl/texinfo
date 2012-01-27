# $Id: Makefile.am,v 1.34 2012-01-27 20:23:03 pertusus Exp $
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

SUBDIRS = . tests

bin_SCRIPTS = texi2any

do_subst = sed \
  -e 's,[@]PACKAGE_VERSION[@],$(PACKAGE_VERSION),g' \
  -e 's,[@]PACKAGE_NAME[@],$(PACKAGE_NAME),g' \
  -e 's,[@]PACKAGE_URL[@],$(PACKAGE_URL),g' \
  -e 's,[@]sysconfdir[@],$(sysconfdir),g' \
  -e 's,[@]prefix[@],$(prefix),g' \
  -e 's,[@]datarootdir[@],$(datarootdir),g' \
  -e 's,[@]datadir[@],$(datadir),g' \
  -e 's,[@]PACKAGE[@],$(PACKAGE),g' \
  -e 's,[@]USE_EXTERNAL_LIBINTL[@],$(USE_EXTERNAL_LIBINTL),g' \
  -e 's,[@]USE_EXTERNAL_EASTASIANWIDTH[@],$(USE_EXTERNAL_EASTASIANWIDTH),g' \
  -e 's,[@]USE_EXTERNAL_UNIDECODE[@],$(USE_EXTERNAL_UNIDECODE),g'

texi2any: texi2any.pl $(top_builddir)/config.status
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
 Texinfo/Convert/TextContent.pm \
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
 init/tex4ht.pm \
 init/latex2html.pm

test_files = \
 t/README \
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
 t/include/image_encoded.txt \
 t/include/inc_@f--ile.texi \
 t/include/included_file_with_setfilename.texi \
 t/include/this_is_a_long_unknown_file.png \
 t/include/verbatim_encoded.texi \
 t/include/verbatim_encoded_latin1.texi \
 t/include/words.txt \
 t/include_reference/f--ile.png \
 t/include_reference/f--ile.txt \
 t/include_reference/inc_file.texi \
 t/include_reference/incl-incl.txi \
 t/include_reference/macro_included.texi \
 t/include_reference/section_file.texi \
 t/init/only_toc_out.init \
 t/init/cvs.init \
 t/init/redefine_need.init \
 t/init/icons.init \
 t/init/t2h_singular.init \
 t/init/ignore_and_comments_output.init \
 t/init/test_directions.init \
 t/init/mini_ker_t2h.init \
 t/init/test_renamed_nodes.init \
 t/init/misc_file_collision.init \
 t/init/l2h.init \
 t/manual_tree.pl \
 t/test_utils.pl \
 t/input_files/delcomment.texi \
 t/input_files/char_latin1_utf8_in_refs.texi \
 t/input_files/char_latin1_latin1_in_refs.texi \
 t/input_files/sample_utf8.texi \
 t/input_files/japanese_utf8.texi \
 t/input_files/chinese_mixed_with_en.texi \
 #

relative_include_dir = t/include_dir
document_domain = $(PACKAGE)_document
all-local: maintain/catalog.xml
	for file in $(srcdir)/../po_document/*.gmo; do \
	  cat=`basename "$$file"` ; \
	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
	  $(MKDIR_P) "LocaleData/$$lang/LC_MESSAGES/" ; \
	  $(INSTALL_DATA) $$file LocaleData/$$lang/LC_MESSAGES/$(document_domain).mo; \
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

maintainance_files = \
  maintain/all_tests.sh \
  maintain/change_perl_modules_version.sh \
  maintain/language-subtag-registry \
  maintain/Makefile_perl_po \
  maintain/MANIFEST_generated_files \
  maintain/prepare_perl_module.sh \
  maintain/regenerate_converters_documentation.sh \
  maintain/regenerate_documentlanguages.pl \
  maintain/regenerate_file_lists.pl \
  maintain/regenerate_perl_module_files.sh \
  maintain/template.pod \
  maintain/catalog.xml.in

perl_specific_files = \
  Makefile.PL \
  Changes \
  MANIFEST

EXTRA_DIST = \
  texi2any.pl \
  $(test_results) \
  $(test_files) \
  $(tp_tests) \
  $(maintainance_files) \
  $(perl_specific_files) \
  maintain/lib

MANIFEST: maintain/MANIFEST_generated_files Makefile.am Makefile.tres
	echo "$(dist_modules_DATA) $(dist_converters_DATA) $(dist_debugmodules_DATA) " \
	"$(dist_init_DATA) $(test_files) $(tp_tests) $(test_results) " \
	"texi2any-perl $(maintainance_files) README TODO COPYING " \
	"$(perl_specific_files)" \
	 | sed 's/ \+/\n/g' | sort | cat - $< > $@

maintain/catalog.xml: maintain/catalog.xml.in Makefile
	$(MKDIR_P) maintain
	sed -E 's|[@]abs_top_srcdir[@]|$(abs_top_srcdir)|' $< > $@


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
	rm -rf LocaleData
	rm -f t/results/*/*.pl.new
	rm -rf t/results/*/*/out_*/
	rm -rf $(relative_include_dir)
	rm -rf blib po po_document

CLEANFILES = texi2any makeinfo texi2any-perl
DISTCLEANFILES = maintain/catalog.xml pm_to_blib Makefile.old
