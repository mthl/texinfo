use strict;

use Test::More;
BEGIN { plan tests => 7 };

use lib 'maintain/lib/Unicode-EastAsianWidth/lib/';
use lib 'maintain/lib/libintl-perl/lib/';
use lib 'maintain/lib/Text-Unidecode/lib/';
use Texinfo::Parser qw(parse_texi_text);
use Texinfo::Structuring;
use Texinfo::Convert::Texinfo;

use Data::Dumper;

ok(1);

sub test_new_node($$$$)
{
  my $in = shift;
  my $normalized_ref = shift;
  my $out = shift;
  my $name = shift;

  my $parser = Texinfo::Parser::parser();
  my $line = $parser->parse_texi_line ($in);
  my $node = Texinfo::Structuring::_new_node($parser, $line);
  my $texi_result = Texinfo::Convert::Texinfo::convert($node);
  my $normalized = $node->{'extra'}->{'normalized'};
  my $labels = $parser->labels_information();
  my @labels = keys(%$labels);
  ok ((scalar(@labels) == 1 and $labels[0] eq $normalized), "$name label");
  if (!defined($normalized_ref)) {
    print STDERR " --> $name($normalized): $texi_result";
  } else {
    is ($normalized_ref, $normalized, "$name normalized");
    is ($texi_result, $out, $name);
  }
}

test_new_node ('a node', 'a-node', '@node a node
', 'simple');
test_new_node ('a node @code{in code} @c comment
', 'a-node-in-code-', '@node a node @code{in code} @c comment
', 'complex');
