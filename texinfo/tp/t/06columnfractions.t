#use strict;

use Test::More;
BEGIN { plan tests => 8 };
use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;

ok(1);

my $generate;
#$generate = 1;
if ($generate) {
  open (RES, ">t/columnfractions_results.pl") or die;
  print RES 'use vars qw(%result_texts);'."\n\n";
}
else {
  require 't/columnfractions_results.pl';
}

sub try_test($$$) 
{
  my $test_text = shift;
  my $test_name = shift;
  my $check = shift;
  my $parser = Texinfo::Parser->parser({'test' => 1});
  #my $parser = Texinfo::Parser->parser({'test' => 1, 'debug' => 1});
  my $result =  $parser->parse_texi_text($test_text, 1);
  #ok (Data::Compare::Compare($result, $check), $test_name);
  if ($generate) {
    local $Data::Dumper::Purity = 1;
    print RES 'use vars qw($result_'.$test_name.");\n";
    print RES "".Data::Dumper->Dump([$result], ['$result_'.$test_name]);
    print RES "\n".'$result_texts{\''.$test_name.'\'} = \''.tree_to_texi($result)."';\n\n";
    print STDERR "--> $test_name\n".tree_to_texi($result)."\n";
  }
  else {
    ok (Data::Compare::Compare($result, $check), $test_name);
  }
  #exit;
}

foreach my $test (
[ '@multitable @columnfractions 0.4 .6 5.
@end multitable', 'good', $result_good ],
[ '@multitable @columnfractions 0.4 .6 5.@c comment
@end multitable', 'good_comment', $result_good_comment ],
[ '@multitable @columnfractions 0 1  @c space comment
@end multitable', 'good_space_comment', $result_good_space_comment ],
[ '@multitable @columnfractions aaa
@end multitable', 'not_fraction', $result_not_fraction ],
[ '@multitable @columnfractions 
@end multitable', 'empty', $result_empty ],
[ '@multitable @columnfractions @c
@end multitable', 'empty_comment', $result_empty_comment ],
[ '@multitable @columnfractions @b{3.4} 
@end multitable', 'wrong_command', $result_wrong_command ]
) {
  try_test($test->[0], $test->[1], $test->[2])
}

if ($generate) {
  print RES "\n1;\n";
  close (RES);
}
