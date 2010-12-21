# Info.pm: output tree as Info.
#
# Copyright 2010 Free Software Foundation, Inc.
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

package Texinfo::Convert::Info;

use 5.00405;
use strict;

use Texinfo::Convert::Plaintext;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Texinfo::Convert::Plaintext);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Covert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';


sub count_bytes($$) 
{
  my $self = shift;
  my $string = shift;

  if ($self->{'output_encoding'} ne 'us-ascii') {
    return length(Encode::encode($self->{'output_encoding'}, $string));
  } else {
    return length($string);
  }
}

sub update_counts ($$$$$$)
{
  my $self = shift;
  my $main_bytes_count = shift;
  my $main_lines_count = shift;
  my $main_locations = shift;
  my $counts = shift;
  my $locations = shift;
  if ($locations) {
    foreach my $line_location (@{$locations->{'lines'}}) {
      $line_location->{'lines_count'} += $$main_lines_count;
    }
    foreach my $byte_location (@{$locations->{'bytes'}}) {
      $byte_location->{'bytes_count'} += $$main_bytes_count;
    }
    push @{$main_locations->{'lines'}}, @{$locations->{'lines'}};
    push @{$main_locations->{'bytes'}}, @{$locations->{'bytes'}};
  }
  if ($counts) {
    $$main_bytes_count += $counts->{'bytes'};
    $$main_lines_count += $counts->{'lines'} if ($counts->{'lines'});
  }
}

sub _align_lines($$$)
{
  my $text = shift;
  my $max_column = shift;
  my $direction = shift;
  my $result = '';
  foreach my $line (split /^/, $text) {
    chomp($line);
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;
    my $line_width = Texinfo::Convert::Unicode::string_width($line);
    if ($line_width == 0) {
      $result .= "\n";
    } else {
      my $spaces_prepended;
      if ($line_width > $max_column) {
        $spaces_prepended = 0;
      } elsif ($direction eq 'center') {
        $spaces_prepended = (($max_column -1 - $line_width) /2);
      } else {
        $spaces_prepended = ($max_column -1 - $line_width);
      }
      $result .= ' ' x$spaces_prepended . $line ."\n";
    }
  }
  return $result;
}

#sub _flush_paragraph($$)
#{
#  my $self = shift;
#  my $text = shift;
#
#  my $index = -1;
#  $index--
#    while (!$flush_commands{$self->{'format_context'}->[$index]->{'cmdname'}});
#  # nothing to do in case of flushleft
#  if ($self->{'format_context'}->[$index]->{'cmdname'} eq 'flushleft') {
#    return $text;
#  }
#  return _align_lines($text, $self->{'format_context'}->[$index]->{'max'},
#                          'right');
#}

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  return '';
}


my $index_length_to_node = 41;

