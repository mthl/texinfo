# Copyright 2014, 2015, 2016 Free Software Foundation, Inc.
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

package Parsetexi;

use Texinfo::XSLoader;

# same as texi2any.pl, although I don't know what the real requirement
# is for this module.
use 5.00405;
use strict;
use warnings;

require Exporter;

use Texinfo::Encoding;
use Texinfo::Convert::NodeNameNormalization;

our @ISA = qw(Exporter DynaLoader Texinfo::Report);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use XSParagraph ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
    parser
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

sub get_conf($$)
{
  my $self = shift;
  my $var = shift;
  return $self->{$var};
}

# Copied from Parser.pm
# Customization variables obeyed by the Parser, and the default values.
our %default_customization_values = (
  'TEST' => 0,
  'DEBUG' => 0,     # if >= 10, tree is printed in texi2any.pl after parsing.
		    # If >= 100 tree is printed every line.
  'SHOW_MENU' => 1,             # if false no menu error related.
  'INLINE_INSERTCOPYING' => 0,
  'IGNORE_BEFORE_SETFILENAME' => 1,
  'MACRO_BODY_IGNORES_LEADING_SPACE' => 0,
  'IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME' => 1,
  'INPUT_PERL_ENCODING' => undef, # input perl encoding name, set from 
			      # @documentencoding in the default case
  'INPUT_ENCODING_NAME' => undef, # encoding name normalized as preferred
			      # IANA, set from @documentencoding in the default
			      # case
  'CPP_LINE_DIRECTIVES' => 1, # handle cpp like synchronization lines
  'MAX_MACRO_CALL_NESTING' => 100000, # max number of nested macro calls
  'GLOBAL_COMMANDS' => [],    # list of commands registered 
  # This is not used directly, but passed to Convert::Text through 
  # Texinfo::Common::_convert_text_options
  'ENABLE_ENCODING' => 1,     # output accented and special characters
			      # based on @documentencoding
  # following are used in Texinfo::Structuring
  'TOP_NODE_UP' => '(dir)',   # up node of Top node
  'SIMPLE_MENU' => 0,         # not used in the parser but in structuring
  'USE_UP_NODE_FOR_ELEMENT_UP' => 0, # Use node up for Up if there is no 
				     # section up.
);
  
my %parser_default_configuration =
  (%Texinfo::Common::default_parser_state_configuration,
   %default_customization_values);

use Data::Dumper;

# simple deep copy of a structure
sub _deep_copy($)
{
  my $struct = shift;
  my $string = Data::Dumper->Dump([$struct], ['struct']);
  eval $string;
  return $struct;
}

# Stub for Texinfo::Parser::parser (line 574)
sub parser (;$$)
{
  my $conf = shift;

  my %parser_blanks = (
    'labels' => {},
    'targets' => [],
    'extra' => {},
    'info' => {},
    'index_names' => {},
    'merged_indices' => {},
    'nodes' => [],
    'floats' => {},
    'internal_references' => [],

    # Not used but present in case we pass the object into 
    # Texinfo::Parser.
    # FIXME check if we can remove these, because we never want to use
    # Texinfo::Parser if the XS module is in use.
    'conditionals_stack' => [],
    'expanded_formats_stack' => [],
    'context_stack' => ['_root'],

  );

  # my %parser_hash = %parser_blanks;
  # @parser_hash {keys %default_customization_values} =
  #   values %default_customization_values;

  # my $parser = \%parser_hash;

  my $parser = _deep_copy(\%parser_default_configuration);

  $parser->{'gettext'} = $parser_default_configuration{'gettext'};
  $parser->{'pgettext'} = $parser_default_configuration{'pgettext'};

  reset_parser ();
  # fixme: these are overwritten immediately after
  if (defined($conf)) {
    foreach my $key (keys (%$conf)) {
      if (ref($conf->{$key}) ne 'CODE' and $key ne 'values') {
        $parser->{$key} = _deep_copy($conf->{$key});
      } else {
        #warn "key is $key";
        #$parser->{$key} = $conf->{$key};
      }

      if ($key eq 'include_directories') {
        #warn "Passed include_directories\n";
        foreach my $d (@{$conf->{'include_directories'}}) {
          #warn "got dir $d\n";
          add_include_directory ($d);
        }
      } elsif ($key eq 'values') {
	# This is used by Texinfo::Report::gdt for substituted values
	for my $v (keys %{$conf->{'values'}}) {
	  if (!ref($conf->{'values'}->{$v})) {
	    store_value ($v, $conf->{'values'}->{$v});
          } elsif (ref($conf->{'values'}->{$v}) eq 'HASH') {
            store_value ($v, "<<HASH VALUE>>");
	  } elsif (ref($conf->{'values'}->{$v}) eq 'ARRAY') {
	    store_value ($v, "<<ARRAY VALUE>>");
	  } else {
	    store_value ($v, "<<UNKNOWN VALUE>>");
	  }
	}
      } elsif ($key eq 'expanded_formats') {
        clear_expanded_formats ();

        for my $f (@{$parser->{$key}}) {
          add_expanded_format ($f);
        }
      } elsif ($key eq 'SHOW_MENU') {
        conf_set_show_menu ($conf->{$key});
      } else {
	#warn "ignoring parser configuration value \"$key\"\n";
      }
    }
  }

  bless $parser;

  $parser->Texinfo::Report::new;

  return $parser;
}

