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

use DynaLoader;

# same as texi2any.pl, although I don't know what the real requirement
# is for this module.
use 5.00405;
use strict;
use warnings;

require Exporter;

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

  # my %parser_hash = %parser_blanks;
  # @parser_hash {keys %default_customization_values} =
  #   values %default_customization_values;

  # my $parser = \%parser_hash;

  my $parser = _deep_copy(\%parser_default_configuration);

  $parser->{'gettext'} = $parser_default_configuration{'gettext'};
  $parser->{'pgettext'} = $parser_default_configuration{'pgettext'};

  wipe_values ();
  init_index_commands ();
  # fixme: these are overwritten immediately after
  if (defined($conf)) {
    foreach my $key (keys (%$conf)) {
      if (ref($conf->{$key}) ne 'CODE' and $key ne 'values') {
        $parser->{$key} = _deep_copy($conf->{$key});
      } else {
        warn "key is $key";
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
	    warn "v is $v", "\n";
	    store_value ($v, $conf->{'values'}->{$v});
          } elsif (ref($conf->{'values'}->{$v}) eq 'HASH') {
            store_value ($v, "<<HASH VALUE>>");
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

  my $self2 = Texinfo::Parser::parser();
  $self2->{'input'} = $self->{'input'};
  return Texinfo::Parser::_parse_texi ($self2, $root);
}

use Data::Dumper;

sub _add_parents ($);

sub _add_parents ($) {
  my $elt = shift;

  if (exists $elt->{'contents'}) {
    foreach my $child (@{$elt->{'contents'}}) {
      #$child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }

  if (exists $elt->{'args'}) {
    foreach my $child (@{$elt->{'args'}}) {
      #$child->{'parent'} = $elt;
      _add_parents ($child);
    }
  }

  # 'level' is set in Parser.pm, but not under 'extra'.
  # currently this isn't needed as level is set in api.c instead.
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

  if (!defined $self->{'nodes'}) {
    $self->{'nodes'} = [];
  }
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

  my ($TREE, $LABELS, $INDEX_NAMES, $ERRORS, $GLOBAL_INFO);
  if (1) {
    # This is our third way of passing the data: construct it using
    # Perl api directly.
    #print "Parsing file...\n";
    parse_file ($file_name);
    #print "Fetching data..\n";
    $TREE = build_texinfo_tree ();
    #print "Got tree...\n";
    #print Texinfo::Parser::_print_tree ($TREE);

    $LABELS = build_label_list ();

    $INDEX_NAMES = build_index_data ();

    # Commenting out this line changes the run time of makeinfo elisp.texi
    # from about 17.0 sec to 13.0 sec.  documentencoding is utf-8.
    $GLOBAL_INFO = build_global_info ();

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

  #print "Adjusting tree...\n";
  _add_parents ($TREE);
  _complete_node_list ($self, $TREE);
  #print "Adjusted tree.\n";


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

  $self->{'info'} = $GLOBAL_INFO;
  #print "!!! ENCODING IS ", $self->{'info'}->{'input_encoding_name'} , "\n";

  if (defined($self->{'info'}->{'input_encoding_name'})) {
    my ($texinfo_encoding, $perl_encoding, $input_encoding)
      = Texinfo::Encoding::encoding_alias(
            $self->{'info'}->{'input_encoding_name'});
    $self->{'info'}->{'input_encoding_name'} = $input_encoding;
    #print "!!! ENCODING IS ", $self->{'info'}->{'input_encoding_name'} , "\n";

  }
  $self->{'info'}->{'input_file_name'} = $file_name;

  $self->{'labels'} = $LABELS;

  #$self->{'index_names'} = $INDEX_NAMES;
  #for my $index (keys %$INDEX_NAMES) {
  #  if ($INDEX_NAMES->{$index}->{'merged_in'}) {
  #    $self->{'merged_indices'}-> {$index}
  #      = $INDEX_NAMES->{$index}->{'merged_in'};
  #  }
  #}

  _get_errors ($self);


  #$Data::Dumper::Purity = 1;
  #$Data::Dumper::Indent = 1;
  #my $bar = Data::Dumper->Dump([$TREE], ['$TREE']);
  #print $bar;

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

    my $LABELS = build_label_list ();
    $self->{'labels'} = $LABELS;

    _get_errors ($self);
    _add_parents ($tree);
    _complete_node_list ($self, $tree);
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
    _add_parents ($tree);
    return $tree;
}

# Public interfaces of Texinfo::Parser (starting line 942)
sub indices_information($)
{
  my $self = shift;
  if (!$self->{'index_names'}) {
    my $INDEX_NAMES = build_index_data ();
    $self->{'index_names'} = $INDEX_NAMES;
  }
  #for my $index (keys %$INDEX_NAMES) {
  #  if ($INDEX_NAMES->{$index}->{'merged_in'}) {
  #    $self->{'merged_indices'}-> {$index}
  #      = $INDEX_NAMES->{$index}->{'merged_in'};
  #  }
  #}
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

## From XSParagraph loading code

BEGIN {

my $module = "Parsetexi";
my $modulename = "Parsetexi"; # Used in messages.
our $VERSION = '6.1';

# Possible values for TEXINFO_XS environment variable:
#
# TEXINFO_XS=omit         # don't try loading xs at all
# TEXINFO_XS=default      # try xs, libtool and then perl paths, silent fallback
# TEXINFO_XS=libtool      # try xs, libtool only, silent fallback
# TEXINFO_XS=standalone   # try xs, perl paths only, silent fallback
# TEXINFO_XS=warn         # try xs, libtool and then perl paths, warn on failure
# TEXINFO_XS=required     # abort if not loadable, no fallback
# TEXINFO_XS=debug        # voluminuous debugging
#
# Other values are treated at the moment as 'default'.

my $TEXINFO_XS = $ENV{'TEXINFO_XS'};
if (!defined($TEXINFO_XS)) {
  $TEXINFO_XS = '';
}

if ($TEXINFO_XS eq 'omit') {
  # Don't try to use the XS module
  goto FALLBACK;
}

# For verbose information about what's being done
sub _debug($) {
  if ($TEXINFO_XS eq 'debug') {
    my $msg = shift;
    warn $msg . "\n";
  }
}

# For messages to say that XS module couldn't be loaded
sub _fatal($) {
  if ($TEXINFO_XS eq 'debug'
      or $TEXINFO_XS eq 'required'
      or $TEXINFO_XS eq 'warn') {
    my $msg = shift;
    warn $msg . "\n";
  }
}

# We look for the .la and .so files in @INC because this allows us to override
# which modules are used using -I flags to "perl".
sub _find_file($) {
  my $file = shift;
  for my $dir (@INC) {
    _debug "checking $dir/$file";
    if (-f "$dir/$file") {
      _debug "found $dir/$file";
      return ($dir, "$dir/$file");
    }
  }
  return undef;
}

our $disable_XS;
if ($disable_XS) {
  _fatal "use of XS modules was disabled when Texinfo was built";
  goto FALLBACK;
}

# Check for a UTF-8 locale.  Skip the check if the 'locale' command doesn't
# work.
my $a;
if ($^O ne 'MSWin32') {
  $a = `locale -a 2>/dev/null`;
}
if ($a and $a !~ /UTF-8/ and $a !~ /utf8/) {
  _fatal "couldn't find a UTF-8 locale";
  goto FALLBACK;
}
if (!$a) {
  _debug "couldn't run 'locale -a': skipping check for a UTF-8 locale";
}


my ($libtool_dir, $libtool_archive);
if ($TEXINFO_XS ne 'standalone') {
  ($libtool_dir, $libtool_archive) = _find_file("Parsetexi.la");
  if (!$libtool_archive) {
    if ($TEXINFO_XS eq 'libtool') {
      _fatal "$modulename couldn't find Libtool archive file";
      goto FALLBACK;
    }
    _debug "$modulename: couldn't find Libtool archive file";
  }
}

my $dlname = undef;
my $dlpath = undef;

# Try perl paths
if (!$libtool_archive) {
  my @modparts = split(/::/,$module);
  my $dlname = $modparts[-1];
  my $modpname = join('/',@modparts);
  # the directories with -L prepended setup directories to
  # be in the search path. Then $dlname is prepended as it is
  # the name really searched for.
  $dlpath = DynaLoader::dl_findfile(map("-L$_/auto/$modpname", @INC), $dlname);
  if (!$dlpath) {
    _fatal "$modulename: couldn't find $module";
    goto FALLBACK;
  }
  goto LOAD;
}

my $fh;
open $fh, $libtool_archive;
if (!$fh) {
  _fatal "$modulename: couldn't open Libtool archive file";
  goto FALLBACK;
}

# Look for the line in the .la file giving the name of the loadable object.
while (my $line = <$fh>) {
  if ($line =~ /^\s*dlname\s*=\s*'([^']+)'\s$/) {
    $dlname = $1;
    last;
  }
}
if (!$dlname) {
  _fatal "$modulename: couldn't find name of shared object";
  goto FALLBACK;
}

# The *.so file is under .libs in the source directory.
push @DynaLoader::dl_library_path, $libtool_dir;
push @DynaLoader::dl_library_path, "$libtool_dir/.libs";

$dlpath = DynaLoader::dl_findfile($dlname);
if (!$dlpath) {
  _fatal "$modulename: couldn't find $dlname";
  goto FALLBACK;
}

LOAD:

#my $flags = dl_load_flags $module; # This is 0 in DynaLoader
my $flags = 0;
my $libref = DynaLoader::dl_load_file($dlpath, $flags);
if (!$libref) {
  _fatal "$modulename: couldn't load file $dlpath";
  goto FALLBACK;
}
_debug "$dlpath loaded";
my @undefined_symbols = DynaLoader::dl_undef_symbols();
if ($#undefined_symbols+1 != 0) {
  _fatal "$modulename: still have undefined symbols after dl_load_file";
}
my $bootname = "boot_$module";
$bootname =~ s/:/_/g;
_debug "looking for $bootname";
my $symref = DynaLoader::dl_find_symbol($libref, $bootname);
if (!$symref) {
  _fatal "$modulename: couldn't find $bootname symbol";
  goto FALLBACK;
}
my $boot_fn = DynaLoader::dl_install_xsub("${module}::bootstrap",
                                                $symref, $dlname);

if (!$boot_fn) {
  _fatal "$modulename: couldn't bootstrap";
  goto FALLBACK;
}

push @DynaLoader::dl_shared_objects, $dlpath; # record files loaded

# This is the module bootstrap function, which causes all the other
# functions (XSUB's) provided by the module to become available to
# be called from Perl code.
&$boot_fn($module, "1");

## if (!Parsetexi::init ()) {
##   _fatal "$modulename: error initializing";
##   goto FALLBACK;
## }
goto DONTFALLBACK;

FALLBACK:
  if ($TEXINFO_XS eq 'required') {
    die "unset the TEXINFO_XS environment variable to use the "
       ."pure Perl modules\n";
  } elsif ($TEXINFO_XS eq 'warn' or $TEXINFO_XS eq 'debug') {
    #warn "falling back to pure Perl modules\n";
    die "falling back to pure Perl modules\n";
  }
  # Fall back to using the Perl code.
  #require Texinfo::Convert::ParagraphNonXS;
  #*Texinfo::Convert::Paragraph:: = *Texinfo::Convert::ParagraphNonXS::;
DONTFALLBACK: ;
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
