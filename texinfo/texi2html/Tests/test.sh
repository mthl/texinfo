#!/bin/bash

#set -x
do_tidy='no'
do_validate='no'
which tidy 2>&1 > /dev/null && do_tidy='yes'
which validate 2>&1 > /dev/null && do_validate='yes'

LANG=C
export LANG
LC_ALL=C
export LC_ALL

test_texi(){
dir=$1; shift
texi_file=$1 ;shift
options=$1; shift
wc=$1; shift
suffix=$1; shift
basename=$1; shift
ignore_tags=$1; shift
validate=$1; shift
test_tidy=$1;shift
fail=$1; shift
[ -z $fail ] && fail='success'
[ -z $wc ] && wc=0
[ -z $suffix ] && suffix=texi
[ -z $texi_file ] && texi_file=$dir.$suffix
[ -z $ignore_tags ] && ignore_tags=no
[ -z $validate ] && validate=yes
[ $validate = validate ] && validate=yes
[ -z $test_tidy ] && test_tidy=yes
[ $test_tidy = test_tidy -o $test_tidy = tidy ] && test_tidy=yes
[ $ignore_tags = 'yes' -o $ignore_tags = 'ignore_tags' ] && ignore_tags=yes
[ -z $basename ] && basename=`basename $texi_file .$suffix`
options="-test $options"
stderr_file=$basename.2
echo "making test: $dir/$texi_file $options"
if [ ! -d $dir ]; then
	echo "  !!! no dir $dir"
	return
fi
if [ ! -f $dir/$texi_file ]; then
	echo "  !!! no file $dir/$texi_file"
	return
fi
(cd $dir && rm $basename.html ${basename}_???.html ${basename}_??.html ${basename}_?.html ${basename}_frame.html ${basename}_toc_frame.html ${basename}_???.htm ${basename}_??.htm ${basename}_?.htm ${basename}_????.png ${basename}_???.png ${basename}_??.png ${basename}_?.png ${basename}_l2h.css ${basename}_l2h.html ${basename}_l2h_images.* ${basename}_l2h_labels.pl ${basename}_l2h.tex $basename.passfirst $basename.passtexi $basename.2 ${basename}-l2h_cache.pm) > /dev/null 2>&1
export T2H_HOME=../..

# generate a dump of the first pass
#(cd $dir && perl -x -w ../../texi2html.pl -test $options -dump-texi $texi_file)
#(cd $dir && ../../texi2html -test $options -dump_texi $texi_file) > /dev/null 2>&1
(cd $dir && perl -x -w ../../texi2html.pl $options -dump-texi $texi_file) > /dev/null 2>&1

#(cd $dir && perl -x -w ../../texi2html.pl -test $options -init ../../examples/xhtml.init $texi_file) 2>$dir/$stderr_file > /dev/null
#(cd $dir && perl -x -w ../../texi2html.pl -test $options -init ../../examples/html32.init $texi_file) 2>$dir/$stderr_file > /dev/null
#(cd $dir && perl -x -w ../../texi2html.pl -test $options -init ../../examples/inlinestyle.init $texi_file) 2>$dir/$stderr_file > /dev/null
#(cd $dir && ../../texi2html -test $options $texi_file) 2>$dir/$stderr_file > /dev/null
#(cd $dir && texi2html -test $options $texi_file) 2>$dir/$stderr_file > /dev/null
(cd $dir && perl -x -w ../../texi2html.pl $options $texi_file) 2>$dir/$stderr_file > /dev/null
ret=$?
echo "  status:"
if [ $ret = 0 -a $fail = 'fail' ]; then echo "    !!! no failing";
elif [ $ret != 0 -a $fail = 'success' ]; then echo "    !!! no success";
else echo "    passed"
fi

if [ $wc != 'no' ]; then
	echo "  stderr line count:"
	if [ -f $dir/$stderr_file ]; then
		res_wc=`<$dir/$stderr_file wc -l`
		if [ $res_wc != $wc ]; then echo "    !!! bad line count: $res_wc != $wc"
		else echo "    passed"
		fi
	else echo "    !!! no $dir/$stderr_file file"
	fi
fi

dir_res=${dir}_res
[ -d $dir_res ] || return
echo "  diffs:"
previous_good='no'
for file in `ls $dir_res` ; do
	found='no'
	if [ -d $dir_res/$file -a $dir_res/$file = $dir_res/'CVS' ]; then continue
	elif [ -d $dir_res/$file ]; then
		file_or_dir=dir
		if [ ! -d $dir/$file ]; then
			result=1
		else
			found='yes'
			diff --recursive $dir_res/$file $dir/$file 2>&1 > /dev/null
			result=$?
		fi
	elif [ -f $dir_res/$file ]; then
		file_or_dir=file
		if [ ! -f $dir/$file ]; then
			result=1
		else
			found='yes'
			if [ $ignore_tags = 'yes' ]; then
				temp_file=$dir/${file}_tempnotag
				sed 's/\$\([[:alpha:]]\+\):.*\$/\$\1\$/g' $dir/${file} > $temp_file
				sed 's/\$\([[:alpha:]]\+\):.*\$/\$\1\$/g' $dir_res/$file | diff - $temp_file 2>&1 > /dev/null
				result=$?
				rm $temp_file
			else			
				diff $dir_res/$file $dir/$file 2>&1 > /dev/null
				result=$?
			fi
		fi
	else
		echo "Unkown file type for $file ???"
		continue
	fi

	if [ $result != 0 ]; then 
		if [ "$previous_good" = yes ]; then echo
		fi
		if [ $found = 'no' ]; then
			echo "    !!! $file_or_dir not found: $file";
			previous_good=no
		else
			echo "    !!! $file_or_dir differ: $file";
			previous_good=no
		fi
	else
		if [ "$previous_good" = yes ]; then  echo -n "."
		else echo -n "    ."
		fi
		previous_good=yes
	fi
done
if [ "$previous_good" = yes ]; then echo; fi

if [ $test_tidy = 'yes' -a $do_tidy = 'yes' ]; then
	echo "  test with tidy:"
	if tidy -q -e -f /dev/null $dir/$basename*.html; then
		echo "    passed"
	else echo "    !!! tidy failed"
	fi
fi
	
if [ $validate = 'yes' -a $do_validate = 'yes' ]; then
	echo "  test validity:"
	if validate $dir/$basename*.html > /dev/null; then
		echo "    passed"
	else echo "    !!! not valid $? errors"
	fi
fi
	
}

