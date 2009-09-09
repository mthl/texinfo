EXTRA_DIST = macros.texi simple_macro.texi nested_macro_calls.texi \
 glossary.texi imbricated_macros.texi expansion_order.texi \
 ifclear_in_macro.texi macro_call_in_ifset.texi ifset_in_macro.texi \
 not_ifset_text.texi bib-example.texi quote-args.texi alias.texi \
 test_include.texi nested_ignore.texi include_macro.texi \
 cond.texi defxcond.texi include-value.texi macro_in_misc.texi \
 value_in_misc_valid.texi macro-at.texi node-expand.texi \
 value_in_pass0_macros.texi macros_in_pass0_macros.texi macro_zero.texi \
 macro_in_pass_texi_commands.texi two_macros_on_a_line.texi \
 macro_commands_in_pass_texi_commands.texi node-value.texi empty_macro.texi \
 test_include_with_setfilename.texi no_arg_macro.texi \
 simple_imbricated_macro.texi test_paths.texi \
 setfilename_comment.texi double_setfilename.texi bad_setfilename.texi \
 inc_@f--ile.texi \
 file.texi inc_file.texi macro_included.texi my-bib-macros.texi \
 incl-incl.txi included_file_with_setfilename.texi \
 tests.txt res res_all res_info

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
