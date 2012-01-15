#! /usr/bin/perl -w

# texi_sort_elements_count: sort elements based on words or line counts.
#
# Copyright 2012 Free Software Foundation, Inc.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# Original author: Patrice Dumas <pertusus@free.fr>


use strict;

use Getopt::Long qw(GetOptions);

Getopt::Long::Configure("gnu_getopt");

BEGIN
{
  my $texinfolibdir = '@datadir@/@PACKAGE@';
  unshift @INC, ($texinfolibdir)
    if ($texinfolibdir ne ''
        and $texinfolibdir ne '@' .'datadir@/@PACKAGE'.'@');
}

use Texinfo::Parser;
use Texinfo::Structuring;
use Texinfo::Convert::TextContent;

my $configured_version = '@PACKAGE_VERSION@';
$configured_version = $Texinfo::Parser::VERSION
  if ($configured_version eq '@' . 'PACKAGE_VERSION@');

my $real_command_name = $0;
$real_command_name =~ s/.*\///;
$real_command_name =~ s/\.pl$//;



my $force = 0;
my $use_sections = 0;
my $count_words = 0;
my $no_warn = 0;

# placeholder for future i18n.
sub __($)
{
  return $_[0];
}

my $result_options = Getopt::Long::GetOptions (
 'help|h' => sub { print_help(); exit 0; },
 'version|V' => sub {print "$real_command_name $configured_version\n\n";
                     printf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), '2012';
      exit 0;},
  'force' => \$force,
  'use-sections!' => \$use_sections,
  'count-words!' => \$count_words,
  'no-warn' => \$no_warn,
);

exit 1 if (!$result_options);

my @input_files = @ARGV;
# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);

die sprintf(__("%s: missing file argument.\n"), $real_command_name)
   .sprintf(__("Try `%s --help' for more information.\n"), $real_command_name)
     unless (scalar(@input_files) >= 1);


if (scalar(@input_files) > 1) {
  warn sprintf(__("%s: superfluous file arguments.\n"), $real_command_name);
}

my $file = shift @input_files;

sub print_help()
{
  print STDERR sprintf(__("Usage: %s [OPTION]... TEXINFO-FILE...

Dump out a list of elements sorted by the number of lines (or words) 
they contain after removal of \@-commands.

Options:
     --count-words    count words instead of lines.
     --force          keep on even if the Texinfo file parsing failed.
     --help           display this help and exit.
     --no-warn        suppress warnings (but not errors).
     --use-sections   use sections as elements instead of nodes.
     --version        display version information and exit.
"), $real_command_name);
}

if (!defined($file)) {
  print_help();
  exit 1;
}

sub _exit($)
{
  my $error_count = shift;
  exit (1) if ($error_count and !$force);
}

sub handle_errors($$)
{
  my $self = shift;
  my $error_count = shift;
  my ($errors, $new_error_count) = $self->errors();
  $error_count += $new_error_count if ($new_error_count);
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'} if ($error_message->{'type'} eq 'error'
                                           or !$no_warn);
  }

  _exit($error_count);
  return $error_count;
}

my $error_count = 0;
my $parser = Texinfo::Parser::parser();
my $tree = $parser->parse_texi_file($file);

if (!defined($tree)) {
  handle_errors($parser, $error_count);
  exit (1);
}

my $converter_options = {};
$converter_options->{'parser'} = $parser;
my $converter = Texinfo::Convert::TextContent->converter($converter_options);
my $elements;
if ($use_sections) {
  $elements = Texinfo::Structuring::split_by_section($tree);
} else {
  $elements = Texinfo::Structuring::split_by_node($tree);
}

if (!$elements) {
  @$elements = [ $tree ];
} elsif (scalar(@$elements) >= 1 
         and (!$elements->[0]->{'extra'}->{'node'}
              and !$elements->[0]->{'extra'}->{'section'})) {
  shift @$elements;
}

my $max_count = 0;
my @name_counts_array;
foreach my $element (@$elements) {
  my $name = 'UNNAMED element';
  if ($element->{'extra'}->{'node'} or $element->{'extra'}->{'section'}) {
    my $command = $element->{'extra'}->{'element_command'};
    if ($command->{'cmdname'} eq 'node') {
      $name = $converter->convert_tree({'contents' 
        => $command->{'extra'}->{'nodes_manuals'}->[0]->{'node_content'}});
    } else {
      $name = "\@$command->{'cmdname'} ".$converter->convert_tree($command->{'args'}->[0]);
    }
  }
  chomp($name);
  my $count;
  my $element_content = $converter->convert($element);
  if ($count_words) {
    my @res = split /\W+/, $element_content;
    $count = scalar(@res);
  } else {
    my @res = split /^/, $element_content;
    $count = scalar(@res);
  }
  push @name_counts_array, [$count, $name];
  if ($count > $max_count) {
    $max_count = $count;
  }
}

my @sorted_name_counts_array = sort {$a->[0] <=> $b->[0]} @name_counts_array;
@sorted_name_counts_array = reverse(@sorted_name_counts_array);

my $max_length = length($max_count);
foreach my $sorted_count (@sorted_name_counts_array) {
  print STDOUT sprintf("%${max_length}d  $sorted_count->[1]\n", $sorted_count->[0]);
}

1;
