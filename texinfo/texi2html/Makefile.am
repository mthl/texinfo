## Process this file with automake to produce Makefile.in

SUBDIRS = doc Tests
imagesdir = $(pkgdatadir)/images
i18ndir = $(pkgdatadir)/i18n

#
# This is to prevent texinfo.tex from being included
# in the top-level distribution directory.
TEXINFO_TEX = doc/texinfo.tex

bin_SCRIPTS = texi2html

man_MANS = texi2html.1

EXTRA_DIST = \
	INTRODUCTION \
	MySimple.pod \
	T2h_i18n.pm \
	autogen.sh \
	texi2html.init

dist_pkgdata_DATA = l2h.init \
	examples/makeinfo.init \
	examples/xhtml.init \
	examples/html32.init

dist_i18n_DATA = i18n/template \
    i18n/de \
    i18n/es \
    i18n/fr \
    i18n/nl \
    i18n/no \
    i18n/pt \


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

texi2html: \
	$(srcdir)/MySimple.pm \
	$(srcdir)/T2h_i18n.pm \
	$(srcdir)/texi2html.init \
	$(srcdir)/texi2html.pl

# Do not create info files for distribution
dist-info:
