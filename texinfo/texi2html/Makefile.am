## Process this file with automake to produce Makefile.in

SUBDIRS = doc Tests
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

texi2html: \
	$(srcdir)/MySimple.pm \
	$(srcdir)/T2h_i18n.pm \
	$(srcdir)/texi2html.init \
	$(srcdir)/texi2html.pl

# Do not create info files for distribution
dist-info:
