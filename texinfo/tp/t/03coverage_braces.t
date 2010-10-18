use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple', '@b{in  b}.'],
['nested', 'type the characters @kbd{l o g o u t @key{RET}}.'],
['nested_args', '@xref{@@ @samp{in samp}, descr @b{in b}}'],
['too_much_args', '@abbr{AZE, A truc Z b, E eep}'],
['footnote', 'text@footnote{in footnote.

@r{in footnote r}. } after footnote.'],
['no_brace', '@TeX and @code code'],
['space_in_footnote','text@footnote{ in footnote.}'],
['footnote_ending_on_empty_line','text@footnote{ in footnote.

}'],
['space_in_image','@image{ a ,bb, cc,dd ,e }. @image{ f }.']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('coverage_braces', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

1;
