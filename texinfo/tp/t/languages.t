use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple',
'@documentlanguage fr

@node Top

@defivar AAA BBB CCC
@end defivar
'],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'plaintext';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('languages', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;
