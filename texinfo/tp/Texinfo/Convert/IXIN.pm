# IXIN.pm: output tree as IXIN.
#
# Copyright 2013 Free Software Foundation, Inc.
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
#
# This module implements abstract functions that output the IXIN format
# using lower level formatting funtions, here adapted to lisp like 
# output.  For other output, the output specific functions should be
# redefined.  This module is not enough to output IXIN format, a module
# inheriting both from a converter module and this module is required.

package Texinfo::Convert::IXIN;

use 5.00405;
use strict;

use Texinfo::Convert::TexinfoSXML;
use Texinfo::Common;

use Carp qw(cluck);

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Convert::Converter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Convert::IXIN ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  output_ixin
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '5.0';

my $ixin_version = 1;

sub _ixin_version($)
{
  my $self = shift;
  return $ixin_version;
}

my %additional_setting_commands;
# FIXME pagesizes is line
foreach my $command ('pagesizes', 'everyheading', 'everyfooting', 
                     'evenheading', 'evenfooting', 'oddheading', 'oddfooting',
                     'documentencoding', 'documentlanguage', 'clickstyle') {
  $additional_setting_commands{$command} = 1;
}
  

# output specific
sub ixin_header($)
{
  my $self = shift;
  my $header = 'ixin '.$self->_ixin_version().';';
  if ($self->get_conf('OUTPUT_ENCODING_NAME')) {
    $header .= ' -*- coding: '. $self->get_conf('OUTPUT_ENCODING_NAME') .'-*-;';
  }
  $header .= "\n";
}

my %attribute_string_names = (
  'nodeentry' => {'name' => 1},
  'nodelabel' => {'name' => 1},
  'filename' => {'name' => 1},
  'settingvalue' => {'value' => 1},
  'nodetweakvalue' => {'value' => 1},
);

sub _ixin_attributes($$$)
{
  my $self = shift;
  my $name = shift;
  my $attributes = shift;
  my $result = '';
  if ($attributes) {
    for (my $i = 0; $i < scalar(@$attributes); $i += 2) {
      if ($attribute_string_names{$name} 
          and $attribute_string_names{$name}->{$attributes->[$i]}) {
        $result .= '"'
          .Texinfo::Convert::TexinfoSXML->protect_text($attributes->[$i+1]).'"';
      } else {
        $result .= $attributes->[$i+1];
      }
      $result .= ' ';
    }
  }
  return $result;
}

sub ixin_open_element($$;$)
{
  my $self = shift;
  my $name = shift;
  my $attributes = shift;
  my $result = '(';
  $result .= $self->_ixin_attributes($name, $attributes);
  return $result;
}

sub ixin_list_element($$$)
{
  my $self = shift;
  my $name = shift;
  my $attributes = shift;
  my $result = $self->_ixin_attributes($name, $attributes);
  $result =~ s/ $//;
  return $result;
}

sub ixin_close_element($$)
{
  my $self = shift;
  my $name = shift;
  return ')';
  #return "|$name)";
}

sub ixin_element($$;$)
{
  my $self = shift;
  my $name = shift;
  my $attributes = shift;
  my $opening = $self->ixin_open_element($name, $attributes);
  $opening =~ s/ $//;
  return $opening . $self->ixin_close_element($name);
}

sub ixin_symbol_element($$$)
{
  my $self = shift;
  my $name = shift;
  my $string = shift;
  return $string;
}

sub ixin_none_element($$)
{
  my $self = shift;
  my $name = shift;
  return ' - ';
}


# end output specific subs

# FIXME this is rather non specific. Move to Converter?
sub _get_element($$);
sub _get_element($$)
{
  my $self = shift;
  my $current = shift;

  my ($element, $root_command);
  while (1) {
    #print STDERR Texinfo::Common::_print_current($current);
    if ($current->{'type'}) {
      if ($current->{'type'} eq 'element') {
        return ($current, $root_command);
      }
    }
    if ($current->{'cmdname'}) {
      if ($Texinfo::Common::root_commands{$current->{'cmdname'}}) {
        $root_command = $current;
        return ($element, $root_command) if defined($element);
      }
    }
    if ($current->{'parent'}) {
      $current = $current->{'parent'};
    } else {
      return ($element, $root_command);
    }
  }
}

sub _count_bytes($$) 
{
  my $self = shift;
  my $string = shift;

  return Texinfo::Common::count_bytes($self, $string);
}

sub _associated_node_id($$$)
{
  my $self = shift;
  my $command = shift;
  my $node_label_number = shift;

  my ($element, $root_command) = $self->_get_element($command);
  my $associated_node_id;
  if (defined($root_command) 
      and defined($root_command->{'extra'}->{'normalized'})) {
    $associated_node_id 
      = $node_label_number->{$root_command->{'extra'}->{'normalized'}};
  } else {
    $associated_node_id = -1;
  }
  return $associated_node_id;
}

