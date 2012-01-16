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
# to determine the path separator
use Config;

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

# determine the path separators
my $path_separator = $Config{'path_sep'};
$path_separator = ':' if (!defined($path_separator));
my $quoted_path_separator = quotemeta($path_separator);

my $force = 0;
my $use_sections = 0;
my $count_words = 0;
my $no_warn = 0;

# placeholder for future i18n.
sub __($)
{
  return $_[0];
}

my $format = 'info';
# this is the format associated with the output format, which is replaced
# when the output format changes.  It may also be removed if there is the
# corresponding --no-ifformat.
#my $default_expanded_format = [ $format ];
my @include_dirs = ();
my @prepend_dirs = ();

my $parser_default_options = {
                              #'expanded_formats' => [], 
                              'expanded_formats' => [ $format ], 
                              'values' => {},
                              #'gettext' => \&__
                              };

sub set_expansion($$) {
  my $region = shift;
  my $set = shift;
  $set = 1 if (!defined($set));
  if ($set) {
    push @{$parser_default_options->{'expanded_formats'}}, $region
      unless (grep {$_ eq $region} @{$parser_default_options->{'expanded_formats'}});
  } else {
    @{$parser_default_options->{'expanded_formats'}} = 
      grep {$_ ne $region} @{$parser_default_options->{'expanded_formats'}};
#    @{$default_expanded_format} 
#       = grep {$_ ne $region} @{$default_expanded_format};
  }
}

my $result_options = Getopt::Long::GetOptions (
 'help|h' => sub { print help(); exit 0; },
 'version|V' => sub {print "$real_command_name $configured_version\n\n";
                     printf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), '2012';
      exit 0;},
  'force' => \$force,
  'ifhtml!' => sub { set_expansion('html', $_[1]); },
  'ifinfo!' => sub { set_expansion('info', $_[1]); },
  'ifxml!' => sub { set_expansion('xml', $_[1]); },
  'ifdocbook!' => sub { set_expansion('docbook', $_[1]); },
  'iftex!' => sub { set_expansion('tex', $_[1]); },
  'ifplaintext!' => sub { set_expansion('plaintext', $_[1]); },
  'use-sections!' => \$use_sections,
  'count-words!' => \$count_words,
  'no-warn' => \$no_warn,
  'D=s' => sub {$parser_default_options->{'values'}->{$_[1]} = 1;},
  'U=s' => sub {delete $parser_default_options->{'values'}->{$_[1]};},
  'I=s' => sub {
                push @include_dirs, split(/$quoted_path_separator/, $_[1]); },
  'P=s' => sub { unshift @prepend_dirs, split(/$quoted_path_separator/, $_[1]); },
 'number-sections!' => sub { set_from_cmdline('NUMBER_SECTIONS', $_[1]); },
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

my $input_file_name = shift @input_files;

sub help()
{
  my $help =
    sprintf(__("Usage: %s [OPTION]... TEXINFO-FILE...\n"), $real_command_name)
   ."\n".
    __("Dump out a list of elements sorted by the number of lines (or words) 
they contain after removal of \@-commands.\n")
."\n";

  $help .= __("General Options:
  --count-words    count words instead of lines.
  --force          keep on even if the Texinfo file parsing failed.
  --help           display this help and exit.
  --no-warn        suppress warnings (but not errors).
  --use-sections   use sections as elements instead of nodes.
  --version        display version information and exit.\n")
."\n";
  $help .= __("Input file options:
  -D VAR                        define the variable VAR, as with \@set.
  -I DIR                        append DIR to the \@include search path.
  -P DIR                        prepend DIR to the \@include search path.
  -U VAR                        undefine the variable VAR, as with \@clear.\n")
."\n";
  $help .= __("Conditional processing in input:
  --ifdocbook       process \@ifdocbook and \@docbook.
  --ifhtml          process \@ifhtml and \@html.
  --ifinfo          process \@ifinfo.
  --ifplaintext     process \@ifplaintext.
  --iftex           process \@iftex and \@tex.
  --ifxml           process \@ifxml and \@xml.
  --no-ifdocbook    do not process \@ifdocbook and \@docbook text.
  --no-ifhtml       do not process \@ifhtml and \@html text.
  --no-ifinfo       do not process \@ifinfo text.
  --no-ifplaintext  do not process \@ifplaintext text.
  --no-iftex        do not process \@iftex and \@tex text.
  --no-ifxml        do not process \@ifxml and \@xml text.

  Also, for the --no-ifFORMAT options, do process \@ifnotFORMAT text.\n");
  return $help;
  
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

my $input_directory = '.';
if ($input_file_name =~ /(.*\/)/) {
  $input_directory = $1;
}

my $parser_options = { %$parser_default_options };
$parser_options->{'include_directories'} = [@include_dirs];
my @prependended_include_directories = ('.');
push @prependended_include_directories, $input_directory
    if ($input_directory ne '.');
unshift @{$parser_options->{'include_directories'}},
   @prependended_include_directories;
unshift @{$parser_options->{'include_directories'}}, @prepend_dirs;

my $error_count = 0;
my $parser = Texinfo::Parser::parser($parser_options);
my $tree = $parser->parse_texi_file($input_file_name);

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
  @$elements = ($tree);
} elsif (scalar(@$elements) >= 1 
         and (!$elements->[0]->{'extra'}->{'node'}
              and !$elements->[0]->{'extra'}->{'section'})) {
  shift @$elements;
}

my $max_count = 0;
my @name_counts_array;
foreach my $element (@$elements) {
  my $name = 'UNNAMED element';
  if ($element->{'extra'} 
      and ($element->{'extra'}->{'node'} or $element->{'extra'}->{'section'})) {
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
