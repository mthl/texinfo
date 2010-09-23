use Test::More;
use strict;

require 't/test_utils.pl';

my @test_cases = (
[ 'good', '@multitable @columnfractions 0.4 .6 5.
@end multitable' ],
[ 'good_comment', '@multitable @columnfractions 0.4 .6 5.@c comment
@end multitable' ],
[ 'good_space_comment', '@multitable @columnfractions 0 1  @c space comment
@end multitable' ],
[ 'not_fraction','@multitable @columnfractions aaa
@end multitable' ],
[ 'empty', '@multitable @columnfractions 
@end multitable' ],
[ 'empty_comment', '@multitable @columnfractions @c
@end multitable' ],
[ 'wrong_command', '@multitable @columnfractions @b{3.4} 
@end multitable' ]
);

our $arg_generate;

ok(1);

my $test = new_test('columnfractions', $arg_generate);

foreach my $test_case (@test_cases) {
  $test->test($test_case);
}

$test->end_test();

if ($arg_generate) {
  plan tests => 2;
}
else {
  plan tests => (2 + scalar(@test_cases) * 3);
}
