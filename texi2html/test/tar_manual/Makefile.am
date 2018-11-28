EXTRA_DIST = \
 config.texi freemanuals.texi  header.texi snapshot.texi value.texi \
dumpdir.texi  genfile.texi      intern.texi     sparse.texi    version.texi \
fdl.texi      getdate.texi      rendition.texi  tar.texi \
 tests.txt res

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out diffs

dist-hook:
	rm -rf `find $(distdir)/res -name CVS`
