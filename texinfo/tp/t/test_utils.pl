use strict;

use Test::More;
use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;
use Getopt::Long qw(GetOptions);

use vars qw(%result_texts %result_trees %result_errors);

ok(1);

our $arg_generate;
our $arg_debug;

Getopt::Long::Configure("gnu_getopt");
GetOptions('g|generate' => \$arg_generate, 'd|debug' => \$arg_debug);

our $arg_test_case = shift @ARGV;

sub new_test ($;$$)
{
  my $name = shift;
  my $generate = shift;
  my $debug = shift;
  my $file = "t/results/$name.pl";
  my $test = {'name' => $name, 'generate' => $generate, 
              'file' => $file, 'debug' => $debug};
  
  if ($generate) {
    local *FH;
    open (*FH, ">$file") or die "Open $file: $!\n";
    $test->{'fh'} = *FH;
    my $FH = $test->{'fh'};
    print $FH 'use vars qw(%result_texts %result_trees %result_errors);'."\n\n";
  }
  else {
    require "$file";
  }
  bless $test;
  return $test;
}

sub test($$) 
{
  my $self = shift;
  my $test_case = shift;
  my $test_name = shift @$test_case;
  my $test_text = shift @$test_case;

  my $parser = Texinfo::Parser->parser({'test' => 1, 'debug' => $self->{'debug'}});
  print STDERR "  TEST $test_name\n" if ($self->{'debug'});
  my $result =  $parser->parse_texi_text($test_text, 1);
  $result = $parser->tree () if (!$result);

  if ($self->{'generate'}) {
    local $Data::Dumper::Purity = 1;
    local $Data::Dumper::Sortkeys = 1;
    local $Data::Dumper::Indent = 1;
    my $FH = $self->{'fh'};
    print $FH "################ $test_name\n";
    print $FH "".Data::Dumper->Dump([$result], ['$result_trees{\''.$test_name.'\'}']);
    print $FH "\n".'$result_texts{\''.$test_name.'\'} = \''.tree_to_texi($result)."';\n\n";
    print $FH "".Data::Dumper->Dump([$parser->errors()], ['$result_errors{\''.$test_name.'\'}']) ."\n\n";
    
    print STDERR "--> $test_name\n".tree_to_texi($result)."\n";
  }
  else {
    ok (Data::Compare::Compare($result, $result_trees{$test_name}, { 'ignore_hash_keys' => [qw(parent)] }), $test_name.' tree' );
    ok (Data::Compare::Compare($parser->errors(), $result_errors{$test_name}), $test_name.' errors' );
    is (tree_to_texi($result), $result_texts{$test_name}, $test_name.' text' );
  }
  #exit;
}

sub end_test($)
{
  my $self = shift;
  if ($self->{'generate'}) {
    my $FH = $self->{'fh'};
    print $FH "\n1;\n";
    close ($self->{'fh'});
  }
}

sub run_test_case($$;$$$)
{
  my $name = shift;
  my $test_cases = shift;
  my $test_case_name = shift;
  my $generate = shift;
  my $debug = shift;

  my $test = new_test($name, $generate, $debug);
  my $ran_tests = $test_cases;
  if (defined($test_case_name)) {
    if ($test_case_name =~ /^\d+$/) {
      $ran_tests = [ $test_cases->[$test_case_name-1] ];
    } else {
      foreach my $test_case (@$test_cases) {
        $ran_tests = [ $test_case ] if ($test_case->[0] eq $test_case_name);
      }
    }
  }

  foreach my $test_case (@$ran_tests) {
    $test->test($test_case);
  }
  if ($generate) {
    plan tests => 1;
  } else {
    plan tests => (1 + scalar(@$ran_tests) * 3);
  }


  $test->end_test();
}

1;
