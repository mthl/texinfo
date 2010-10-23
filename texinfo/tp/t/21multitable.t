use strict;

require 't/test_utils.pl';

my @test_cases = (
['multitable_not_closed_item_tab',
'@multitable {r} {t}
@item rt @tab ds
'],
['multitable_not_closed_item',
'@multitable {r} {t}
@item rt 
'],
['multitable_not_closed',
'@multitable {r} {t}
'],
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('multitable', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

