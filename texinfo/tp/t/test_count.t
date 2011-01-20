use strict;

use Test::More;
BEGIN { plan tests => 1 };
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use lib '../texi2html/lib/libintl-perl/lib/';
use Texinfo::Convert::Info;
use Texinfo::Parser;
use Texinfo::Structuring;
use Test::Deep;
use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

my $debug = 0;

GetOptions('d|debug' => \$debug);

ok(1);

{
package Texinfo::DebugCount;
use vars qw(@ISA);
@ISA = qw(Texinfo::Convert::Plaintext);

sub _convert($$)
{
  my $self = shift;
  my $root = shift;

  my $text =
    Texinfo::Convert::Plaintext::_convert($self, $root);
  my $string = '';
  $string .= '@'.$root->{'cmdname'} if ($root->{'cmdname'});
  $string .= ":$root->{'type'}" if ($root->{'type'});
  $string .= ":text" if (defined($root->{'text'}));
  #if ($counts) {
  #  if (defined($counts->{'bytes'})) {
  #    $string .= ", b $counts->{'bytes'}";
  #  }
  #  if (defined($counts->{'lines'})) {
  #    $string .= ", l $counts->{'lines'}";
  #  }
  #  if ($locations) {
  #    foreach my $location (@$locations) {
  #      $string .= "|";
  #      if (defined($location->{'lines'})) {
  #        $string .= " l $location->{'lines'}";
  #      }
  #      if (defined($location->{'bytes'})) {
  #        $string .= " b $location->{'bytes'}";
  #      }
  #    }
  #  }
  #}
  #print STDERR "$string\n";
  #return ($text, $counts, $locations);
  return $text;
}

}

my @test_cases1 = (
['commands',
'@TeX{}. Ab. @@. @
@~e, @^{@dotless{i}}

Hohoh

@example 
truc
@end example

@vtable @samp
@item vitem table

text
@end vtable'],
);
my @test_cases2 = (
['flushright',
'
@flushright
  aaa bb @anchor{rrr} ada   
 dad  sff sd @anchor{a1} and @anchor{a2} dsdbf

dqs
sqdd

@anchor{alone}

new para.

@end flushright
']);

my @test_cases = (
['multitable',
'
@multitable {aaa} {bb1} {ccc}
@item aaa @tab bb @anchor{anch 1}
@tab ccc
@item @tab @anchor{anch2}
@end multitable
']);

#if (@ARGV) {
#  my $file = shift (@ARGV);
#  my $tree = $parser->parse_texi_file($file);
#} else {
#  $tree = $parser->parse_texi_text('');
#}

foreach my $test_case (@test_cases) {
  my $test_name = $test_case->[0];
  my $parser = Texinfo::Parser::parser();
  my $tree = $parser->parse_texi_text($test_case->[1]);
  my $converter = Texinfo::DebugCount->converter({'DEBUG' => $debug, 
                                                  'parser' => $parser});
  my ($converted_text) = $converter->_convert($tree);

#  print STDERR $converted_text;
}

1;

