include Makefile.incl

$(srcdir)/Makefile.incl:
	(cd $(srcdir)/ && $(SHELL) ./maintain/regenerate_file_lists.pl)

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
	$(do_subst) $(srcdir)/$< > $@
	chmod a+x $@

modulesdir = $(pkgdatadir)/Texinfo
dist_modules_DATA = \
 Texinfo/Parser.pm \
 Texinfo/Report.pm \
 Texinfo/Common.pm \
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

test_files = \
 t/27float.t \
 t/test_count.t \
 t/03coverage_braces.t \
 t/70value_and_macro.t \
 t/10menu.t \
 t/05paragraph.t \
 t/22xtable.t \
 t/test_sort.t \
 t/02coverage.t \
 t/19def.t \
 t/01use.t \
 t/18itemize.t \
 t/06columnfractions.t \
 t/04verb.t \
 t/plaintext_tests.t \
 t/181quotation.t \
 t/57invalid_nestings.t \
 t/58alias.t \
 t/21multitable.t \
 t/08misc_commands.t \
 t/paragraph.t \
 t/30sectioning.t \
 t/test_utils.pl \
 t/info_tests.t \
 t/55conditionals.t \
 t/html_tests.t \
 t/50value.t \
 t/60macro.t \
 t/include/file_with_xml_chars.texi \
 t/include/a.txt \
 t/include/count_image.txt \
 t/include/fdotext.png \
 t/include/incl-incl.txi \
 t/include/fdotext.ext \
 t/include/count_image_text.txt \
 t/include/aa.txt \
 t/include/image.txt \
 t/include/section_file.texi \
 t/include/f.txt \
 t/include/this_is_a_long_unknown_file.png \
 t/include/count_image.png \
 t/include/f--ile.txt \
 t/include/fext.png \
 t/include/fextext \
 t/include/included_file_with_setfilename.texi \
 t/include/fext.txt \
 t/include/inc_file.texi \
 t/include/inc_@f--ile.texi \
 t/include/f--ile.png \
 t/include/words.txt \
 t/include/fdotext.txt \
 t/include/macro_included.texi \
 t/include/fext.ext \
 t/languages.t \
 t/16raw.t \
 t/09indices.t \
 t/accents.t \
 t/28heading.t \
 t/README \
 t/init/test_renamed_nodes.init \
 t/init/redefine_need.init \
 t/init/test_directions.init


EXTRA_DIST = \
  texi2any.pl \
  $(test_results) \
  $(test_files)

# FIXME put those somewhere else?  In maintain/lib?
libsrcdir = $(srcdir)/../texi2html/lib
  
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

uninstall-local:
	rm -rf $(DESTDIR)$(pkgdatadir)/lib/

CLEANFILES = texi2any
