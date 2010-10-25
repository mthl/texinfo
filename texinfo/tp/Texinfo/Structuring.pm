# Structuring.pm: extract informations about a document structure based on the 
#                 document tree.
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
# Parts (also from Patrice Dumas) come from texi2html.pl.

package Texinfo::Structuring;

use 5.00405;
use strict;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Structuring ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my %types_to_enter;
foreach my $type_to_enter ('brace_command_arg', 'misc_line_arg',
    'paragraph') {
  $types_to_enter{$type_to_enter} = 1;
}

# anchor may appear in @center? @item/x?
# going in node, sectioning 
# not going in: pagesizes listoffloats shorttitle shorttitlepage 
#               settitle author subtitle title
# index entries
# footnote? section node
# float printindex contents shortcontents
# anchor

sub _next_content($)
{
  my $current = shift;
  if ($current->{'contents'} and scalar(@{$current->{'contents'}})) {
    $current = $current->{'contents'}->[0];
  } elsif ($current->{'args'} and @{$current->{'args'}}
           and (!defined($current->{'args'}->[0]->{'type'})
               or ($current->{'args'}->[0]->{'type'} 
                  and $types_to_enter{$current->{'args'}->[0]->{'type'}}
                  and !($current->{'extra'} 
                        and $current->{'extra'}->{'misc_args'}))
               or $current->{'type'} and $current->{'type'} eq 'menu_entry')) {
    $current = $current->{'args'}->[0];
  } elsif ($current->{'next'}) {
    $current = $current->{'next'};
  } else {
    while ($current->{'parent'} and !$current->{'parent'}->{'next'}) {
      $current = $current->{'parent'};
    }
    if ($current->{'parent'} and $current->{'parent'}->{'next'}) {
      $current = $current->{'parent'}->{'next'}
    } else {
      $current = undef;
    }
  }
  return $current;
}

# For debugging
sub _print_current($)
{
  my $current = shift;
  my $type = '';
  my $cmd = '';
  my $parent_string = '';
  my $text = '';
  $type = "($current->{'type'})" if (defined($current->{'type'}));
  $cmd = "\@$current->{'cmdname'}" if (defined($current->{'cmdname'}));
  $text = "[text: $current->{'text'}]" if (defined($current->{'text'}));
  my $args = '';
  my $contents = '';
  $args = "args(".scalar(@{$current->{'args'}}).')' if $current->{'args'};
  $contents = "contents(".scalar(@{$current->{'contents'}}).')'
    if $current->{'contents'};
  if ("$cmd$type" ne '') {
    return "$cmd$type : $text $args $contents\n";
  } else {
    return "$text $args $contents\n";
  }
}

# the tree is modified: 'next' pointers are added.
sub _collect_structure($)
{
  my $current = shift;

  while ($current) {
    if ($current->{'contents'} and scalar(@{$current->{'contents'}})) {
      for (my $i = 0; $i < scalar(@{$current->{'contents'}}) -1; $i++) {
        $current->{'contents'}->[$i]->{'next'} = $current->{'contents'}->[$i+1];
      }
    }
    if ($current->{'args'} and scalar(@{$current->{'args'}}) > 1
        and !($current->{'extra'} 
              and $current->{'extra'}->{'misc_args'})) {
      for (my $i = 0; $i < scalar(@{$current->{'args'}}) -1; $i++) {
        $current->{'args'}->[$i]->{'next'} = $current->{'args'}->[$i+1];
      }
    }
    print STDERR ""._print_current($current);
    $current = _next_content($current);
  }
}

sub sectioning_structure($)
{
  my $root = shift;
  if (!$root->{'type'} or $root->{'type'} ne 'document_root'
      or !$root->{'contents'}) {
    return undef;
  }
  foreach my $content (@{$root->{'contents'}}) {
    if ($content->{'cmdname'} and $content->{'cmdname'} ne 'node'
        and $content->{'cmdname'} ne 'bye') {
      my $level = 0;
      $level = $content->{'extra'}->{'sections_level'}
        if ($content->{'extra'} and $content->{'extra'}->{'sections_level'});

      print STDERR "$level $content->{'cmdname'}\n";
    }
  }
}

1;
