# $Id: 02coverage.t 8055 2018-08-13 11:41:21Z gavin $
use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

# These tests are supposed to test the same things as tests
# under tp/tests did, but to be faster, as we are avoiding the
# start-up time of perl for every one.
my @test_cases = (
['texi_glossary',
  undef, {'test_file' => 'glossary.texi',
  },
],
['texi_bib_example',
  undef, {'test_file' => 'bib-example.texi',
  },
],
['texi_cond',
  undef, {'test_file' => 'cond.texi',
    'expanded_formats' => ['html', 'info'],
  },
],
['cond',
  undef, {'test_file' => 'cond.texi',
  },
],
['cond_xml',
  undef, {'test_file' => 'cond.texi',
    'test_formats' => ['xml'],
    'expanded_formats' => ['xml'],
  },
],
['cond_no-ifhtml_no-ifinfo_no-iftex',
  undef, {'test_file' => 'cond.texi',
    'expanded_formats' => [],
  },
],
['cond_ifhtml_ifinfo_iftex',
  undef, {'test_file' => 'cond.texi',
    'expanded_formats' => ['html', 'info', 'tex'],
  },
  {'expanded_formats' => ['html', 'info', 'tex'], },
],
['cond_info',
  undef, {'test_file' => 'cond.texi',
    'test_formats' => ['info'],
    'expanded_formats' => ['info', 'plaintext'],
  },
],
['cond_info_no-ifhtml_no-ifinfo_no-iftex',
  undef, {'test_file' => 'cond.texi',
    'test_formats' => ['info'],
    'expanded_formats' => [],
  },
  {'expanded_formats' => []}
],
['cond_info_ifhtml_ifinfo_iftex',
  undef, {'test_file' => 'cond.texi',
    'test_formats' => ['info'],
    'expanded_formats' => ['info', 'html', 'tex'],
  },
  {'expanded_formats' => ['info', 'html', 'tex'],}
],
['unknown_nodes_renamed',
  undef, {'test_file' => 'unknown_nodes_renamed.texi', 
   'test_formats' => ['file_html']
  },
  {'RENAMED_NODES_FILE' => 'unknown_nodes_renamed-noderename.cnf',
  }
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
  if (!$test->[2]->{'test_formats'}) {
    push @{$test->[2]->{'test_formats'}}, 'html';
  }
  $test->[3]->{'TEXI2HTML'} = 1;
  $test->[3]->{'TEST'} = 1;
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('formatting', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);
