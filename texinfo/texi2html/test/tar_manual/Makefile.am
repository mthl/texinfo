EXTRA_DIST = \
 config.texi freemanuals.texi  header.texi snapshot.texi value.texi \
dumpdir.texi  genfile.texi      intern.texi     sparse.texi    version.texi \
fdl.texi      getdate.texi      rendition.texi  tar.texi \
 tests.txt res res_info res_all

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
