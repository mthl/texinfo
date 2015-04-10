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
  my $conf = shift;

  my %parser_blanks = (
    'labels' => {},
    'extra' => {},
    'info' => {},
    'index_names' => {},
    'merged_indices' => {},
    'nodes' => [],

    # These aren't implemented yet.
    'floats' => {},
    'internal_references' => [],

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

  wipe_values ();
  if (defined($conf)) {
    foreach my $key (keys (%$conf)) {
      if ($key eq 'include_directories') {
        warn "Passed include_directories\n";
        foreach my $d (@{$conf->{'include_directories'}}) {
          warn "got dir $d\n";
          add_include_directory ($d);
        }
      } elsif ($key eq 'values') {
	# This is used by Texinfo::Structuring::gdt for substituted values
	for my $v (keys %{$conf->{'values'}}) {
	  if (ref($conf->{'values'}->{$v}) eq 'HASH') {
	    if (defined ($conf->{'values'}->{$v}->{'text'})) {
	      store_value ($v, $conf->{'values'}->{$v}->{'text'});
	    } else {
	      store_value ($v, "<<HASH WITH NO TEXT>>");
	    }
	  } elsif (ref($conf->{'values'}->{$v}) eq 'SCALAR') {
	    store_value ($v, $conf->{'values'}->{$v});
	  } elsif (ref($conf->{'values'}->{$v}) eq 'ARRAY') {
	    store_value ($v, "<<ARRAY VALUE>>");
	  } else {
	    store_value ($v, "<<UNKNOWN VALUE>>");
	  }
	}
      } else {
	#warn "ignoring parser configuration value \"$key\"\n";
      }
    }
  }

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

  # 'level' is set in Parser.pm, but not under 'extra'.
  if (defined ($elt->{'extra'}) and defined $elt->{'extra'}{'level'}) {
    $elt->{'level'} = $elt->{'extra'}{'level'};
  }
}

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

  my $contents;
  if (defined $node->{'extra'}{'associated_section'}) {
    $contents = $node->{'extra'}{'associated_section'}->{'contents'};
  } else {
    $contents = $node->{'contents'};
  }
    

  foreach my $child (@{$contents}) {
    if ($child->{'cmdname'} and $child->{'cmdname'} eq 'menu') {
      push @{$node->{'menus'}}, $child;
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
      push $self->{'nodes'}, $child;

      $child->{'extra'}->{'normalized'} = 
	$child->{'extra'}{'nodes_manuals'}[0]{'normalized'};

      _find_menus_of_node ($child);
    }
  }
}

# Replacement for Texinfo::Parser::parse_texi_file (line 835)
sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;
  my $tree_stream;

  $self->{'info'}->{'input_file_name'} = $file_name;

  #print "Getting tree...\n";

  my ($TREE, $LABELS, $INDEX_NAMES, $ERRORS);
  if (1) {
    # This is our third way of passing the data: construct it using
    # Perl api directly.
    print "Parsing file...\n";
    parse_file ($file_name);
    print "Fetching data..\n";
    $TREE = build_texinfo_tree ();
    print "Got tree...\n";
    #print Texinfo::Parser::_print_tree ($TREE);

    $LABELS = build_label_list ();

    $INDEX_NAMES = build_index_data ();

  } elsif (0) {
    # $| = 1; # Flush after each print
    print "Parsing file...\n";
    parse_file ($file_name);
    print "Fetching data\n";
    $tree_stream = dump_tree_to_string_1 ();
    #print "tree stream is $tree_stream\n";
    eval $tree_stream;
    $tree_stream = dump_root_element_1 ();
    eval $tree_stream;
    while (1) {
      $tree_stream = dump_root_element_2 ();
      last if (!defined $tree_stream);
      eval $tree_stream;
    }
    $tree_stream = dump_tree_to_string_2 ();
    #print "tree stream is $tree_stream\n";
    eval $tree_stream;
    $tree_stream = dump_tree_to_string_25 ();
    #print "tree stream is $tree_stream\n";
    eval $tree_stream;
    $tree_stream = dump_tree_to_string_3 ();
    #print "tree stream is $tree_stream\n";
    eval $tree_stream;
    print "Got data.\n";
  } elsif (0) {

    # This calls a separate executable instead of using the code
    # compliled into Parsetexi.pm as a library.
    $tree_stream = qx(./parsetexi $file_name 2>/dev/null);

    print "Reading tree...\n";
    eval $tree_stream;
    print "Read tree.\n";
  }

  print "Adjusting tree...\n";
  _add_parents ($TREE);
  _complete_node_list ($self, $TREE);
  print "Adjusted tree.\n";

  $self->{'info'}->{'input_file_name'} = $file_name;

  $self->{'labels'} = $LABELS;

  $self->{'index_names'} = $INDEX_NAMES;
  #for my $index (keys %$INDEX_NAMES) {
  #  if ($INDEX_NAMES->{$index}->{'merged_in'}) {
  #    $self->{'merged_indices'}-> {$index}
  #      = $INDEX_NAMES->{$index}->{'merged_in'};
  #  }
  #}

  # Copy the errors into the error list in Texinfo::Report.
  # TODO: Could we just access the error list directly instead of going
  # through Texinfo::Report line_error?
  $tree_stream = dump_errors();
  eval $tree_stream;
  for my $error (@{$ERRORS}) {
    if ($error->{'type'} eq 'error') {
      $self->line_error ($error->{'message'}, $error->{'line_nr'});
    } else {
      $self->line_warn ($error->{'message'}, $error->{'line_nr'});
    }
  }


  #$Data::Dumper::Purity = 1;
  #$Data::Dumper::Indent = 1;
  #my $bar = Data::Dumper->Dump([$TREE], ['$TREE']);
  #print $bar;

  return $TREE;
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
    _add_parents ($tree);
    return $tree;
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
