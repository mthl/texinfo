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

sub _printindex($$)
{
  my $self = shift;
  my $printindex = shift;

  

  return '';
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
                          'contents' => ['text' => '(',
                             @{$node_direction->{'extra'}->{'manual_content'}},
                                          'text' => ')']}));
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
