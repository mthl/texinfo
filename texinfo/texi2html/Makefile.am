## Process this file with automake to produce Makefile.in

SUBDIRS = . doc Tests
imagesdir = $(pkgdatadir)/images
i18ndir = $(pkgdatadir)/i18n

#
# This is to prevent texinfo.tex from being included
# in the top-level distribution directory.
TEXINFO_TEX = doc/texinfo.tex

bin_SCRIPTS = texi2html
texi2html_additionnal_scripts = \
	MySimple.pm \
	T2h_i18n.pm \
	texi2html.init \
	translations.pl \
	l2h.init

texi2html_SOURCES = texi2html_configured.pl $(texi2html_additionnal_scripts)

noinst_SCRIPTS = manage_i18n.pl

EXTRA_DIST = \
	INTRODUCTION \
	MySimple.pod \
	autogen.sh \
	manage_i18n.pl \
	missing-texi2html \
	texi2html.pl \
	texi2html.spec \
	texi2html.spec.in \
	texi2html.pl \
	$(texi2html_additionnal_scripts)

dist_pkgdata_DATA = l2h.init \
	examples/makeinfo.init \
	examples/xhtml.init \
	examples/html32.init \
	examples/book.init \
	examples/noheaders.init \
	examples/inlinestyle.init \
	examples/utf8.init \
	examples/chm.init \
	examples/roff.init	

dist_i18n_DATA = i18n/en \
	i18n/de \
	i18n/es \
	i18n/fr \
	i18n/nl \
	i18n/no \
	i18n/pt 

dist_images_DATA = images/a_begin.gif \
	images/a_begin_na.gif \
	images/a_document.gif \
	images/a_document_na.gif \
	images/a_empty.gif \
	images/a_end.gif \
	images/a_end_na.gif \
	images/a_help.gif \
	images/a_help_na.gif \
	images/a_index.gif \
	images/a_index_na.gif \
	images/a_leftdouble.gif \
	images/a_leftdouble_na.gif \
	images/a_left.gif \
	images/a_left_na.gif \
	images/a_page.gif \
	images/a_page_na.gif \
	images/a_rightdouble.gif \
	images/a_rightdouble_na.gif \
	images/a_right.gif \
	images/a_right_na.gif \
	images/a_searchdoc.gif \
	images/a_searchdoc_na.gif \
	images/a_search.gif \
	images/a_search_na.gif \
	images/a_tableofcon.gif \
	images/a_tableofcon_na.gif \
	images/a_top.gif \
	images/a_top_na.gif \
	images/a_up.gif \
	images/a_up_na.gif \
	images/bg.jpg \
	images/bg_left.gif \
	images/bg_right.gif \
	images/blue_dir.gif \
	images/blue_down.gif \
	images/blue_grab.gif \
	images/blue_help.gif \
	images/blue_next.gif \
	images/blue_nnext.gif \
	images/blue_pprev.gif \
	images/blue_prev.gif \
	images/blue_readme.gif \
	images/blue_top.gif \
	images/blue_up.gif \
	images/blue_uup.gif \
	images/contents_motif.gif \
	images/COPYING \
	images/index_motif.gif \
	images/Mybg.gif \
	images/next_motif.gif \
	images/next_motif_gr.gif \
	images/previous_motif.gif \
	images/previous_motif_gr.gif \
	images/spacer3.gif \
	images/xy_contents.gif \
	images/xy_foot.gif \
	images/xy_next.gif \
	images/xy_next_gr.gif \
	images/xy_nextsection.gif \
	images/xy_nextsection_gr.gif \
	images/xy_previous.gif \
	images/xy_previous_gr.gif \
	images/xy_previoussection.gif \
	images/xy_previoussection_gr.gif \
	images/xy_up.gif \
	images/xy_up_gr.gif

texi2html: $(texi2html_SOURCES)
	sed -e "/@MYSIMPLE@/r $(srcdir)/MySimple.pm" \
	    -e "/@INIT@/r $(srcdir)/texi2html.init" \
	    -e "/@T2H_TRANSLATIONS_FILE@/r $(srcdir)/translations.pl" \
	    -e "/@T2H_L2H_INIT@/r $(srcdir)/l2h.init" \
	    -e "/@T2H_I18N@/r $(srcdir)/T2h_i18n.pm" $< >$@
	chmod a+x $@

texi2html.spec: texi2html.spec.in configure
	@echo Generating $@...
	@sed -e "s/@PACKAGE_VERSION@/$(PACKAGE_VERSION)/" \
	     -e "s/@PACKAGE_TARNAME@/$(PACKAGE_TARNAME)/" $< >texi2html.tmp
	@cp texi2html.tmp $(srcdir)/$@
	-@rm texi2html.tmp

i18n/en: texi2html.pl texi2html.init T2h_i18n.pm examples/roff.init \
                 examples/noheaders.init
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -I . -I $(srcdir) template $^

i18n/de i18n/nl i18n/es i18n/no i18n/pt i18n/fr: i18n/en
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -I . -I $(srcdir) update

translations.pl: i18n/de i18n/nl i18n/es i18n/no i18n/pt i18n/fr i18n/en
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -o $@ -I . -I $(srcdir) merge

#translations.pl: texi2html.pl texi2html.init T2h_i18n.pm examples/roff.init \
#                 examples/noheaders.init i18n/de i18n/nl i18n/es i18n/no \
#                 i18n/pt i18n/fr
	## Make sure the following script runs and generates files in
	## $(srcdir).
#	cd $(srcdir); $(PERL) $(srcdir)/manage_i18n.pl all

html-local: texi2html

dist-local: texi2html

clean-local:
	-rm -f texi2html
