# DebugCount.pm: gather information on byes and lines count for debugging purposes
#
# Copyright 2011 Free Software Foundation, Inc.
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

use Texinfo::Convert::Plaintext;

package DebugTexinfo::DebugCount;
use vars qw(@ISA);
@ISA = qw(Texinfo::Convert::Plaintext);

sub _convert($$)
{
  my $self = shift;
  my $root = shift;
  
  $self->{'level'}++;
  $self->{'command_type_nr'}++;
  my $bytes_before = $self->{'count_context'}->[-1]->{'bytes'};
  my $number_before = "($self->{'count_context'}->[-1]->{'bytes'},$self->{'count_context'}->[-1]->{'lines'})";
  my $command_nr = '['.$self->{'command_type_nr'}.']';
  my $command_type = '';
  $command_type .= '@'.$root->{'cmdname'} if ($root->{'cmdname'});
  $command_type .= ":$root->{'type'}" if ($root->{'type'});
  $command_type .= ":text" if (defined($root->{'text'}));
  my $string_before = ' ' x $self->{'level'}. "$command_nr $number_before $command_type\n";
  push @{$self->{'debug_count_strings'}}, $string_before;
  
  my $text =
    Texinfo::Convert::Plaintext::_convert($self, $root);
  my $locations_string = '';
  if ($self->{'count_context'}->[-1]->{'locations'}) {
    my $location_string = '';
    foreach my $location (@{$self->{'count_context'}->[-1]->{'locations'}}) {
      $location_string .= "  l ";
      if (defined($location->{'lines'})) {
        $location_string .= " l $location->{'lines'}";
      }
      if (defined($location->{'bytes'})) {
        $location_string .= " b $location->{'bytes'}";
      }
      if (defined($self->{'debug_locations_strings'}->{$location})) {
        if ($self->{'debug_locations_strings'}->{$location} eq $location_string) {
          $location_string = '';
        }
      } else {
        $self->{'debug_locations_strings'}->{$location} = $location_string;
      }
    }
    $locations_string .= $location_string ."\n" if ($location_string);
  }
  #push @{$self->{'debug_count_strings'}}, ' ' x $self->{'level'}. "TEXT: $text|\n"
  #  if ($self->{'count_context'}->[-1]->{'bytes'} > $bytes_before);
  my $number_after = "($self->{'count_context'}->[-1]->{'bytes'},$self->{'count_context'}->[-1]->{'lines'})";
  my $string_after = ' ' x $self->{'level'}. "$command_nr $number_after\n";
  $string_after .= " locations $locations_string"
     if ($locations_string ne '');
  push @{$self->{'debug_count_strings'}}, $string_after;
  $self->{'level'}--;
  if ($self->{'level'} > 0) {
    return $text;
  } else {
    return "".join('',@{$self->{'debug_count_strings'}}).$text;
  }
}

1;
