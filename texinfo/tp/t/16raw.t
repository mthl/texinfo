use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
[ 'nested macros', '@macro truc   { arg,  ex}
in macro \arg\
@macro othermacro 
other macro
@end macro
@macro
@end macro
'],
['misc raw','
@html 
in html @end html

@tex in tex
@end tex

@verbatim
in verbatim
in verbatim2
@end verbatim
'],
['misc raw comments','
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
'],
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_test_case ('raw', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

ok(1);

