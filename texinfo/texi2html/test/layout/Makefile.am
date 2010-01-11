EXTRA_DIST = no_monolithic.texi navigation.texi formatting_regions.texi \
 only_toc_out.init vertical_nav.init misc_file_collision.init \
 no_use_titlepage_for_title.init ignore_and_comments_output.init \
 tests.txt res res_all res_info

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
