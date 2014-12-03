SOURCE = ti.twjr
TEXISOURCE = ti.texi

all: texindex.awk ti.pdf

$(TEXISOURCE): $(SOURCE)
	./jrweave $(SOURCE) > $(TEXISOURCE)

texindex.awk: $(SOURCE)
	./jrtangle $(SOURCE)

ti.pdf: $(TEXISOURCE)
	texi2dvi --pdf --batch --build-dir=ti.t2p -o ti.pdf ti.texi

html: ti.html

ti.html: $(TEXISOURCE)
	makeinfo --no-split --html $(TEXISOURCE)
