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

  
  $self->{'command_type_nr'}++;
  my $string = "($self->{'count_context'}->[-1]->{'bytes'},$self->{'count_context'}->[-1]->{'lines'}) ";
  my $command_type = '['.$self->{'command_type_nr'}.'] ';
  $command_type .= '@'.$root->{'cmdname'} if ($root->{'cmdname'});
  $command_type .= ":$root->{'type'}" if ($root->{'type'});
  $command_type .= ":text" if (defined($root->{'text'}));
  $string .= $command_type."\n";
  push @{$self->{'debug_count_strings'}}, $string;
  
  my $text =
    Texinfo::Convert::Plaintext::_convert($self, $root);
  my $location_string = '';
  if ($self->{'count_context'}->[-1]->{'locations'}) {
    foreach my $location (@{$self->{'count_context'}->[-1]->{'locations'}}) {
      $location_string .= "  l ";
      if (defined($location->{'lines'})) {
        $location_string .= " l $location->{'lines'}";
      }
      if (defined($location->{'bytes'})) {
        $location_string .= " b $location->{'bytes'}";
      }
      $location_string .= "\n";
    }
  }
  push @{$self->{'debug_count_strings'}}, "locations $command_type\n" .$location_string
     if ($location_string ne '');
  return $text;
}

}

my @test_cases = (
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

my @test_cases3 = (
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
  $converter->{'debug_count_strings'} = [];
  $converter->{'command_type_nr'} = 0;
  my $converted_text = $converter->_convert($tree);
  #print STDERR @{$converter->{'debug_count_strings'}};
  #print STDERR $converted_text;
}

1;

