#
info_TEXINFOS = texi2html.texi

#CLEANFILES = texi2html.ps texi2html.pdf texi2html.html \
#             texi2html.ascii
#
texinfodata = $(datadir)/texinfo
texinfohtmldir = $(texinfodata)/html
texinfohtml_DATA    = texi2html.html

# use the script out of the distribution NOT
# an old one which is installed on the client.
TEXI2HTML = $(top_builddir)/texi2html

EXTRA_DIST = texi2html.html

texi2html.html: texi2html.texi $(srcdir)/version.texi $(TEXI2HTML)
	TEXINPUTS=$(srcdir)::$$TEXINPUTS \
	  $(SHELL) $(top_srcdir)/missing-texi2html --run $(TEXI2HTML) -V $<

txt: texi2html.txt

SUFFIXES = .txt

# texinfo based targets automake neglects to include
.texinfo.txt:
	$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I $(srcdir) \
	 --no-headers -o $@ `test -f '$<' || echo '$(srcdir)/'`$<
.txi.txt:
	$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I $(srcdir) \
	 --no-headers -o $@ `test -f '$<' || echo '$(srcdir)/'`$<
.texi.txt:
	$(MAKEINFO) $(AM_MAKEINFOFLAGS) $(MAKEINFOFLAGS) -I $(srcdir) \
	 --no-headers -o $@ `test -f '$<' || echo '$(srcdir)/'`$<