#use Texinfo::Parser;

# Wrapper for Parser.pm:_parse_texi.  We don't want to use this for the 
# main tree, but it is called via some other functions like 
# parse_texi_line, which is used in a few places.  This stub should go 
# away at some point.
sub _parse_texi ($;$)
{
  my $self = shift;
  my $root = shift;
  ##
  ##  my $self2 = Texinfo::Parser::parser();
  ##  $self2->{'input'} = $self->{'input'};
  ##  return Texinfo::Parser::_parse_texi ($self2, $root);
  return {};
}

use Data::Dumper;

# Look for a menu in the node, saving in the 'menus' array reference
# of the node element
# This array was built on line 4800 of Parser.pm.
sub _find_menus_of_node ($) {
  my $node = shift;

  # If a sectioning command wasn't used in the node, the
  # associated_section won't be set.  This is the case for
  # "(texinfo)Info Format Preamble" and some other nodes in
  # doc/texinfo.texi.  Avoid referencing it which would create
  # it by mistake, which would cause problems in Structuring.pm.
  #
  # Also, check for menu elements under both the node element and the
  # sectioning element.  This is for malformed input with a @menu between
  # the two commands.

  my $contents;

  if ($node->{'contents'}) {
    $contents = $node->{'contents'};
    foreach my $child (@{$contents}) {
      if ($child->{'cmdname'} and $child->{'cmdname'} eq 'menu') {
        push @{$node->{'menus'}}, $child;
      }
    }
  }

  if (defined $node->{'extra'}{'associated_section'}) {
    $contents = $node->{'extra'}{'associated_section'}->{'contents'};
    foreach my $child (@{$contents}) {
      if ($child->{'cmdname'} and $child->{'cmdname'} eq 'menu') {
        push @{$node->{'menus'}}, $child;
      }
    }
  }
}

# For each node, call _find_menus_of_node.
sub _complete_node_menus ($$) {
  my $self = shift;
  my $root = shift;

  if (!defined $self->{'nodes'}) {
    $self->{'nodes'} = [];
  }
  foreach my $child (@{$root->{'contents'}}) {
    if ($child->{'cmdname'} and $child->{'cmdname'} eq 'node') {
      _find_menus_of_node ($child);
    }
  }
}

sub get_parser_info {
  my $self = shift;

  my ($TARGETS, $INTL_XREFS, $FLOATS,
      $INDEX_NAMES, $ERRORS, $GLOBAL_INFO, $GLOBAL_INFO2);

  $TARGETS = build_label_list ();
  $INTL_XREFS = build_internal_xref_list ();
  $FLOATS = build_float_list ();
  $INDEX_NAMES = build_index_data ();
  $GLOBAL_INFO = build_global_info ();
  $GLOBAL_INFO2 = build_global_info2 ();

  $self->{'targets'} = $TARGETS;
  $self->{'labels'} = {};
  $self->{'internal_references'} = $INTL_XREFS;
  $self->{'floats'} = $FLOATS;
  $self->{'info'} = $GLOBAL_INFO;
  $self->{'extra'} = $GLOBAL_INFO2;

  _get_errors ($self);
}

