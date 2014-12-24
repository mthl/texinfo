SOURCE = ti.twjr
TEXI = ti.texi
AWK = texindex.awk

all: $(AWK) html ti.pdf

$(TEXI): $(SOURCE)
	rm -f $@
	$(GAWK) ./jrweave $(SOURCE) >$(TEXI) || rm -f $@; chmod a-w $@

$(AWK): $(SOURCE)
	./jrtangle $(SOURCE) || rm -f $@

ti.pdf: $(TEXI)
	texi2dvi --pdf --build-dir=ti.t2p -o ti.pdf $(TEXI)

html: ti.html

ti.html: $(TEXI)
	makeinfo --no-split --html $(TEXI)
