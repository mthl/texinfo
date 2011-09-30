use strict;

require 't/test_utils.pl';

my @test_cases = (
['simple',
'@documentlanguage fr

@node Top

@defivar AAA BBB CCC
@end defivar
'],
['multiple',
'@documentlanguage fr

@copying
@defivar copying a b
@end defivar
@end copying

@node Top

@defivar fr BBB CCC
@end defivar

@insertcopying

@documentlanguage pt

@defivar pt BBB CCC
@end defivar

@insertcopying
']);

my %info_tests = (
  'multiple' => 1,
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'plaintext';
  if ($info_tests{$test->[0]}) {
    push @{$test->[2]->{'test_formats'}}, 'info';
    push @{$test->[2]->{'test_formats'}}, 'html';
  }
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('languages', [@test_cases], $arg_test_case,
   $arg_generate, $arg_debug);

1;