sub _printindex($$)
{
  my $self = shift;
  my $printindex = shift;

  my $index_name;

  if ($printindex->{'extra'} and $printindex->{'extra'}->{'misc_args'}
      and defined($printindex->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $printindex->{'extra'}->{'misc_args'}->[0];
  } else {
    return '';
  }

  # this is not redone for each index, only once
  if (!defined($self->{'index_entries'}) and $self->{'parser'}) {
    my ($index_names, $merged_indices, $index_entries)
       = $self->{'parser'}->indices_information();
    $self->{'index_entries'} = $self->Texinfo::Structuring::sort_indices($index_entries);
    $self->{'index_names'} = $index_names;
    $self->{'merged_indices'} = $merged_indices;
  }
  if (!$self->{'index_entries'} or !$self->{'index_entries'}->{$index_name}
      or ! @{$self->{'index_entries'}->{$index_name}}) {
    return '';
  }

  my $result = "\x{00}\x{08}[index\x{00}\x{08}]\n* Menu:\n\n";

  my $lines_count = 3;
  my $bytes_count = $self->count_bytes($result);

  # first determine the line numbers for the spacing of their formatting
  my %line_nrs;
  my $max_index_line_nr_string_length = 0;
  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    my $line_nr;
    if (defined ($self->{'index_entries_line_location'}->{$entry})) {
      $line_nr = $self->{'index_entries_line_location'}->{$entry}->{'lines_count'};
    }
    if (!defined($entry->{'node'})) {
      $line_nr = 0;
    } else {
      $line_nr = 3 if (defined($line_nr) and $line_nr < 3);
      $line_nr = 4 if (!defined($line_nr));
    }
    my $index_line_nr_string_length = 
      Texinfo::Convert::Unicode::string_width($line_nr);
    $max_index_line_nr_string_length = $index_line_nr_string_length 
     if ($max_index_line_nr_string_length < $index_line_nr_string_length);
    $line_nrs{$entry} = $line_nr;
  }

  # this is used to count entries that are the same
  my %entry_counts = ();

  # FIXME second maybe should be index_prefix of eeach entry?
  my $in_code = $self->{'index_names'}->{$index_name}->{$index_name};

  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    #my @keys = keys(%$entry);
    #print STDERR "$index_name $entry: @keys\n";
    my $entry_tree = {'contents' => $entry->{'content'}};
    $entry_tree->{'type'} = 'code' if ($in_code);
    my $entry_text = '';
    $self->advance_count_text(\$entry_text, \$bytes_count, undef,
           undef, 0, $self->convert_line($entry_tree, {'indent' => 0}));

    my $entry_nr = '';
    if (!defined($entry_counts{$entry_text})) {
      $entry_counts{$entry_text} = 0;
    } else {
      $entry_counts{$entry_text}++;
      $entry_nr = ' <'.$entry_counts{$entry_text}.'>';
    }
    my $entry_line = "* $entry_text${entry_nr}: ";
    $bytes_count += $self->count_bytes("* ${entry_nr}: ");
    
    my $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    if ($line_width < $index_length_to_node) {
      my $spaces = ' ' x ($index_length_to_node - $line_width);
      $entry_line .= $spaces;
      $bytes_count += $self->count_bytes($spaces);
    }
    my $node_text;
    if (!defined($entry->{'node'})) {
      $node_text = $self->gdt('(outside of any node)');
      $bytes_count += $self->count_bytes($node_text);
      $entry_line .= $node_text;
    } else {
      $self->advance_count_text(\$entry_line, \$bytes_count, undef,
           undef, 0, $self->convert_line({'type' => 'code', 
                'contents' => $entry->{'node'}->{'extra'}->{'node_content'}}));
    }
    $entry_line .= '.';
    $bytes_count += $self->count_bytes('.');

    $result .= $entry_line;

    my $line_nr = $line_nrs{$entry};
    my $line_nr_spaces = sprintf("%${max_index_line_nr_string_length}d", $line_nr);
    my $line_part = "(line ${line_nr_spaces})";
    $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    my $line_part_width = Texinfo::Convert::Unicode::string_width($line_part);
    if ($line_width + $line_part_width +1 > $self->{'fillcolumn'}) {
      $line_part = "\n" . ' ' x ($self->{'fillcolumn'} - $line_part_width) 
           . "$line_part\n";
      $lines_count++;
    } else { 
      $line_part 
        = ' ' x ($self->{'fillcolumn'} - $line_part_width - $line_width)
           . "$line_part\n";
    }
    $lines_count++;
    $result .= $line_part;
    $bytes_count += $self->count_bytes($line_part);
  }

  $result .= "\n"; 
  $lines_count++;
  $bytes_count += $self->count_bytes("\n");
  
  return ($result, {'lines' => $lines_count, 'bytes' => $bytes_count});
}

my @directions = ('Next', 'Prev', 'Up');
sub _node($$)
{
  my $self = shift;
  my $node = shift;

  my $bytes_count = 0;

  # FIXME $outfile
  my $result = "\x{1F}\nFile: outfile,  Node:  ";
  $bytes_count += $self->count_bytes($result);
  $self->advance_count_text(\$result, \$bytes_count, undef,
               undef, 0, $self->convert_line({'type' => 'code', 
                           'contents' => $node->{'extra'}->{'node_content'}}));
  foreach my $direction(@directions) {
    if ($node->{'node_'.lc($direction)}) {
      my $node_direction = $node->{'node_'.lc($direction)};
      my $text = ",  $direction: ";
      $bytes_count += $self->count_bytes($text);
      $result .= $text;
      if ($node_direction->{'extra'}->{'manual_content'}) {
        $self->advance_count_text(\$result, \$bytes_count, undef,
                undef, 0, $self->convert_line({'type' => 'code',
                          'contents' => [{'text' => '('},
                             @{$node_direction->{'extra'}->{'manual_content'}},
                                          {'text' => ')'}]}));
      }
      if ($node_direction->{'extra'}->{'node_content'}) {
        $self->advance_count_text(\$result, \$bytes_count, undef,
               undef, 0, $self->convert_line({'type' => 'code', 
                 'contents' => $node_direction->{'extra'}->{'node_content'}}));
      }
    }
  }
  $result .="\n\n";
  $bytes_count += $self->count_bytes("\n\n");

  return ($result, {'bytes' => $bytes_count, 'lines' => 3});
}

sub _anchor($$)
{
  my $self = shift;
  my $anchor = shift;
  return '';
}

1;
