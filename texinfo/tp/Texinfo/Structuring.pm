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

# for debugging.  Also for index entries sorting.
use Texinfo::Convert::Text;
# for error messages 
use Texinfo::Convert::Texinfo;

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
  nodes_tree
  number_floats
  sort_indices
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my $TOP_NODE_UP = '(dir)';

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

# Not used for now
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

# Not used for now
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

my %command_structuring_level = %Texinfo::Common::command_structuring_level;

my %appendix_commands;
my %unnumbered_commands;
foreach my $command (keys(%command_structuring_level)) {
  if ($command =~ /appendix/) {
    $appendix_commands{$command} = 1;
  } elsif ($command =~ /unnumbered/) {
    $unnumbered_commands{$command} = 1;
  }
}
$unnumbered_commands{'top'} = 1;
$unnumbered_commands{'centerchap'} = 1;
$unnumbered_commands{'part'} = 1;

my $min_level = $command_structuring_level{'top'};
my $max_level = $command_structuring_level{'subsubsection'};

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

  my $section_top;
  
  # holds the current number for all the levels.  It is not possible to use
  # something like the last child index, because of @unnumbered.
  my @command_numbers;
  foreach my $content (@{$root->{'contents'}}) {
    if ($content->{'cmdname'} and $content->{'cmdname'} ne 'node'
        and $content->{'cmdname'} ne 'bye') {
      if ($content->{'cmdname'} eq 'top') {
        if ($section_top) {
          $self->line_error($self->__("\@top already exists"), 
                                       $content->{'line_nr'});
        } else {
          $section_top = $content;
        }
      }
      my $level = $command_structuring_level{$content->{'cmdname'}};
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
            $self->line_error(sprintf($self->__("Upping the section level of \@%s which is too low"), 
                                       $content->{'cmdname'}), $content->{'line_nr'});
            $content->{'level'} = $previous_section->{'level'} + 1;
          }
          $previous_section->{'section_childs'} = [$content];
          $content->{'section_up'} = $previous_section;

          # if the up is unnumbered, the number information has to be kept,
          # to avoid reusing an already used number.
          if (!$unnumbered_commands{$previous_section->{'cmdname'}}) {
            $command_numbers[$content->{'level'}] = undef;
          } elsif (!$unnumbered_commands{$content->{'cmdname'}}) {
            $command_numbers[$content->{'level'}]++;
          }
        } else {
          my $up = $previous_section->{'section_up'};
          if ($previous_section->{'level'} != $level) {
            # means it is above the previous command, the up is to be found
            while ($up->{'section_up'} and $up->{'level'} >= $level) {
              $up = $up->{'section_up'};
            }
            if ($level <= $up->{'level'}) {
              $self->line_error(sprintf($self->__("Lowering the section level of \@%s appearing after a lower element"), 
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
        # construct the number, if not below an unnumbered
        if ($command_numbers[$number_top_level]) {
          $content->{'number'} = $command_numbers[$number_top_level];
          for (my $i = $number_top_level+1; $i <= $content->{'level'}; $i++) {
            $content->{'number'} .= ".$command_numbers[$i]";
            # If there is an unnumbered above, then no number is added.
            if (!$command_numbers[$i]) {
              delete $content->{'number'};
              last;
            }
          }
        }
      }
      $previous_section = $content;

      if ($self->{'DEBUG'}) {
        my $number = '';
        $number = $content->{'number'} if defined($content->{'number'});
        print STDERR "($content->{'level'}|$level|$command_structuring_level{$content->{'cmdname'}})[$command_numbers[$content->{'level'}]]($in_appendix) $number \@$content->{'cmdname'} ".Texinfo::Convert::Text::convert($content->{'args'}->[0])."\n";
      }
    }
  }
  $self->{'structuring'}->{'sectioning_root'} = $sec_root;
  return $sec_root;
}

# used to put a node name in error messages.
sub _node_extra_to_texi($)
{
  my $node = shift;
  my $result = '';
  if ($node->{'manual_content'}) {
    $result = '('.Texinfo::Convert::Texinfo::convert({'contents' 
                                     => $node->{'manual_content'}}) .')';
  }
  if ($node->{'node_content'}) {
    $result .= Texinfo::Convert::Texinfo::convert ({'contents' 
                                          => $node->{'node_content'}});
  }
  return $result;
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
                $self->line_error (sprintf($self->__("Menu reference to nonexistent node `%s'"), 
                  _node_extra_to_texi($menu_content->{'extra'}->{'menu_entry_node'})), 
                  $menu_content->{'line_nr'});
              }
            } else {
              # this may happen more than once for a given node if the node 
              # is in more than one menu.  Therefore all the menu up node 
              # are kept in $menu_node->{'menu_up_hash'}
              my $normalized_menu_node
                = $menu_content->{'extra'}->{'menu_entry_node'}->{'normalized'};
              my $menu_node =
                $self->{'labels'}->{$normalized_menu_node};
              $menu_node->{'menu_up'} = $node;
              $menu_node->{'menu_up_hash'}->{$node->{'extra'}->{'normalized'}} =1;
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
      $self->line_warn (sprintf($self->__("unreferenced node `%s'"), 
        _node_extra_to_texi($node->{'extra'})), $node->{'line_nr'});
    }
    my $automatic_directions = 
      (scalar(@{$node->{'extra'}->{'nodes_manuals'}}) == 1);

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
        if ($node->{'node_next'}) {
          if (!defined($node->{'menu_next'})) {
            $self->line_warn(sprintf($self->__("No node following `%s' in menu, but `%s' follows in sectioning"), 
             _node_extra_to_texi($node->{'extra'}), 
             _node_extra_to_texi($node->{'node_next'}->{'extra'})), 
             $node->{'line_nr'})
          } elsif ($node->{'menu_next'} ne $node->{'node_next'}) {
            $self->line_warn(sprintf($self->__("Node following `%s' in menu `%s' and in sectioning `%s' differ"), 
            _node_extra_to_texi($node->{'extra'}),
            _node_extra_to_texi($node->{'menu_next'}->{'extra'}), 
            _node_extra_to_texi($node->{'node_next'}->{'extra'})),
            $node->{'line_nr'})
          }
        }
      } else {
        # Special case for Top node.
        $node->{'node_up'} = {'extra' => Texinfo::Parser::_parse_node_manual(
                                {'contents' => [ {'text' => $TOP_NODE_UP} ]})};
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
        next if (!defined($node_direction));
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
              $self->line_error (sprintf($self->__("%s reference to nonexistent `%s'"),
                    $direction_texts{$direction},
                    _node_extra_to_texi($node_direction)), 
                    $node->{'line_nr'});
            }
          }
        }
      }
    }
    if ($node->{'node_up'} and (!$node->{'menu_up_hash'}
         or !$node->{'menu_up_hash'}->{$node->{'node_up'}->{'extra'}->{'normalized'}})) {
      if (!$node->{'node_up'}->{'extra'}->{'manual_content'}) {
      # up node has no menu entry
          $self->line_error(sprintf($self->__("Node `%s' lacks menu item for `%s' despite being its Up target"), 
             _node_extra_to_texi($node->{'node_up'}->{'extra'}), 
             _node_extra_to_texi($node->{'extra'})),
             $node->{'node_up'}->{'line_nr'});
      # This leads to an error when there is an external nodes as up, and 
      # not in Top node.
      } elsif ($node->{'menu_up'}) {
        $self->line_warn(sprintf($self->__("For `%s', up in menu `%s' and up `%s' don't match"), 
          _node_extra_to_texi($node->{'extra'}),
          _node_extra_to_texi($node->{'menu_up'}->{'extra'}), 
          _node_extra_to_texi($node->{'node_up'}->{'extra'})), $node->{'line_nr'});
      }
    }
  }
  $self->{'structuring'}->{'top_node'} = $top_node;
  return $top_node;
}

