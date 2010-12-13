use strict;

use Test::More;
BEGIN { plan tests => 5 };

use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use lib '../texi2html/lib/libintl-perl/lib/';
use Texinfo::Convert::Text;
use Texinfo::Parser;
use Texinfo::Structuring;
use Test::Deep;

ok(1, "modules loading");

my $tree = Texinfo::Parser::parse_texi_line(undef, '@copyright{} @quotedblbase{}');
my $result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1});
is ($result, 'C ,,', 'sort no encoding');

$result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1,
                                      'enabled_encoding' => 'utf-8'});

is ($result, "\x{00A9} \x{201E}", 'sort utf-8');

$result = Texinfo::Convert::Text::convert($tree, {'sort_string' => 1,
                                      'enabled_encoding' => 'iso-8859-1'});

is ($result, "\x{00A9} ,,", 'sort iso-8859-1');

my $parser = Texinfo::Parser::parser();
$tree = $parser->parse_texi_text('@node Top

@cindex !
@cindex e
@cindex E
@cindex ``
@cindex @~e
@cindex
@cindex aaaaaaaaaaaa
');

my ($index_names, $merged_indices, $index_entries) = 
   $parser->indices_information();
my $sorted_index_entries = Texinfo::Structuring::sort_indices($tree, $index_entries);

my @entries = ();
foreach my $entry (@{$sorted_index_entries->{'cp'}}) {
  push @entries, $entry->{'key'};
}

my @entries_ref = ('!', '``', 'aaaaaaaaaaaa', 'E', 'e', 'e~');

cmp_deeply (\@entries, \@entries_ref, 'sorted index entries');


