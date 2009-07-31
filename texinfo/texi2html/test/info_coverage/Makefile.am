EXTRA_DIST = anchor_paragraph.texi images_quotes.texi simple_cartouche.texi \
center_flush.texi index_after_heading.texi simple_def.texi \
cindex_at_end_node.texi itemize_in_example.texi simple_enumerate.texi \
commentexample.texi itemize_long_item.texi simple_float.texi \
comment_in_example.texi line_passed_and_formats.texi simple_footnotes.texi \
def_cmds_clean.texi long_line.texi simple_index.texi \
def_in_copying.texi long_uref_after_item.texi simple_itemize.texi \
def_in_example.texi menu_in_deffn.texi simple_multitable.texi \
def.texi multitable_in_example.texi simple_verbatim.texi \
enumerate_in_example.texi multitable.texi space_at_menu_end.texi \
exdent_and_commands.texi nested_multitable_anchor_index.texi \
space_in_menu.texi exdent_and_formats.texi nested_multitable.texi \
star_at_command_in_formats.texi float_long_captions.texi \
noindent_after_smallexample.texi star_at_command.texi \
headings_in_footnote.texi noindent_in_paragraph.texi table_long_item.texi \
html_expanded.texi paragraphindent.texi test_setfilename.texi \
images_eol.texi simple_2nodes.texi thing_in_menu.texi \
empty_multitable_in_itemize.texi code.texi kbd.texi \
 f--ile""\.png f--ile""\.txt this_is_a_long_unknown_file.png \
 verb.txt tests.txt res res_all res_info

DISTCLEANFILES = l2h_tmp_dir.init tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
