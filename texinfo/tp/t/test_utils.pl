use strict;

use Test::More;
use Texinfo::Parser;
use Texinfo::Convert::Text;
use Texinfo::Convert::Texinfo;
use Texinfo::Structuring;
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Convert::Plaintext;
use File::Basename;
use Data::Dumper;
use Data::Compare;
use Test::Deep;
use Clone qw(clone);
#use Data::Diff;
#use Data::Transformer;
#use Struct::Compare;
use Getopt::Long qw(GetOptions);

use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

ok(1);

our $arg_generate;
our $arg_debug;
our $arg_complete;
our $nr_comparisons = 8;

Getopt::Long::Configure("gnu_getopt");
GetOptions('g|generate' => \$arg_generate, 'd|debug' => \$arg_debug, 
           'c|complete' => \$arg_complete);

our $arg_test_case = shift @ARGV;

#my $remove_parent = sub {my $h = shift; delete $h->{'parent'}};
#my $transformer = Data::Transformer->new('hash'=>$remove_parent);
sub remove_keys($$;$);
sub remove_keys($$;$)
{
  my $root = shift;
  my $deleted_keys = shift;
  my $been_there = shift;
  return undef if (!defined($root));
  if (!defined($been_there)) {
    #print STDERR "First call: $root\n";
    $root = clone ($root);
    #print STDERR Data::Dumper->Dump([$root]);
    $been_there = {};
  }
  #print STDERR "remove_keys: $root\n";
  if (ref($root) eq 'HASH') {
    foreach my $key (@$deleted_keys) {
      if (exists($root->{$key})) {
        delete ($root->{$key});
        #print STDERR "Deleted $root $key\n";
      }
    }
    $been_there->{$root} = 1;
    foreach my $key (%$root) {
      next if (!defined($root->{$key}) or !ref($root->{$key})
               or (ref($root->{$key}) ne 'HASH' 
                    and ref($root->{$key}) ne 'ARRAY')
               or exists($been_there->{$root->{$key}}));
      #print STDERR "Recurse in $root $key\n";
      remove_keys($root->{$key}, $deleted_keys, $been_there);
    }
  } elsif (ref($root) eq 'ARRAY') {
    $been_there->{$root} = 1;
    foreach my $element (@$root) {
      next if (!defined($element) or !ref($element)
               or (ref($element) ne 'HASH'
                    and ref($element) ne 'ARRAY')
               or exists($been_there->{$element}));

      remove_keys($element, $deleted_keys, $been_there);
    }
  }
  return $root;
}

sub cmp_trimmed($$$$)
{
  my $compared = shift;
  my $reference = shift;
  my $deleted_keys = shift;
  my $test_name = shift;
  my $trimmed = remove_keys ($compared, $deleted_keys);
  cmp_deeply($trimmed, $reference, $test_name);
}

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

my @contents_keys = ('contents', 'args', 'parent', 'line_nr', 'node_content', 
  'nodes_manuals', 'misc_content', 'invalid_nesting', 
  'block_command_line_contents');
my @menus_keys = ('menu_next', 'menu_up', 'menu_prev', 'menu_up_hash');
my @sections_keys = ('section_next', 'section_prev', 'section_up', 
  'section_childs', 'associated_node');
my @node_keys = ('node_next', 'node_prev', 'node_up', 'menus', 
  'associated_section');
my %avoided_keys_tree;
my @avoided_keys_tree = (@sections_keys, @menus_keys, @node_keys, 
   'menu_child');
foreach my $avoided_key(@avoided_keys_tree) {
  $avoided_keys_tree{$avoided_key} = 1;
}
sub filter_tree_keys { [grep {!$avoided_keys_tree{$_}} ( sort keys %{$_[0]} )] }

#my @avoided_compare_tree = (@avoided_keys_tree, 'parent', 'node_tree');

my %avoided_keys_sectioning;
my @avoided_keys_sectioning = ('section_next', @contents_keys, @menus_keys, 
  @node_keys, 'menu_child');
foreach my $avoided_key(@avoided_keys_sectioning) {
  $avoided_keys_sectioning{$avoided_key} = 1;
}
sub filter_sectioning_keys { [grep {!$avoided_keys_sectioning{$_}}
   ( sort keys %{$_[0]} )] }

my %avoided_keys_nodes;
my @avoided_keys_nodes = (@sections_keys, @contents_keys, @menus_keys);
foreach my $avoided_key(@avoided_keys_nodes) {
  $avoided_keys_nodes{$avoided_key} = 1;
}
sub filter_nodes_keys { [grep {!$avoided_keys_nodes{$_}}
   ( sort keys %{$_[0]} )] }
#my @avoided_compare_nodes = (@avoided_keys_nodes, 'node_up', 'node_prev');

my %avoided_keys_menus;
my @avoided_keys_menus = (@sections_keys, @contents_keys, @node_keys);
foreach my $avoided_key(@avoided_keys_menus) {
  $avoided_keys_menus{$avoided_key} = 1;
}
sub filter_menus_keys { [grep {!$avoided_keys_menus{$_}}
   ( sort keys %{$_[0]} )] }

