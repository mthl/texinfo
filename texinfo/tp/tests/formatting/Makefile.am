EXTRA_DIST = \
bib-example.texi           glossary.texi             simplest.texi \
block_EOL.texi             ignore_and_comments.texi  split_nocopying.texi \
cond.texi                  inc_file.texi             test_need.texi \
defxcond.texi              lightweight_markups.texi  \
tex_complex.texi \
direntry_dircategory.texi  tex_in_copying.texi \
math_not_closed.texi       tex_not_closed.texi \
float_copying.texi         my-bib-macros.texi        tex.texi \
documentlanguage_set.texi japanese_long_name.texi \
contents_at_end_document.texi contents_in_document.texi \
contents_at_document_begin.texi contents_no_section.texi \
contents_at_end_document_after_node.texi \
 file.css tests-parser.txt res_parser

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out_parser diffs

dist-hook:
	rm -rf `find $(distdir)/res_parser -name CVS`