if [ ! -z $1 ]; then
	test_texi "$@"
	exit
fi

test_texi GermanNodeTest nodetest.texi "" 1
test_texi GermanNodeTest nodetest_for_makeinfo.texi "" 9
test_texi index_table
test_texi index_table index_table.texi "-split chapter -init index_test.init -output . -prefix chapter_index_table" 0 texi chapter_index_table
test_texi index_table split_chapter_index.texi "-split chapter -init index_test.init -output ."
test_texi index_table index_split.texi "-split chapter -output . -init index_test.init"
test_texi index_table no_node.texi "-init index_test.init -split chapter -output ." 3
test_texi index_table more_before_top.texi "-init ../../examples/makeinfo.init -init index_test.init -split node -output . -prefix nodes_more_before_top -top-file nodes_more_before_top.html -no-node-files" 0 texi nodes_more_before_top
#test_texi index_table more_before_top.texi "-init index_test.init -split none -prefix nodes_more_before_top_unsplit" 0 texi nodes_more_before_top_unsplit
test_texi index_table more_before_top.texi "-init index_test.init -output . -split chapter"
test_texi index_table more_before_top_section.texi "-init index_test.init -output . -split chapter"
test_texi index_table more_before_top_section.texi "-prefix monolithic_more_before_top_section" 0 texi monolithic_more_before_top_section
test_texi index_table index_special_region.texi "-split chapter -output ."
test_texi index_nodes ../index_table/index_nodes.texi "-init ../../examples/makeinfo.init -init ../index_table/index_test.init -split node -top-file index_nodes.html -output ."
test_texi more_before_top_section ../index_table/more_before_top_section.texi "-init ../../examples/makeinfo.init -init ../index_table/index_test.init -output ."
test_texi index_split_nodes ../index_table/index_split.texi "-init ../../examples/makeinfo.init -output . -init ../index_table/index_test.init"
test_texi node_in_chapter_index_split node_in_chapter_index_split.texi "-init ../index_table/index_test.init -output . -node-files"
test_texi macros
test_texi macros simple_macro.texi "" 4
test_texi macros pass0_macros.texi
test_texi macros truc_machin.texi
test_texi macros glossary.texi
test_texi macros imbricated_macros.texi
test_texi macros expansion_order.texi
test_texi macros ifclear_in_macro.texi
test_texi macros macro_call_in_ifset.texi
test_texi macros ifset_in_macro.texi
test_texi macros ifset_in_macro.texi "-D notes -prefix set_ifset_in_macro" 0 texi set_ifset_in_macro
test_texi macros not_ifset_text.texi
test_texi macros bib-example.texi
test_texi macros quote-args.txi "" 0 txi
test_texi sectionning
test_texi sectionning sectionning.texi "-init test_directions.init -prefix sectionning_directions" 0 texi sectionning_directions
test_texi sectionning test_include.texi
test_texi sectionning novalidate.texi "-init ../../examples/makeinfo.init -prefix novalidate_split -top novalidate_split.html -no-node-file -output ." 0 texi novalidate_split
test_texi sectionning novalidate.texi "-init ../../examples/makeinfo.init -split no -no-node-file"  
test_texi sectionning first_section_no_node.texi "" 1
test_texi sectionning nodes_before_top.texi
test_texi sectionning section_nodes_before_top.texi
test_texi sectionning nodes_after_top_before_section.texi "-split chapter -output ."
test_texi sectionning nodes_test.texi "" 5
test_texi sectionning no_section.texi
test_texi sectionning no_section.texi "-init test_directions.init -prefix no_section_directions" 0 texi no_section_directions
test_texi sectionning no_node.texi
test_texi sectionning no_node.texi "-init test_directions.init -prefix no_node_directions" 0 texi no_node_directions
test_texi sectionning no_node.texi "-prefix chapter_split_no_node -split chapter -output ." 0 texi chapter_split_no_node
test_texi sectionning no_section_no_top.texi
test_texi sectionning one_section.texi
test_texi sectionning one_node.texi
test_texi sectionning macro_in_menu.texi
test_texi sectionning one_node_and_section.texi
test_texi sectionning first_section_and_nodes.texi "" 1
test_texi sectionning double_top.texi "" 3
test_texi sectionning rec_nodes.texi
test_texi sectionning rec_nodes.texi "-init ../../examples/makeinfo.init -prefix makeinfo_rec_nodes -top-file makeinfo_rec_nodes.html -no-node-files -output ." 0 texi makeinfo_rec_nodes
test_texi sectionning ref_in_anchor.texi "" 1
test_texi sectionning brace_not_closed.texi "" 1
test_texi sectionning lower_subsub.texi
test_texi sectionning raiselowersections.texi
test_texi sectionning top_without_node.texi
test_texi sectionning before_node_and_section.texi "" 2
test_texi sectionning section_before_chapter.texi
test_texi sectionning ../node_footnote/node_footnote.texi "--no-separated-footnotes"
test_texi node_footnote node_footnote.texi "-use-node -node-files --no-separated-footnotes -split node -output ."
test_texi floats float.texi
#test_texi floats float.texi "-split chapter -node-files -top-file index.html" 0  texi float_node_files 
test_texi floats float_with_at_commands.texi
test_texi floats float_copying.texi "-split chapter -output ."
test_texi floats caption_not_closed.texi
test_texi formatting clean.texi
test_texi formatting formatting.texi
test_texi formatting formatting.texi "-split section -nosec-nav -nonumber -toc-links -def-table -short-ref -no-separated-footnotes -prefix exotic_formatting -output ." 0 texi exotic_formatting
test_texi formatting formatting.texi "-lang fr -prefix fr_formatting" 0 texi fr_formatting
test_texi formatting formatting.texi "-lang fr -prefix icons_fr_formatting -init icons.init" 0 texi icons_fr_formatting
test_texi formatting formatting.texi "-prefix weird_quotes_formatting -init weird_quotes.init" 0 texi weird_quotes_formatting
test_texi formatting menus.texi
test_texi formatting menus.texi "-init simple_menu.init -prefix menus_simple" 0 texi menus_simple
test_texi formatting simplest.texi "-css-include file.css"
test_texi formatting commands_in_ifset.texi
test_texi formatting ../GermanNodeTest/nodetest.texi "-split chapter -output ."
test_texi formatting formatting.texi "-init ../../examples/utf8.init -prefix to_utf8_formatting" 0 texi to_utf8_formatting
test_texi formatting nodetest_latin1.texi 
test_texi formatting nodetest_latin1.texi "-init ../../examples/utf8.init -prefix to_utf8_nodetest_latin1" 0 texi to_utf8_nodetest_latin1
test_texi formatting nodetest_utf8.texi 
test_texi formatting nodetest_utf8.texi "-init no_unicode.init -prefix no_unicode_nodetest_utf8" 0 texi no_unicode_nodetest_utf8
test_texi formatting nodetest_latin1.texi "-init no_unicode.init -prefix no_unicode_nodetest_latin1" 0 texi no_unicode_nodetest_latin1
test_texi formatting ../GermanNodeTest/nodetest.texi "-init no_unicode.init -prefix no_unicode_nodetest" 0 texi no_unicode_nodetest
test_texi formatting testkb.texi
test_texi formatting quotation.texi
test_texi formatting umlaut.texi
test_texi formatting def_cmds.texi
test_texi formatting def_cmd_dble.texi
test_texi formatting imbrications.texi "" 2
test_texi formatting complex_command_in_simple_command.texi
test_texi formatting verbatim_html.texi "-l2h -expand tex" 16
test_texi formatting center.texi
test_texi formatting tables.texi
test_texi formatting tex.texi "-l2h -expand tex" "no"
test_texi formatting formats_in_menu.texi
test_texi formatting comments.texi
test_texi formatting comments.texi "-init redefine_need.init -prefix comments_redefined" 0 texi  comments_redefined 
test_texi formatting equivalent_nodes.texi "" 5
test_texi formatting bad_nesting.texi
test_texi formatting formats_not_closed.texi "" 12
test_texi formatting commands_not_closed.texi "" 4
test_texi formatting math_not_closed.texi "--l2h --iftex" 8
test_texi formatting not_closed_in_menu.texi "" 7
test_texi formatting macro_call_not_closed.texi "" 1
test_texi formatting macro_def_not_closed.texi "" 1
test_texi formatting ignored_not_closed.texi "" 1
test_texi formatting verb_not_closed.texi "" 1
test_texi formatting tex_not_closed.texi "-l2h -expand tex " 2
test_texi formatting html_not_closed.texi "" 1
test_texi formatting verbatim_not_closed.texi "" 1
test_texi formatting copying_not_closed.texi "" 1
test_texi formatting node_in_copying.texi "" 1
test_texi formatting tex_in_copying.texi "-l2h -expand tex"
test_texi formatting titlepage_not_closed.texi "" 1
test_texi formatting footnote_not_closed.texi "" 1
test_texi formatting nested_ignore.texi
test_texi formatting test_refs.texi 
test_texi formatting test_refs.texi "-prefix chapter_test_refs -split chapter -output ." 0 texi chapter_test_refs
test_texi formatting test_refs.texi "-prefix node_test_refs -split node -node-files -use-nodes -output ." 0 texi node_test_refs
test_texi formatting at_commands_in_refs.texi
test_texi htmlxref ../formatting/test_refs.texi "-prefix no_split_test_refs" 2 texi no_split_test_refs
test_texi htmlxref ../formatting/test_refs.texi "--split node --use-nodes --node-files --output ." 0 texi
test_texi node_utf8_translit ../formatting/nodetest_utf8.texi "-node-files -use-nodes -split node -output . -prefix nodetest" 1 texi nodetest
test_texi node_utf8_translit_no_unidecode ../formatting/nodetest_utf8.texi "-init ../formatting/no_unidecode.init -node-files -use-nodes -split node -output . -prefix nodetest" 1 texi nodetest
test_texi node_translit ../GermanNodeTest/nodetest.texi "-node-files -use-nodes -split node -output ." 
test_texi node_translit_no_unicode ../GermanNodeTest/nodetest.texi "-init ../formatting/no_unicode.init -node-files -use-nodes -split node -output ."
test_texi node_translit_no_unidecode ../GermanNodeTest/nodetest.texi "-init ../formatting/no_unidecode.init -node-files -use-nodes -split node -output ."
test_texi texi2html 
test_texi viper_monolithic viper.texi "-ifinfo"
test_texi viper viper.texi "-split chapter -ifinfo -output ."
test_texi xemacs xemacs.texi "-split chapter -ifinfo -output ."
test_texi xemacs_frame xemacs.texi "-split chapter -frames -ifinfo -output ."
test_texi texinfo info-stnd.texi "-split chapter -node-files -output ."
test_texi texinfo texinfo.txi "-split chapter -ifinfo -output ." 0 txi texinfo #ignore_tags
test_texi nodes_texinfo ../texinfo/texinfo.txi "-split node -node-files -ifinfo -output . -I ../texinfo" 0 txi texinfo   #ignore_tags
test_texi ccvs cvs.texinfo "-split chapter -output ." 0 texinfo
test_texi tar ../tar_texi/tar.texi 
#test_texi singular ../singular_texi/singular.tex "-init-file ../singular_texi/t2h_singular.init -l2h -short-ext -prefix sing -top-file index.htm -noVerbose -output ." 0 tex sing #ignore_tags
#test_texi singular_httex ../singular_texi/singular.tex "-init-file ../singular_texi/t2h_singular.init -init ../../examples/tex4ht.init -short-ext -prefix sing -top-file index.htm -noVerbose -output ." 0 tex sing #ignore_tags