my @node_directions = ('Next', 'Prev', 'Up');

sub output_ixin($$)
{
  my $self = shift;
  my $root = shift;

  $self->_set_outfile();
  return undef unless $self->_create_destination_directory();

  my $fh;
  if (! $self->{'output_file'} eq '') {
    $fh = $self->Texinfo::Common::open_out($self->{'output_file'});
    if (!$fh) {
      $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $self->{'output_file'}, $!));
      return undef;
    }
  }

  $self->_set_global_multiple_commands(-1);
  # we ignore everything before the first node
  $self->_set_ignored_type('text_root');

  my $result = $self->ixin_header();

  $result .= $self->ixin_open_element('meta');
  $result .= $self->ixin_open_element('xid');

  my $output_file = $self->ixin_none_element('filename');
  if ($self->{'output_file'} ne '') {
    $result .= $self->ixin_list_element('filename', 
                           ['name', $self->{'output_file'}]);
  }
  my $lang = $self->get_conf('documentlanguage');
  #my $lang_code = $lang;
  #my $region_code;
  #if ($lang =~ /^([a-z]+)_([A-Z]+)/) {
  #  $lang_code = $1;
  #  $region_code = $2;
  #}
  $result .= ' ';
  $result .= $self->ixin_list_element('lang', ['name', $lang]);
  # FIXME title: use simpletitle or fulltitle
  
  if ($self->{'info'}->{'dircategory_direntry'}) {
    my $current_category;
    foreach my $dircategory_direntry (@{$self->{'info'}->{'dircategory_direntry'}}) {
      if ($dircategory_direntry->{'cmdname'} and $dircategory_direntry->{'cmdname'} eq 'dircategory') {
        if ($current_category) {
          $result .= $self->ixin_close_element('category');
        }
        $current_category = $dircategory_direntry;
        $result .= $self->ixin_open_element('category');
        # FIXME wait for Thien-Thi input on renderable or string.
      } elsif ($dircategory_direntry->{'cmdname'} 
               and $dircategory_direntry->{'cmdname'} eq 'direntry') {
        # FIXME wait for Thien-Thi input on renderable or string and node
        # rendering
      }
    }
    if ($current_category) {
      $result .= $self->ixin_close_element('category');
    }
  }
  $result .= $self->ixin_close_element('xid');

  # FIXME vars: wait for Thien-Thi answer.

  my $elements = Texinfo::Structuring::split_by_node($root);
  # setting_commands is for @-commands appearing before the first node,
  # while end_of_nodes_setting_commands holds, for @-commands names, the 
  # last @-command element.
  my %setting_commands;
  my %end_of_nodes_setting_commands;
  my %setting_commands_defaults;
  foreach my $global_command (keys(%{$self->{'extra'}})) {
    if (($Texinfo::Common::misc_commands{$global_command}
         and $Texinfo::Common::misc_commands{$global_command} =~ /^\d/)
        or $additional_setting_commands{$global_command}) {
      if (ref($self->{'extra'}->{$global_command}) eq 'ARRAY') {
        if (defined($Texinfo::Common::document_settable_at_commands{$global_command})) {
          $setting_commands_defaults{$global_command} 
            = $Texinfo::Common::document_settable_at_commands{$global_command};
        }
        foreach my $command (@{$self->{'extra'}->{$global_command}}) {
          my ($element, $root_command) = _get_element($self, $command);
          # before first node
          if (!defined($root_command->{'extra'}) 
              and !defined($root_command->{'extra'}->{'normalized'})) {
            $setting_commands{$global_command} = $command;
          } else {
            # register the setting value at the end of the node
            $end_of_nodes_setting_commands{$root_command->{'extra'}->{'normalized'}}->{$global_command}
              = $command;
          }
          #print STDERR "$element $root_command->{'extra'} $global_command\n";
        }
      } else {
        if (defined($Texinfo::Common::document_settable_unique_at_commands{$global_command})) {
          $setting_commands_defaults{$global_command} 
            = $Texinfo::Common::document_settable_unique_at_commands{$global_command};
        }
        $setting_commands{$global_command} = $self->{'extra'}->{$global_command};
      }
    }
  }
  my %settings;
  foreach my $setting_command_name (keys(%setting_commands)) {
    my $setting_command = $setting_commands{$setting_command_name};
    $setting_command_name = 'shortcontents' 
        if ($setting_command_name eq 'summarycontents');
    my $value = $self->_informative_command_value($setting_command);
    #print STDERR "$setting_command_name $value\n";
    # do not register settings if sete at the default value.
    if (defined($value) 
        and !(defined($setting_commands_defaults{$setting_command_name}) 
              and $setting_commands_defaults{$setting_command_name} eq $value)) {
      $settings{$setting_command_name} = $value;
    }
  }

  $result .= ' ';
  $result .= $self->ixin_open_element('settings');
  if (scalar(keys(%settings))) {
    foreach my $command_name (sort(keys(%settings))) {
      $result .= $self->ixin_open_element('setting');
      $result .= $self->ixin_symbol_element('settingname', $command_name);
      $result .= ' ';
      if ($Texinfo::Common::misc_commands{$command_name} eq 'lineraw') {
        $result .= $self->ixin_list_element('settingvalue', 
                                   ['value', $settings{$command_name}]);
      } else {
        $result .= $self->ixin_symbol_element('settingvalue', $settings{$command_name});
      }
      $result .= $self->ixin_close_element('setting');
    }
  }
  $result .= $self->ixin_close_element('settings');

  foreach my $region ('copying', 'titlepage') {
    if ($self->{'extra'}->{$region}) {
      $result .= $self->convert_tree($self->{'extra'}->{$region});
    } else {
      $result .= $self->ixin_none_element($region);
    }
  }

  # FIXME toc: wait for Thien-Thi answer.

  $result .= $self->ixin_close_element('meta');
  $result .= "\n";

  # to do the nodes index, one need the size of each node.
  # to do the counts list, one need to know the sizze of the node index.
  # So we have to start by the node data.
  my $node_nr = 0;
  my %current_settings;
  my %node_label_number;
  my %node_byte_sizes;
  my %node_tweaks;
  my @nodes;
  my $document_output = '';
  if ($elements) {
    foreach my $node_element (@$elements) {
      next if ($node_element->{'extra'}->{'no_node'});
      $node_nr++;
      my $node = $node_element->{'extra'}->{'element_command'};
      push @nodes, $node;
      my $normalized_node_name = $node->{'extra'}->{'normalized'};
      foreach my $setting_command_name (keys(%current_settings)) {
        $node_tweaks{$normalized_node_name}->{$setting_command_name}
          = $current_settings{$setting_command_name};
      }
      $node_label_number{$normalized_node_name} = $node_nr;

      my $node_result = $self->convert_tree($node_element);
      $document_output .= $node_result;

      # get node length.
      $node_byte_sizes{$normalized_node_name} 
         = $self->_count_bytes($node_result);
      # update current settings
      if (defined($end_of_nodes_setting_commands{$normalized_node_name})) {
        foreach my $setting_command_name (keys(%{$end_of_nodes_setting_commands{$normalized_node_name}})) {
          my $value = $self->_informative_command_value(
            $end_of_nodes_setting_commands{$normalized_node_name}->{$setting_command_name});
          if ((defined($settings{$setting_command_name}) 
               and $settings{$setting_command_name} eq $value)
              or (!defined($settings{$setting_command_name})
                  and defined($setting_commands_defaults{$setting_command_name})
                  and $setting_commands_defaults{$setting_command_name} eq $value)) {
            delete $current_settings{$setting_command_name}; 
          } else {
            $current_settings{$setting_command_name} = $value;
          }
        }
      }
    }
  } else {
    # not a full document.
  }

  my $nodes_index = $self->ixin_open_element('nodesindex');
  foreach my $node (@nodes) {
    my $normalized_node_name = $node->{'extra'}->{'normalized'};
    # FIXME name should be a renderable sequence
    my @attributes = ('name', $normalized_node_name,
                      'length', $node_byte_sizes{$normalized_node_name});
    foreach my $direction (@node_directions) {
      if ($node->{'node_'.lc($direction)}) {
        my $node_direction = $node->{'node_'.lc($direction)};
        if ($node_direction->{'extra'}->{'manual_content'}) {
          # FIXME?
          push @attributes, ('node'.lc($direction), -2);
        } else {
          push @attributes, ('node'.lc($direction), 
                 $node_label_number{$node_direction->{'extra'}->{'normalized'}})
        }
      } else {
        push @attributes, ('node'.lc($direction), -1);
      }
    }
    $nodes_index .= $self->ixin_open_element('nodeentry', \@attributes);
    
    if ($node_tweaks{$normalized_node_name}) {
      $nodes_index .= $self->ixin_open_element('nodetweaks');
      foreach my $command_name (sort(keys(%{$node_tweaks{$normalized_node_name}}))) {
        $nodes_index .= $self->ixin_open_element('nodetweak');
        $nodes_index .= $self->ixin_symbol_element('nodetweakname', $command_name);
        $nodes_index .= ' ';
        if ($Texinfo::Common::misc_commands{$command_name} eq 'lineraw') {
          $nodes_index .= $self->ixin_list_element('nodetweakvalue', 
            ['value', $node_tweaks{$normalized_node_name}->{$command_name}]);
        } else {
          $nodes_index .= $self->ixin_symbol_element('nodetweakvalue', 
                       $node_tweaks{$normalized_node_name}->{$command_name});
        }
        $nodes_index .= $self->ixin_close_element('nodetweak');
        
      }
      $nodes_index .= $self->ixin_close_element('nodetweaks');
    }
    $nodes_index .= $self->ixin_close_element('nodeentry');
  }
  $nodes_index .= $self->ixin_close_element('nodesindex');
  $nodes_index .= "\n";

  # do sectioning tree
  my $sectioning_tree = '';
  $sectioning_tree  .= $self->ixin_open_element('sectioningtree');
  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}) {
    my $section_root = $self->{'structuring'}->{'sectioning_root'};
    foreach my $top_section (@{$section_root->{'section_childs'}}) {
      my $section = $top_section;
 SECTION:
      while ($section) {
        my ($element, $root_command) = $self->_get_element($section);
        my $associated_node_id = $self->_associated_node_id($section, 
                                                     \%node_label_number);
        my @attributes = ('nodeid', $associated_node_id, 'type', 
              $self->_level_corrected_section($section));
        $sectioning_tree .= $self->ixin_open_element('sectionentry',
                 \@attributes);
        $sectioning_tree .= $self->ixin_open_element('sectiontitle');
        if ($section->{'args'} and $section->{'args'}->[0]) {
          $sectioning_tree .= $self->convert_tree($section->{'args'}->[0]);
        }
        $sectioning_tree .= $self->ixin_close_element('sectiontitle');
        # top is special and never considered to contain anything.  So
        # it is closed here and not below.
        if ($section->{'cmdname'} eq 'top') {
          $sectioning_tree .= $self->ixin_close_element('sectionentry');
        }
        if ($section->{'section_childs'}) {
          $section = $section->{'section_childs'}->[0];
        } elsif ($section->{'section_next'}) {
          $sectioning_tree .= $self->ixin_close_element('sectionentry');
          last if ($section eq $top_section);
          $section = $section->{'section_next'};
        } else {
          if ($section eq $top_section) {
            $sectioning_tree .= $self->ixin_close_element('sectionentry')
              unless ($section->{'cmdname'} eq 'top');
            last;
          }
          while ($section->{'section_up'}) {
            $section = $section->{'section_up'};
            $sectioning_tree .= $self->ixin_close_element('sectionentry');
            if ($section eq $top_section) {
              $sectioning_tree .= $self->ixin_close_element('sectionentry')
                 unless ($section->{'cmdname'} eq 'top');
              last SECTION;
            }
            if ($section->{'section_next'}) {
              $sectioning_tree .= $self->ixin_close_element('sectionentry');
              $section = $section->{'section_next'};
              last;
            }
          }
        }
      }
    }
  }
  $sectioning_tree  .= $self->ixin_close_element('sectioningtree') . "\n";

  # do labels

  my $non_node_labels_text = '';
  my $labels_nr = 0;
  if ($self->{'labels'}) {
    foreach my $label (sort(keys(%{$self->{'labels'}}))) {
      my $command = $self->{'labels'}->{$label};
      next if ($command->{'cmdname'} eq 'node');
      $labels_nr++;
      my $associated_node_id = $self->_associated_node_id($command, 
                                                     \%node_label_number);
      $non_node_labels_text .= $self->ixin_element('label', ['name', $label,
                                       'nodeid', $associated_node_id,
                                       'type', $command->{'cmdname'}]);
    }
  }
  
  my $labels_text = $self->ixin_open_element('labels', ['count', $labels_nr]);
  foreach my $node (@nodes) {
    $labels_text .= $self->ixin_list_element('nodelabel', ['name', 
                                    $node->{'extra'}->{'normalized'}]);
    $labels_text .= ' ';
  }
  $labels_text .= $non_node_labels_text 
                  . $self->ixin_close_element('labels')."\n";
  
  # do document-term sets (indices)

  # do floats

  # do blobs

  my @counts_attributes = ('nodeindexlen', $self->_count_bytes($nodes_index),
                    'nodecounts', $node_nr, 
                    'sectioningtreelen', $self->_count_bytes($sectioning_tree),
                    'labelslen', $self->_count_bytes($labels_text));

  my $output = $self->_output_text($result, $fh);

  $output .= $self->_output_text(
               $self->ixin_element('counts', \@counts_attributes) ."\n", $fh);

  $output .= $self->_output_text($nodes_index, $fh);
  $output .= $self->_output_text($sectioning_tree, $fh);
  $output .= $self->_output_text($labels_text, $fh);

  $output .= $self->_output_text($document_output ."\n", $fh);

  # output blobs

  if ($fh and $self->{'output_file'} ne '-') {
    $self->register_close_file($self->{'output_file'});
    if (!close ($fh)) {
      $self->document_error(sprintf($self->__("Error on closing %s: %s"),
                                    $self->{'output_file'}, $!));
    }
  }
  return $output;
}

1;
