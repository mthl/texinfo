## Process this file with automake to produce Makefile.in

# breaks with automake version < 1.4
AUTOMAKE_OPTIONS = 1.4 gnu
#
SUBDIRS = doc
#
# This is to prevent texinfo.tex from being included
# in the top-level distribution directory.
TEXINFO_TEX = doc/texinfo.tex

bin_SCRIPTS = texi2html
man_MANS = texi2html.1
#EXTRA_DIST =  INTRODUCTION autogen.sh texi2html.init \
#              MySimple.pm MySimple.pod version.texi
EXTRA_DIST =  INTRODUCTION autogen.sh texi2html.init \
              MySimple.pm MySimple.pod
#info_TEXINFOS = texi2html.texi
#htmldir = $(prefix)/html
#html_DATA    = texi2html.html

TEXI2HTML = texi2html

#MAINTAINERCLEANFILES = \
#	INSTALL \
#	Makefile.in \
#	aclocal.m4 \
#	configure \
#	install-sh \
#	missing \
#       mkinstalldirs \
#       mdate-sh
# Don't remove INSTALL file!!!
MAINTAINERCLEANFILES = \
	Makefile.in \
	aclocal.m4 \
	configure \
        config.log \
        config.status \
        config.cache

all: texi2html

texi2html: $(srcdir)/texi2html.pl $(srcdir)/texi2html.init $(srcdir)/MySimple.pm

#texi2html.html: texi2html.texi $(TEXI2HTML) Makefile
#	$(PERL) $(TEXI2HTML) -V texi2html.texi

# Remove info and html files at make clean
#clean-aminfo:
#	rm -f texi2html.info* texi2html.html

# Do not create info files for distribution
dist-info:
