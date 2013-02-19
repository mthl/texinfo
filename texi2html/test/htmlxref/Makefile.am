EXTRA_DIST = htmlxref.cnf-ref \
 tests.txt res res_all res_info

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
