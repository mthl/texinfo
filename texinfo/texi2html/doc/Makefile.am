#
info_TEXINFOS = texi2html.texi
texi2html_TEXINFOS = custhtml.texi custpage.texi \
                     extfile.texi ifo.texi \
                     initfile.texi options.texi \
                     custhtml-header.htmltexi \
                     reference.texi \
                     version.texi
#
CLEANFILES = texi2html.ps texi2html.pdf texi2html.html \
             texi2html.ascii
#
htmldir = $(prefix)/html
html_DATA    = texi2html.html

# use the script out of the distribution NOT
# an old one which is installed on the client.
TEXI2HTML = $(top_builddir)/texi2html

MAINTAINERCLEANFILES = \
	Makefile.in \
	texi2thml.html

all: info texi2html.html

texi2html.html: texi2html.texi $(texi2html_TEXINFOS) $(TEXI2HTML) Makefile
	TEXINPUTS=$(srcdir)::$$TEXINPUTS \
	  $(PERL) $(TEXI2HTML) -V $<
# Should be using pdftex - it preserves links in PDF
texi2html.pdf: texi2html.ps
	$(PS2PDF) texi2html.ps texi2html.pdf

# Do not create info files for distribution
dist-info:

#
dvi: texi2html.dvi

ps: texi2html.ps

pdf: texi2html.pdf

html: texi2html.html
