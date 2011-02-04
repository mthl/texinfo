use strict;

require 't/test_utils.pl';

my @test_cases = (
['empty_line',
'@example
example

after empty line
@end example
'],
['quote_dash_in_example',
'
@example
and now -- yes---now and ``so\'\'.

@end example
'],
['text_on_command_line',
'@example text on line
@end example

@example text on line followed by text
normal text
@end example

@example
in example
@end example text after end

@example
@example
@end example text after end example nested in example
@end example
'],
['def_in_example',
'@example
@defun name arg
in defun
@end defun
@end example
'],
['caption_in_example',
'@float float

@example
in example 

@caption{caption}

After caption
@end example
@end float
'],
['titlefont_in_example',
'@example
@titlefont{Title}
Text.
@end example
'],
['comments_in_example',
'Example with comments 2 lines
@example 
line @c comment
second line @c comment
@end example

Example with comments 1 line
@example
line @c comment
@end example
'],
);

my @test_invalid = (
['empty_line_style_command',
'@example
example @samp{in samp

after empty} line
@end example
'],
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('preformatted', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

