EXTRA_DIST = custhtml.texi  ifo.texi       options.texi    texi2html.texi \
custpage.texi  initfile.texi  reference.texi  version.texi \
custhtml-header.htmltexi \
 tests.txt res

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
