## Process this file with automake to produce Makefile.in

SUBDIRS = . doc Tests
imagesdir = $(pkgdatadir)/images
i18ndir = $(pkgdatadir)/i18n

#
# This is to prevent texinfo.tex from being included
# in the top-level distribution directory.
TEXINFO_TEX = doc/texinfo.tex

bin_SCRIPTS = texi2html
texi2html_additional_scripts = \
	MySimple.pm \
	T2h_i18n.pm \
	texi2html.init \
	translations.pl \
	l2h.init

texi2html_sources = texi2html_configured.pl $(texi2html_additional_scripts)

noinst_SCRIPTS = manage_i18n.pl buildt2h.sh

EXTRA_DIST = \
	MySimple.pod \
	autogen.sh \
	$(noinst_SCRIPTS) \
	missing-texi2html \
	texi2html.pl \
	texi2html.spec \
	texi2html.spec.in \
	texi2html.pl \
	$(texi2html_additional_scripts)

dist_pkgdata_DATA = l2h.init \
	examples/makeinfo.init \
	examples/xhtml.init \
	examples/html32.init \
	examples/book.init \
	examples/noheaders.init \
	examples/inlinestyle.init \
	examples/utf8.init \
	examples/chm.init \
	examples/roff.init	

dist_i18n_DATA = i18n/en \
	i18n/de \
	i18n/es \
	i18n/fr \
	i18n/nl \
	i18n/no \
	i18n/pt 

#texi2html: $(texi2html_sources)
#	sed -e "/@MYSIMPLE@/r $(srcdir)/MySimple.pm" \
#	    -e "/@INIT@/r $(srcdir)/texi2html.init" \
#	    -e "/@T2H_TRANSLATIONS_FILE@/r $(srcdir)/translations.pl" \
#	    -e "/@T2H_L2H_INIT@/r $(srcdir)/l2h.init" \
#	    -e "/@T2H_I18N@/r $(srcdir)/T2h_i18n.pm" $< >$@
#	chmod a+x $@
texi2html: $(texi2html_sources)
	$(srcdir)/buildt2h.sh $@ $^ 
	chmod a+x $@

texi2html.spec: texi2html.spec.in configure
	@echo Generating $@...
	@sed -e "s/[@]PACKAGE_VERSION[@]/$(PACKAGE_VERSION)/" \
	     -e "s/[@]PACKAGE_TARNAME[@]/$(PACKAGE_TARNAME)/" $< >texi2html.tmp
	@cp texi2html.tmp $(srcdir)/$@
	-@rm texi2html.tmp

i18n/en: texi2html.pl texi2html.init T2h_i18n.pm examples/roff.init \
                 examples/noheaders.init
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -I . -I $(srcdir) template $^

i18n/de i18n/nl i18n/es i18n/no i18n/pt i18n/fr: i18n/en
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -I . -I $(srcdir) update

translations.pl: i18n/de i18n/nl i18n/es i18n/no i18n/pt i18n/fr i18n/en
	$(PERL) $(top_builddir)/manage_i18n.pl -d i18n -o $@ -I . -I $(srcdir) merge

html-local: texi2html

clean-local:
	-rm -f texi2html