# Replacement for Texinfo::Parser::parse_texi_file (line 835)
sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;
  my $tree_stream;

  $self->{'info'}->{'input_file_name'} = $file_name;

  parse_file ($file_name);
  my $TREE = build_texinfo_tree ();
  get_parser_info ($self);
  _complete_node_menus ($self, $TREE);

  # line 899
  my $text_root;
  if ($TREE->{'type'} eq 'text_root') {
    $text_root = $TREE;
  } elsif ($TREE->{'contents'} and $TREE->{'contents'}->[0]
      and $TREE->{'contents'}->[0]->{'type'} eq 'text_root') {
    $text_root = $TREE->{'contents'}->[0];
  }

  # Put everything before @setfilename in a special type.  This allows
  # ignoring everything before @setfilename.

  # The non-XS Perl code checks $self->{'extra'}->{'setfilename'}, which
  # would be set in _register_global_command.
  if ($self->{'IGNORE_BEFORE_SETFILENAME'} and $text_root) {
    my $before_setfilename = {'type' => 'preamble_before_setfilename',
      'parent' => $text_root,
      'contents' => []};
    while (@{$text_root->{'contents'}}
        and (!$text_root->{'contents'}->[0]->{'cmdname'}
          or $text_root->{'contents'}->[0]->{'cmdname'} ne 'setfilename')) {
      my $content = shift @{$text_root->{'contents'}};
      $content->{'parent'} = $before_setfilename;
      push @{$before_setfilename->{'contents'}}, $content;
    }
    if (!@{$text_root->{'contents'}}) {
      # not found
      #splice @{$text_root->{'contents'}}, 0, 0, @$before_setfilename;
      $text_root->{'contents'} = $before_setfilename->{'contents'};
    }
    else {
    unshift (@{$text_root->{'contents'}}, $before_setfilename)
      if (@{$before_setfilename->{'contents'}});
    }
  }

  ############################################################

  if (defined($self->{'info'}->{'input_encoding_name'})) {
    my ($texinfo_encoding, $perl_encoding, $input_encoding)
      = Texinfo::Encoding::encoding_alias(
            $self->{'info'}->{'input_encoding_name'});
    $self->{'info'}->{'input_encoding_name'} = $input_encoding;
  }
  $self->{'info'}->{'input_file_name'} = $file_name;

  return $TREE;
}

# Copy the errors into the error list in Texinfo::Report.
# TODO: Could we just access the error list directly instead of going
# through Texinfo::Report line_error?
sub _get_errors($)
{
  my $self = shift;
  my $ERRORS;
  my $tree_stream = dump_errors();
  eval $tree_stream;
  for my $error (@{$ERRORS}) {
    if ($error->{'type'} eq 'error') {
      $self->line_error ($error->{'message'}, $error->{'line_nr'});
    } else {
      $self->line_warn ($error->{'message'}, $error->{'line_nr'});
    }
  }
}

# Replacement for Texinfo::Parser::parse_texi_text (line 757)
#
# Used in tests under tp/t.
sub parse_texi_text($$;$$$$)
{
    my $self = shift;
    my $text = shift;
    my $lines_nr = shift;
    my $file = shift;
    my $macro = shift;
    my $fixed_line_number = shift;

    return undef if (!defined($text));

    $self = parser() if (!defined($self));
    parse_text($text);
    my $tree = build_texinfo_tree ();
    my $INDEX_NAMES = build_index_data ();
    $self->{'index_names'} = $INDEX_NAMES;

    for my $index (keys %$INDEX_NAMES) {
      if ($INDEX_NAMES->{$index}->{'merged_in'}) {
        $self->{'merged_indices'}-> {$index}
          = $INDEX_NAMES->{$index}->{'merged_in'};
      }
    }

    get_parser_info($self);
    _complete_node_menus ($self, $tree);
    return $tree;
}

# Replacement for Texinfo::Parser::parse_texi_line (line 918)
sub parse_texi_line($$;$$$$)
{
    my $self = shift;
    my $text = shift;
    my $lines_nr = shift;
    my $file = shift;
    my $macro = shift;
    my $fixed_line_number = shift;

    return undef if (!defined($text));

    $self = parser() if (!defined($self));
    parse_string($text);
    my $tree = build_texinfo_tree ();
    return $tree;
}

