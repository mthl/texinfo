use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'text', 'text' ],
[ 'text_comment', 'text@c comment' ],
[ 'text_space_comment', ' text  @c space comment' ],
[ 'text_line', '
text

'],
[ 'comment_between_text', 'text
@c comment
end para' ],
[ 'two_lines','text l 1
text l 2
'],
[ 'no_paragraph_commands', '@*
@titlefont{title font}
@image{aa,bb,cc,dd,ee}
'],
[ 'paragraph_command','@@

@b{aaa}.
'],
['close_paragraph_command',
'para @titlefont{in titlefont} after titlefont.

p before sp
@sp 4
inew p after sp'],
['paragraph_in_style_command',
'a 2 paragraphs sample @samp{in first paragraph

in second}.

a 3 paragraphs sample @samp{in first paragraph

in second

in third}.
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('paragraph', \@test_cases, $arg_test_case, 
   $arg_generate, $arg_debug);
