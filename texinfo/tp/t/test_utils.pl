use strict;

use Test::More;
use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;
#use Data::Diff;
#use Data::Transformer;
#use Struct::Compare;
use Getopt::Long qw(GetOptions);

use vars qw(%result_texts %result_trees %result_errors);

ok(1);

our $arg_generate;
our $arg_debug;
our $arg_complete;

Getopt::Long::Configure("gnu_getopt");
GetOptions('g|generate' => \$arg_generate, 'd|debug' => \$arg_debug, 
           'c|complete' => \$arg_complete);

our $arg_test_case = shift @ARGV;

#my $remove_parent = sub {my $h = shift; delete $h->{'parent'}};
#my $transformer = Data::Transformer->new('hash'=>$remove_parent);

sub new_test ($;$$)
{
  my $name = shift;
  my $generate = shift;
  my $debug = shift;
  my $test = {'name' => $name, 'generate' => $generate, 
              'debug' => $debug};
  
  if ($generate) {
    mkdir "t/results/$name" if (! -d "t/results/$name");
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
  my $parser_options = shift @$test_case;
  $parser_options = {} if (!defined($parser_options));

  my $parser = Texinfo::Parser->parser({'test' => 1, 'debug' => $self->{'debug'},
                                       %$parser_options});
  print STDERR "  TEST $test_name\n" if ($self->{'debug'});
  my $result =  $parser->parse_texi_text($test_text, 1);
  my ($errors, $error_nrs) = $parser->errors();

  my $file = "t/results/$self->{'name'}/$test_name.pl";
  my $new_file = $file.'.new';

  {
    local $Data::Dumper::Purity = 1;
    local $Data::Dumper::Sortkeys = 1;
    local $Data::Dumper::Indent = 1;

    my $out_file = $new_file;
    $out_file = $file if ($self->{'generate'});

    open (OUT, ">$out_file") or die "Open $out_file: $!\n";
    print OUT 'use vars qw(%result_texts %result_trees %result_errors);'."\n\n";

    #print STDERR "Generate: ".Data::Dumper->Dump([$result], ['$res']);
    my $out_result = "".Data::Dumper->Dump([$result], ['$result_trees{\''.$test_name.'\'}']);
    my $perl_string_result = tree_to_texi($result);
    $perl_string_result =~ s/\\/\\\\/g;
    $out_result .= "\n".'$result_texts{\''.$test_name.'\'} = \''.$perl_string_result."';\n\n";
    $out_result .= "".Data::Dumper->Dump([$errors], ['$result_errors{\''.$test_name.'\'}']) ."\n\n";
    print OUT $out_result;
    close (OUT);
    
    print STDERR "--> $test_name\n".tree_to_texi($result)."\n" if ($self->{'generate'});
  } 
  if (!$self->{'generate'}) {
    require $file;

    #$transformer->traverse($result_trees{$test_name});
    #$transformer->traverse($result);
    {
      #local $Data::Dumper::Purity = 1;
      local $Data::Dumper::Sortkeys = 1;
      local $Data::Dumper::Indent = 1;
      #if (!Struct::Compare::compare($result, $result_trees{$test_name})) {
      #  print STDERR "".Data::Dumper->Dump([$result],['$new']);
      #  print STDERR "".Data::Dumper->Dump([$result_trees{$test_name}], ['$ref']);
      #}

      #my $diff = Data::Diff->new($result, $result_trees{$test_name});
      #print STDERR "".Data::Dumper->Dump([$diff->raw()], ['$diff']);
    }
    ok (Data::Compare::Compare($result, $result_trees{$test_name}, { 'ignore_hash_keys' => [qw(parent)] }), $test_name.' tree' );
    #ok(Struct::Compare::compare($result, $result_trees{$test_name}), $test_name.' tree' );
    #ok (Data::Compare::Compare($result, $result_trees{$test_name}), $test_name.' tree' );
    ok (Data::Compare::Compare($errors, $result_errors{$test_name}), $test_name.' errors' );
    ok (tree_to_texi($result) eq $result_texts{$test_name}, $test_name.' text' );
    #is (tree_to_texi($result), $result_texts{$test_name}, $test_name.' text' );
  }
  #exit;
}

sub run_all($$;$$$)
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
    if ($arg_complete) {
      $test->output_texi_file($test_case)
    } else {
      $test->test($test_case);
    }
  }
  if ($generate or $arg_complete) {
    plan tests => 1;
  } else {
    plan tests => (1 + scalar(@$ran_tests) * 3);
  }
}

sub output_texi_file($)
{
  my $self = shift;
  my $test_case = shift;
  my $test_name = shift @$test_case;
  my $test_text = shift @$test_case;

  my $dir = "texi/$self->{'name'}/";
  mkdir "texi/" or die 
     unless (-d "texi/");
  mkdir $dir or die 
     unless (-d $dir);
  my $file = "${dir}$test_name.texi";
  open (OUTFILE, ">$file") or die ("Open $file: $!\n");
  print OUTFILE "\\input texinfo \@c -*-texinfo-*-

\@setfilename $test_name.info

\@node Top

\@top $test_name

$test_text

\@bye\n";
  close (OUTFILE);
}

1;
