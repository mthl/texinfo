#
info_TEXINFOS = texi2html.texi
texi2html_TEXINFOS = custhtml.texi custpage.texi \
                     extfile.texi ifo.texi \
                     initfile.texi options.texi \
                     custhtml-header.htmltexi \
                     reference.texi \
                     version.texi
#
CLEANFILES = texi2html.info* texi2html.dvi \
             texi2html.ps texi2html.pdf texi2html.html \
             texi2html.ascii \
             texi2html.cp texi2html.cps \
             texi2html.fn texi2html.fns \
             texi2html.ky texi2html.kys \
             texi2html.op texi2html.ops \
             texi2html.pg texi2html.pgs
#
htmldir = $(prefix)/html
html_DATA    = texi2html.html

# use the script out of the distribution NOT
# an old one which is installed on the client.
TEXI2HTML = ../texi2html

MAINTAINERCLEANFILES = \
	Makefile.in \
	texi2thml.html

all: texi2html.info

texi2html.html: texi2html.texi $(texi2html_TEXINFOS) $(TEXI2HTML) Makefile
	$(PERL) $(TEXI2HTML) -V texi2html.texi
texi2html.info: texi2html.texi $(texi2html_TEXINFOS)
	$(MAKEINFO) texi2html.texi
texi2html.dvi: texi2html.texi $(texi2html_TEXINFOS)
	texi2dvi texi2html.texi
texi2html.ps: texi2html.dvi texi2html.texi $(texi2html_TEXINFOS)
	$(DVIPS) -o texi2html.ps texi2html.dvi
texi2html.pdf: texi2html.ps texi2html.texi $(texi2html_TEXINFOS)
	$(PS2PDF) texi2html.ps texi2html.pdf

# Remove info and html files at make clean
clean-aminfo:
	rm -f texi2html.info* texi2html.html

# Do not create info files for distribution
dist-info:

#
dvi: texi2html.dvi

ps: texi2html.ps

pdf: texi2html.pdf

html: texi2html.html
