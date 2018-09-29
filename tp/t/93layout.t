# $Id: 02coverage.t 8055 2018-08-13 11:41:21Z gavin $
use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

# These tests are supposed to test the same things as tests
# under tp/tests did, but to be faster, as we are avoiding the
# start-up time of perl for every one.
my @test_cases = (
['no_monolithic',
  undef, {'test_file' => 'no_monolithic.texi' },
  {'MONOLITHIC' => 0}
],

);

foreach my $test (@test_cases) {
  if (!$test->[2]->{'test_formats'}) {
    push @{$test->[2]->{'test_formats'}}, 'file_html';
  }
  $test->[3]->{'TEXI2HTML'} = 1;
  $test->[3]->{'TEST'} = 1;
  $test->[3]->{'PROGRAM'} = 'texi2any';
  $test->[3]->{'PACKAGE_URL'} = 'http://www.gnu.org/software/texinfo/';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('layout', [@test_cases], $arg_test_case, $arg_generate, $arg_debug);
