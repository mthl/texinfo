use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
['w_argument',
'@itemize @w{}
@item @option{--build=} platform on which the program is compiled,
@item @option{--target=} target platform on which the program is processed.
@end itemize
'],
# unclear that these are valid constructs...
['accent_argument',
'@itemize @~@comment
@item item
@end itemize

@itemize @~
@item item
@end itemize
'],
['not_closed_item',
'@itemize
@item in item
'],
['not_closed_itemize',
'@itemize
'],
['lone_end_itemize',
'@end itemize
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('itemize', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