sub split_by_node($)
{
  my $root = shift;
  if (!$root->{'type'} or $root->{'type'} ne 'document_root'
      or !$root->{'contents'} or !@{$root->{'contents'}}) {
    return undef;
  }
  my $elements;
  my $current = { 'type' => 'element', 'extra' => {'no_node' => 1}};
  push @$elements, $current; 
  foreach my $content (@{$root->{'contents'}}) {
    if ($content->{'cmdname'} and $content->{'cmdname'} eq 'node') {
      if ($current->{'extra'}->{'no_node'}) {
        delete $current->{'extra'}->{'no_node'};
        $current->{'extra'}->{'node'} = $content;
      } else {
        $current = { 'type' => 'element', 'extra' => {'node' => $content}};
        push @$elements, $current;
      }
    }
    push @{$current->{'contents'}}, $content;
    $content->{'parent'} = $current;
  }
  return $elements;
}

sub split_by_section($)
{
  my $root = shift;
  if (!$root->{'type'} or $root->{'type'} ne 'document_root'
      or !$root->{'contents'} or !@{$root->{'contents'}}) {
    return undef;
  }
  my $elements;
  my $current = { 'type' => 'element', 'extra' => {'no_section' => 1}};
  push @$elements, $current; 
  foreach my $content (@{$root->{'contents'}}) {
    if ($content->{'cmdname'} and $content->{'cmdname'} eq 'node' 
         and $content->{'extra'}->{'associated_section'}) {
      if ($current->{'extra'}->{'no_section'}) {
        delete $current->{'extra'}->{'no_section'};
        $current->{'extra'}->{'section'} = $content->{'extra'}->{'associated_section'};
      } else {
        $current = { 'type' => 'element', 'extra' 
                => {'section' => $content->{'extra'}->{'associated_section'}}};
        push @$elements, $current;
      }
    } elsif ($content->{'cmdname'} and $content->{'cmdname'} ne 'node' 
                                   and $content->{'cmdname'} ne 'bye') {
      if ($current->{'extra'}->{'no_section'}) {
        delete $current->{'extra'}->{'no_section'};
        $current->{'extra'}->{'section'} = $content;
      } elsif ($current->{'extra'}->{'section'} ne $content) {
        $current = { 'type' => 'element', 'extra' => {'section' => $content}};
        push @$elements, $current;
      }
    }
    push @{$current->{'contents'}}, $content;
    $content->{'parent'} = $current;
  }
  return $elements;
}

