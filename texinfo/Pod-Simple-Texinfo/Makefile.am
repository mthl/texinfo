bin_SCRIPTS = pod2texi

EXTRA_DIST = Changes \
 Makefile.PL \
 MANIFEST \
 t/Pod-Simple-Texinfo.t 

modulesdir = $(pkgdatadir)/Pod-Simple-Texinfo/Pod/Simple/

dist_modules_DATA = \
 lib/Pod/Simple/Texinfo.pm

pod2texi: pod2texi.pl
	sed -e 's,[@]datadir[@],$(datadir),g' $(srcdir)/$< >$@
	chmod a+x $@

