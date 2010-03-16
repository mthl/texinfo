## Process this file with automake to produce Makefile.in

# don't install gmo files from texi2hmtl directories if in texinfo, 
# they are also in ../po and ../po_document
if TEXI2HTML
po_subdirs = po_document po_messages
po_document_dir = .
else
po_subdirs =
po_document_dir = ..
endif

SUBDIRS = $(po_subdirs) . doc Tests test

imagesdir = $(datadir)/texi2html/images
i18ndir = $(datadir)/texi2html/i18n
initdir = $(datadir)/texinfo/init

#
# This is to prevent texinfo.tex from being included
# in the top-level distribution directory.
TEXINFO_TEX = doc/texinfo.tex

bin_SCRIPTS = texi2html
texi2html_additional_scripts = \
	MySimple.pm \
	T2h_i18n.pm \
	texi2html.init \
	translations.pl \
	examples/l2h.init \
	T2h_l2h.pm \
	documentlanguages.pl

texi2html_formats = \
	formats/html.init \
	formats/info.init \
	formats/docbook.init \
	formats/xml.init \
	formats/plaintext.init

dist_init_DATA = maintained_extra/book.init \
	maintained_extra/chm.init \
	maintained_extra/tex4ht.init \
	maintained_extra/html32.init \
	maintained_extra/mediawiki.init

texi2html_sources = texi2html_configured.pl $(texi2html_additional_scripts)

noinst_SCRIPTS = manage_i18n.pl buildt2h.sh addformats.sh \
 parse_8bit_makeinfo_maps.pl

# style_example.css comes from http://planet.gnu.org/~ams/style.css
EXTRA_DIST = \
	configure.ac \
	config.rpath \
	MySimple.pod \
	autogen.sh \
	$(noinst_SCRIPTS) \
	missing-texi2html \
	texi2html.pl \
	texi2html.spec \
	texi2html.spec.in \
	texi2html.pl \
	regenerate_documentlanguages.pl \
	$(texi2html_additional_scripts) \
	$(texi2html_formats) \
	examples/l2h.init \
	examples/makeinfo.init \
	examples/xhtml.init \
	examples/noheaders.init \
	examples/inlinestyle.init \
	examples/utf8.init \
	examples/enable_encoding.init \
	examples/roff.init \
	examples/my-bib-macros.texi \
	examples/bib-example.texi \
	examples/glossary.texi \
	examples/style_example.css \
	lib \
	po_messages/Makevars.in \
	po_messages/POTFILES.in.in \
	po_document/Makevars.in \
	po_document/POTFILES.in.in

i18n_files = i18n/de \
	i18n/es \
	i18n/fr \
	i18n/nl \
	i18n/no \
	i18n/pt \
	i18n/pt_BR \
	i18n/ja \
	i18n/it \
	i18n/hu

dist_i18n_DATA = i18n/en \
	$(i18n_files)

dist_images_DATA = images/a_begin.png \
	images/a_begin_na.png \
	images/a_document.png \
	images/a_document_na.png \
	images/a_empty.png \
	images/a_end.png \
	images/a_end_na.png \
	images/a_help.png \
	images/a_help_na.png \
	images/a_index.png \
	images/a_index_na.png \
	images/a_leftdouble.png \
	images/a_leftdouble_na.png \
	images/a_left.png \
	images/a_left_na.png \
	images/a_page.png \
	images/a_page_na.png \
	images/a_rightdouble.png \
	images/a_rightdouble_na.png \
	images/a_right.png \
	images/a_right_na.png \
	images/a_searchdoc.png \
	images/a_searchdoc_na.png \
	images/a_search.png \
	images/a_search_na.png \
	images/a_tableofcon.png \
	images/a_tableofcon_na.png \
	images/a_top.png \
	images/a_top_na.png \
	images/a_up.png \
	images/a_up_na.png \
	images/bg.jpg \
	images/bg_left.png \
	images/bg_right.png \
	images/blue_dir.png \
	images/blue_down.png \
	images/blue_grab.png \
	images/blue_help.png \
	images/blue_next.png \
	images/blue_nnext.png \
	images/blue_pprev.png \
	images/blue_prev.png \
	images/blue_readme.png \
	images/blue_top.png \
	images/blue_up.png \
	images/blue_uup.png \
	images/contents_motif.png \
	images/COPYING \
	images/COPYING.Attribution-ShareAlike \
	images/GPL \
	images/README \
	images/index_motif.png \
	images/Mybg.png \
	images/next_motif.png \
	images/next_motif_gr.png \
	images/previous_motif.png \
	images/previous_motif_gr.png \
	images/spacer3.png \
	images/xy_contents.png \
	images/xy_foot.png \
	images/xy_next.png \
	images/xy_next_gr.png \
	images/xy_nextsection.png \
	images/xy_nextsection_gr.png \
	images/xy_previous.png \
	images/xy_previous_gr.png \
	images/xy_previoussection.png \
	images/xy_previoussection_gr.png \
	images/xy_up.png \
	images/xy_up_gr.png

