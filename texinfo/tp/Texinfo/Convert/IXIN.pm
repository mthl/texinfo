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

sub ixin_empty($$)
{
  my $self = shift;
  my $name = shift;
  return '-';
}

sub ixin_open_element($$)
{
  my $self = shift;
  my $name = shift;
  return '(';
}

sub ixin_close_element($$)
{
  my $self = shift;
  my $name = shift;
  return ')';
}

sub ixin_string_element($$$)
{
  my $self = shift;
  my $name = shift;
  my $string = shift;
  return '"'.Texinfo::Convert::TexinfoSXML->protect_text($string).'"';
}

sub ixin_symbol_element($$$)
{
  my $self = shift;
  my $name = shift;
  my $string = shift;
  return $string;
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

  my $header = $self->ixin_header();
  my $result = $self->ixin_open_element('meta');
  $result .= $self->ixin_open_element('xid');

  my $output_file = $self->ixin_empty('filename');
  if ($self->{'output_file'} ne '') {
    $result .= $self->ixin_string_element('filename', $self->{'output_file'});
  }
  my $lang = $self->get_conf('documentlanguage');
  #my $lang_code = $lang;
  #my $region_code;
  #if ($lang =~ /^([a-z]+)_([A-Z]+)/) {
  #  $lang_code = $1;
  #  $region_code = $2;
  #}
  $result .= ' ';
  $result .= $self->ixin_string_element('lang', $lang);
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
  foreach my $global_command (keys(%{$self->{'extra'}})) {
    if (($Texinfo::Common::misc_commands{$global_command}
         and $Texinfo::Common::misc_commands{$global_command} =~ /^\d/)
        or $additional_setting_commands{$global_command}) {
      if (ref($self->{'extra'}->{$global_command}) eq 'ARRAY') {
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
    if (defined($value)) {
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
        $result .= $self->ixin_string_element('settingvalue', $settings{$command_name});
      } else {
        $result .= $self->ixin_symbol_element('settingvalue', $settings{$command_name});
      }
      $result .= $self->ixin_close_element('setting');
    }
  }
  $result .= $self->ixin_close_element('settings');
  $result .= $self->ixin_close_element('meta');
  $result .= "\n";

  my $document_output = '';
  if ($elements) {
    foreach my $node_element (@$elements) {
      my $node_result = $self->convert_tree($node_element);
      if ($node_element->{'extra'}->{'no_node'}) {
        print STDERR "FIXME No node.  What to do?\n";
      }
      # get node length.
      $document_output .= $node_result;
    }
  } else {
    # not a full document.
    return $self->_output_text($self->convert_tree($root), $fh);
  }

  my $output = $self->_output_text($result, $fh);

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

