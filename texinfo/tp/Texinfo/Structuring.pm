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

use Texinfo::Convert::Text;
use Texinfo::Parser qw(tree_to_texi);

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
  sectioning_structure  
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

# todo:
# complete directions for nodes with automatic sectioning
#     automatic sectioning: scalar(@{$node->{'extra'}->{'nodes_manuals'} != 1)
# 

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

my %sec2level = (
              'top', 0,
              'chapter', 1,
              'unnumbered', 1,
              'chapheading', 1,
              'appendix', 1,
              'section', 2,
              'unnumberedsec', 2,
              'heading', 2,
              'appendixsec', 2,
              'subsection', 3,
              'unnumberedsubsec', 3,
              'subheading', 3,
              'appendixsubsec', 3,
              'subsubsection', 4,
              'unnumberedsubsubsec', 4,
              'subsubheading', 4,
              'appendixsubsubsec', 4,
         );

# out of the main hierarchy
$sec2level{'part'} = 0;
# this are synonyms
$sec2level{'appendixsection'} = 2;
# sec2level{'majorheading'} is also 1 and not 0
$sec2level{'majorheading'} = 1;
$sec2level{'chapheading'} = 1;
$sec2level{'centerchap'} = 1;

my %appendix_commands;
my %unnumbered_commands;
foreach my $command (keys(%sec2level)) {
  if ($command =~ /appendix/) {
    $appendix_commands{$command} = 1;
  } elsif ($command =~ /unnumbered/) {
    $unnumbered_commands{$command} = 1;
  }
}
$unnumbered_commands{'top'} = 1;
$unnumbered_commands{'centerchap'} = 1;
$unnumbered_commands{'part'} = 1;

my $min_level = $sec2level{'top'};
my $max_level = $sec2level{'subsubsection'};

sub sectioning_structure($$)
{
  my $self = shift;
  my $root = shift;
  if (!$root->{'type'} or $root->{'type'} ne 'document_root'
      or !$root->{'contents'}) {
    return undef;
  }

  my $sec_root = {};
  my $previous_section;

  my $in_appendix = 0;
  # lowest level with a number.  This is the lowest level above 0.
  my $number_top_level;
  
  # holds the current number for all the levels.  It is not possible to use
  # something like the last child index, because of @unnumber.
  my @command_numbers;
  foreach my $content (@{$root->{'contents'}}) {
    if ($content->{'cmdname'} and $content->{'cmdname'} ne 'node'
        and $content->{'cmdname'} ne 'bye') {
      my $level = $sec2level{$content->{'cmdname'}};
      # correct level according to raise/lowersections
      if ($content->{'extra'} and $content->{'extra'}->{'sections_level'}) {
        $level -= $content->{'extra'}->{'sections_level'};
        if ($level < $min_level) {
          $level = $min_level;
        } elsif ($level > $max_level) {
          $level = $max_level;
        }
      }
      $content->{'level'} = $level;

      if ($previous_section) {
        # new command is below
        if ($previous_section->{'level'} < $level) {
          if ($level - $previous_section->{'level'} > 1) {
            $self->_line_error(sprintf($self->__("Upping the section level of \@%s which is too low"), 
                                       $content->{'cmdname'}), $content->{'line_nr'});
            $content->{'level'} = $previous_section->{'level'} + 1;
          }
          $previous_section->{'section_childs'} = [$content];
          $content->{'section_up'} = $previous_section;
          $command_numbers[$content->{'level'}] = undef;
        } else {
          my $up = $previous_section->{'section_up'};
          if ($previous_section->{'level'} != $level) {
            # means it is above the previous command, the up is to be found
            while ($up->{'section_up'} and $up->{'level'} >= $level) {
              $up = $up->{'section_up'};
            }
            if ($level <= $up->{'level'}) {
              $self->_line_error(sprintf($self->__("Lowering the section level of \@%s appearing after a lower element"), 
                                       $content->{'cmdname'}), $content->{'line_nr'});
              $content->{'level'} = $up->{'level'} + 1;
            }
          }
          push @{$up->{'section_childs'}}, $content;
          $content->{'section_up'} = $up;
          $content->{'section_prev'} = $up->{'section_childs'}->[-2];
          $content->{'section_prev'}->{'section_next'} = $content;
          if (!$unnumbered_commands{$content->{'cmdname'}}) {
            $command_numbers[$content->{'level'}]++;
          }
          
        }
      } else { # first section determines the level of the root.  It is 
               # typically -1 when there is a @top.
        $content->{'section_up'} = $sec_root;
        $sec_root->{'level'} = $level - 1;
        $sec_root->{'section_childs'} = [$content];
        $number_top_level = $level;
        $number_top_level++ if (!$number_top_level);
      }
      if (!defined($command_numbers[$content->{'level'}])) {
        if ($unnumbered_commands{$content->{'cmdname'}}) {
          $command_numbers[$content->{'level'}] = 0;
        } else {
          $command_numbers[$content->{'level'}] = 1;
        }
      }
      if ($appendix_commands{$content->{'cmdname'}} and !$in_appendix) {
        $in_appendix = 1;
        $command_numbers[$content->{'level'}] = 'A';
      }
      if (!$unnumbered_commands{$content->{'cmdname'}}) {
        # construct the number
        $content->{'number'} = $command_numbers[$number_top_level];
        for (my $i = $number_top_level+1; $i <= $content->{'level'}; $i++) {
          $content->{'number'} .= ".$command_numbers[$i]";
        }
      }
      $previous_section = $content;

      #my $number = '';
      #$number = $content->{'number'} if defined($content->{'number'});
      #print STDERR "($content->{'level'}|$level|$sec2level{$content->{'cmdname'}})[$command_numbers[$content->{'level'}]]($in_appendix) $number \@$content->{'cmdname'} ".Texinfo::Convert::Text::convert($content->{'args'}->[0])."\n";
    }
  }
  return $sec_root;
}

