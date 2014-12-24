SOURCE = ti.twjr
TEXI = ti.texi
AWK = texindex.awk

all: check $(AWK) html ti.pdf

$(TEXI): $(SOURCE)
	rm -f $@; $(GAWK) ./jrweave $(SOURCE) >$(TEXI) || rm -f $@; chmod a-w $@

$(AWK): $(SOURCE)
	rm -f $@; ./jrtangle $(SOURCE) || rm -f $@

ti.pdf: $(TEXI)
	texi2dvi --pdf --build-dir=ti.t2p -o ti.pdf $(TEXI)

html: texindex.html

texindex.html: $(TEXI)
	makeinfo --no-split --html $(TEXI)

check: $(AWK)
	texindex $(ttests)/idxmarkup.cp
	cat $(ttests)/idxmarkup.cps
