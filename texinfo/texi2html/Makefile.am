# Makefile.am for texi2html.
# Process this file with automake to produce Makefile.in
#
# Copyright 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008,
# 2009, 2010 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# don't install gmo files from texi2html directories if in texinfo, 
# they are also in ../po and ../po_document
if TEXI2HTML
po_subdirs = po_document po_messages
po_document_dir = .
else
po_subdirs =
po_document_dir = ..

config.rpath: $(srcdir)/../build-aux/config.rpath
	${INSTALL_DATA} $(srcdir)/../build-aux/config.rpath config.rpath

AUTHORS: $(srcdir)/../AUTHORS
	(echo "Below is a copy of the texinfo AUTHORS file, listing texi2html authors"; echo) \
	   | cat - $(srcdir)/../AUTHORS > $@
endif

SUBDIRS = $(po_subdirs) . test

imagesdir = $(datadir)/texi2html/images
#i18ndir = $(datadir)/texi2html/i18n
initdir = $(datadir)/texinfo/init

bin_SCRIPTS = texi2any
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
 parse_8bit_makeinfo_maps.pl gettext_to_separated.pl separated_to_hash.pl

# style_example.css comes from http://planet.gnu.org/~ams/style.css
EXTRA_DIST = \
	configure.ac \
	config.rpath \
	autogen.sh \
	AUTHORS \
	MySimple.pod \
	$(noinst_SCRIPTS) \
	missing-texi2html \
	texi2html.pl \
	texi2html.spec.in \
	texi2html.pl \
	regenerate_documentlanguages.pl \
	$(texi2html_additional_scripts) \
	$(texi2html_formats) \
	examples/l2h.init \
	examples/makeinfo.init \
	examples/xhtml.init \
	examples/noheaders.init \
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
	po_document/POTFILES.in.in \
	i18n_ref \
	translations.pl

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

texi2any: texi2html.temp $(texi2html_formats)
	$(SHELL) $(srcdir)/addformats.sh $@ $^
	chmod a+x $@

texi2html.spec: texi2html.spec.in $(top_builddir)/configure
	@echo Generating $@...
	@sed -e "s/[@]PACKAGE_VERSION[@]/$(PACKAGE_VERSION)/" \
	     $< >texi2html.tmp
	@cp texi2html.tmp texi2html.spec
	-@rm texi2html.tmp

$(po_document_dir)/po_document/$(PACKAGE)_document.pot:
	if test '$(USE_NLS)' = 'yes'; then \
	  cd $(po_document_dir)/po_document && $(MAKE) $(AM_MAKEFLAGS) update-po; \
	fi

# notice the 
#     cat $< | sed -e 's/charset=CHARSET/charset=ascii/'
# Indeed $(po_document_dir)/po_document/$(PACKAGE)_document.pot is 
# autogenerated with charset CHARSET (and no command line option for 
# xgettext to change it), and msgexec doesn't like it and don't do anything.
# msgexec: present charset "CHARSET" is not a portable encoding name
i18n/en.thl i18n/: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
	$(MKDIR_P) i18n
	if test '$(USE_NLS)' = 'yes'; then \
	  for file in "$(srcdir)/$(po_document_dir)/po_document/"*".po"; do lang=`basename "$$file" .po | sed 's/\..*//'`; \
		test "$$lang" = 'en' && continue; \
		msgexec -i "$$file" "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" $$lang > i18n/$$lang.thl; \
	  done; \
	  cat $< | sed -e 's/charset=CHARSET/charset=ascii/' | msgexec "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > i18n/en.thl; \
	else \
	  cp -p i18n_ref/*.thl i18n; \
	fi

i18n_ref:
	$(MKDIR_P) i18n_ref

# Should be done manually, otherwise it is left after make distclean
# in a out of source build directory.
regenerate_i18n_ref: i18n i18n_ref
	if test '$(USE_NLS)' = 'yes'; then \
	  cp -p i18n/*.thl i18n_ref; \
	fi

#i18n/en: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
#	$(MKDIR_P) i18n
#	msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > $@

translations.pl: i18n/en.thl
	$(PERL) manage_i18n.pl -d i18n -o $@ -I . -I $(srcdir) merge

# update the po files, and install locally the .mo files for the in
# source tests
check-local: makeinfo.pl texi2any.pl
	if test '$(USE_NLS)' = 'yes'; then \
	  cd $(po_document_dir)/po_document && $(MAKE) $(AM_MAKEFLAGS) update-po; \
	fi
	rm -rf locales
	for file in "$(srcdir)/$(po_document_dir)/po_document/"*.po; do \
	  basename=`basename "$$file" .po` ; \
	  $(MKDIR_P) "locales/$$basename/LC_MESSAGES/" ; \
	  if test '$(USE_NLS)' = 'yes'; then \
	    $(MSGFMT) "$$file" -o "locales/$$basename/LC_MESSAGES/texi2html_document.mo" ; \
	  else \
	    cp -p "$(srcdir)/$(po_document_dir)/po_document/$$basename.mo" "locales/$$basename/LC_MESSAGES/texi2html_document.mo" ; \
	  fi; \
	done

makeinfo.pl texi2any.pl:
	-$(LN_S) $(srcdir)/texi2html.pl $@

makeinfo texi2html: texi2any
	-$(LN_S) texi2any $@

html-local: texi2html

distclean-local:
	-rm -rf locales i18n

install-data-local: i18n
	$(MKDIR_P) $(DESTDIR)$(pkgdatadir)/i18n
	$(INSTALL_DATA) i18n/*.thl  $(DESTDIR)$(pkgdatadir)/i18n
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
	rm -rf $(DESTDIR)$(pkgdatadir)/lib/ $(DESTDIR)$(pkgdatadir)/i18n
	rm -f $(DESTDIR)$(bindir)/texi2html
	rm -f $(DESTDIR)$(bindir)/makeinfo

install-exec-hook:
	-$(LN_S) texi2any $(DESTDIR)$(bindir)/texi2html
	-$(LN_S) texi2any $(DESTDIR)$(bindir)/makeinfo

dist-hook:
	rm -rf `find $(distdir)/lib $(distdir)/i18n_ref -name CVS`

ACLOCAL_AMFLAGS = -I m4

CLEANFILES = texi2html texi2html.temp texi2any makeinfo \
	texi2any.pl makeinfo.pl

DISTCLEANFILES = po_messages/Makevars \
	po_messages/POTFILES.in \
	po_document/Makevars \
	po_document/POTFILES.in
