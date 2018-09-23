# $Id: 02coverage.t 8055 2018-08-13 11:41:21Z gavin $
use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

# These tests are supposed to test the same things as tests
# under tp/tests did, but to be faster.
my @test_cases = (
['unknown_nodes_renamed',
  undef, {'test_file' => 'unknown_nodes_renamed.texi',
  },
],
['one_line_no_content',
  undef, {'test_file' => 'one_line_no_content.texi',
  },
],
['one_line',
  undef, {'test_file' => 'one_line.texi',
  },
],
['empty',
  undef, {'test_file' => 'empty.texi',
  },
],

);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html';
  $test->[3]->{'TEXI2HTML'} = 1;
  $test->[3]->{'TEST'} = 1;
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('formatting', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);
