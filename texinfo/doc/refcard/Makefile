# $Id: Makefile,v 1.3 2012-09-12 18:15:43 karl Exp $
# Makefile for texinfo/doc/refcard.
# This is not hooked into Automake, just here for those working on the refcard.
#
# Copyright 2008, 2012 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

doc = txirefcard

# parallel makes, etc., will fail.
all: $(doc).pdf $(doc)-a4.pdf

# trying to get it work with pdftex isn't worth the trouble.
$(doc).pdf: $(doc).tex
	tex '\nonstopmode \input $(doc)'
	dvips -t landscape -t letter $(doc) -o
	ps2pdf $(doc).ps

$(doc)-a4.pdf: $(doc).tex
	tex '\nonstopmode \let\afour=1 \input $(doc)'
	dvips -t landscape -t a4 $(doc) -o
	ps2pdf $(doc).ps $@

check: ccheck vcheck

ccheck:
	txicmdcheck

vcheck:
	txivarcheck

clean:
	rm -f $(doc)*.dvi $(doc)*.log $(doc)*.ps

distclean: clean
	rm -f $(doc)*.pdf
