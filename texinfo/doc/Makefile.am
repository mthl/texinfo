# $Id: Makefile.am,v 1.23 2005-03-25 13:55:14 kasal Exp $
# Makefile.am for texinfo/doc.
# Run automake in .. to produce Makefile.in from this.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# Put texinfo.txi first because that's the most important.
info_TEXINFOS = texinfo.txi info-stnd.texi info.texi
DISTCLEANFILES = texinfo texinfo-* info*.info*

man_MANS = info.1 infokey.1 install-info.1 makeinfo.1 texindex.1 texi2dvi.1 \
           info.5 texinfo.5

# Use the programs built in our distribution, taking account of possible
# cross-compiling.
MAKEINFO = $(top_builddir)/$(native_tools)/makeinfo/makeinfo

## We'd also like to use something like this, but Automake calls
## "install-info" directly.
## INSTALL_INFO = $(top_builddir)/$(native_tools)/util/ginstall-info

TXI_XLATE = txi-cs.tex txi-de.tex txi-en.tex txi-es.tex txi-fr.tex \
	    txi-it.tex txi-nl.tex txi-no.tex txi-pl.tex txi-pt.tex txi-tr.tex

# Include our texinfo.tex, not Automake's.
EXTRA_DIST = epsf.tex pdfcolor.tex texinfo.tex \
             fdl.texi \
	     $(man_MANS) $(TXI_XLATE)

if INSTALL_WARNINGS
install-data-local:
	@echo
	@echo "WARNING: If your texmf tree does not already contain"
	@echo "         up-to-date versions, you must install"
	@echo "             texinfo.tex and txi-??.tex manually,"
	@echo "         perhaps in TEXMF/tex/texinfo/,"
	@echo "         where TEXMF is a root of your TeX tree."
	@echo "         See doc/README for some considerations."
	@echo "         You can run make TEXMF=/your/texmf install-tex to do this."
	@echo
	@echo "         You may also need to install epsf.tex and (if you"
	@echo "         use pdftex) pdfcolor.tex in TEXMF/tex/generic/dvips"
	@echo "         and TEXMF/pdftex/plain/misc/pdfcolor.tex respectively,"
	@echo "         if your TeX installation did not include them."
endif

texmf_texinfo = $(TEXMF)/tex/texinfo
texmf_dvips = $(TEXMF)/tex/generic/epsf
texmf_pdftex_misc = $(TEXMF)/pdftex/plain/pdfcolor
install-tex:
	test -n "$(TEXMF)" || (echo "TEXMF must be set." >&2; exit 1)
	$(mkinstalldirs) $(DESTDIR)$(texmf_texinfo) $(DESTDIR)$(texmf_dvips) $(DESTDIR)$(texmf_pdftex_misc)
	$(INSTALL_DATA) $(srcdir)/texinfo.tex $(DESTDIR)$(texmf_texinfo)/texinfo.tex
	$(INSTALL_DATA) $(srcdir)/epsf.tex $(DESTDIR)$(texmf_dvips)/epsf.tex
	$(INSTALL_DATA) $(srcdir)/pdfcolor.tex $(DESTDIR)$(texmf_pdftex_misc)/pdfcolor.tex
	for f in $(TXI_XLATE); do \
	  $(INSTALL_DATA) $(srcdir)/$$f $(DESTDIR)$(texmf_texinfo)/$$f; done

# The man pages depend on the --help strings and the version number.
common_mandeps = $(top_srcdir)/configure.ac

# Set up variables:
man_rule_0 = echo "Updating man page $@" && \
	program=`expr '/$@' : '.*/\(.*\)\.1'` && \
	case $$program in makeinfo) dir=makeinfo;; info*) dir=info;; \
		*) dir=util;; esac && \
	case $$program in info|install-info) program=g$$program;; \
		esac

# Update the binary:
man_rule_1 = \
	echo cd $(top_builddir)/$$dir '&&' $(MAKE) $(AM_MAKEFLAGS) $$program$(EXEEXT) && \
	     cd $(top_builddir)/$$dir  &&  $(MAKE) $(AM_MAKEFLAGS) $$program$(EXEEXT)

# Generate the page:
# Add $(top_srcdir)/util to the path, because texi2dvi is in source tree.
man_rule_2 = \
	PATH="$(top_srcdir)/util@PATH_SEPARATOR@$$PATH" && \
	for dir in util info makeinfo; do \
	  PATH="$(top_builddir)/$(native_tools)/$$dir@PATH_SEPARATOR@$$PATH"; \
	done && \
	echo PATH="$$PATH" $(HELP2MAN) --name=\"$$name\" $$program '>$@' && \
	$(HELP2MAN) --name="$$name" $$program >$@

# Update manpage for a binary program:
man_rule_bin = $(man_rule_0) && $(man_rule_1) && $(man_rule_2)
# Update manpage for a script:
man_rule_scr = $(man_rule_0) && $(man_rule_2)

$(srcdir)/info.1: $(top_srcdir)/info/info.c $(common_mandeps)
	@name="read Info documents" && $(man_rule_bin)
$(srcdir)/infokey.1: $(top_srcdir)/info/infokey.c $(common_mandeps)
	@name="compile customizations for Info" && $(man_rule_bin)
$(srcdir)/install-info.1: $(top_srcdir)/util/install-info.c $(common_mandeps)
	@name="update info/dir entries" && $(man_rule_bin)
$(srcdir)/makeinfo.1: $(top_srcdir)/makeinfo/makeinfo.c $(common_mandeps)
	@name="translate Texinfo documents" && $(man_rule_bin)
$(srcdir)/texindex.1: $(top_srcdir)/util/texindex.c $(common_mandeps)
	@name="sort Texinfo index files" && $(man_rule_bin)

$(srcdir)/texi2dvi.1: $(top_srcdir)/util/texi2dvi $(common_mandeps)
	@name="print Texinfo documents" && $(man_rule_scr)

# Do not create info files for distribution.
dist-info:
