#use strict;

use Test::More;
#BEGIN { plan tests => 8 };

require 't/test_utils.pl';

my $generate;
 $generate = 1;

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

# following may be cut and paste.

if ($generate) {
  plan tests => 1;
}
else {
  plan tests => (1 + scalar(@test_cases) * 2);
}

ok(1);

my $test = new_test('columnfractions', $generate);

foreach my $test_case (@test_cases) {
  $test->test($test_case);
}

$test->end_test();
