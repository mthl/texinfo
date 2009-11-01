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
TEXI2HTML = $(builddir)/../texi2html

man_MANS = texi2html.1

EXTRA_DIST = \
	texi2html.1.in \
	texi2html.html \
	info_format_informations.txt 

CLEANFILES = texi2html.1

#texi2html.html: texi2html.texi $(srcdir)/version.texi \
#  $(TEXI2HTML)
texi2html.html: texi2html.texi $(srcdir)/version.texi \
  $(srcdir)/../texi2html.pl $(srcdir)/../texi2html.init \
  $(srcdir)/../MySimple.pm $(srcdir)/../T2h_i18n.pm
	TEXINPUTS=$(srcdir)::$$TEXINPUTS T2H_HOME=$(srcdir)/../ \
	  $(SHELL) $(srcdir)/../missing-texi2html --run \
	    $(PERL) -x $(srcdir)/../texi2html.pl -V $<

$(TEXI2HTML):
	@(cd $(builddir)/../ && make texi2html)

texi2html.1: texi2html.1.in $(top_builddir)/config.status
	@echo Generating $@...
	@sed -e "s/[@]PACKAGE_VERSION[@]/$(PACKAGE_VERSION)/" \
	     -e "s/[@]PACKAGE_DATE[@]/$(PACKAGE_DATE)/" \
	     -e "s#[@]sysconfdir[@]#$(sysconfdir)#" \
	     -e "s#[@]pkgdatadir[@]#$(pkgdatadir)#" $< >texi2html.tmp
	@mv texi2html.tmp $@

txt: texi2html.txt

SUFFIXES = .txt

check-local: $(TEXI2HTML) 
	TEXINPUTS=$(srcdir)::$$TEXINPUTS T2H_SOURCE_LIBINTL=$(srcdir)/../lib/libintl-perl/lib \
	   $(TEXI2HTML) -V $(srcdir)/texi2html.texi

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
