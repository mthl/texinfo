use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'simple',
'@include inc_file.texi
'],
['macro_definition_in_include',
'@include macro_included.texi

Call macro
@themacro{}
'],
['value_expansion_in_include',
'@set testvar incl-incl.txi

@c test - in the variable name, and concatenation of text after.
@set test-var incl-incl.tx

@c test - in the variable name, and concatenation of text before and after.
@set test_var ncl-incl.tx


@node Top

testvar include: @include @value{testvar}

testvar verbatiminclude: @verbatiminclude @value{testvar}


test-var include: @include @value{test-var}i

test-var verbatiminclude: @verbatiminclude @value{test-var}i


test_var include: @include i@value{test_var}i

test_var verbatiminclude: @verbatiminclude i@value{test_var}i
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('include', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

