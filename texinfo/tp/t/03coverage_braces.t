use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple', '@b{in  b}.'],
['nested', 'type the characters @kbd{l o g o u t @key{RET}}.'],
['nested_args', '@xref{@@ @samp{in samp}, descr @b{in b}}'],
['too much args', '@abbr{AZE, A truc Z b, E eep}'],
['footnote', 'text@footnote{in footnote.

@r{in footnote r}. } after footnote.']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_test_case ('coverage_braces', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

1;
