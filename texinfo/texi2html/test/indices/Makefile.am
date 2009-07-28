EXTRA_DIST = index_table.texi index_no_node.texi \
 index_split.texi split_chapter_index.texi nodes_before_top_and_sections.texi\
 nodes_before_top.texi index_special_region_no_insertcopying.texi \
 index_special_region.texi index_special_region_no_region.texi \
 index_nodes.texi printindex_between_node_section.texi \
 index_and_node_same_name.texi recursive_synindex.texi \
 syncode_index_print_both.texi index_entry_in_footnote.texi \
 index_one_node.texi index_no_node_no_top.texi \
 index_test.init tests.txt res res_all res_info

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
