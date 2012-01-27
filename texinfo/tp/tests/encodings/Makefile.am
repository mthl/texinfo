EXTRA_DIST = \
 accent.texi \
 weird_accents.texi accentenc.texi \
 accent-text.txi ogolat2.texi \
 japanese.texi chinese_mixed_with_en.texi documentlanguage_set.texi \
 encoding_index-latin1.texi encoding_index.texi  encoding_index-utf8.texi \
 japanese_shift_jis.texi \
 japanese_long_name.texi \
 tests-parser.txt res_parser res_parser_info

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out_parser out_parser_info diffs

dist-hook:
	rm -rf `find $(distdir)/res_parser $(distdir)/res_parser_info -name CVS`