texi2html.temp: $(texi2html_sources)
	$(SHELL) $(srcdir)/buildt2h.sh $@ $^

texi2html: texi2html.temp $(texi2html_formats)
	$(SHELL) $(srcdir)/addformats.sh $@ $^
	chmod a+x $@

texi2html.spec: texi2html.spec.in $(top_builddir)/configure
	@echo Generating $@...
	@sed -e "s/[@]PACKAGE_VERSION[@]/$(PACKAGE_VERSION)/" \
	     $< >texi2html.tmp
	@cp texi2html.tmp texi2html.spec
	-@rm texi2html.tmp

$(po_document_dir)/po_document/$(PACKAGE)_document.pot:
	cd $(po_document_dir)/po_document && $(MAKE) $(AM_MAKEFLAGS) update-po

$(i18n_files): $(po_document_dir)/po_document/$(PACKAGE)_document.pot
	$(MKDIR_P) i18n
	for file in $(i18n_files); do lang=`basename $$file`; \
		msgexec -i "$(srcdir)/$(po_document_dir)/po_document/$$lang."*po "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" $$lang > $$file; \
	done

i18n/en: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
	$(MKDIR_P) i18n
	msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > $@

translations.pl: $(dist_i18n_DATA) 
	$(PERL) manage_i18n.pl -d i18n -o $@ -I . -I $(srcdir) merge

# update the po files, and install locally the .mo files for the in
# source tests
check-local: makeinfo.pl texi2any.pl
	cd $(po_document_dir)/po_document && $(MAKE) $(AM_MAKEFLAGS) update-po
	if test '$(USE_NLS)' = 'yes'; then \
	  rm -rf locales ; \
	  for file in "$(srcdir)/$(po_document_dir)/po_document/"*.po; do \
	    basename=`basename "$$file" .po` ; \
	    $(MKDIR_P) "locales/$$basename/LC_MESSAGES/" ; \
	    $(MSGFMT) "$$file" -o "locales/$$basename/LC_MESSAGES/texi2html_document.mo" ; \
	  done ; \
	fi

makeinfo.pl texi2any.pl:
	-$(LN_S) $(srcdir)/texi2html.pl $@

html-local: texi2html

clean-local:
	-rm -f texi2html texi2html.temp

distclean-local:
	-rm -rf locales

install-data-local:
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/Recode \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/RecodeData
	$(INSTALL_DATA) $(srcdir)/lib/libintl-perl/lib/Locale/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale
	$(INSTALL_DATA) $(srcdir)/lib/libintl-perl/lib/Locale/Recode/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/Recode
	$(INSTALL_DATA) $(srcdir)/lib/libintl-perl/lib/Locale/RecodeData/*.pm \
	  $(DESTDIR)$(pkgdatadir)/lib/libintl-perl/lib/Locale/RecodeData
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode
	$(INSTALL_DATA) $(srcdir)/lib/Unicode-EastAsianWidth/lib/Unicode/EastAsianWidth.pm \
	 $(DESTDIR)$(pkgdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode

uninstall-local:
	rm -rf $(DESTDIR)$(pkgdatadir)/lib/

dist-hook:
	rm -rf `find $(distdir)/lib  -name CVS`

ACLOCAL_AMFLAGS = -I m4

DISTCLEANFILES = po_messages/Makevars \
	po_messages/POTFILES.in \
	po_document/Makevars \
	po_document/POTFILES.in
