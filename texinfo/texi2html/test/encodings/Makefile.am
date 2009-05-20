EXTRA_DIST = nodetest.texi nodetest_latin1.texi nodetest_utf8.texi \
 multi_lang.texi unknown_language.texi umlaut.texi accent.texi \
 weird_accents.texi accentenc.texi \
 accent-text.txi ogolat2.texi  ogoutf.texi \
 at_commands_in_refs_latin1.texi at_commands_in_refs_utf8.texi \
 japanese.texi documentlanguage_set.texi \
 encoding_index-latin1.texi  encoding_index.texi  encoding_index-utf8.texi \
 enable_encoding_no_use_entity.init \
 no_unicode.init no_unidecode.init icons.init tests.txt res

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out diffs

dist-hook:
	rm -rf `find $(distdir)/res -name CVS`
