use strict;

require 't/test_utils.pl';

my @test_cases = (
['image_inline_or_not',
'@image{A}

Para @image{hh}.

@node Top

@image{B}

Para @image{jj}.

@example

@image{in_example}

T
@image{in example after text}
@end example

@quotation @image{in_quotation_arg}
@image{in_quotation_content}
@end quotation

@table @asis
@item @image{in_table_item}

@image{in_table_def}

AA @image{in_table_def_para}

@image{in_table_def_after}
@end table

@menu
* @image{node_image}:: @image{image_in_description}
* @image{in_menu_entry_name}: (somewhere)@image{extnode}.

@image{in_menu_comment}
@end menu

@node @image{node_image}
@chapter @image{in_chapter_arg}


T@footnote{
@image{in_footnote}
}

@float F,g

@image{in_float}

@caption{@image{in_caption} PAra @image{in_caption_para}}
@end float
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['xml'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('xml_tests', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;

