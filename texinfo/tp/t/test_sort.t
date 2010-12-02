use strict;

use Test::More;
BEGIN { plan tests => 4 };

use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Convert::Text;
use Texinfo::Parser;

ok(1, "modules loading");

my $tree = Texinfo::Parser::parse_texi_line(undef, '@copyright{} @quotedblbase{}');
my $result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1});
is ($result, 'C ,,', 'sort no encoding');

$result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1,
                                      'enable_encoding' => 'utf-8'});

is ($result, "\x{00A9} \x{201E}", 'sort utf-8');

$result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1,
                                      'enable_encoding' => 'iso-8859-1'});

is ($result, "\x{00A9} ,,", 'sort iso-8859-1');
