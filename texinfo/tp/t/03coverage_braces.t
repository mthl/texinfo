use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple', '@b{in  b}.'],
['nested', 'type the characters @kbd{l o g o u t @key{RET}}.'],
['nested_args', '@xref{@@ @samp{in samp}, descr @b{in b}}'],
['too_much_args', '@abbr{AZE, A truc Z b, E eep}'],
['footnote', 'text@footnote{in footnote.

@r{in footnote r}. } after footnote.'],
['no_brace', '@TeX and @code code and @footnote footnote '],
['no_brace_space_end_line',
'@code {c}.

@code
Arg.'],
['space_in_footnote','text@footnote{ in footnote.}'],
['footnote_ending_on_empty_line','text@footnote{ in footnote.

}'],
['space_in_image','@image{ a ,bb, cc,dd ,e }. @image{ f }.'],
['empty_second_email_argument', '@email{ a@@b.c, }'],
['empty_line_in_anchor',
'@anchor{an

anchor}
'],
['space_in_anchor',
'@anchor{   anchor  name   }.
']);

my @test_invalid = (
['unmatched_brace','@samp{Closing} @samp{ @} without opening macro }.}'],
['brace_opened_no_command','anchor{truc@} @anchor{truc}.
@bye'],
['caption_not_closed',
'@float Text

@caption{Not closed caption

The caption is closed as soon as @@end float is encountered, since
as much as possible is closed in order to find the @@float beginning.

@end float

@bye
'],
['code_not_closed','@code{in code'],
['anchor_not_closed',
'@anchor{my anchor

'],
['footnote_not_closed',
'AAA@footnote{ in footnote

Second paragraph.
'],
['math_not_closed','@math{\delta + 2'],
['math_bracketed_not_closed','@math{{x^i}\over{\tan '],
['math_bracketed_inside_not_closed','@math{{x^i}\over{\tan}'],
['unknown_command_with_braces',
'Unknown thing @thing{}

Unknown macro @unknown{ first paragraph

second paragraph}

@unknown2{ first paragraph

second paragraph

third}
'],
['footnote_in_command_not_closed',
'aaa@code{in code@footnote{in footnote']
);

our ($arg_test_case, $arg_generate, $arg_debug);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['plaintext'];
}

run_all ('coverage_braces', [@test_cases, @test_invalid], $arg_test_case,
   $arg_generate, $arg_debug);

1;
