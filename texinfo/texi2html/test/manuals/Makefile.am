EXTRA_DIST = cvs.texi info-stnd.texi texinfo.texi mini_ker.texi \
 version-stnd.texi version.texi fdl.texi hello.texi fdl-hello.texi \
 mini_ker_t2h.init cvs.init tests.txt res

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
