use strict;

use Texinfo::Parser qw(:all);
use Data::Dumper;
use Data::Compare;

use vars qw(%result_texts %result_trees);

sub new_test ($;$) {
  my $name = shift;
  my $generate = shift;
  my $file = "t/results/$name.pl";
  my $test = {'name' => $name, 'generate' => $generate, 'file' => $file};
  
  if ($generate) {
    local *FH;
    open (*FH, ">$file") or die "Open $file: $!\n";
    $test->{'fh'} = *FH;
    my $FH = $test->{'fh'};
    print $FH 'use vars qw(%result_texts);'."\n\n";
    print $FH 'use vars qw(%result_trees);'."\n\n";
  }
  else {
    require "$file";
  }
  bless $test;
  return $test;
}

sub test($$$$) 
{
  my $self = shift;
  my $test_case = shift;
  my $test_name = shift @$test_case;
  my $test_text = shift @$test_case;

  my $parser = Texinfo::Parser->parser({'test' => 1});
  #my $parser = Texinfo::Parser->parser({'test' => 1, 'debug' => 1});
  my $result =  $parser->parse_texi_text($test_text, 1);

  if ($self->{'generate'}) {
    local $Data::Dumper::Purity = 1;
    $Data::Dumper::Sortkeys = 1;
    my $FH = $self->{'fh'};
    print $FH "".Data::Dumper->Dump([$result], ['$result_trees{\''.$test_name.'\'}']);
    print $FH "\n".'$result_texts{\''.$test_name.'\'} = \''.tree_to_texi($result)."';\n\n";
    print STDERR "--> $test_name\n".tree_to_texi($result)."\n";
  }
  else {
    ok (Data::Compare::Compare($result, $result_trees{$test_name}, { 'ignore_hash_keys' => [qw(parent)] }), $test_name.' tree' );
    is (tree_to_texi($result), $result_texts{$test_name}, $test_name.' text' );
  }
  #exit;
}

sub end_test($) {
  my $self = shift;
  if ($self->{'generate'}) {
    my $FH = $self->{'fh'};
    print $FH "\n1;\n";
    close ($self->{'fh'});
  }
}

1;
