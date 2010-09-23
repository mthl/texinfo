#use strict;

use Test::More;
#BEGIN { plan tests => 8 };

require 't/test_utils.pl';

my $generate;
# $generate = 1;
my $debug;
# $debug = 1;

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

# following may be cut and paste.

if ($generate) {
  plan tests => 1;
}
else {
  plan tests => (1 + scalar(@test_cases) * 3);
}

ok(1);

my $test = new_test('paragraph', $generate, $debug);

foreach my $test_case (@test_cases) {
  $test->test($test_case);
}

$test->end_test();