# Public interfaces of Texinfo::Parser (starting line 942)
sub indices_information($)
{
  my $self = shift;

  my $INDEX_NAMES;
  if (!$self->{'index_names'}) {
    $INDEX_NAMES = build_index_data ();
    $self->{'index_names'} = $INDEX_NAMES;
  }
  return $self->{'index_names'};
}

sub floats_information($)
{
  my $self = shift;
  return $self->{'floats'};
}

sub internal_references_information($)
{
  my $self = shift;
  return $self->{'internal_references'};
}

sub global_commands_information($)
{
  my $self = shift;
  return $self->{'extra'};
}

sub global_informations($)
{
  my $self = shift;
  return $self->{'info'};
}

# Setup labels and nodes info and return labels
# FIXME : should share this with the non-XS code.
sub labels_information($)
{
  my $self = shift;

  if (!defined $self->{'labels'}
       and defined $self->{'targets'}) {
    my %labels = ();
    for my $target (@{$self->{'targets'}}) {
      if ($target->{'cmdname'} eq 'node') {
        if ($target->{'extra'}->{'nodes_manuals'}) {
          for my $node_manual (@{$target->{'extra'}{'nodes_manuals'}}) {
            if (defined $node_manual
                  and defined $node_manual->{'node_content'}) {
              my $normalized = Texinfo::Convert::NodeNameNormalization::normalize_node({'contents' => $node_manual->{'node_content'}});
              $node_manual->{'normalized'} = $normalized;
            }
          }
        }
      }
      if (defined $target->{'extra'}->{'node_content'}) {
        my $normalized = Texinfo::Convert::NodeNameNormalization::normalize_node({'contents' => $target->{'extra'}->{'node_content'}});

        if ($normalized !~ /[^-]/) {
          $self->line_error (sprintf($self->__("empty node name after expansion `%s'"),
                Texinfo::Convert::Texinfo::convert({'contents' 
                               => $target->{'extra'}->{'node_content'}})), 
                $target->{'line_nr'});
          delete $target->{'extra'}->{'node_content'};
        } else {
          if (defined $labels{$normalized}) {
            $self->line_error(
              sprintf($self->__("\@%s `%s' previously defined"), 
                         $target->{'cmdname'}, 
                   Texinfo::Convert::Texinfo::convert({'contents' => 
                       $target->{'extra'}->{'node_content'}})), 
                           $target->{'line_nr'});
            $self->line_error(
              sprintf($self->__("here is the previous definition as \@%s"),
                               $labels{$normalized}->{'cmdname'}),
                       $labels{$normalized}->{'line_nr'});
            delete $target->{'extra'}->{'node_content'};
          } else {
            $labels{$normalized} = $target;
            $target->{'extra'}->{'normalized'} = $normalized;
            if ($target->{'cmdname'} eq 'node') {
              if ($target->{'extra'}
                  and $target->{'extra'}{'node_argument'}) {
                $target->{'extra'}{'node_argument'}{'normalized'}
                  = $normalized;
              }
              push @{$self->{'nodes'}}, $target;
            }
          }
        }
      } else {
        if ($target->{'cmdname'} eq 'node') {
          $self->line_error (sprintf($self->__("empty argument in \@%s"),
                  $target->{'cmdname'}), $target->{'line_nr'});
          delete $target->{'extra'}->{'node_content'};
        }
      }
    }
    $self->{'labels'} = \%labels;
    delete $self->{'targets'};
  }
  return $self->{'labels'};
}

BEGIN {
  Texinfo::XSLoader::init (
    "Texinfo::Parser",
    "Parsetexi",
    undef,
    "Parsetexi",
    1);

} # end BEGIN

# NB Don't add more functions down here, because this can cause an error
# with some versions of Perl, connected with the typeglob assignment just
# above.  ("Can't call mro_method_changed_in() on anonymous symbol table").
#
# See http://perl5.git.perl.org/perl.git/commitdiff/03d9f026ae253e9e69212a3cf6f1944437e9f070?hp=ac73ea1ec401df889d312b067f78b618f7ffecc3
#
# (change to Perl interpreter on 22 Oct 2011)


1;
__END__
