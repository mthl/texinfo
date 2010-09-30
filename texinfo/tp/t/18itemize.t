use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
['w_argument',
'@itemize @w{}
@item @option{--build=} platform on which the program is compiled,
@item @option{--target=} target platform on which the program is processed.
@end itemize
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('itemize', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

