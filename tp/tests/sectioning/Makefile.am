# sectioning/Makefile.am - public domain.
 
EXTRA_DIST = \
 at_commands_in_refs.texi \
 equivalent_nodes.texi \
 more_sections_than_nodes.texi \
 node_footnote.texi \
 nodes_after_top_before_chapter.texi \
 nodes_after_top_before_section.texi \
 no_node.texi \
 placed_things_before_element.texi \
 sectioning.texi \
 test_refs.texi \
 test_two_include.texi \
 top_node_up_implicit.texi \
 top_node_up_explicit.texi \
 two_footnotes_in_nodes.texi \
 version.texi \
 \
 renamednodes.cnf-ref \
 list-of-tests \
 res_parser

DISTCLEANFILES = tests.log tests.out equivalent_nodes-noderename.cnf

distclean-local:
	rm -rf out_parser diffs test_log

dist-hook:
	rm -rf `find $(distdir)/res_parser -name .git`
