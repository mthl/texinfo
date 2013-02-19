EXTRA_DIST = def_cmds.texi menus.texi quotation.texi \
 float_with_at_commands.texi float_copying.texi macro_in_menu.texi \
 ref_in_anchor.texi tex.texi block_EOL.texi detailmenus.texi \
 commands_in_ifset.texi simplest.texi punctuation.texi \
 punctuation_frenchspacing.texi \
 simple_punctuation.texi def_end_of_line.texi \
 center.texi tables.texi formats_in_menu.texi heading.texi quotes.texi \
 indicateurl_paragraph.texi complex_command_in_simple_command.texi \
 symbol_after_block.texi html-extrali.texi html-para.texi html-title.texi \
 images.texi index_in_item_line_table.texi index_in_item_line_vtable.texi \
 index_in_item_line_table_in_code.texi table_in_table_item.texi \
 index_in_item_line_vtable_printindex.texi \
 nested_formats.texi inter_item_commands.texi multitables.texi \
 double_style_paragraph.texi at_command_glued.texi test_sp.texi \
 kbdinputstyle.texi simple_images.texi simple_table.texi empty_item.texi \
 direntry_dircategory.texi nested_table.texi symbol_after_command.texi \
 paragraph_in_samp.texi formats_only_titles.texi \
 def_end_of_line_footnote.texi test_menuentry.texi \
 line_commands_comments_spaces.texi lightweight_markups.texi \
 punctuation_in_command.texi test_w.texi empty_deftype.texi \
 allowcodebreaks.texi format_in_titlepage.texi \
 no_colon_in_menu.texi menu_title_before_entries.texi \
 warn_characters_in_var.texi itemize_w.texi \
 f--ile.gif f--ile.jpeg f--ile.png f---ile.gr--a f--ile.jpg f--ile.txt \
 redefine_need.init \
 file.css tests.txt res \
 res_all res_info

DISTCLEANFILES = tests.log tests.out

distclean-local:
	rm -rf out out_all out_info diffs

dist-hook:
	rm -rf `find $(distdir)/res $(distdir)/res_info $(distdir)/res_all -name CVS`