sub _unsplit($)
{
  my $root = shift;
  if (!$root->{'type'} or $root->{'type'} ne 'document_root'
      or !$root->{'contents'} or !@{$root->{'contents'}}) {
    return $root;
  }
  foreach my $content (@{$root->{'contents'}}) {
    $content->{'parent'} = $root;
  }
  return $root;
}

sub number_floats($)
{
  my $floats = shift;
  return if (!defined($floats));
  foreach my $style (keys(%$floats)) {
    my %nr_in_chapter;
    my $float_index = 0;
    foreach my $float (@{$floats->{$style}}) {
      next if (!$float->{'extra'} 
               or !defined($float->{'extra'}->{'normalized'}));
      $float_index++;
      my $number;
      if ($float->{'float_section'}) {
        my $up = $float->{'float_section'};
        while ($up->{'section_up'} and $command_structuring_level{$up->{'cmdname'}} 
               and $command_structuring_level{$up->{'section_up'}->{'cmdname'}}) {
          $up = $up->{'section_up'};
        }
        if (!$unnumbered_commands{$up->{'cmdname'}}) {
          $nr_in_chapter{$up->{'number'}}++;
          $number = $up->{'number'} . '.' . $nr_in_chapter{$up->{'number'}};
        }
      }
      $number = $float_index if (!defined($number));
      $float->{'number'} = $number;
    }
  }
}

sub _sort_subroutine($$)
{
  my $key1 = shift;
  my $key2 = shift;
  my $a = uc($key1->{'key'});
  my $b = uc($key2->{'key'});
  my $res = ((($a =~ /^[[:alpha:]]/ and $b =~ /^[[:alpha:]]/) or
            ($a !~ /^[[:alpha:]]/ and $b !~ /^[[:alpha:]]/)) && $a cmp $b)
             || ($a =~ /^[[:alpha:]]/ && 1) || -1;
  return $res;
}

sub _do_index_keys($$)
{
  my $self = shift;
  my $index_entries = shift;
  my $options = {'sort_string' => 1};
  if ($self->{'ENABLE_ENCODING'} and $self->{'encoding'}) {
    $options->{'enabled_encoding'} = $self->{'encoding'};
  }
  foreach my $index_name (keys(%$index_entries)) {
    foreach my $entry (@{$index_entries->{$index_name}}) {
      $entry->{'key'} = Texinfo::Convert::Text::convert(
                              {'contents' => $entry->{'content'}},
                              $options);
    }
  }
}

sub sort_indices ($$)
{
  my $self = shift;
  my $index_entries = shift;
  my $sorted_index_entries;
  _do_index_keys($self, $index_entries);
  foreach my $index_name (keys(%$index_entries)) {
    @{$sorted_index_entries->{$index_name}} = 
        sort _sort_subroutine @{$index_entries->{$index_name}};
  }
  return $sorted_index_entries;
}

1;