my @node_directions = ('next', 'prev', 'up');
# FIXME i18n?
my %direction_texts = (
 'prev' => 'Prev',
 'next' => 'Next',
 'up' => 'Up'
);

# first go through all the menu and set menu_up, menu_next, menu_prev
# and warn for unknown nodes.
# then go through all the nodes and set directions
sub nodes_tree ($)
{
  my $self = shift;
  return undef unless ($self->{'nodes'} and @{$self->{'nodes'}});
  my $top_node;
  foreach my $node (@{$self->{'nodes'}}) {
    $top_node = $node if ($node->{'extra'}->{'normalized'} eq 'Top');
    if ($node->{'menus'}) {
      foreach my $menu (@{$node->{'menus'}}) {
        my $previous_node;
        foreach my $menu_content (@{$menu->{'contents'}}) {
          if ($menu_content->{'extra'}
             and $menu_content->{'extra'}->{'menu_entry_node'}
             and !$menu_content->{'extra'}->{'menu_entry_node'}->{'manual_content'}) {
            if (!$self->{'labels'}->{$menu_content->{'extra'}->{'menu_entry_node'}->{'normalized'}}) {
              if (!$self->{'novalidate'}) {
                $self->_line_error (sprintf($self->__("Menu reference to nonexistent node `%s'"), 
                  tree_to_texi({ 'contents' => $menu_content->{'extra'}->{'menu_entry_node'}->{'node_content'} })), 
                  $menu_content->{'line_nr'});
              }
            } else {
              my $menu_node =
                $self->{'labels'}->{$menu_content->{'extra'}->{'menu_entry_node'}->{'normalized'}};
              $menu_node->{'menu_up'} = $node;
              if ($previous_node) {
                $menu_node->{'menu_prev'} = $previous_node;
                $previous_node->{'menu_next'} = $menu_node;
              } else {
                $node->{'menu_child'} = $menu_node;
              }
              $previous_node = $menu_node;
            }
          }
        } # end menu
      }
    }
  }
  $top_node = $self->{'nodes'}->[0] if (!$top_node);
  foreach my $node (@{$self->{'nodes'}}) {
    # warn if node is not top node and doesn't appear in menu
    if ($node ne $top_node and !$node->{'menu_up'}) {
      $self->_line_warn (sprintf($self->__("unreferenced node `%s'"), 
        tree_to_texi({ 'contents' => $node->{'extra'}->{'node_content'}})), 
                       $node->{'line_nr'});
    }
    my $automatic_directions = 
      (scalar(@{$node->{'extra'}->{'nodes_manuals'}}) != 1);

    if ($automatic_directions) {
      if ($node->{'extra'}->{'normalized'} ne 'Top') {
        foreach my $direction (@node_directions) {
          next if ($node->{'node_'.$direction});
          if ($node->{'associated_section'}) {
            my $section = $node->{'associated_section'};
            if ($section->{'section_'.$direction}
               and $section->{'section_'.$direction}->{'associated_node'}) {
              $node->{'node_'.$direction} 
                = $section->{'section_'.$direction}->{'associated_node'};
            }
          } elsif ($node->{'menu_'.$direction}) {
            $node->{'node_'.$direction} = $node->{'menu_'.$direction};
          }
        }
      } else {
        # Special case for Top node.
        $node->{'node_up'} = Texinfo::Parser::_parse_node_manual(
                                {'contents' => [ {'text' => '(dir)'} ]});
        if ($node->{'menu_child'}) {
          $node->{'node_next'} = $node->{'menu_child'};
          $node->{'menu_child'}->{'node_prev'} = $node;
        }
      }
    } else {
      my @directions = @{$node->{'extra'}->{'nodes_manuals'}};
      shift @directions;
      foreach my $direction (@node_directions) {
        my $node_direction = shift @directions;
        next if ($node->{'node_'.$direction} or !defined($node_direction));
        # external node
        if ($node_direction->{'manual_content'}) {
          $node->{'node_'.$direction} = { 'extra' => $node_direction };
        } else {
          if ($self->{'labels'}->{$node_direction->{'normalized'}}) {
            $node->{'node_'.$direction} 
              = $self->{'labels'}->{$node_direction->{'normalized'}};
          } else {
            if ($self->{'novalidate'}) {
              $node->{'node_'.$direction} = { 'extra' => $node_direction };
            } else {
              $self->_line_error (sprintf($self->__("%s reference to nonexistent `%s'"),
                    $direction_texts{$direction}, 
                    tree_to_texi({'contents' => $node_direction->{'node_content'}})), 
                    $node->{'line_nr'});
            }
          }
        }
      }
    }
  }
  return $top_node;
}

1;
