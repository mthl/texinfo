#use strict;

use Test::More;
#BEGIN { plan tests => 8 };

require 't/test_utils.pl';

my @test_cases = (
[ 'text', 'text' ],
[ 'text comment', 'text@c comment' ],
[ 'text space comment', ' text  @c space comment' ],
[ 'text line', '
text

'],
[ 'comment between text', 'text
@c comment
end para' ],
[ 'two lines','text l 1
text l 2
'],
[ 'no paragraph commands', '@*
@titlefont{title font}
@image{aa,bb,cc,dd,ee}
'],
[ 'paragraph command','@@

@b{aaa}.
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_test_case ('paragraph', \@test_cases, $arg_test_case, 
   $arg_generate, $arg_debug);