my %avoided_keys_floats;
my @avoided_keys_floats = (@sections_keys, @contents_keys, @node_keys, 
                           @menus_keys);
foreach my $avoided_key(@avoided_keys_floats) {
  $avoided_keys_floats{$avoided_key} = 1;
}
sub filter_floats_keys { [grep {!$avoided_keys_floats{$_}}
   ( sort keys %{$_[0]} )] }

sub convert_to_plaintext($$)
{
  my $self = shift;
  my $tree = shift;
  my $converter = Texinfo::Convert::Plaintext::converter({'debug' => $self->{'debug'}});
  return $converter->convert($tree);
}

my %formats = (
  'plaintext' => \&convert_to_plaintext,
);

sub test($$) 
{
  my $self = shift;
  my $test_case = shift;

  my $parser_options = {};
  my ($test_name, $test_text);

  if (ref($test_case) eq 'ARRAY') {
    $test_name = shift @$test_case;
    $test_text = shift @$test_case;
    $parser_options = shift @$test_case if (@$test_case);
  } else {
    $test_name = basename($test_case, '.texi');
  }
  my @tested_formats;
  if ($parser_options and $parser_options->{'test_formats'}) {
    push @tested_formats, @{$parser_options->{'test_formats'}};
    delete $parser_options->{'test_formats'};
  }

  my $parser = Texinfo::Parser->parser({'test' => 1,
                                        'include_directories' => ['t/include/'],
                                        'debug' => $self->{'debug'},
                                       %$parser_options});
  # take the initial values to record only if there is something new
  my ($initial_index_names, $initial_merged_indices) 
    = $parser->indices_information();
  # do a copy to compare the values and not the references
  $initial_index_names = { %{$initial_index_names} };
  $initial_merged_indices = { %{$initial_merged_indices} };
  print STDERR "  TEST $test_name\n" if ($self->{'debug'});
  my $result;
  if (ref($test_case) eq 'ARRAY') {
    $result = $parser->parse_texi_text($test_text, 1);
  } else {
    $result = $parser->parse_texi_file($test_case);
  }
  my $floats = $parser->floats_information();

  my $structure = Texinfo::Structuring::sectioning_structure($parser, $result);

  my $top_node = Texinfo::Structuring::nodes_tree($parser);

  my ($errors, $error_nrs) = $parser->errors();
  my ($index_names, $merged_indices) = $parser->indices_information();
  my $indices;
  $indices->{'index_names'} = $index_names
    unless (Data::Compare::Compare($index_names, $initial_index_names));
  $indices->{'merged_indices'} = $merged_indices
    unless (Data::Compare::Compare($merged_indices, $initial_merged_indices));

  my $converted_text = Texinfo::Convert::Text::convert($result);

  my %converted;
  foreach my $format (@tested_formats) {
  #  $converted{$format} = &{$formats{$format}}($self, $result);
  #  print STDERR "$format: \n$converted{$format}";
  }

  my $file = "t/results/$self->{'name'}/$test_name.pl";
  my $new_file = $file.'.new';

  {
    local $Data::Dumper::Purity = 1;
    local $Data::Dumper::Indent = 1;

    my $out_file = $new_file;
    $out_file = $file if ($self->{'generate'});

    open (OUT, ">$out_file") or die "Open $out_file: $!\n";
    print OUT 'use vars qw(%result_texis %result_texts %result_trees %result_errors '."\n".
              '   %result_indices %result_sectioning %result_nodes %result_menus'."\n".
              '   %result_floats);'."\n\n";

    #print STDERR "Generate: ".Data::Dumper->Dump([$result], ['$res']);
    my $out_result;
    {
      local $Data::Dumper::Sortkeys = \&filter_tree_keys;
      $out_result = Data::Dumper->Dump([$result], ['$result_trees{\''.$test_name.'\'}']);
    }
    my $texi_string_result = Texinfo::Convert::Texinfo::convert($result);
    my $perl_string_result = $texi_string_result;
    $perl_string_result =~ s/\\/\\\\/g;
    $perl_string_result =~ s/'/\\'/g;
    my $perl_string_converted_text = $converted_text;
    $perl_string_converted_text =~ s/\\/\\\\/g;
    $perl_string_converted_text =~ s/'/\\'/g;
    $out_result .= "\n".'$result_texis{\''.$test_name.'\'} = \''.$perl_string_result."';\n\n";
    $out_result .= "\n".'$result_texts{\''.$test_name.'\'} = \''.$perl_string_converted_text."';\n\n";
    {
      local $Data::Dumper::Sortkeys = \&filter_sectioning_keys;
      $out_result .=  Data::Dumper->Dump([$structure], ['$result_sectioning{\''.$test_name.'\'}'])."\n"
        if ($structure);
    }
    if ($top_node) {
      {
        local $Data::Dumper::Sortkeys = \&filter_nodes_keys;
         $out_result .=  Data::Dumper->Dump([$top_node], ['$result_nodes{\''.$test_name.'\'}'])."\n";
      }
      {
        local $Data::Dumper::Sortkeys = \&filter_menus_keys;
         $out_result .=  Data::Dumper->Dump([$top_node], ['$result_menus{\''.$test_name.'\'}'])."\n";
      }
    }
    {
      local $Data::Dumper::Sortkeys = 1;
      $out_result .= Data::Dumper->Dump([$errors], ['$result_errors{\''.$test_name.'\'}']) ."\n\n";
      $out_result .= Data::Dumper->Dump([$indices], ['$result_indices{\''.$test_name.'\'}']) ."\n\n"
         if ($indices);
    }
    if ($floats)
    {
      local $Data::Dumper::Sortkeys = \&filter_floats_keys;
      $out_result .= Data::Dumper->Dump([$floats], ['$result_floats{\''.$test_name.'\'}']) ."\n\n";
    }
    $out_result .= "1;\n";
    print OUT $out_result;
    close (OUT);
    if (ref($test_case) ne 'ARRAY') {
      my $out_texi_file = "t/results/$self->{'name'}/$test_name.texi";
      open (OUT, ">$out_texi_file") or die "Open $out_texi_file: $!\n";
      print OUT $texi_string_result;
      close (OUT);
    }
    
    print STDERR "--> $test_name\n".Texinfo::Convert::Texinfo::convert($result)."\n" 
            if ($self->{'generate'});
  } 
  if (!$self->{'generate'}) {
    require $file;

    #$transformer->traverse($result_trees{$test_name});
    #$transformer->traverse($result);
    #{
      #local $Data::Dumper::Purity = 1;
      #local $Data::Dumper::Sortkeys = 1;
      #local $Data::Dumper::Indent = 1;
      #if (!Struct::Compare::compare($result, $result_trees{$test_name})) {
      #  print STDERR "".Data::Dumper->Dump([$result],['$new']);
      #  print STDERR "".Data::Dumper->Dump([$result_trees{$test_name}], ['$ref']);
      #}

      #my $diff = Data::Diff->new($result, $result_trees{$test_name});
      #print STDERR "".Data::Dumper->Dump([$diff->raw()], ['$diff']);
    #}
    cmp_trimmed($result, $result_trees{$test_name}, \@avoided_keys_tree,
                $test_name.' tree');
#    ok (Data::Compare::Compare($result, $result_trees{$test_name}, 
#               { 'ignore_hash_keys' => [@avoided_compare_tree] }), 
#        $test_name.' tree' );
    cmp_trimmed($structure, $result_sectioning{$test_name},
                 \@avoided_keys_sectioning, $test_name.' sectioning' );

  #  ok (Data::Compare::Compare($structure, $result_sectioning{$test_name}, 
  #            { 'ignore_hash_keys' => [@avoided_compare_sectioning] }), 
  #      $test_name.' sectioning' );
    #my $trimmed = remove_keys ($top_node, \@avoided_keys_nodes);
    #cmp_deeply($trimmed, $result_nodes{$test_name}, $test_name.' nodes');
    cmp_trimmed($top_node, $result_nodes{$test_name}, \@avoided_keys_nodes,
                $test_name.' nodes');
 #   ok (Data::Compare::Compare($top_node, $result_nodes{$test_name},
 #                      { 'ignore_hash_keys' => [@avoided_compare_nodes] }),
 #        $test_name.' nodes');
    {
    local $Data::Dumper::Purity = 1;
    local $Data::Dumper::Indent = 1;
  #     local $Data::Dumper::Sortkeys = \&filter_nodes_keys;
       #print STDERR  Data::Dumper->Dump([$trimmed], ['$top_node']);
  #      print STDERR  Data::Dumper->Dump([$result_nodes{$test_name}], ['$result']);
    }
    cmp_trimmed($top_node, $result_menus{$test_name}, \@avoided_keys_menus,
                $test_name.' menus');

    ok (Data::Compare::Compare($errors, $result_errors{$test_name}), 
        $test_name.' errors');
    ok (Data::Compare::Compare($indices, $result_indices{$test_name}), 
        $test_name.' indices');
    ok (Texinfo::Convert::Texinfo::convert($result) eq $result_texis{$test_name}, 
         $test_name.' texi');
    ok ($converted_text eq $result_texts{$test_name}, $test_name.' text');
    #is (Texinfo::Convert::Texinfo::convert($result), $result_texis{$test_name}, $test_name.' text');
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
    plan tests => (1 + scalar(@$ran_tests) * $nr_comparisons);
  }
}

sub run_all_files($$;$$$)
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
      foreach my $file (@$test_cases) {
        my $test_case = basename ($file, '.texi');
        $ran_tests = [ $file ] if ($test_case eq $test_case_name);
      }
    }
  }
  foreach my $test_case (@$ran_tests) {
    $test->test($test_case);
  }

  if ($generate or $arg_complete) {
    plan tests => 1;
  } else {
     plan tests => (1 + scalar(@$ran_tests) * $nr_comparisons);
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
