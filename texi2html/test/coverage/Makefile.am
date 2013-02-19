EXTRA_DIST = formatting.texi comments.texi pass0_macros.texi float.texi \
 imbrications.texi formats_titles.texi delcomment.texi \
 line_commands_comment.texi  \
 f--ile.e--xt f--ile.jpg simplest.texi tests.txt res res_all res_info

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
