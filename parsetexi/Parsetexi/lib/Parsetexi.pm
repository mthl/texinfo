package Parsetexi;

use 5.018001;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter Texinfo::Report);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Parsetexi ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
  parser
  parse_texi_text
  parse_texi_line
  parse_texi_file
  indices_information
  floats_information
  internal_references_information
  labels_information
  global_commands_information
  global_informations
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Parsetexi::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Parsetexi', $VERSION);

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


# Stub for Texinfo::Parser::parser (line 574)
sub parser (;$$)
{
  # None of these are implemented yet.
  my %parser_blanks = (
    'labels' => {},
    'floats' => {},
    'internal_references' => [],
    'extra' => {},
    'info' => {},
    'index_names' => {},
    'merged_indices' => {},
    'nodes' => [],

    # Not used but present in case we pass the object into 
    # Texinfo::Parser.
    'conditionals_stack' => [],
    'expanded_formats_stack' => [],
    'context_stack' => ['_root'],

  );

  my %parser_hash = %parser_blanks;
  @parser_hash {keys %default_customization_values} =
    values %default_customization_values;

  my $parser = \%parser_hash;

  $parser->{'gettext'} = $parser_default_configuration{'gettext'};
  $parser->{'pgettext'} = $parser_default_configuration{'pgettext'};

  bless $parser;

  $parser->Texinfo::Report::new;

  return $parser;
}

use Texinfo::Parser;

# Wrapper for Parser.pm:_parse_texi.  We don't want to use this for the 
# main tree, but it is called via some other functions like 
# parse_texi_line, which is used in a few places.  This stub should go 
# away at some point.
sub _parse_texi ($;$)
{
  my $self = shift;
  my $root = shift;

  return Texinfo::Parser::_parse_texi ($self, $root);
}

use Data::Dumper;

sub _add_parents ($);

sub _add_parents ($) {
  my $elt = shift;

  if (exists $elt->{'contents'}) {
    foreach my $child (@{$elt->{'contents'}}) {
      $child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }

  if (exists $elt->{'args'}) {
    foreach my $child (@{$elt->{'args'}}) {
      $child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }
}

# Set the 'menu_entry' extra key on each menu entry.  This was the
# return value of _parse_node_manual (line 2257, Parser.pm).
sub _add_menu_entry_node_keys ($) {
  my $menu = shift;
  foreach my $entry (@{$menu->{'contents'}}) {
    next if !$entry->{'type'} or $entry->{'type'} ne 'menu_entry';
    foreach my $part (@{$entry->{'args'}}) {
      if ($part->{'type'} eq 'menu_entry_node') {
	#$entry->{'extra'}->{'menu_entry_node'}->{'manual_content'} = ...;

	# In Texinfo::Parser::_parse_node_manual, a copy was taken of
	# the contents, and leading and trailing whitespace elements
	# removed with _trim_spaces_comment_from_content.
	$entry->{'extra'}->{'menu_entry_node'}->{'node_content'}
	  = $part->{'contents'};

	# TODO: Actually get normalized node name of target.
	$entry->{'extra'}->{'menu_entry_node'}->{'normalized'}
	  = $part->{'contents'}[0]{'text'};
      }
    }
  }
}

# Look for a menu in the node, saving in the 'menus' array reference
# of the node element
# This array was built on line 4800 of Parser.pm.
sub _find_menus_of_node ($) {
  my $node = shift;

  foreach my $child
          (@{$node->{'extra'}{'associated_section'}->{'contents'}}) {
    if ($child->{'cmdname'} and $child->{'cmdname'} eq 'menu') {
      push @{$node->{'menus'}}, $child;
      _add_menu_entry_node_keys ($child);
    }
  }
}

# Loop through the top-level elements in the tree, collecting node 
# elements into $ROOT->{'nodes').  This is used in 
# Structuring.pm:nodes_tree.
sub _complete_node_list ($$) {
  my $self = shift;
  my $root = shift;

  foreach my $child (@{$root->{'contents'}}) {
    if ($child->{'cmdname'} and $child->{'cmdname'} eq 'node') {
      #printf "FOUND NODE\n";
      push $self->{'nodes'}, $child;
      #print "CONTENTS are " . $child->{'contents'};

      # TODO - actually normalize the name
      $child->{'extra'}->{'normalized'} = 
	$child->{'args'}->[0]->{'contents'}->[1]->{'text'};

      #print "Normalized node name saved as " .
      #$child->{'extra'}->{'normalized'} . "\n";

      $child->{'extra'}->{'nodes_manuals'} = [];
      foreach my $node_arg (@{$child->{'args'}}) {
	push $child->{'extra'}->{'nodes_manuals'},
	  {'node_content' => $node_arg->{'contents'}};

	# Set 'node_content' on the node element itself.
	#if (!defined($child->{'extra'}->{'node_content'})) {
	#  $child->{'extra'}->{'node_content'} =  $node_arg->{'contents'};
	#}
      }

      _find_menus_of_node ($child);
    }
  }
}

# Stub for Texinfo::Parser::parse_texi_file (line 835)
sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;
  my $tree_stream;

  $self->{'info'}->{'input_file_name'} = $file_name;

  #print "Getting tree...\n";

  # Note we are calling a separate executable instead of using the code
  # compliled into Parsetexi.pm as a library.  We should add functions 
  # to Parsetexi.pm to get the tree without doing this.
  $tree_stream = qx(./parsetexi $file_name 2>/dev/null);

  my ($TREE, $LABELS, $INDEX_NAMES);
  #print "Reading tree...\n";
  eval $tree_stream;
  #print "Read tree.\n";
	  
  #print "Adjusting tree...\n";
  _add_parents ($TREE);
  _complete_node_list ($self, $TREE);
  #print "Adjusted tree.\n";

  $self->{'info'}->{'input_file_name'} = $file_name;

  $self->{'labels'} = $LABELS;

  $self->{'index_names'} = $INDEX_NAMES;

  #$Data::Dumper::Purity = 1;
  #$Data::Dumper::Indent = 1;
  #my $bar = Data::Dumper->Dump([$TREE], ['$TREE']);
  #print $bar;

  return $TREE;
}

# Public interfaces of Texinfo::Parser (starting line 942)
sub indices_information($)
{
  my $self = shift;
  return ($self->{'index_names'}, $self->{'merged_indices'});
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

sub labels_information($)
{
  my $self = shift;
  return $self->{'labels'};
}


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Parsetexi - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Parsetexi;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Parsetexi, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

A. U. Thor, E<lt>g@slackware.lanE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by A. U. Thor

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
