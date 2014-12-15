SOURCE = ti.twjr
TEXISOURCE = ti.texi

all: texindex.awk ti.pdf

$(TEXISOURCE): $(SOURCE)
	$(GAWK) ./jrweave $(SOURCE) >$(TEXISOURCE) || rm -f $@

texindex.awk: $(SOURCE)
	./jrtangle $(SOURCE) || rm -f $@

ti.pdf: $(TEXISOURCE)
	texi2dvi --pdf --build-dir=ti.t2p -o ti.pdf ti.texi

html: ti.html

ti.html: $(TEXISOURCE)
	makeinfo --no-split --html $(TEXISOURCE)
