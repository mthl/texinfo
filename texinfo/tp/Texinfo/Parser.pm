# Parser.pm: parse texinfo code into a tree.
#
# Copyright 2010, 2011 Free Software Foundation, Inc.
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
# Parts (also from Patrice Dumas) come from texi2html.pl or texi2html.init.

# The organization of the file is the following:
#  module definitions.
#  default parser state.  With explanation of the internal structures.
#  initializations, determination of command types.
#  user visible subroutines.
#  internal subroutines, doing the parsing.

package Texinfo::Parser;

# We need the unicode stuff.
use 5.006;
use strict;

# debug
#use Carp qw(cluck);

use Data::Dumper;

# to detect if an encoding may be used to open the files
use Encode;
# for i18n
use Locale::Messages;

#use POSIX qw(setlocale LC_ALL LC_CTYPE LC_MESSAGES);

# commands definitions
use Texinfo::Common;
# Error reporting and counting, and translation of strings.
use Texinfo::Report;

# to expand file names in @include
use Texinfo::Convert::Text;
# to normalize node name, anchor, float arg, listoffloats and first *ref argument.
use Texinfo::Convert::NodeNameNormalization;
# in error messages
use Texinfo::Convert::Texinfo;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter Texinfo::Report);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Texinfo::Parser ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  parser
  parse_texi_text
  parse_texi_line
  parse_texi_file
  errors
  indices_information
  floats_information
  internal_references_information
  labels_information
  global_commands_information
  global_informations
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

sub N__($)
{
  return $_[0];
}

sub __($$)
{
  my $self = shift;
  return &{$self->{'gettext'}}(@_);
}

# these are the default values for the parser state that may be 
# initialized to values given by the user.
our %default_configuration = (
  'TEST' => 0,
  'DEBUG' => 0,
  'SHOW_MENU' => 1,             # if false no menu error related.
  'gettext' => sub {return $_[0];},
  'expanded_formats' => [],
  'include_directories' => [ '.' ],
  'INLINE_INSERTCOPYING' => 0,
  'IGNORE_BEFORE_SETFILENAME' => 1,
  # this is the initial context.  It is put at the bottom of the 
  # 'context_stack'
  'context' => '_root',
  # the stack of the macros being expanded (more recent are first)
  'macro_stack' => [],
  # these are the user-added indices.  May be an array reference on names
  # or an hash reference in the same format than %index_names below
  'indices' => [],
  # the following are dynamically modified during the document parsing.
  'aliases' => {},            # key is a command name value is the alias
  'values' => {},             # the key is the name, the value the @set name 
                              # argument.  A Texinfo tree may also be used.
  'macros' => {},             # the key is the user-defined macro name.  The 
                              # value is the reference on a macro element 
                              # as obtained by parsing the @macro
  'explained_commands' => {}, # the key is a command name, either acronym
                              # or abbr, the value is a hash.  The key hash 
                              # is a normalized first argument of the 
                              # corresponding command, the value is the 
                              # contents array of the previous command with
                              # this first arg and a second arg.
  'clickstyle' => 'arrow',
  'kbdinputstyle' => 'distinct',
  'sections_level' => 0,      # modified by raise/lowersections
  'merged_indices' => {},     # the key is merged in the value
  'labels'          => {},    # keys are normalized label names, as described
                              # in the `HTML Xref' node.  Value should be
                              # a node/anchor or float in the tree.
  'novalidate' => 0,          # same as setting @novalidate.
  'perl_encoding' => undef,   # perl encoding name, set from @documentencoding
  'encoding_name' => undef,   # Current encoding set by @documentencoding
                              # and normalized
  'documentlanguage' => undef, 
                              # Current documentlanguage set by 
                              # @documentlanguage
  # FIXME not used?
  'ENABLE_ENCODING' => 1,     # corresponds to --enable-encoding.
  'MAX_MACRO_CALL_NESTING' => 100000, # max number of nested macro calls
  'TOP_NODE_UP' => '(dir)',   # up node of Top node
  'SIMPLE_MENU' => 0          # currently not used in the parser for now, 
                              # but relevant for structuring
);

# The commands in initialization_overrides are not set in the document if
# set at the parser initialization.
my %initialization_overrides = (
  'encoding_name' => 1,
  'documentlanguage' => 1,
);

# the other possible keys for the parser state are:
#
# expanded_formats_hash   each key comes from expanded_formats value is 1
# index_names             a structure holding the link between index 
#                         names and prefixes
#                         see the initial value as %index_names below.
# context_stack           stack of the contexts, more recent on top.
#                         'line' is added when on a line or 
#                         block @-command line,
#                         'def' is added instead if on a definition line.
#                         'preformatted' is added in block commands 
#                         where there is no paragraphs and spaces are kept 
#                         (format, example, display...)
#                         'menu' is added in menu commands
#                         'math', 'footnote', 'caption', 'shortcaption' are 
#                         also added when in those commands
# conditionals_stack      a stack of conditional commands that are expanded.
# definfoenclose          an hash, key is the command name, value is an array
#                         reference with 2 values, beginning and ending.
# input                   a stack, with last at bottom.  Holds the opened files
#                         or text.  Pending macro expansion or text expansion
#                         is also in that structure.
# misc_commands           the same than %misc_commands below, but with index
#                         entry commands dynamically added
# close_paragraph_commands      same than %close_paragraph_command, but with
#                               insertcopying removed if INLINE_INSERTCOPYING
# close_preformatted_commands   same than %close_preformatted_command, but with
#                               insertcopying removed if INLINE_INSERTCOPYING
# no_paragraph_commands   the same than %default_no_paragraph_commands
#                         below, with index
#                         entry commands dynamically added
# simple_text_commands    the same than %simple_text_commands below, but 
#                         with index entry commands dynamically added
# errors_warnings         a structure with the errors and warnings.
# error_nrs               number of errors.
# current_node            last seen node.
# current_section         last seen section.
# nodes                   list of nodes.
# command_index_prefix    associate a command name to an index prefix.
# prefix_to_index_name    associate an index prefix to the index name.
# index_entries           key is an index name, value is an array reference
#                         on index_entry.
# floats                  key is the normalized float type, value is an array
#                         reference holding all the floats.
# internal_references     an array holding all the internal references.

# set                     points to the value set when initializing, for
#                         configuration items that are not to be overriden
#                         by @-commands.  For example documentlanguage.

# A line information is an hash reference with the keys:
# line_nr        the line number
# file_name      the file name
# macro          if in a macro expansion, the name of the macro
#
# A text fragment information is a 2 element array reference, the first is the
# text fragment, the second is the line information.
#
# The input structure is an array, the first is the most recently included
# file.  The last element may be a file if the parsing is done on a file, 
# with parse_texi_file, or simply pending text, if called as parse_texi_text.
# each element of the array is a hash reference.  The key are:
# pending    an array reference containing pending text fragments, either the
#            text given as parse_texi_text or macro expansion text.
# name       file name
# line_nr    current line number in the file
# fh         filehandle for the file


my %no_brace_commands         = %Texinfo::Common::no_brace_commands;
my %misc_commands             = %Texinfo::Common::misc_commands;
my %brace_commands            = %Texinfo::Common::brace_commands;    
my %accent_commands           = %Texinfo::Common::accent_commands;
my %context_brace_commands    = %Texinfo::Common::context_brace_commands;
my %block_commands            = %Texinfo::Common::block_commands;
my %block_item_commands       = %Texinfo::Common::block_item_commands;
my %close_paragraph_commands  = %Texinfo::Common::close_paragraph_commands;
my %def_map                   = %Texinfo::Common::def_map;
my %def_commands              = %Texinfo::Common::def_commands;
my %def_aliases               = %Texinfo::Common::def_aliases;
my %menu_commands             = %Texinfo::Common::menu_commands;
my %preformatted_commands     = %Texinfo::Common::preformatted_commands;
my %item_container_commands   = %Texinfo::Common::item_container_commands;
my %item_line_commands        = %Texinfo::Common::item_line_commands;
my %deprecated_commands       = %Texinfo::Common::deprecated_commands;
my %root_commands             = %Texinfo::Common::root_commands;
my @out_formats               = @Texinfo::Common::out_formats;
my %command_index_prefix      = %Texinfo::Common::command_index_prefix;
my %command_structuring_level = %Texinfo::Common::command_structuring_level;
my %ref_commands              = %Texinfo::Common::ref_commands;
my %region_commands           = %Texinfo::Common::region_commands;
my %code_style_commands       = %Texinfo::Common::code_style_commands;
my %in_heading_commands       = %Texinfo::Common::in_heading_commands;
my %explained_commands        = %Texinfo::Common::explained_commands;

my %keep_line_nr_brace_commands = %context_brace_commands;
foreach my $keep_line_nr_brace_command ('titlefont', 'anchor') {
  $keep_line_nr_brace_commands{$keep_line_nr_brace_command} = 1;
}
foreach my $brace_command (keys (%brace_commands)) {
  $keep_line_nr_brace_commands{$brace_command} = 1
    if ($brace_commands{$brace_command} > 1);
}

my %def_prepended_content;
foreach my $def_command(keys %def_map) {

  # prepare what will be prepended when the def command is an alias
  if (ref($def_map{$def_command}) eq 'HASH') {
    my ($real_command) = keys (%{$def_map{$def_command}});
    my $prepended = $def_map{$def_command}->{$real_command};
    if ($prepended =~ /^\{/) {
      my $text = $prepended;
      $text =~ s/\{([^\}]+)\}/$1/;
      my $bracketed = { 'type' => 'bracketed'};
      $bracketed->{'contents'} = [ { 'parent' => $bracketed,
                                     'text' => $text } ];
      $def_prepended_content{$def_command} = [$bracketed];
    } else {
      $def_prepended_content{$def_command} = [{ 'text' => $prepended }];
    }
    push @{$def_prepended_content{$def_command}}, { 'text' => ' ' };
  }
}


my %type_with_paragraph;
foreach my $type ('before_item', 'text_root', 'document_root',
                  'brace_command_context') {
  $type_with_paragraph{$type} = 1;
}

my %command_ignore_space_after;
foreach my $command ('anchor', 'hyphenation', 'caption', 'shortcaption') {
  $command_ignore_space_after{$command} = 1;
}

my %global_multiple_commands;
foreach my $global_multiple_command ('author', 'documentlanguage', 
  'documentencoding', 'insertcopying',
  'subtitle', 'contents', 'shortcontents', 'summarycontents',
  'kbdinputstyle', 'paragraphindent', 'firstparagraphindent',
  'frenchspacing', 'hyphenation', 'urefbreakstyle',
  'xrefautomaticsectiontitle', 'codequoteundirected',
  'codequotebacktick', 'titlefont', 'footnote', 'printindex') {
  $global_multiple_commands{$global_multiple_command} = 1;
}

my %global_unique_commands;
foreach my $global_unique_command ('title', 
  'shorttitlepage', 'settitle', 'copying', 'documentdescription',
  'novalidate', 'titlepage',
  'setfilename', 'setcontentsaftertitlepage', 
  'setshortcontentsaftertitlepage', 'footnotestyle',
  'documentencoding', 'everyheadingmarks','everyfootingmarks',
  'evenheadingmarks', 'oddheadingmarks', 'evenfootingmarks', 'oddfootingmarks',
  'fonttextsize', 'pagesizes', 'setchapternewpage', 'top'
) {
  $global_unique_commands{$global_unique_command} = 1;
}

# key is index name, keys of the reference value are the prefixes.
# value associated with the prefix is 0 if the prefix is not a code-like
# prefix, 1 if it is a code-like prefix (set by defcodeindex/syncodeindex).
my %index_names = %Texinfo::Common::index_names;

# index names that cannot be set by the user.
my %forbidden_index_name = ();

foreach my $name(keys(%index_names)) {
  foreach my $prefix (keys %{$index_names{$name}}) {
    $forbidden_index_name{$prefix} = 1;
  }
}

foreach my $other_forbidden_index_name ('info','ps','pdf','htm',
   'log','aux','dvi','texi','txi','texinfo','tex','bib') {
  $forbidden_index_name{$other_forbidden_index_name} = 1;
}

my %default_no_paragraph_commands;
my %begin_line_commands;

foreach my $command ('node', 'end') {
  $begin_line_commands{$command} = $command;
}

foreach my $no_paragraph_command ('titlefont', 'caption', 'shortcaption', 
          'image', '*', 'hyphenation', 'anchor') {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
}

foreach my $no_paragraph_command (keys(%misc_commands)) {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
  $begin_line_commands{$no_paragraph_command} = 1;
}

# verbatiminclude is not said to begin at the beginning of the line
# in the manual
foreach my $misc_not_begin_line ('comment', 'c', 'sp', 'refill', 
                                'noindent', 'indent', 'columnfractions',
                                'tab', 'item', 'headitem', 'verbatiminclude',
                                'vskip', keys(%in_heading_commands)) {
  delete $begin_line_commands{$misc_not_begin_line};
}

my %block_arg_commands;
foreach my $block_command (keys(%block_commands)) {
  $begin_line_commands{$block_command} = 1;
  $default_no_paragraph_commands{$block_command} = 1;
  $block_arg_commands{$block_command} = 1 
    if ($block_commands{$block_command} ne 'raw');
}

my %close_preformatted_commands = %close_paragraph_commands;
foreach my $no_close_preformatted('sp') {
  delete $close_preformatted_commands{$no_close_preformatted};
}

# commands that may appear in accents
my %in_accent_commands = (%no_brace_commands, %accent_commands);
foreach my $brace_command(keys(%brace_commands)) {
  $in_accent_commands{$brace_command} = 1 if (!$brace_commands{$brace_command});
}
$in_accent_commands{'c'} = 1;
$in_accent_commands{'comment'} = 1;

# commands that may appear in texts arguments
my %in_full_text_commands = %no_brace_commands;
foreach my $command (keys(%brace_commands)) {
  $in_full_text_commands{$command} = 1;
}
foreach my $misc_command_in_full_text('c', 'comment', 'refill', 'noindent',
                                       'indent', 'columnfractions') {
  $in_full_text_commands{$misc_command_in_full_text} = 1;
}

foreach my $out_format (@out_formats) {
  $in_full_text_commands{$out_format} = 1;
}
delete $in_full_text_commands{'caption'};
delete $in_full_text_commands{'shortcaption'};
foreach my $block_command (keys(%block_commands)) {
  $in_full_text_commands{$block_command} = 1 
    if ($block_commands{$block_command} eq 'conditional');
}

# commands that may happen in simple text arguments
my %in_simple_text_commands = %in_full_text_commands;
foreach my $not_in_simple_text_command('noindent', 'indent', 
                                       'titlefont', 'anchor', 'footnote',
                                       'xref','ref','pxref', 'inforef') {
  delete $in_simple_text_commands{$not_in_simple_text_command};
}

# commands that only accept simple text as argument in any context.
# index entry commands are dynamically added.
my %simple_text_commands;
foreach my $misc_command(keys(%misc_commands)) {
  if ($misc_commands{$misc_command} =~ /^\d+$/ 
      or ($misc_commands{$misc_command} eq 'line' and !$root_commands{$misc_command})
      or $misc_commands{$misc_command} eq 'text') {
    $simple_text_commands{$misc_command} = 1;
  }
}
delete $simple_text_commands{'center'};
delete $simple_text_commands{'exdent'};
foreach my $command ('titlefont', 'anchor', 'xref','ref','pxref', 
                     'inforef', 'shortcaption', 'math', 'indicateurl',
                     'email', 'uref', 'url', 'image', 'abbr', 'acronym', 
                     'dmn', 'ctrl') {
  $simple_text_commands{$command} = 1;
}

# commands that accept full text, but no block or top-level commands
my %full_text_commands;
foreach my $brace_command (keys (%brace_commands)) {  
  if ($brace_commands{$brace_command} == 1 
      and (!$simple_text_commands{$brace_command} 
           and !$context_brace_commands{$brace_command})) {
    $full_text_commands{$brace_command} = 1;
  }
}
$full_text_commands{'center'} = 1;
$full_text_commands{'exdent'} = 1;

# contexts on the context_stack stack where empty line don't trigger
# paragraph
my %no_paragraph_contexts;
foreach my $no_paragraph_context ('math', 'preformatted', 'menu', 'def') {
  $no_paragraph_contexts{$no_paragraph_context} = 1;
};



# simple deep copy of a structure
sub _deep_copy ($)
{
  my $struct = shift;
  my $string = Data::Dumper->Dump([$struct], ['struct']);
  eval $string;
  return $struct;
}

# enter all the commands associated with an index name using the prefix
# list
sub _register_index_commands ($$)
{
  my $self = shift;
  my $index_name = shift;
  foreach my $prefix (keys (%{$self->{'index_names'}->{$index_name}})) {
    $self->{'misc_commands'}->{$prefix.'index'} = 'line';
    $self->{'no_paragraph_commands'}->{$prefix.'index'} = 1;
    $self->{'simple_text_commands'}->{$prefix.'index'} = 1;
    $self->{'command_index_prefix'}->{$prefix.'index'} = $prefix;
    $self->{'prefix_to_index_name'}->{$prefix} = $index_name;
  }
}

# initialization entry point.  Set up a parser.
# The last argument, optional, is a hash provided by the user to change
# the default values for what is present in %default_configuration.
# The exact arguments of the function depend on how it was called,
# in a object oriented way or not.
sub parser(;$$)
{
  my $class = shift;
  my $conf;

  my $parser = _deep_copy(\%default_configuration);
  # _deep_copy doesn't handle subs
  $parser->{'gettext'} = $default_configuration{'gettext'};

  # called not object-oriented
  if (ref($class) eq 'HASH') {
    #print STDERR "Not oo\n"
    $conf = $class;
    bless $parser;

  } elsif (ref($class)) { 
    # called on an existing parser, interpreted as a duplication
    my $old_parser = $class;
    $class = ref($class);
    $parser = _deep_copy($old_parser);
    $parser->{'gettext'} = $old_parser->{'gettext'};
    bless $parser, $class;
    $conf = shift;

  } elsif (defined($class)) {
    bless $parser, $class;
    $conf = shift;
  } else {
    bless $parser;
    $conf = shift;
  }

  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if (exists($default_configuration{$key})) {
        if (ref($conf->{$key}) ne 'CODE' and $key ne 'values') {
          $parser->{$key} = _deep_copy($conf->{$key});
        } else {
          $parser->{$key} = $conf->{$key};
        }
        if ($initialization_overrides{$key}) {
          $parser->{'set'}->{$key} = $parser->{$key};
        }
      } else {
        warn "$key not a possible configuration in Texinfo::Parser::parser\n";
      }
    }
  }
  #foreach my $value (keys %{$parser->{'values'}}) {
  #  print STDERR "   ->  $value $parser->{'values'}->{$value}\n";
  #}
  # Now initialize command hash that are dynamically modified, notably
  # those for index commands, and lists, based on defaults and user provided.
  $parser->{'misc_commands'} = _deep_copy (\%misc_commands);
  $parser->{'simple_text_commands'} = _deep_copy (\%simple_text_commands);
  $parser->{'no_paragraph_commands'} = { %default_no_paragraph_commands };
  $parser->{'index_names'} = _deep_copy (\%index_names);
  $parser->{'command_index_prefix'} = {%command_index_prefix};
  $parser->{'close_paragraph_commands'} = {%close_paragraph_commands};
  $parser->{'close_preformatted_commands'} = {%close_preformatted_commands};
  if ($parser->{'INLINE_INSERTCOPYING'}) {
    delete $parser->{'close_paragraph_commands'}->{'insercopying'};
    delete $parser->{'close_preformatted_commands'}->{'insercopying'};
  }
  # a hash is simply concatenated.  It should be like %index_names.
  if (ref($parser->{'indices'}) eq 'HASH') {
    %{$parser->{'index_names'}} = (%{$parser->{'index_names'}}, 
                                   %{$parser->{'indices'}});
  } else { # an array holds index names defined with @defindex
    foreach my $name (@{$parser->{'indices'}}) {
      $parser->{'index_names'}->{$name} = {$name => 0};
    }
  }
  foreach my $index (keys (%{$parser->{'index_names'}})) {
    $parser->_register_index_commands($index);
  }
  foreach my $explained_command(keys(%explained_commands)) {
    if  (!defined($parser->{'explained_commands'}->{$explained_command})) {
      $parser->{'explained_commands'}->{$explained_command} = {};
    }
  }
  $parser->{'context_stack'} = [ $parser->{'context'} ];
  $parser->{'regions_stack'} = [];
  # turn the array to a hash for speed.  Not sure it really matters for such
  # a small array.
  foreach my $expanded_format(@{$parser->{'expanded_formats'}}) {
    $parser->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }

  $parser->Texinfo::Report::new;

  return $parser;
}

sub get_conf($$)
{
  my $self = shift;
  my $var = shift;
  return $self->{$var};
}

# split a scalar text in an array lines.
sub _text_to_lines($)
{
  my $text = shift;
  die if (!defined($text));
  my $had_final_end_line = chomp($text);
  my $lines = [ map {$_."\n"} split (/\n/, $text, -1) ];
  $lines = [''] if (!@$lines);
  chomp($lines->[-1]) unless ($had_final_end_line);
  return $lines;
}

# construct a text fragments array matching a lines array, based on information
# supplied.
# If $fixed_line_number is set the line number is not increased, otherwise
# it is increased, beginning at $first_line.
sub _complete_line_nr($$;$$$)
{
  my $lines = shift;
  my $first_line = shift;
  my $file = shift;
  my $macro = shift;
  my $fixed_line_number = shift;

  $macro = '' if (!defined($macro));
  $file = '' if (!defined($file));
  my $new_lines = [];

  if (defined($first_line)) {
    my $line_index = $first_line;
    foreach my $index(0..scalar(@$lines)-1) {
      $line_index = $index+$first_line if (!$fixed_line_number);
      $new_lines->[$index] = [ $lines->[$index],  
                             { 'line_nr' => $line_index,
                               'file_name' => $file, 'macro' => $macro } ];
    }
  } else {
    foreach my $line (@$lines) {
      push @$new_lines, [ $line ];
    }
  }
  return $new_lines;
}

# entry point for text fragments.
# Used in tests.
# Note that it has not asociated root type a opposed to parse_texi_line
# and parse_texi_file.
sub parse_texi_text($$;$$$$)
{
  my $self = shift;
  my $text = shift;
  my $lines_nr = shift;
  my $file = shift;
  my $macro = shift;
  my $fixed_line_number = shift;

  return undef if (!defined($text));

  my $lines_array = [];
  if (!ref($text)) {
    $text = _text_to_lines($text);
  }
  $lines_nr = [] if (!defined($lines_nr));
  if (!ref($lines_nr)) {
    $lines_array = _complete_line_nr($text, $lines_nr, $file, 
                                     $macro, $fixed_line_number);
  } else {
    while (@$text) {
      my $line_nr = shift @$lines_nr;
      my $line = shift @$text;
      push @$lines_array, [$line, $line_nr];
    }
  }

  $self = parser() if (!defined($self));
  $self->{'input'} = [{'pending' => $lines_array}];
  my $tree = $self->_parse_texi();
  return $tree;
}

# parse a texi file
sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;

  my $filehandle = do { local *FH };
  if (!open ($filehandle, $file_name)) { 
    $self->document_error(sprintf($self->__("Can't read file %s: %s"), 
                                  $file_name, $!));
    return undef;
  }
  my $line_nr = 0;
  my $line;
  my @first_lines;
  while ($line = <$filehandle>) {
    $line_nr++;
    $line =~ s/\x{7F}.*\s*//;
    if ($line =~ /^ *\\input/ or $line =~ /^\s*$/) {
      push @first_lines, $line;
    } else {
      last;
    }
  }
  my $root = { 'contents' => [], 'type' => 'text_root' };
  if (@first_lines) {
    push @{$root->{'contents'}}, { 'type' => 'preamble', 'contents' => [] };
    foreach my $line (@first_lines) {
      push @{$root->{'contents'}->[-1]->{'contents'}}, 
                                   { 'text' => $line,
                                     'type' => 'preamble_text' };
    }
  }

  $self = parser() if (!defined($self));
  $self->{'input'} = [{
       'pending' => [ [$line, { 'line_nr' => $line_nr,
                      'file_name' => $file_name, 'macro' => '' }] ],
       'name' => $file_name,
       'line_nr' => $line_nr,
       'fh' => $filehandle
        }];
  $self->{'info'}->{'input_file_name'} = $file_name;
  my $tree = $self->_parse_texi($root);

  # Find 'text_root', which contains everything before first node/section.
  # if there are elements, 'text_root' is the first content, otherwise it
  # is the root.
  my $text_root;
  if ($tree->{'type'} eq 'text_root') {
    $text_root = $tree;
  } elsif ($tree->{'contents'} and $tree->{'contents'}->[0]
           and $tree->{'contents'}->[0]->{'type'} eq 'text_root') {
    $text_root = $tree->{'contents'}->[0];
  }

  # Put everything before @setfilename in a special type.  This allows to
  # ignore everything before @setfilename.
  if ($self->{'IGNORE_BEFORE_SETFILENAME'} and $text_root and 
      $self->{'extra'} and $self->{'extra'}->{'setfilename'}
      and $self->{'extra'}->{'setfilename'}->{'parent'} eq $text_root) {
    my $before_setfilename = {'type' => 'preamble_before_setfilename',
                              'parent' => $text_root,
                              'contents' => []};
    while ($text_root->{'contents'}->[0] ne $self->{'extra'}->{'setfilename'}) {
      my $content = shift @{$text_root->{'contents'}};
      $content->{'parent'} = $before_setfilename;
      push @{$before_setfilename->{'contents'}}, $content;
    }
    unshift (@{$text_root->{'contents'}}, $before_setfilename)
      if (@{$before_setfilename->{'contents'}});
  }

  return $tree;
}

sub parse_texi_line($$;$$$$)
{
  my $self = shift;
  my $text = shift;
  my $lines_nr = shift;
  my $file = shift;
  my $macro = shift;
  my $fixed_line_number = shift;

  return undef if (!defined($text));

  if (!ref($text)) {
    $text = _text_to_lines($text);
  }
  my $lines_array = _complete_line_nr($text, $lines_nr, $file, 
                                     $macro, $fixed_line_number);

  $self = parser() if (!defined($self));
  $self->{'input'} = [{'pending' => $lines_array}];
  my $tree = $self->_parse_texi({'contents' => [], 'type' => 'root_line'});
  return $tree;
}

# return the errors and warnings
sub errors ($)
{
  my $self = shift;
  return ($self->{'errors_warnings'}, $self->{'error_nrs'});
}

# return indices informations
sub indices_information ($)
{
  my $self = shift;
  #return ($self->{'index_names'}, $self->{'merged_indices'});
  return ($self->{'index_names'}, $self->{'merged_indices'}, $self->{'index_entries'});
}

sub floats_information ($)
{
  my $self = shift;
  return $self->{'floats'};
}

sub internal_references_information ($)
{
  my $self = shift;
  return $self->{'internal_references'};
}

sub global_commands_information ($)
{
  my $self = shift;
  return $self->{'extra'};
}

# @ dircategory_direntry
# @ unassociated_menus
# perl_encoding
# encoding_name
# input_file_name
sub global_informations ($)
{
  my $self = shift;
  return $self->{'info'};
}

sub labels_information ($)
{
  my $self = shift;
  return $self->{'labels'};
}

# Following are the internal subroutines.  The most important are
# _parse_texi:  the main parser loop.
# _end_line:    called at an end of line.  Opening if @include lines is 
#               done here.
# _next_text:   present the next text fragment, from pending text or line,
#               as described above.

# for debugging
sub _print_current($)
{
  my $current = shift;
  if (ref($current) ne 'HASH') {
    return  "_print_current: $current not a hash\n";
  }
  my $type = '';
  my $cmd = '';
  my $parent_string = '';
  my $text = '';
  $type = "($current->{'type'})" if (defined($current->{'type'}));
  $cmd = "\@$current->{'cmdname'}" if (defined($current->{'cmdname'}));
  $cmd .= "($current->{'level'})" if (defined($current->{'level'}));
  $text = "[text: $current->{'text'}]" if (defined($current->{'text'}));
  if ($current->{'parent'}) {
    my $parent = $current->{'parent'};
    my $parent_cmd = '';
    my $parent_type = '';
    $parent_cmd = "\@$parent->{'cmdname'}" if (defined($parent->{'cmdname'}));
    $parent_type = "($parent->{'type'})" if (defined($parent->{'type'}));
    $parent_string = " <- $parent_cmd$parent_type\n";
  }
  my $args = '';
  my $contents = '';
  $args = "args(".scalar(@{$current->{'args'}}).')' if $current->{'args'};
  $contents = "contents(".scalar(@{$current->{'contents'}}).')'
    if $current->{'contents'};
  if ("$cmd$type" ne '') {
    return "$cmd$type : $text $args $contents\n$parent_string";
  } else {
    return "$text $args $contents\n$parent_string";
  }
}

# for debugging
sub _print_command_args_texi($)
{
  my $current = shift;
  return '' if (!$current->{'cmdname'});
  my $args = '';
  my $with_brace;
  if ($current->{'args'} and @{$current->{'args'}}) {
    $with_brace 
        = ($current->{'args'}->[0]->{'type'} eq 'brace_command_arg'
           or $current->{'args'}->[0]->{'type'} eq 'brace_command_context');
    $args .= '{' if ($with_brace);
    foreach my $arg (@{$current->{'args'}}) {
      $args .= Texinfo::Convert::Texinfo::convert($arg).', ';
    }
    $args =~ s/, $//;
  }
  chomp($args);
  if ($with_brace) {
    $args .= '}';
  }
  return '@'.$current->{'cmdname'} .$args."\n";
}

sub _print_current_keys($)
{
  my $current = shift;
  my $string = _print_current($current);
  foreach my $key (keys (%$current)) {
    $string .= "   $key: $current->{$key}\n";
  }
  if ($current->{'extra'}) {
    $string .= "    EXTRA\n";
    foreach my $key (keys (%{$current->{'extra'}})) {
      $string .= "    $key: $current->{'extra'}->{$key}\n";
    }
  }
  return $string;
}

# For debugging
my @kept_keys = ('contents', 'cmdname', 'type', 'text', 'args');
my %kept_keys;
foreach my $key (@kept_keys) {
  $kept_keys{$key} = 1;
}
sub _filter_print_keys { [grep {$kept_keys{$_}} ( sort keys %{$_[0]} )] };
sub _print_tree($)
{
  my $tree = shift;
  local $Data::Dumper::Sortkeys = \&_filter_print_keys;
  local $Data::Dumper::Purity = 1;
  local $Data::Dumper::Indent = 1;

  return Data::Dumper->Dump([$tree]);
}

sub _register_global_command($$$$)
{
  my $self = shift;
  my $command = shift;
  my $current = shift;
  my $line_nr = shift;
  if ($global_multiple_commands{$command} and $command ne 'author') {
    push @{$self->{'extra'}->{$command}}, $current;
    return 1;
  } elsif ($global_unique_commands{$command}) {
    if (exists ($self->{'extra'}->{$current->{'cmdname'}})) {
      $self->line_warn (sprintf($self->__('Multiple @%s'), 
        $current->{'cmdname'}), $line_nr); 
    } else {
      $self->{'extra'}->{$current->{'cmdname'}} = $current;
    }
    return 1;
  }
  return 0;
}

# parse a @macro line
sub _parse_macro_command_line($$$$$;$)
{
  my $self = shift;
  my $command = shift;
  my $line = shift;
  my $parent = shift;
  my $line_nr = shift;
  my $macro = { 'cmdname' => $command, 'parent' => $parent, 'contents' => [],
               'extra' => {'arg_line' => $line}, 'line_nr' => $line_nr };
  # REMACRO
  if ($line =~ /^\s+([[:alnum:]][[:alnum:]-]*)\s*(.*)/) {
    my $macro_name = $1;
    my $args_def = $2;
    my @args;

    if ($args_def =~ s/^\s*{\s*(.*?)\s*}\s*//) {
      @args = split(/\s*,\s*/, $1);
    }
 
    if ($args_def =~ /^\s*[^\@]/) {
      $self->line_error(sprintf($self->__("Bad syntax for \@%s argument: %s"), 
                                 $command, $args_def),
                        $line_nr);
      $macro->{'extra'}->{'invalid_syntax'} = 1;
    }
    print STDERR "MACRO \@$command $macro_name\n" if ($self->{'DEBUG'});

    $macro->{'args'} = [ 
      { 'type' => 'macro_name', 'text' => $macro_name, 
          'parent' => $macro } ];
    my $index = 0;
    foreach my $formal_arg (@args) {
      push @{$macro->{'args'}}, 
        { 'type' => 'macro_arg', 'text' => $formal_arg, 
          'parent' => $macro};
      if ($formal_arg !~ /^[\w\-]+$/) {
        $self->line_error(sprintf($self->__("Bad or empty \@%s formal argument: %s"),
                                           $command, $formal_arg), $line_nr);
        $macro->{'extra'}->{'invalid_syntax'} = 1;
      }
      $macro->{'extra'}->{'args_index'}->{$formal_arg} = $index;
      $index++;
    }
  } else {
    $self->line_error (sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    $macro->{'extra'}->{'invalid_syntax'} = 1;
  }
  return $macro;
}

# start a paragraph if in a context where paragraphs are to be started.
sub _begin_paragraph ($$)
{
  my $self = shift;
  my $current = shift;

  if ((!$current->{'type'} or $type_with_paragraph{$current->{'type'}})
      and !$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
    die "BUG: contents undef "._print_current($current) 
       if (!defined($current->{'contents'}));

    # find whether an @indent precedes the paragraph
    my $indent;
    if (scalar(@{$current->{'contents'}})) {
      my $index = scalar(@{$current->{'contents'}}) -1;
      while ($index >= 0
            and !($current->{'contents'}->[$index]->{'type'} 
              and ($current->{'contents'}->[$index]->{'type'} eq 'empty_line'
                   or $current->{'contents'}->[$index]->{'type'} eq 'paragraph'))
            and !($current->{'contents'}->[$index]->{'cmdname'}
                  and $self->{'close_paragraph_commands'}->{$current->{'contents'}->[$index]->{'cmdname'}})) {
        if ($current->{'contents'}->[$index]->{'cmdname'}
          and ($current->{'contents'}->[$index]->{'cmdname'} eq 'indent'
              or $current->{'contents'}->[$index]->{'cmdname'} eq 'noindent')) {
          $indent = $current->{'contents'}->[$index]->{'cmdname'};
          last;
        }
        $index--;
      }
    }
    push @{$current->{'contents'}}, 
            { 'type' => 'paragraph', 'parent' => $current, 'contents' => [] };
    $current->{'contents'}->[-1]->{'extra'}->{$indent} = 1 if ($indent);
    $current = $current->{'contents'}->[-1];
    print STDERR "PARAGRAPH\n" if ($self->{'DEBUG'});
    return $current;
  }
  return 0;
}

sub _begin_preformatted($)
{
  my $self = shift;
  my $current = shift;
  if ($self->{'context_stack'}->[-1] eq 'preformatted') {
    push @{$current->{'contents'}}, 
          { 'type' => 'preformatted', 'parent' => $current, 'contents' => [] };
    $current = $current->{'contents'}->[-1];
    print STDERR "PREFORMATTED\n" if ($self->{'DEBUG'});
  }
  return $current;
}

# currently doesn't do much more than
# return $_[1]->{'parent'}
sub _close_brace_command($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  my $located_line_nr = $line_nr;
  # use the beginning of the @-command for the error message
  # line number if available. FIXME currently not done for regular brace commands
  $located_line_nr = $current->{'line_nr'}
    if ($current->{'line_nr'});
  if ($current->{'cmdname'} ne 'verb' or $current->{'type'} eq '') {
    $self->line_error (sprintf($self->__("%c%s missing close brace"),
                 ord('@'), $current->{'cmdname'}), $located_line_nr);
  } else {
    $self->line_error (sprintf($self->__("\@%s missing closing delimiter sequence: %s}"), $current->{'cmdname'}, $current->{'type'}), $located_line_nr);
  }
  $current = $current->{'parent'};
  return $current;
}

sub _in_code($$)
{
  my $self = shift;
  my $current = shift;

  while ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
          and exists $brace_commands{$current->{'parent'}->{'cmdname'}}
          and !exists $context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
    return 1 if ($code_style_commands{$current->{'parent'}->{'cmdname'}});
    $current = $current->{'parent'}->{'parent'};
  }
  return 0;
}

# close brace commands, that don't set a new context (ie @caption, @footnote)
sub _close_all_style_commands($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  while ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
          and exists $brace_commands{$current->{'parent'}->{'cmdname'}}
          and !exists $context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
    $current = _close_brace_command($self, $current->{'parent'}, $line_nr);
  }
  return $current;
}

# close brace commands except for @caption, @footnote then the paragraph
sub _end_paragraph ($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  $current = _close_all_style_commands($self, $current, $line_nr);
  if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
    print STDERR "CLOSE PARA\n" if ($self->{'DEBUG'});
    $current = $current->{'parent'};
  } 
  return $current;
}

# close brace commands except for @caption, @footnote then the preformatted
sub _end_preformatted ($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  $current = _close_all_style_commands($self, $current, $line_nr);
  if ($current->{'type'} and $current->{'type'} eq 'preformatted') {
    print STDERR "CLOSE PREFORMATTED\n" if ($self->{'DEBUG'});
    # completly remove void preformatted contexts
    if (!@{$current->{'contents'}}) {
      my $removed = pop @{$current->{'parent'}->{'contents'}};
      print STDERR "popping $removed->{'type'}\n" if ($self->{'DEBUG'});
    }
    $current = $current->{'parent'};
  }
  return $current;
}

# put everything after the last @item/@itemx in an item_table type container.
sub _gather_previous_item($;$)
{
  my $current = shift;
  my $next_command = shift;

  # nothing to do in that case.
  if ($current->{'contents'}->[-1]->{'type'}
      and $current->{'contents'}->[-1]->{'type'} eq 'before_item') {
    return;
  }
  #print STDERR "GATHER "._print_current($current)."\n";
  my $type;
  # if before an itemx, the type is different since there should not be 
  # real content, so it may be treated differently
  if ($next_command and $next_command eq 'itemx') {
    $type = 'inter_item';
  } else {
    $type = 'table_item';
  }
  my $table_gathered = {'type' => $type,
                       'contents' => []};
  # remove everything that is not an @item/@items or before_item to 
  # put it in the table_item, starting from the end.
  my $contents_count = scalar(@{$current->{'contents'}});
  for (my $i = 0; $i < $contents_count; $i++) {
    #print STDERR "_gather_previous_item $i on $contents_count: "._print_current($current->{'contents'}->[-1])."\n";
    if ($current->{'contents'}->[-1]->{'cmdname'} 
        and ($current->{'contents'}->[-1]->{'cmdname'} eq 'item' 
             or ($current->{'contents'}->[-1]->{'cmdname'} eq 'itemx'))) {
      last;
    } else {
      my $item_content = pop @{$current->{'contents'}};
      $item_content->{'parent'} = $table_gathered;
      unshift @{$table_gathered->{'contents'}}, $item_content;
    }
  }
  if ($type eq 'table_item') {
    my $table_entry = {'type' => 'table_entry',
                    'parent' => $current,
                    'contents' => []};
    my $table_term = {'type' => 'table_term',
                    'parent' => $table_entry,
                    'contents' => []};
    push @{$table_entry->{'contents'}}, $table_term;
    my $contents_count = scalar(@{$current->{'contents'}});
    for (my $i = 0; $i < $contents_count; $i++) {
      if ($current->{'contents'}->[-1]->{'type'} 
           and ($current->{'contents'}->[-1]->{'type'} eq 'before_item'
                or $current->{'contents'}->[-1]->{'type'} eq 'table_entry')) {
        last;
      } else {
        my $item_content = pop @{$current->{'contents'}};
        $item_content->{'parent'} = $table_term;
        unshift @{$table_term->{'contents'}}, $item_content;
        # debug
        if (! (($item_content->{'cmdname'} 
                and ($item_content->{'cmdname'} eq 'itemx'
                    or $item_content->{'cmdname'} eq 'item'))
               or ($item_content->{'type'} 
                   and $item_content->{'type'} eq 'inter_item'))) {
          print STDERR "BUG: wrong element in table term: "
             ._print_current($item_content);
        }
      }
    }
    push @{$current->{'contents'}}, $table_entry;
    if (scalar(@{$table_gathered->{'contents'}})) {
      push @{$table_entry->{'contents'}}, $table_gathered;
      $table_gathered->{'parent'} = $table_entry;
    }
  } else {
  # FIXME keep table_item with only comments and/or empty lines?
  # FIXME check that there are only comments, empty preformatted and indices
    if (scalar(@{$table_gathered->{'contents'}})) {
      push @{$current->{'contents'}}, $table_gathered;
      $table_gathered->{'parent'} = $current;
    }
  }
}

sub _gather_def_item($;$)
{
  my $current = shift;
  my $next_command = shift;
  my $type;
  # means that we are between a @def*x and a @def
  if ($next_command) {
    $type = 'inter_def_item';
  } else {
    $type = 'def_item';
  }

  #print STDERR "_gather_def_item in "._print_current($current)."\n";
  my $def_item = {'type' => $type,
                  'parent' => $current,
                  'contents' => []};
  # remove everything that is not a def_line to put it in the def_item,
  # starting from the end.
  my $contents_count = scalar(@{$current->{'contents'}});
  for (my $i = 0; $i < $contents_count; $i++) {
    #print STDERR "_gather_def_item $type ($i on $contents_count) "._print_current($current->{'contents'}->[-1])."\n";
    if ($current->{'contents'}->[-1]->{'type'} 
        and $current->{'contents'}->[-1]->{'type'} eq 'def_line') {
     #   and !$current->{'contents'}->[-1]->{'extra'}->{'not_after_command'}) {
      last;
    } else {
      my $item_content = pop @{$current->{'contents'}};
      $item_content->{'parent'} = $def_item;
      unshift @{$def_item->{'contents'}}, $item_content;
    }
  }
  if (scalar(@{$def_item->{'contents'}})) {
    push @{$current->{'contents'}}, $def_item;
  }
}

# close formats
sub _close_command_cleanup($$$) {
  my $self = shift;
  my $current = shift;

  return unless ($current->{'cmdname'});
  # remove the dynamic counters in multitable, they are not of use in the final
  # tree.  Also determine the multitable_body and multitable_head with 
  # @item or @headitem rows.
  if ($current->{'cmdname'} eq 'multitable') {
    my $in_head_or_rows;
    my @contents = @{$current->{'contents'}};
    $current->{'contents'} = [];
    foreach my $row (@contents) {
      if ($row->{'type'} and $row->{'type'} eq 'row') {
        delete $row->{'cells_count'};
        if ($row->{'contents'}->[0]->{'cmdname'} eq 'headitem') {
          if (!$in_head_or_rows) {
            push @{$current->{'contents'}}, {'type' => 'multitable_head',
                                             'parent' => $current};
            $in_head_or_rows = 1;
          }
        } elsif ($row->{'contents'}->[0]->{'cmdname'} eq 'item') {
          if (!defined($in_head_or_rows) or $in_head_or_rows) {
            push @{$current->{'contents'}}, {'type' => 'multitable_body',
                                             'parent' => $current};
            $in_head_or_rows = 0;
          }
        }
        push @{$current->{'contents'}->[-1]->{'contents'}}, $row;
        $row->{'parent'} = $current->{'contents'}->[-1];
      } else {
        push @{$current->{'contents'}}, $row;
        $in_head_or_rows = undef;
      }
    }
    delete $current->{'rows_count'};
  } elsif ($item_container_commands{$current->{'cmdname'}}) {
    delete $current->{'items_count'};
  }

  # put everything after the last @def*x command in a def_item type container.
  if ($def_commands{$current->{'cmdname'}}) {
    # At this point the end command hasn't been added to the command contents.
    #my $end;
    #if ($current->{'extra'}->{'end_command'}) {
    #  $end = pop @{$current->{'contents'}};
    #  die "BUG $current->{'cmdname'}: end don't match end_command "._print_current($current) ."end: "._print_current($end) ."end_command "._print_current($current->{'extra'}->{'end_command'})
    #    if ($end ne $current->{'extra'}->{'end_command'});
    #}
    _gather_def_item($current);
  }

  if ($item_line_commands{$current->{'cmdname'}}) {
    # no end at this point
    #my $end;
    #if ($current->{'extra'}->{'end_command'}) {
    #  $end = pop @{$current->{'contents'}};
    #  die "Not end at end of format $current->{'cmdname'}" 
    #    if (!$end->{'cmdname'} or $end->{'cmdname'} ne 'end');
    #}
    if (@{$current->{'contents'}}) {
      _gather_previous_item($current);
    }
    #push @{$current->{'contents'}}, $end if ($end);
  }
  
  # put end out of before_item, and replace it at the end of the parent.
  # remove empty before_item.
  # warn if not empty before_item, but format is empty
  if ($block_item_commands{$current->{'cmdname'}}) {
    if (@{$current->{'contents'}}) {
      my $leading_spaces = 0;
      my $before_item;
      if ($current->{'contents'}->[0]->{'type'}
          and $current->{'contents'}->[0]->{'type'} eq 'empty_line_after_command'
          and $current->{'contents'}->[1]
          and $current->{'contents'}->[1]->{'type'}
          and $current->{'contents'}->[1]->{'type'} eq 'before_item') {
        $leading_spaces = 1;
        $before_item = $current->{'contents'}->[1];
      } elsif ($current->{'contents'}->[0]->{'type'} 
              and $current->{'contents'}->[0]->{'type'} eq 'before_item') {
        $before_item = $current->{'contents'}->[0];
      }
      if ($before_item) {
        if ($current->{'extra'}->{'end_command'}
            and @{$before_item->{'contents'}} 
            and $before_item->{'contents'}->[-1] eq $current->{'extra'}->{'end_command'}) {
          my $end = pop @{$before_item->{'contents'}};
          $end->{'parent'} = $current;
          push @{$current->{'contents'}}, $end;
        }
        # remove empty before_items
        if (!@{$before_item->{'contents'}}) {
          if ($leading_spaces) {
            my $space = shift @{$current->{'contents'}};
            shift @{$current->{'contents'}};
            unshift @{$current->{'contents'}}, $space;
          } else {
            shift @{$current->{'contents'}};
          }
        } else {
          # warn if not empty before_item, but format is empty
          my $empty_before_item = 1;
          foreach my $before_item_content (@{$before_item->{'contents'}}) {
            if (!$before_item_content->{'cmdname'} or 
                  ($before_item_content->{'cmdname'} ne 'c' 
                   and $before_item_content->{'cmdname'} ne 'comment')) {
              $empty_before_item = 0;
              last;
            }
          }
          if (!$empty_before_item) {
            my $empty_format = 1;
            foreach my $format_content (@{$current->{'contents'}}) {
              next if ($format_content eq $before_item);
              if (($format_content->{'cmdname'} and 
                   ($format_content->{'cmdname'} ne 'c'
                    and $format_content->{'cmdname'} ne 'comment'
                    and $format_content->{'cmdname'} ne 'end'))
                  or ($format_content->{'type'} and
                    ($format_content->{'type'} ne 'empty_line_after_command'))) {
                $empty_format = 0;
                last;
              }
            }
            if ($empty_format) {
              $self->line_warn (sprintf($self->__("\@%s has text but no \@item"),
                                        $current->{'cmdname'}), $current->{'line_nr'});                       
            }
          }
        }
      }
    }
  }
}

# close the current command, with error messages and give the parent.
# If the last argument is given it is the command being closed if
# hadn't there be an error, currently only block command, used for a
# better error message.
sub _close_current($$$;$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;
  my $command = shift;

  if ($current->{'cmdname'}) {
    if (exists($brace_commands{$current->{'cmdname'}})) {
      pop @{$self->{'context_stack'}}
         if (exists $context_brace_commands{$current->{'cmdname'}});
      $current = _close_brace_command($self, $current, $line_nr);
    } elsif (exists($block_commands{$current->{'cmdname'}})) {
      if (defined($command)) {
        $self->line_error(sprintf($self->__("`\@end' expected `%s', but saw `%s'"),
                                   $current->{'cmdname'}, $command), $line_nr);
      } else {
        $self->line_error(sprintf($self->__("No matching `%cend %s'"),
                                   ord('@'), $current->{'cmdname'}), $line_nr);
      }
      pop @{$self->{'context_stack'}} if
         ($preformatted_commands{$current->{'cmdname'}}
           or $menu_commands{$current->{'cmdname'}});
      pop @{$self->{'regions_stack'}} 
         if ($region_commands{$current->{'cmdname'}});
      $current = $current->{'parent'};
    } else { # FIXME is this possible? And does it make sense?
      # silently close containers and @-commands without brace nor @end
      # $self->line_error(sprintf($self->__("Closing \@%s"), 
      #                          $current->{'cmdname'}), $line_nr);
      $current = $current->{'parent'};
    }
  } elsif ($current->{'type'}) {
    if ($current->{'type'} eq 'bracketed') {
    # FIXME record the line number in the bracketed and use it
      $self->line_error (sprintf($self->__("Misplaced %c"),
                                             ord('{')), $line_nr);
      $current = $current->{'parent'};
    } else {
      if ($current->{'type'} eq 'menu_comment' 
          or $current->{'type'} eq 'menu_entry_description') {
        print STDERR "Closing MENU COMMENT/ENTRY_DESCRIPTION ($current->{'type'}) when closing\n"
          if ($self->{'DEBUG'});
        my $context = pop @{$self->{'context_stack'}};
        warn "BUG: not preformatted on context stack $context (close $current->{'type'})" 
           if ($context ne 'preformatted');
        # close empty menu_comment
        if (!@{$current->{'contents'}}) {
          pop @{$current->{'parent'}->{'contents'}};
        }
      }
      $current = $current->{'parent'};
    }
  } else { # Should never go here.
    $current = $current->{'parent'} if ($current->{'parent'});
    print STDERR "BUG: Where am I? "._print_current($current);
  }
  return $current;
}

# a command arg means closing until that command is found.
# no command arg means closing until the root or a root_command
# is found.
sub _close_commands($$$;$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;
  my $command = shift;

  $current = _end_paragraph($self, $current, $line_nr);
  $current = _end_preformatted($self, $current, $line_nr);

        # stop if the command is found
  while (!($command and $current->{'cmdname'}
           and $current->{'cmdname'} eq $command) 
         # stop if at the root
         and $current->{'parent'}
     # stop if in a root command 
     # or in a context_brace_commands and searching for a specific 
     # end block command.  
     # This second condition means that a footnote is not closed when 
     # looking for the end of a block command, but is closed when 
     # completly closing the stack.
         and !($current->{'cmdname'}
               and ($root_commands{$current->{'cmdname'}}
                    or ($command and $current->{'parent'}->{'cmdname'}
                       and $context_brace_commands{$current->{'parent'}->{'cmdname'}})))){
    $self->_close_command_cleanup($current);
    $current = $self->_close_current($current, $line_nr, $command);
  }

  my $closed_command;
  if ($command and $current->{'cmdname'} 
    and $current->{'cmdname'} eq $command) {
    if ($preformatted_commands{$current->{'cmdname'}}) {
      my $context = pop @{$self->{'context_stack'}};
      warn "BUG: closing preformatted_command $command wrong context $context"
        if ($context ne 'preformatted');
    } elsif ($menu_commands{$current->{'cmdname'}}) {
      my $context = pop @{$self->{'context_stack'}};
      # may be in menu, but context is preformatted if in a preformatted too.
      warn "BUG: closing menu command $command wrong context $context"
        if ($context ne 'menu' and $context ne 'preformatted');
    }
    #print STDERR "close context $context for $current->{'cmdname'}\n"
    #  if ($self->{'DEBUG'});
    pop @{$self->{'regions_stack'}} 
       if ($region_commands{$current->{'cmdname'}});
    $closed_command = $current;
    #$self->_close_command_cleanup($current);
    $current = $current->{'parent'};
  } elsif ($command) {
    $self->line_error (sprintf($self->__("Unmatched `%c%s'"), 
                       ord('@'), "end $command"), $line_nr);
  }
  return ($closed_command, $current);
}

# begin paragraph if needed.  If not try to merge with the previous
# content if it is also some text.
sub _merge_text ($$$)
{
  my $self = shift;
  my $current = shift;
  my $text = shift;

  my $paragraph;

  my $no_merge_with_following_text = 0;
  if ($text =~ /\S/) {
    my $leading_spaces;
    if ($text =~ /^(\s+)/) {
      $leading_spaces = $1;
    }
    if ($current->{'contents'} and @{$current->{'contents'}}
      and $current->{'contents'}->[-1]->{'type'}
      and ($current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command'
         or $current->{'contents'}->[-1]->{'type'} eq 'empty_spaces_before_argument'
         or $current->{'contents'}->[-1]->{'type'} eq 'empty_spaces_after_close_brace')) {
      $no_merge_with_following_text = 1;
    }
    if (_abort_empty_line ($self, $current, $leading_spaces)) {
      $text =~ s/^(\s+)//;
    } 

    $paragraph = _begin_paragraph($self, $current);
    $current = $paragraph if ($paragraph);
  }

  die "BUG: No contents in _merge_text "._print_current($current) 
          if (!defined($current->{'contents'}));
  if (@{$current->{'contents'}} 
      and exists($current->{'contents'}->[-1]->{'text'}) 
      and $current->{'contents'}->[-1]->{'text'} !~ /\n/
      and !$no_merge_with_following_text) {
    $current->{'contents'}->[-1]->{'text'} .= $text;
    print STDERR "MERGED TEXT: $text|||\n" if ($self->{'DEBUG'});
  } else {
    push @{$current->{'contents'}}, { 'text' => $text, 'parent' => $current };
    print STDERR "NEW TEXT: $text|||\n" if ($self->{'DEBUG'});
  }
  return $current;
}

# return the parent if in a item_container command, itemize or enumerate
sub _item_container_parent($)
{
  my $current = shift;
  if ((($current->{'cmdname'} and $current->{'cmdname'} eq 'item')
       or ($current->{'type'} and $current->{'type'} eq 'before_item'))
      and ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
        and $item_container_commands{$current->{'parent'}->{'cmdname'}})) {
    return ($current->{'parent'});
  }
  return undef;
}

# return the parent if in a item_line command, @*table
sub _item_line_parent($)
{
  my $current = shift;
  if ($current->{'cmdname'} and ($current->{'cmdname'} eq 'item'
       or $current->{'cmdname'} eq 'itemx')) {
      $current = $current->{'parent'}->{'parent'};
  } elsif ($current->{'type'} and $current->{'type'} eq 'before_item'
            and $current->{'parent'}) {
    $current = $current->{'parent'};
  }
  return $current if ($current->{'cmdname'} 
                       and $item_line_commands{$current->{'cmdname'}});
  return undef;
}

# return the parent if in a multitable
sub _item_multitable_parent($)
{
  my $current = shift;
  if (($current->{'cmdname'} and ($current->{'cmdname'} eq 'headitem'
       or $current->{'cmdname'} eq 'item' or $current->{'cmdname'} eq 'tab'))
      and $current->{'parent'} and $current->{'parent'}->{'parent'}) {
    $current = $current->{'parent'}->{'parent'};
  } elsif ($current->{'type'} and $current->{'type'} eq 'before_item'
            and $current->{'parent'}) {
    $current = $current->{'parent'};
  }
  return $current if ($current->{'cmdname'} 
                       and $current->{'cmdname'} eq 'multitable');
  return undef;
}

# returns next text fragment, be it pending from a macro expansion or 
# text or file
sub _next_text($$)
{
  my $self = shift;
  my $line_nr = shift;
 
  while (@{$self->{'input'}}) {
    my $current = $self->{'input'}->[0];
    if (@{$current->{'pending'}}) {
      my $new_text = shift @{$current->{'pending'}};
      if ($new_text->[1] and $new_text->[1]->{'end_macro'}) {
        delete $new_text->[1]->{'end_macro'};
        my $top_macro = shift @{$self->{'macro_stack'}};
        print STDERR "SHIFT MACRO_STACK(@{$self->{'macro_stack'}}): $top_macro->{'args'}->[0]->{'text'}\n"
          if ($self->{'DEBUG'});
      }
      return ($new_text->[0], $new_text->[1]);
    } elsif ($current->{'fh'}) {
      my $fh = $current->{'fh'};
      my $line = <$fh>;
      if (defined($line)) {
        $line =~ s/\x{7F}.*\s*//;
        $current->{'line_nr'}++;
        return ($line, {'line_nr' => $current->{'line_nr'}, 
                        'file_name' => $current->{'name'},
                        'macro' => ''});
      }
    }
    shift(@{$self->{'input'}});
  }

  return (undef, $line_nr);
}

# collect text and line numbers until an end of line is found.
sub _new_line ($$)
{
  my $self = shift;
  my $line_nr = shift;
  my $new_line = '';

  while (1) {
    my $new_text;
    ($new_text, $line_nr) = _next_text($self, $line_nr);
    if (!defined($new_text)) {
      $new_line = undef if ($new_line eq '');
      last;
    }

    $new_line .= $new_text;

    my $chomped_text = $new_text;
    last if chomp($chomped_text);
  }
  return ($new_line, $line_nr);
}

sub _expand_macro_arguments($$$$)
{
  my $self = shift;
  my $macro = shift;
  my $line = shift;
  my $line_nr = shift;
  my $braces_level = 1;
  my $arguments = [ '' ];
  my $arg_nr = 0;
  my $args_total = scalar(@{$macro->{'args'}}) -1;
  my $name = $macro->{'args'}->[0]->{'text'};

  my $line_nr_orig = $line_nr;

  while (1) {
    if ($line =~ s/([^\\{},]*)([\\{},])//) {
      my $separator = $2;
      $arguments->[-1] .= $1;
      if ($separator eq '\\') {
        if ($line =~ s/^(.)//) {
          my $protected_char = $1;
          if ($protected_char !~ /[\\{},]/) {
            $arguments->[-1] .= '\\';
          }
          $arguments->[-1] .= $protected_char;
          
          print STDERR "MACRO ARG: $separator: $protected_char\n" if ($self->{'DEBUG'});
        } else {
          $arguments->[-1] .= '\\';
          print STDERR "MACRO ARG: $separator\n" if ($self->{'DEBUG'});
        }
      } elsif ($separator eq ',') {
        if ($braces_level == 1) {
          if (scalar(@$arguments) < $args_total) {
            push @$arguments, '';
            $line =~ s/^\s*//;
            print STDERR "MACRO NEW ARG\n" if ($self->{'DEBUG'});
          } else {
            # implicit quoting when there is one argument.
            if ($args_total != 1) {
              $self->line_error (sprintf($self->__("Macro `%s' called with too many args"), 
                                $name), $line_nr);
            }
            $arguments->[-1] .= ',';
          }
        } else {
          $arguments->[-1] .= ',';
        }
      } elsif ($separator eq '}') {
        $braces_level--;
        last if ($braces_level == 0);
        $arguments->[-1] .= $separator;
      } elsif ($separator eq '{') {
        $braces_level++;
        $arguments->[-1] .= $separator;
      }
    } else {
      print STDERR "MACRO ARG end of line\n" if ($self->{'DEBUG'});
      $arguments->[-1] .= $line;

      ($line, $line_nr) = _new_line($self, $line_nr);
      if (!defined($line)) {
        $self->line_error (sprintf($self->__("\@%s missing close brace"), 
           $name), $line_nr_orig);
        return ($arguments, "\n", $line_nr);
      }
    }
  }
  if ($args_total == 0 and $arguments->[0] =~ /\S/) {
    $self->line_error (sprintf($self->__("Macro `%s' declared without argument called with an argument"), 
                                $name), $line_nr);
  }
  print STDERR "END MACRO ARGS EXPANSION(".scalar(@$arguments)."): ".
                  join("|\n", @$arguments) ."|\n" if ($self->{'DEBUG'});
  return ($arguments, $line, $line_nr);
}

sub _expand_macro_body($$$$) {
  my $self = shift;
  my $macro = shift;
  my $args = shift;
  my $line_nr = shift;

  my $macrobody = $macro->{'extra'}->{'macrobody'};
  my $args_total = scalar(@{$macro->{'args'}}) -1;
  my $args_index = $macro->{'extra'}->{'args_index'};

  my $i;
  for ($i=0; $i<=$args_total; $i++) {
    $args->[$i] = "" unless (defined($args->[$i]));
  }

  my $result = '';
  while ($macrobody ne '') {
    if ($macrobody =~ s/^([^\\]*)\\//o) {
      $result .= $1;
      if ($macrobody =~ s/^\\//) {
        $result .= '\\';
      } elsif ($macrobody =~ s/^([^\\]*)\\//) {
        my $arg = $1;
        if (defined($args_index->{$arg})) {
          $result .= $args->[$args_index->{$arg}];
        } else {
          $self->line_error (sprintf($self->__("\\ in \@%s expansion followed `%s' instead of parameter name or \\"), 
                             $macro->{'args'}->[0]->{'text'}, $arg), $line_nr);
          $result .= '\\' . $arg;
        }
      }
      next;
    }
    $result .= $macrobody;
    last;
  }
  return $result;
}

# each time a new line appeared, a container is opened to hold the text
# consisting only of spaces.  This container is removed here, typically
# this is called when non-space happens on a line.
sub _abort_empty_line($$;$)
{
  my $self = shift;
  my $current = shift;
  my $additional_text = shift;
  $additional_text = '' if (!defined($additional_text));
  if ($current->{'contents'} and @{$current->{'contents'}} 
       and $current->{'contents'}->[-1]->{'type'}
       and ($current->{'contents'}->[-1]->{'type'} eq 'empty_line' 
           or $current->{'contents'}->[-1]->{'type'} eq 'empty_spaces_before_argument'
           or $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command'
           or $current->{'contents'}->[-1]->{'type'} eq 'empty_spaces_after_close_brace')) {
    print STDERR "ABORT EMPTY additional text |$additional_text|, current |$current->{'contents'}->[-1]->{'text'}|\n" if ($self->{'DEBUG'});
    $current->{'contents'}->[-1]->{'text'} .= $additional_text;
    if ($current->{'contents'}->[-1]->{'text'} eq '') {
      pop @{$current->{'contents'}} 
    } elsif ($current->{'contents'}->[-1]->{'type'} eq 'empty_line') {
      # exactly the same condition than to begin a paragraph
      if ((!$current->{'type'} or $type_with_paragraph{$current->{'type'}})
         and !$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
        $current->{'contents'}->[-1]->{'type'} = 'empty_spaces_before_paragraph';
      } else { 
        delete $current->{'contents'}->[-1]->{'type'};
      }
    } elsif ($current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command') {
      $current->{'contents'}->[-1]->{'type'} = 'empty_spaces_after_command';
    }
    return 1;
  }
  return 0;
}

# isolate last space in a command to help expansion disregard unuseful spaces.
sub _isolate_last_space($$;$)
{
  my $self = shift;
  my $current = shift;
  my $type = shift;
  $type = 'spaces_at_end' if (!defined($type));
  if ($current->{'contents'} and @{$current->{'contents'}}) {
    my $index = -1;
    $index = -2 
      if (scalar(@{$current->{'contents'}}) > 1 
        and $current->{'contents'}->[-1]->{'cmdname'}
        and $self->{'misc_commands'}->{$current->{'contents'}->[-1]->{'cmdname'}});
    if (defined($current->{'contents'}->[$index]->{'text'}) 
        and !$current->{'contents'}->[$index]->{'type'}
        and $current->{'contents'}->[$index]->{'text'} =~ /\s+$/) {
      if ($current->{'contents'}->[$index]->{'text'} !~ /\S/) {
        $current->{'contents'}->[$index]->{'type'} = $type;
      } else {
        $current->{'contents'}->[$index]->{'text'} =~ s/(\s+)$//;
        my $spaces = $1;
        my $new_spaces = { 'text' => $spaces, 'parent' => $current,
                           'type' => $type };
        if ($index == -1) {
          push @{$current->{'contents'}}, $new_spaces;
        } else {
          splice (@{$current->{'contents'}}, $index+1, 0, $new_spaces);
        }
      }
    }
  }
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


# retrieve a leading manual name in parentheses, if there is one.
sub _parse_node_manual($)
{
  my $node = shift;
  my @contents = @{$node->{'contents'}};
  _trim_spaces_comment_from_content(\@contents);

  my $manual;
  my $result;
#print STDERR "RRR $contents[0] and $contents[0]->{'text'} \n";
  if ($contents[0] and $contents[0]->{'text'} and $contents[0]->{'text'} =~ /^\(/) {
    if ($contents[0]->{'text'} !~ /^\($/) {
      my $brace = shift @contents;
      my $brace_text = $brace->{'text'};
      $brace_text =~ s/^\(//;
      unshift @contents, { 'text' => $brace_text, 'type' => $brace->{'type'},
                           'parent' => $brace->{'parent'} } if $brace_text ne '';
    } else {
      shift @contents;
    }
    while(@contents) {
      my $content = shift @contents;
      if (!defined($content->{'text'}) or $content->{'text'} !~ /\)/) {
        push @$manual, $content;
      } else {
        my $brace_text = $content->{'text'};
        my ($before, $after) = split (/\)/, $brace_text, 2);
        push @$manual, { 'text' => $before, 'parent' => $content->{'parent'} }
            if ($before ne '');
        $after =~ s/^\s*//;
        unshift @contents,  { 'text' => $after, 'parent' => $content->{'parent'} }
            if ($after ne '');
        last;
      }
    }
    $result->{'manual_content'} = $manual if (defined($manual));
  }
  if (@contents) {
    $result->{'node_content'} = \@contents;
    $result->{'normalized'} =
      Texinfo::Convert::NodeNameNormalization::normalize_node({'contents' => \@contents});
  }
  return $result;
}

sub _parse_float_type($)
{
  my $current = shift;
  if (@{$current->{'args'}}) {
    my @type_contents = @{$current->{'args'}->[0]->{'contents'}};
    _trim_spaces_comment_from_content(\@type_contents);
    if (@type_contents) {
      my $normalized 
        = Texinfo::Convert::NodeNameNormalization::normalize_node(
                                               {'contents' => \@type_contents});
      $current->{'extra'}->{'type'}->{'content'} = \@type_contents;
      if ($normalized =~ /[^-]/) {
        $current->{'extra'}->{'type'}->{'normalized'} = $normalized;
        return 1;
      }
    }
  }
  $current->{'extra'}->{'type'}->{'normalized'} = '';
  return 0;
}

# used for definition line parsing
sub _next_bracketed_or_word($$)
{
  my $self = shift;
  my $contents = shift;
  return undef if (!scalar(@{$contents}));
  my $spaces;
  $spaces = shift @{$contents} if (defined($contents->[0]->{'text'}) and 
                                     $contents->[0]->{'text'} !~ /\S/);
  $spaces = undef if (!$spaces->{'text'});
  $spaces->{'type'} = 'spaces' if (defined($spaces));
  return undef if (!scalar(@{$contents}));

  #print STDERR "BEFORE PROCESSING ".Texinfo::Convert::Texinfo::convert({'contents' => $contents});
  if ($contents->[0]->{'type'} and $contents->[0]->{'type'} eq 'bracketed') {
    #print STDERR "Return bracketed\n";
    my $bracketed = shift @{$contents};
    # FIXME don't modify type here?
    # return ($spaces, $bracketed);
    $self->_isolate_last_space($bracketed, 'empty_space_at_end_def_bracketed');
    return ($spaces, { 'contents' => $bracketed->{'contents'},
                       'parent' => $bracketed->{'parent'},
                       'type' => 'bracketed_def_content', });
  } elsif ($contents->[0]->{'cmdname'}) {
    #print STDERR "Return command $contents->[0]->{'cmdname'}\n";
    return ($spaces, shift @{$contents});
  } else {
    #print STDERR "Process $contents->[0]->{'text'}\n";
    $contents->[0]->{'text'} =~ s/^(\s*)//;
    my $space_text = $1;
    $spaces = {'text' => $space_text, 'type' => 'spaces'} if ($space_text);
    $contents->[0]->{'text'} =~ s/^(\S+)//;
    shift @{$contents} if ($contents->[0]->{'text'} eq '');
    return ($spaces, {'text' => $1});
  }
}

# definition line parsing
sub _parse_def ($$$)
{
  my $self = shift;
  my $command = shift;
  my $contents = shift;
  
  my @contents = @$contents;
  shift @contents if ($contents[0] and $contents[0]->{'type'}
                    and $contents[0]->{'type'} eq 'empty_spaces_after_command');
  if ($def_aliases{$command}) {
    unshift @contents, @{$def_prepended_content{$command}};
    $command = $def_aliases{$command};
  }
  foreach (my $i = 0; $i < scalar(@contents); $i++) {
    # copy, to avoid changing the original
    $contents[$i] = {'text' => $contents[$i]->{'text'}} 
       if (defined($contents[$i]->{'text'}));
  }
  my @result;
  my @args = @{$def_map{$command}};
  my $arg_type;
  # Even when $arg_type is not set, that is for def* that is not documented
  # to take args, everything is as is arg_type was set to arg.
  $arg_type = pop @args if ($args[-1] eq 'arg' or $args[-1] eq 'argtype');
  foreach my $arg (@args) {
    #print STDERR "$command $arg"._print_current($contents[0]);
    #foreach my $content (@contents) {print STDERR " "._print_current($content)};
    #print STDERR " contents ->".Texinfo::Convert::Texinfo::convert ({'contents' => \@contents});
    my ($spaces, $next) = $self->_next_bracketed_or_word(\@contents);
    last if (!defined($next));
    #print STDERR "NEXT ".Texinfo::Convert::Texinfo::convert($next)."\n";
    push @result, ['spaces', $spaces] if (defined($spaces));
    push @result, [$arg, $next];
  }

  my @args_results;
  while (@contents) {
    my ($spaces, $next) = $self->_next_bracketed_or_word(\@contents);
    push @args_results, ['spaces', $spaces] if (defined($spaces));
    last if (!defined($next));
    if (defined($next->{'text'})) {
      while (1) {
        if ($next->{'text'} =~ s/^([^\[\](),]+)//) {
          push @args_results, ['arg', {'text' => $1}];
        } elsif ($next->{'text'} =~ s/^([\[\](),])//) {
          push @args_results, ['delimiter', 
                      {'text' => $1, 'type' => 'delimiter'}];
        } else {
          last;
        }
      }
    } else {
      push @args_results, [ 'arg', $next ];
    }
  }
  if ($arg_type and $arg_type eq 'argtype') {
    my $next_is_type = 1;
    foreach my $arg(@args_results) {
      if ($arg->[0] eq 'spaces') {
      } elsif ($arg->[0] eq 'delimiter') {
        $next_is_type = 1;
      } elsif ($arg->[1]->{'cmdname'} and $arg->[1]->{'cmdname'} ne 'code') {
        $next_is_type = 1;
      } elsif ($next_is_type) {
        $arg->[0] = 'typearg';
        $next_is_type = 0;
      } else {
        $next_is_type = 1;
      }
    }
  }
  return [@result, @args_results];
}

# register a label, that is something that may be the target of a reference
# and must be unique in the document.  Corresponds with @node, @anchor and 
# @float second arg.
sub _register_label($$$$)
{
  my $self = shift;
  my $current = shift;
  my $label = shift;
  my $line_nr = shift;
  my $normalized = $label->{'normalized'};
  if ($self->{'labels'}->{$normalized}) {
    $self->line_error(sprintf($self->__("\@%s `%s' previously defined"), 
                         $current->{'cmdname'}, 
                   Texinfo::Convert::Texinfo::convert({'contents' => 
                                                $label->{'node_content'}})), 
                           $line_nr);
    $self->line_error(sprintf($self->__("here is the previous definition as \@%s"),
                               $self->{'labels'}->{$normalized}->{'cmdname'}),
                       $self->{'labels'}->{$normalized}->{'line_nr'}, 1);
    return 0;
  } else {
    $current->{'extra'}->{'normalized'} = $normalized;
    $current->{'extra'}->{'node_content'} = $label->{'node_content'};
    $self->{'labels'}->{$normalized} = $current;
    return 1;
  }
}

sub _non_bracketed_contents($)
{
  my $current = shift;
  if ($current->{'type'} and $current->{'type'} eq 'bracketed') {
    my $new = {};
    $new->{'contents'} = $current->{'contents'} if ($current->{'parent'});
    $new->{'parent'} = $current->{'parent'} if ($current->{'parent'});
    return $new;
  } else {
    return $current;
  }
}

# store an index entry.
# $current is the command element.
# $content holds the actual content.
# for index entries and v|ftable items, it is the index entry content, 
# for def, it is the parsed arguments, based on the definition line 
# arguments.
sub _enter_index_entry($$$$$$)
{
  my $self = shift;
  my $command = shift;
  my $current = shift;
  my $content = shift;
  my $content_normalized = shift;
  my $line_nr = shift;

  $content_normalized = $content if (!defined($content_normalized));

  my $prefix = $self->{'command_index_prefix'}->{$command};
  my $index_name = $self->{'prefix_to_index_name'}->{$prefix};
  my $number = (defined($self->{'index_entries'}->{$index_name})
                 ? (scalar(@{$self->{'index_entries'}->{$index_name}}) + 1)
                   : 1);
  my $index_entry = { 'index_name'           => $index_name,
                      'index_at_command'     => $command,
                      'index_prefix'         => $prefix,
                      'content'              => $content,
                      'content_normalized'   => $content_normalized,
                      'command'              => $current,
                      'number'               => $number,
                    };
  if (@{$self->{'regions_stack'}}) {
    $index_entry->{'region'} = $self->{'regions_stack'}->[-1];
  } elsif ($self->{'current_node'}) {
    $index_entry->{'node'} = $self->{'current_node'};
  } elsif (!$self->{'current_section'}) {
    $self->line_error (sprintf($self->__("Entry for index `%s' outside of any node"), 
                               $index_name), $line_nr);
  }
  #print STDERR "INDEX ENTRY \@$command->{'cmdname'} $index_name($number)\n";
  push @{$self->{'index_entries'}->{$index_name}}, $index_entry;
  $current->{'extra'}->{'index_entry'} = $index_entry;
}

# This is always called at command closing.
sub _remove_empty_content_arguments($)
{
  my $current = shift;
  my $type;
  if ($current->{'extra'}) {
    if ($current->{'extra'}->{'block_command_line_contents'}) {
      $type = 'block_command_line_contents';
    } elsif ($current->{'extra'}->{'brace_command_contents'}) {
      $type = 'brace_command_contents';
    }
  }
  if ($type) {
    while (@{$current->{'extra'}->{$type}} 
           and not defined($current->{'extra'}->{$type}->[-1])) {
      pop @{$current->{'extra'}->{$type}}; 
    }
    delete $current->{'extra'}->{$type} if (!@{$current->{'extra'}->{$type}});
    delete $current->{'extra'} if (!keys(%{$current->{'extra'}}));
  }
}

# close constructs and do stuff at end of line (or end of the document)
sub _end_line($$$);
sub _end_line($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  my $current_old = $current;

  my $included_file = 0;

  # a line consisting only of spaces.
  if ($current->{'contents'} and @{$current->{'contents'}} 
      and $current->{'contents'}->[-1]->{'type'} 
      and $current->{'contents'}->[-1]->{'type'} eq 'empty_line') {
    print STDERR "END EMPTY LINE\n" if ($self->{'DEBUG'});
    if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
      my $empty_line = pop @{$current->{'contents'}};
      $current = _end_paragraph($self, $current, $line_nr);
      push @{$current->{'contents'}}, $empty_line;
      $empty_line->{'parent'} = $current;
    } elsif (($current->{'type'} 
              # FIXME remove this condition
               and $current->{'type'} eq 'menu_entry_description')
              or ($current->{'type'}
               and $current->{'type'} eq 'preformatted'
               and $current->{'parent'}->{'type'}
               and $current->{'parent'}->{'type'} eq 'menu_entry_description'))  {
      my $empty_line = pop @{$current->{'contents'}};
      if ($current->{'type'} eq 'preformatted') {
        my $empty_preformatted = (!@{$current->{'contents'}});
        $current = $current->{'parent'};
        pop @{$current->{'contents'}} if ($empty_preformatted);
      }
      my $context = pop @{$self->{'context_stack'}};
      warn "BUG: empty line after menu_entry_description bad context: $context"
        if ($context ne 'preformatted');
      
      # first parent is menu_entry
      $current = $current->{'parent'}->{'parent'};
      
      push @{$current->{'contents'}}, { 'type' => 'menu_comment',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      push @{$current->{'contents'}}, { 'type' => 'preformatted',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      push @{$current->{'contents'}}, { 'type' => 'after_description_line', 
                                        'text' => $empty_line->{'text'},
                                        'parent' => $current };
      push @{$self->{'context_stack'}}, 'preformatted';
      print STDERR "MENU: END DESCRIPTION, OPEN COMMENT\n" if ($self->{'DEBUG'});
    } elsif (!$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
            # FIXME remove this if an empty line in a brace command
            # is acceptable
      $current = _end_paragraph($self, $current, $line_nr);
    }

  # end of a menu line.
  } elsif ($current->{'type'} 
    and ($current->{'type'} eq 'menu_entry_name'
     or $current->{'type'} eq 'menu_entry_node')) {
    my $empty_menu_entry_node = 0;
    my $end_comment;
    if ($current->{'type'} eq 'menu_entry_node') {
      if (@{$current->{'contents'}} 
          and $current->{'contents'}->[-1]->{'cmdname'}
          and ($current->{'contents'}->[-1]->{'cmdname'} eq 'c' 
            or $current->{'contents'}->[-1]->{'cmdname'} eq 'comment')) {
        $end_comment = pop @{$current->{'contents'}};
      }
      if (!@{$current->{'contents'}} 
           # empty if only the end of line or spaces
           or (@{$current->{'contents'}} == 1 
               and defined($current->{'contents'}->[-1]->{'text'})
               and $current->{'contents'}->[-1]->{'text'} !~ /\S/)) {
        $empty_menu_entry_node = 1;
        push @{$current->{'contents'}}, $end_comment if ($end_comment);
      }
    }
    # we abort the menu entry if there is no node name
    if ($empty_menu_entry_node 
          or $current->{'type'} eq 'menu_entry_name') {
      my $description_or_menu_comment;
      print STDERR "FINALLY NOT MENU ENTRY\n" if ($self->{'DEBUG'});
      my $menu = $current->{'parent'}->{'parent'};
      my $menu_entry = pop @{$menu->{'contents'}};
      if (@{$menu->{'contents'}} and $menu->{'contents'}->[-1]->{'type'}
         and $menu->{'contents'}->[-1]->{'type'} eq 'menu_entry') {
        my $entry = $menu->{'contents'}->[-1];
        my $description;
        foreach my $entry_element (reverse(@{$entry->{'args'}})) {
          if ($entry_element->{'type'} eq 'menu_entry_description') {
            $description = $entry_element;
            last;
          }
        }
        if ($description) {
          $description_or_menu_comment = $description;
        } else {
          # Normally this cannot happen
          warn "BUG: No description in menu_entry";
          push @{$entry->{'args'}}, {'type' => 'menu_entry_description',
                                     'parent' => $entry,
                                     'contents' => [] };
          $description_or_menu_comment = $entry->{'args'}->[-1];
        }
      } elsif (@{$menu->{'contents'}} and $menu->{'contents'}->[-1]->{'type'}
         and $menu->{'contents'}->[-1]->{'type'} eq 'menu_comment') {
        $description_or_menu_comment = $menu->{'contents'}->[-1];
      }
      if ($description_or_menu_comment) {
        $current = $description_or_menu_comment;
        if ($current->{'contents'}->[-1] and $current->{'contents'}->[-1]->{'type'}
          and $current->{'contents'}->[-1]->{'type'} eq 'preformatted') {
          $current = $current->{'contents'}->[-1];
        } else {
          # FIXME verify that this may happen
          #push @{$self->{'context_stack'}}, 'preformatted';
          push @{$current->{'contents'}}, {'type' => 'preformatted',
                                    'parent' => $current,
                                    'contents' => [] };
          $current = $current->{'contents'}->[-1];
        }
        push @{$self->{'context_stack'}}, 'preformatted';
      } else {
        #warn "BUG: no menu_comment nor menu_entry in menu";
        push @{$menu->{'contents'}}, {'type' => 'menu_comment',
                                    'parent' => $menu,
                                    'contents' => [] };
        $current = $menu->{'contents'}->[-1];
        push @{$current->{'contents'}}, {'type' => 'preformatted',
                                  'parent' => $current,
                                  'contents' => [] };
        $current = $current->{'contents'}->[-1];
        push @{$self->{'context_stack'}}, 'preformatted';
        print STDERR "THEN MENU_COMMENT OPEN\n" if ($self->{'DEBUG'});
      }
      while (@{$menu_entry->{'args'}}) {
        my $arg = shift @{$menu_entry->{'args'}};
        if (defined($arg->{'text'})) {
          $current = _merge_text ($self, $current, $arg->{'text'});
        } else {
          while (@{$arg->{'contents'}}) {
            my $content = shift @{$arg->{'contents'}};
            if (defined($content->{'text'})) {
              $current = _merge_text ($self, $current, 
                                    $content->{'text'});
              $content = undef;
            } else {
              $content->{'parent'} = $current;
              push @{$current->{'contents'}}, $content;
            }
          }
        }
        $arg = undef;
      }
      #push @{$self->{'context_stack'}}, 'preformatted';
      # MENU_COMMENT open
      $menu_entry = undef;
    } else {
      print STDERR "MENU ENTRY END LINE\n" if ($self->{'DEBUG'});
      $current = $current->{'parent'};
      $current = _enter_menu_entry_node($self, $current, $line_nr);
      if (defined($end_comment)) {
        $end_comment->{'parent'} = $current;
        push @{$current->{'contents'}}, $end_comment;
      }
    }
  # def line
  } elsif ($current->{'parent'}
            and $current->{'parent'}->{'type'}
            and $current->{'parent'}->{'type'} eq 'def_line') {
    my $def_context = pop @{$self->{'context_stack'}};
    die "BUG: def_context $def_context "._print_current($current) 
      if ($def_context ne 'def');
    my $def_command = $current->{'parent'}->{'extra'}->{'def_command'};
    my $arguments = $self->_parse_def ($def_command, 
                                       $current->{'contents'});
    if (scalar(@$arguments)) {
      $current->{'parent'}->{'extra'}->{'def_args'} = $arguments;
      my $def_parsed_hash;
      foreach my $arg (@$arguments) {
        die if (!defined($arg->[0]));
        last if ($arg->[0] eq 'arg' or $arg->[0] eq 'typearg' 
                  or $arg->[0] eq 'delimiter');
        next if ($arg->[0] eq 'spaces');
        # change of type is done in _parse_def.
        #if ($arg->[1]->{'type'} and $arg->[1]->{'type'} eq 'bracketed') {
        #  $def_parsed_hash->{$arg->[0]} = { 'contents' => $arg->[1]->{'contents'},
        #                                    'type' => 'bracketed_def_content',
        #                                    'parent' => $arg->[1]->{'parent'}};
        #} else {
        #  $def_parsed_hash->{$arg->[0]} = $arg->[1];
        #}
        $def_parsed_hash->{$arg->[0]} = $arg->[1];
      }
      $current->{'parent'}->{'extra'}->{'def_parsed_hash'} = $def_parsed_hash;
      # do an standard index entry tree
      my $index_entry = $def_parsed_hash->{'name'};
      if (defined($index_entry)) {
        my $index_contents_normalized;
        if ($def_parsed_hash->{'class'}) {
          if ($command_index_prefix{$def_command} eq 'f') {
            $index_entry = $self->gdt('{name} on {class}', 
                                  {'name' => $def_parsed_hash->{'name'},
                                   'class' => $def_parsed_hash->{'class'}});
           $index_contents_normalized
             = [_non_bracketed_contents($def_parsed_hash->{'name'}),
                { 'text' => ' on '},
                _non_bracketed_contents($def_parsed_hash->{'class'})];
          } elsif ($command_index_prefix{$def_command} eq 'v'
                  and $def_command ne 'defcv') {
            $index_entry = $self->gdt('{name} of {class}', 
                                     {'name' => $def_parsed_hash->{'name'},
                                     'class' => $def_parsed_hash->{'class'}});
            $index_contents_normalized
              = [_non_bracketed_contents($def_parsed_hash->{'name'}),
                 { 'text' => ' of '},
                 _non_bracketed_contents($def_parsed_hash->{'class'})];
          }
        }
        $index_contents_normalized = [$index_entry]
          if (!defined($index_contents_normalized));
        my $index_contents;
        # 'root_line' is the container returned by gdt.
        if ($index_entry->{'type'} and $index_entry->{'type'} eq 'root_line') {
          $index_contents = $index_entry->{'contents'};
        } else {
          $index_contents = [$index_entry];
        }
        _enter_index_entry($self, 
          $current->{'parent'}->{'extra'}->{'original_def_cmdname'},
          $current->{'parent'}, $index_contents, 
          $index_contents_normalized, $line_nr);
      } else {
        $self->line_warn (sprintf($self->__('Missing name for @%s'), 
         $current->{'parent'}->{'extra'}->{'original_def_cmdname'}), $line_nr); 
      }
    } else {
      $self->line_warn (sprintf($self->__('Missing category for @%s'),
         $current->{'parent'}->{'extra'}->{'original_def_cmdname'}), $line_nr); 
    }
    $current = $current->{'parent'}->{'parent'};
    $current = $self->_begin_preformatted($current);

  # other block command lines
  } elsif ($current->{'type'}
            and $current->{'type'} eq 'block_line_arg') {
    my $empty_text;
    my $context = pop @{$self->{'context_stack'}};
    print STDERR "BUG: $context in block_line_arg ne line\n" 
       if ($context ne 'line');
    # @multitable args
    if ($current->{'parent'}->{'cmdname'}
               and $current->{'parent'}->{'cmdname'} eq 'multitable') {
      # parse the prototypes and put them in a special arg
      my @prototype_row;
      foreach my $content (@{$current->{'contents'}}) {
        if ($content->{'type'} and $content->{'type'} eq 'bracketed') {
          push @prototype_row, { 'contents' => $content->{'contents'},
                                 'parent' => $content->{'parent'},
                                 'type' => 'bracketed_multitable_prototype'};
        } elsif ($content->{'text'}) {
          if ($content->{'text'} =~ /\S/) {
            foreach my $prototype(split /\s+/, $content->{'text'}) {
              push @prototype_row, { 'text' => $prototype, 
                            'type' => 'row_prototype' } unless ($prototype eq '');
            }
          }
        } else {
          if (!$content->{'cmdname'}) { 
            $self->line_warn (sprintf($self->
                   __("Unexpected argument on \@%s line: %s"), 
                   $current->{'cmdname'}, 
         Texinfo::Convert::Texinfo::convert({ $content->{'contents'} })), 
                                            $line_nr);
          } elsif ($content->{'cmdname'} eq 'c' 
                   or $content->{'cmdname'} eq 'comment') {
          } else {
            push @prototype_row, $content;
          }
        }
      }
      
      my $multitable = $current->{'parent'};
      $multitable->{'extra'}->{'max_columns'} = scalar(@prototype_row);
      if (!scalar(@prototype_row)) {
        $self->line_warn ($self->__("empty multitable"), $line_nr);
      }
      $multitable->{'extra'}->{'prototypes'} = \@prototype_row;

    } else {
      $self->_isolate_last_space($current, 'space_at_end_block_command');
      $self->_register_command_arg($current, 'block_command_line_contents');
    } 
    # @float args
    if ($current->{'parent'}->{'cmdname'}
               and $current->{'parent'}->{'cmdname'} eq 'float') {
      my $float = $current->{'parent'};
      $float->{'line_nr'} = $line_nr;
      my $type = '';
      if (@{$float->{'args'}}) {
        if ($float->{'args'}->[1]) {
          my $float_label = _parse_node_manual($float->{'args'}->[1]);
          _check_internal_node($self, $float_label, $line_nr);
          if (defined($float_label) and $float_label->{'node_content'}
             and $float_label->{'normalized'} =~ /[^-]/) {
            _register_label($self, $float, $float_label, $line_nr);
          }
        }
        _parse_float_type ($float);
        $type = $float->{'extra'}->{'type'}->{'normalized'};
      }
      push @{$self->{'floats'}->{$type}}, $float;
      $float->{'float_section'} = $self->{'current_section'} 
        if (defined($self->{'current_section'}));
      #$float->{'float_node'} = $self->{'current_node'} 
      #  if (defined($self->{'current_node'}));
    }
    $current = $current->{'parent'};
    delete $current->{'remaining_args'};
    # don't consider empty argument of block @-commands as argument,
    # reparent them as contents
    if ($current->{'args'}->[0]->{'contents'}->[0] 
         and $current->{'args'}->[0]->{'contents'}->[0]->{'type'}
         and $current->{'args'}->[0]->{'contents'}->[0]->{'type'} eq 'empty_line_after_command')
    {
      my $empty_text = $current->{'args'}->[0]->{'contents'}->[0];
      $empty_text->{'parent'} = $current;
      unshift @{$current->{'contents'}}, $empty_text;
      delete $current->{'args'};
    }
    # Additionally, remove empty arguments as far as possible
    _remove_empty_content_arguments($current);

    if ($current->{'cmdname'} 
          and $block_item_commands{$current->{'cmdname'}}) {
      if ($current->{'cmdname'} eq 'enumerate') {
        my $spec = 1;
        if ($current->{'extra'}->{'block_command_line_contents'}
            and defined($current->{'extra'}->{'block_command_line_contents'}->[0])) {
          if (scalar(@{$current->{'extra'}->{'block_command_line_contents'}->[0]}) > 1) {
            $self->line_error (sprintf($self->__("Superfluous argument to \@%s"),
               $current->{'cmdname'}), $line_nr);
          }
          my $arg = $current->{'extra'}->{'block_command_line_contents'}->[0]->[0];
          if (!defined($arg->{'text'}) or $arg->{'text'} !~ /^[[:alnum:]]$/) {
            $self->line_error (sprintf($self->
               __("Bad argument to \@%s"), $current->{'cmdname'}), $line_nr);
          } else {
            $spec = $arg->{'text'};
          }
        }
        $current->{'extra'}->{'enumerate_specification'} = $spec;
      } elsif ($item_line_commands{$current->{'cmdname'}}) {
        if (!$current->{'extra'} 
            or !$current->{'extra'}->{'command_as_argument'}) {
          $self->line_error(sprintf($self->__("%s requires an argument: the formatter for %citem"), 
                                    $current->{'cmdname'}, ord('@')), $line_nr);
        } elsif (!$brace_commands{$current->{'extra'}->{'command_as_argument'}->{'cmdname'}}
            and !$self->{'definfoenclose'}->{$current->{'extra'}->{'command_as_argument'}->{'cmdname'}}) {
          $self->line_error (sprintf($self->
             __("Command \@%s not accepting argument in brace should not be on \@%s line"), 
                                    $current->{'extra'}->{'command_as_argument'}->{'cmdname'},
                                    $current->{'cmdname'}),
                              $line_nr);
          delete $current->{'extra'}->{'command_as_argument'};
        }
      }
      # This code checks that the command_as_argument of the @itemize
      # is alone on the line, otherwise it is not an command_as_argument.
      if ($current->{'extra'}
          and $current->{'extra'}->{'command_as_argument'}
          and $current->{'cmdname'} eq 'itemize') {
        my @args = @{$current->{'args'}->[0]->{'contents'}};
        while (@args) {
          my $arg = shift @args;
          last if ($arg eq $current->{'extra'}->{'command_as_argument'});
        }
        while (@args) {
          my $arg = shift @args;
          if (!(($arg->{'cmdname'} 
               and ($arg->{'cmdname'} eq 'c' 
                     or $arg->{'cmdname'} eq 'comment'))
               or (defined($arg->{'text'}) and $arg->{'text'} !~ /\S/))) {
            #print STDERR " -> stop at "._print_current($arg)."\n";
            delete $current->{'extra'}->{'command_as_argument'}->{'type'};
            delete $current->{'extra'}->{'command_as_argument'};
            last;
          }
        }
      }
      if ($current->{'extra'}
          and $current->{'extra'}->{'command_as_argument'}
          and $accent_commands{$current->{'extra'}->{'command_as_argument'}->{'cmdname'}}
          and ($current->{'cmdname'} eq 'itemize' 
               or $item_line_commands{$current->{'cmdname'}})) {
        $self->line_warn (sprintf($self->
           __("Accent command `\@%s' not allowed as \@%s argument"),
              $current->{'extra'}->{'command_as_argument'}->{'cmdname'}, 
              $current->{'cmdname'}),
              $line_nr);
        delete $current->{'extra'}->{'command_as_argument'};
        delete $current->{'extra'}->{'block_command_line_contents'};
      }
      if (!$current->{'extra'}->{'block_command_line_contents'}
          and $current->{'cmdname'} eq 'itemize') {
        $current->{'extra'}->{'block_command_line_contents'} = [
          [ { 'cmdname' => 'bullet', 
            'type' => 'command_as_argument',
            'parent' => $current }
          ]
        ];
        $current->{'extra'}->{'command_as_argument'} = 
          $current->{'extra'}->{'block_command_line_contents'}->[0]->[0];
      } elsif ($item_line_commands{$current->{'cmdname'}} and
              ! $current->{'extra'}->{'command_as_argument'}) {
        $current->{'extra'}->{'block_command_line_contents'} = [
          [ { 'cmdname' => 'asis', 
            'type' => 'command_as_argument',
            'parent' => $current }
          ]
        ];
        $current->{'extra'}->{'command_as_argument'} = 
          $current->{'extra'}->{'block_command_line_contents'}->[0]->[0];
      }
      push @{$current->{'contents'}}, { 'type' => 'before_item',
         'contents' => [], 'parent', $current };
      $current = $current->{'contents'}->[-1];
    }
    if ($current->{'cmdname'} and $menu_commands{$current->{'cmdname'}}) {
      push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                       'parent' => $current,
                                       'contents' => [] };
      $current = $current->{'contents'}->[-1];
     #push @{$current->{'contents'}}, {'type' => 'preformatted',
     #                                 'parent' => $current,
     #                                 'contents' => [] };
     #$current = $current->{'contents'}->[-1];
      print STDERR "MENU_COMMENT OPEN\n" if ($self->{'DEBUG'});
      push @{$self->{'context_stack'}}, 'preformatted';
    }
    $current = $self->_begin_preformatted($current);

  # if we are after a @end verbatim, we must restart a preformatted if needed,
  # since there is no @end command explicitly associated to raw commands
  # it won't be done elsewhere.
  } elsif ($current->{'contents'}
           and $current->{'contents'}->[-1]
           and $current->{'contents'}->[-1]->{'type'}
           and $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command'
           and $current->{'contents'}->[-1]->{'extra'}
           and $current->{'contents'}->[-1]->{'extra'}->{'command'}->{'cmdname'} eq 'verbatim') {
    $current = $self->_begin_preformatted($current);
  # misc command line arguments
  } elsif ($current->{'type'} 
           and $current->{'type'} eq 'misc_line_arg') {
    my $context = pop @{$self->{'context_stack'}};
    print STDERR "BUG: $context in misc_line_arg ne line\n" 
       if ($context ne 'line');
    $self->_isolate_last_space($current);

    # first parent is the @command, second is the parent
    $current = $current->{'parent'};
    my $misc_cmd = $current;
    my $command = $current->{'cmdname'};
    my $end_command;
    print STDERR "MISC END \@$command\n" if ($self->{'DEBUG'});
    if ($self->{'misc_commands'}->{$command} =~ /^\d$/) {
      my $args = _parse_line_command_args ($self, $current, $line_nr);
      $current->{'extra'}->{'misc_args'} = $args if (defined($args));
    } elsif ($self->{'misc_commands'}->{$command} eq 'text') {
      my $text = Texinfo::Convert::Text::convert($current->{'args'}->[0],
                                                 {'code' => 1});
      if ($text eq '') {
        $self->line_warn (sprintf($self->__("\@%s missing argument"), 
           $command), $line_nr);
        $current->{'extra'}->{'missing_argument'} = 1;
      } else {
        $current->{'extra'}->{'text_arg'} = $text;
        if ($command eq 'end') {
          # REMACRO
          my $line = $text;
          if ($line =~ s/^([[:alnum:]][[:alnum:]-]+)//) {
            $end_command = $1;
            
            if (!exists $block_commands{$end_command}) {
              $self->line_warn (
                sprintf($self->__("Unknown \@end %s"), $end_command), $line_nr);
              #$current = _merge_text ($self, $current, "\@end $end_command");
              $end_command = undef;
            } else {
              print STDERR "END BLOCK $end_command\n" if ($self->{'DEBUG'});
              if ($block_commands{$end_command} eq 'conditional') {
                if (@{$self->{'conditionals_stack'}}
                  and $self->{'conditionals_stack'}->[-1] eq $end_command) {
                  pop @{$self->{'conditionals_stack'}};
                } else {
                  $self->line_error (sprintf($self->__("Unmatched `%c%s'"),
                       ord('@'), 'end'), $line_nr);
                  $end_command = undef;
                }
              }
              $current->{'extra'}->{'command_argument'} = $end_command
                if (defined($end_command));
            }
            if ($line =~ /\S/ and defined($end_command)) {
              my $texi_line 
                = Texinfo::Convert::Texinfo::convert($current->{'args'}->[0]);
              $texi_line =~ s/^\s*([[:alnum:]][[:alnum:]-]+)//;
              $self->line_error (sprintf($self->__("Superfluous argument to \@%s %s: %s"), 
                                 $command, $end_command, $texi_line), $line_nr);
            }
          } else {
            $self->line_error (sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
          }
        } elsif ($command eq 'include') {
          my $file = Texinfo::Common::locate_include_file($self, $text) ;
          if (defined($file)) {
            my $filehandle = do { local *FH };
            if (open ($filehandle, $file)) {
              $included_file = 1;
              binmode($filehandle, ":encoding($self->{'perl_encoding'})")
                if (defined($self->{'perl_encoding'}));
              print STDERR "Included $file($filehandle)\n" if ($self->{'DEBUG'});
              $included_file = 1;
              unshift @{$self->{'input'}}, { 
                'name' => $file,
                'line_nr' => 1,
                'pending' => [],
                'fh' => $filehandle };
            } else {
              $self->line_error (sprintf($self->__("\@%s: Cannot open %s: %s"), 
                 $command, $text, $!), $line_nr);
            }
          } else {
            $self->line_error (sprintf($self->__("\@%s: Cannot find %s"), 
               $command, $text), $line_nr);
          }
        } elsif ($command eq 'documentencoding') {
          my ($texinfo_encoding, $perl_encoding, $output_encoding)
            = Texinfo::Common::encoding_alias($text);
          $self->line_warn (sprintf($self->__("Encoding `%s' is not a canonical texinfo encoding"), 
                                   $text), $line_nr)
            if (!$texinfo_encoding);
          if (!$perl_encoding) {
            $self->line_warn (sprintf($self->__("unrecognized encoding name `%s'"), 
                       $text), $line_nr);
          } else {
            if ($output_encoding) {
              $current->{'extra'}->{'encoding_name'} = $output_encoding;
            }
            $current->{'extra'}->{'perl_encoding'} = $perl_encoding;

            if (!$self->{'set'}->{'perl_encoding'}) {
              $self->{'perl_encoding'} = $perl_encoding;
              $self->{'info'}->{'perl_encoding'} = $perl_encoding;
              $self->{'info'}->{'encoding_name'} = $output_encoding;
              print STDERR "Using encoding $perl_encoding\n" if ($self->{'DEBUG'});
              foreach my $input (@{$self->{'input'}}) {
                binmode($input->{'fh'}, ":encoding($perl_encoding)") if ($input->{'fh'});
              }
            }
          }
        } elsif ($command eq 'documentlanguage') {
          my @messages = Texinfo::Common::warn_unknown_language($text,
                                                          $self->{'gettext'});
          foreach my $message(@messages) {
            $self->line_warn ($message, $line_nr);
          }
          if (!$self->{'set'}->{'documentlanguage'}) {
            $self->{'documentlanguage'} = $text;
          }
        }
      }
    } elsif ($command eq 'node') {
      foreach my $arg (@{$current->{'args'}}) {
        my $node = _parse_node_manual($arg);
        push @{$current->{'extra'}->{'nodes_manuals'}}, $node;
      }
      if (_check_node_label($self, $current->{'extra'}->{'nodes_manuals'}->[0],
                        $command, $line_nr)) {
        if (_register_label($self, $current, 
                    $current->{'extra'}->{'nodes_manuals'}->[0], $line_nr)) {
          $self->{'current_node'} = $current;
          push @{$self->{'nodes'}}, $current;
        }
      }
    } elsif ($command eq 'listoffloats') {
      # Empty listoffloats is allowed
      _parse_float_type($current);
      #if (!_parse_float_type($current)) {
      #  $self->line_error (sprintf($self->__("\@%s missing argument"), 
      #     $command), $line_nr);
      #}
    # handle all the other 'line' commands.  Here just check that they 
    # have an argument and prepare contents without spaces.
    } else {
      my @contents = @{$current->{'args'}->[0]->{'contents'}};
      _trim_spaces_comment_from_content(\@contents);
      # empty @top is allowed
      if (!scalar(@contents) and $command ne 'top') {
        $self->line_error (sprintf($self->__("\@%s missing argument"), 
           $command), $line_nr);
        $current->{'extra'}->{'missing_argument'} = 1;
      } else {
        $current->{'extra'}->{'misc_content'} = \@contents;
        if (($command eq 'item' or $command eq 'itemx')
            and $self->{'command_index_prefix'}->{$current->{'parent'}->{'cmdname'}}) {
          _enter_index_entry($self, $current->{'parent'}->{'cmdname'}, $current,
                             $current->{'extra'}->{'misc_content'}, 
                             undef, $line_nr);
        } elsif ($self->{'command_index_prefix'}->{$current->{'cmdname'}}) {
          _enter_index_entry($self, $current->{'cmdname'}, $current,
                             $current->{'extra'}->{'misc_content'}, 
                             undef, $line_nr);
          $current->{'type'} = 'index_entry_command';
        }
      }
      if (defined($command_structuring_level{$command})) {
        $current->{'level'} = $command_structuring_level{$command};
      }
    }
    $current = $current->{'parent'};
    if ($end_command) {
      print STDERR "END COMMAND $end_command\n" if ($self->{'debug'});
      my $end = pop @{$current->{'contents'}};
      if ($block_commands{$end_command} ne 'conditional') {
        my $closed_command;
        ($closed_command, $current)
          = _close_commands($self, $current, $line_nr, $end_command);
        my $inline_copying;
        if ($closed_command) {
          $misc_cmd->{'extra'}->{'command'} = $closed_command;
          $closed_command->{'extra'}->{'end_command'} = $misc_cmd;
          $self->_close_command_cleanup($closed_command);
          $end->{'parent'} = $closed_command;

          # register @insertcopying as a macro if INLINE_INSERTCOPYING is set.
          if ($end_command eq 'copying' and $self->{'INLINE_INSERTCOPYING'}) {
            # remove the end of line following @copying.
            my @contents = @{$closed_command->{'contents'}};
            shift @contents if ($contents[0] and $contents[0]->{'type'}
               and ($contents[0]->{'type'} eq 'empty_line_after_command'
                    or $contents[0]->{'type'} eq 'empty_spaces_after_command'));
            # the macrobody is the @copying content converted to Texinfo.
            my $body = Texinfo::Convert::Texinfo::convert(
                         {'contents' => \@contents});
            
            #chomp ($body);
            $self->{'macros'}->{'insertcopying'} = {
                    'args' => [{'text' => 'insertcopying', 'type' => 'macro_name'}],
                    'cmdname' => 'macro',
                    'extra' => {'macrobody' => $body}
            };
            $inline_copying = 1;
            print STDERR "INLINE_INSERTCOPYING as macro\n" if ($self->{'debug'});
          }
          push @{$closed_command->{'contents'}}, $end;

          # closing a menu command, but still in a menu. Open a menu_comment
          if ($menu_commands{$closed_command->{'cmdname'}} 
              and $self->{'context_stack'}->[-1] eq 'menu') {
            print STDERR "CLOSE MENU but still in menu context\n"
              if ($self->{'DEBUG'});
            push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                             'parent' => $current,
                                             'contents' => [] };
            $current = $current->{'contents'}->[-1];
            push @{$self->{'context_stack'}}, 'preformatted';
          }
        }
        $current = $self->_begin_preformatted($current);
      }
    } else {
      $current = $self->_begin_preformatted($current) 
        if ($close_preformatted_commands{$command});
    }
    # if a file was included, remove completly the include file command.
    # Also ignore @setfilename in included file, as said in the manual.
    if ($included_file or ($command eq 'setfilename'
                           and scalar(@{$self->{'input'}}) > 1)) {
      pop @{$current->{'contents'}};
    # columnfractions 
    } elsif ($command eq 'columnfractions') {
      # in a multitable, we are in a block_line_arg
      if (!$current->{'parent'} or !$current->{'parent'}->{'cmdname'} 
                   or $current->{'parent'}->{'cmdname'} ne 'multitable') {
        $self->line_error (sprintf($self->__("\@%s only meaningful on a \@multitable line"), 
           $command), $line_nr);
      } else {
        # This is the multitable block_line_arg line context
        my $context = pop @{$self->{'context_stack'}};
          print STDERR "BUG: $context in misc_line_arg ne line\n" 
        if ($context ne 'line');
        $current = $current->{'parent'};
        $current->{'extra'}->{'max_columns'} = 0;
        if (defined($misc_cmd->{'extra'}->{'misc_args'})) {
          $current->{'extra'}->{'max_columns'} = 
            scalar(@{$misc_cmd->{'extra'}->{'misc_args'}});
          $current->{'extra'}->{'columnfractions'} = $misc_cmd->{'extra'}->{'misc_args'};
        }
        push @{$current->{'contents'}}, { 'type' => 'before_item',
           'contents' => [], 'parent', $current };
        $current = $current->{'contents'}->[-1];
      }
    } elsif ($root_commands{$command}) {
      $current = $current->{'contents'}->[-1];
      delete $current->{'remaining_args'};
      $current->{'contents'} = [];
      # associate the section (not part) with the current node.
      if ($command ne 'node' and $command ne 'part') {
        if ($self->{'current_node'}
           and !$self->{'current_node'}->{'extra'}->{'associated_section'}) {
          $self->{'current_node'}->{'extra'}->{'associated_section'} = $current;
          $current->{'extra'}->{'associated_node'} = $self->{'current_node'};
        }
        if ($self->{'current_parts'}) {
          # no @part associated with @top, but to other sectioning commands
          if ($current->{'cmdname'} ne 'top') {
            $current->{'extra'}->{'associated_part'} = $self->{'current_parts'}->[-1];
            foreach my $part (@{$self->{'current_parts'}}) {
              $part->{'extra'}->{'part_associated_section'} = $current;
            }
          }
          delete $self->{'current_parts'};
        }
        $self->{'current_section'} = $current;
      } elsif ($command eq 'part') {
        push @{$self->{'current_parts'}}, $current;
      }
    }
   # do that last in order to have the line processed if one of the above
   # case is also set.
  } elsif (
      $current->{'contents'} 
      and (scalar(@{$current->{'contents'}}) == 1
           and (($current->{'contents'}->[-1]->{'type'}
               and $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command'))
          or (scalar(@{$current->{'contents'}}) == 2
               and $current->{'contents'}->[-1]->{'cmdname'}
               and ($current->{'contents'}->[-1]->{'cmdname'} eq 'c'
                    or $current->{'contents'}->[-1]->{'cmdname'} eq 'comment')
               and $current->{'contents'}->[-2] 
               and $current->{'contents'}->[-2]->{'type'}
               and $current->{'contents'}->[-2]->{'type'} eq 'empty_line_after_command'))) {
    # empty line after a @menu or before a preformatted. Reparent to the menu
    # or other format
    if ($current->{'type'}
        and $current->{'type'} eq 'preformatted') {
      my $parent = $current->{'parent'};
      if ($parent->{'type'} and $parent->{'type'} eq 'menu_comment'
          and scalar(@{$parent->{'contents'}}) == 1) {
        $parent = $parent->{'parent'};
      }
      my $to_reparent = pop @{$parent->{'contents'}};
      print STDERR "LINE AFTER COMMAND IN PREFORMATTED ($to_reparent->{'type'})\n" if ($self->{'DEBUG'});
      while (@{$current->{'contents'}}) {
        my $content = shift @{$current->{'contents'}};
        $content->{'parent'} = $parent;
        push @{$parent->{'contents'}}, $content;
      }
      push @{$parent->{'contents'}}, $to_reparent;
    }
  }

  # this happens if there is a nesting of line @-commands on a line.
  # they are reprocessed here.
  if ($self->{'context_stack'}->[-1] eq 'line' 
            or $self->{'context_stack'}->[-1] eq 'def') {
    print STDERR "Still opened line command $self->{'context_stack'}->[-1]:"._print_current($current) 
      if ($self->{'DEBUG'});
    if ($self->{'context_stack'}->[-1] eq 'def') {
      while ($current->{'parent'} and !($current->{'parent'}->{'type'}
            and $current->{'parent'}->{'type'} eq 'def_line')) {
        $current = $self->_close_current($current, $line_nr);
      }
    } else {
      while ($current->{'parent'} and !($current->{'type'}
             and ($current->{'type'} eq 'block_line_arg'
                  or $current->{'type'} eq 'misc_line_arg'))) {
        $current = $self->_close_current($current, $line_nr);
      }
    }

    # check for infinite loop bugs...
    if ($current eq $current_old) {
      my $indent = '- ';
      print STDERR "$indent"._print_current($current);
      while ($current->{'parent'}) {
        $indent = '-'.$indent;
        $current = $current->{'parent'};
        print STDERR "$indent"._print_current($current);
      }
      #cluck "Problem with opened line command $self->{'context_stack'}->[-1]";
      die "BUG: did not go up (infinite loop)\n" 
    }

    my $other_included_file = 0;
    ($current, $other_included_file) = $self->_end_line($current, $line_nr);
    $included_file = $included_file + $other_included_file;
  }
  return ($current, $included_file);
}

sub _start_empty_line_after_command($$$) {
  my $line = shift;
  my $current = shift;
  my $command = shift;
  $line =~ s/^([^\S\n]*)//;
  push @{$current->{'contents'}}, { 'type' => 'empty_line_after_command',
                                    'text' => $1,
                                    'parent' => $current,
                                    'extra' => {'command' => $command} };
  return $line;
}

sub _check_empty_node($$$$)
{
  my $self = shift;
  my $parsed_node = shift;
  my $command = shift;
  my $line_nr = shift;
  if (!defined($parsed_node) or !$parsed_node->{'node_content'}) {
    $self->line_error (sprintf($self->__("Empty argument in \@%s"),
                $command), $line_nr);
    return 0;
  } elsif ($parsed_node->{'normalized'} !~ /[^-]/) {
    $self->line_error (sprintf($self->__("Empty node name after expansion `%s'"),
                Texinfo::Convert::Texinfo::convert({'contents' 
                                        => $parsed_node->{'node_content'}})), 
                $line_nr);
    return 0;
  } else {
    return 1;
  }
}

sub _check_internal_node ($$$)
{
  my $self = shift;
  my $parsed_node = shift;
  my $line_nr = shift;
  if ($parsed_node and $parsed_node->{'manual_content'}) {
    $self->line_error (sprintf($self->__("Syntax for an external node used for `%s'"),
          _node_extra_to_texi($parsed_node)), $line_nr)
  }
}

sub _check_node_label($$$$)
{
  my $self = shift;
  my $parsed_node = shift;
  my $command = shift;
  my $line_nr = shift;
  _check_internal_node($self, $parsed_node, $line_nr);
  return _check_empty_node($self, $parsed_node, $command, $line_nr);
}

sub _enter_menu_entry_node($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;
  my $description = { 'type' => 'menu_entry_description',
                      'contents' => [],
                      'parent' => $current };
  push @{$current->{'args'}}, $description;
  foreach my $arg (@{$current->{'args'}}) {
    if ($arg->{'type'} eq 'menu_entry_name') {
      $current->{'extra'}->{'menu_entry_name'} = $arg;
    } elsif ($arg->{'type'} eq 'menu_entry_node') {
      $self->_isolate_last_space($arg, 'space_at_end_menu_node');
      my $parsed_entry_node = _parse_node_manual($arg);
      if (! defined($parsed_entry_node) and $self->{'SHOW_MENU'}) {
        $self->line_error ($self->__("Empty node in menu entry"), $line_nr);
      } else {
        $current->{'extra'}->{'menu_entry_node'} = $parsed_entry_node;
      }
    } elsif ($arg->{'type'} eq 'menu_entry_description') {
      $current->{'extra'}->{'menu_entry_description'} = $arg;
    }
  } 
  $current->{'line_nr'} = $line_nr;
  $current = $description;
  push @{$current->{'contents'}}, {'type' => 'preformatted',
                                   'parent' => $current,
                                   'contents' => [] };
  $current = $current->{'contents'}->[-1];
  push @{$self->{'context_stack'}}, 'preformatted';
  return $current;
}

sub _register_command_arg($$$)
{
  my $self = shift;
  my $current = shift;
  my $type = shift;
  my @contents = @{$current->{'contents'}};
  _trim_spaces_comment_from_content(\@contents);
  if (scalar(@contents)) {
    push @{$current->{'parent'}->{'extra'}->{$type}}, \@contents;
  } else {
    push @{$current->{'parent'}->{'extra'}->{$type}}, undef;
  }
}

sub _command_with_command_as_argument($)
{
  my $current = shift;
  return ($current and $current->{'type'}
      and $current->{'type'} eq 'block_line_arg'
      and $current->{'parent'} 
      and $current->{'parent'}->{'cmdname'} and
     ($current->{'parent'}->{'cmdname'} eq 'itemize'
      or $item_line_commands{$current->{'parent'}->{'cmdname'}})
      and (scalar(@{$current->{'contents'}}) == 1
           or (scalar(@{$current->{'contents'}}) == 2
            and defined($current->{'contents'}->[0]->{'text'})
            and $current->{'contents'}->[0]->{'text'}
                               =~ /^[^\S\n]*/)))
}

# the different types
#c 'menu_entry'
#c 'menu_entry'
# t 'menu_entry_leading_text'
#
#t 'macro_arg_name'
#t 'macro_arg_args'
#
#t 'raw'
#
#t 'misc_arg'
#c 'misc_line_arg'
#
#c 'block_line_arg'
#
#c 'brace_command_arg'
#c 'brace_command_context'
#
#c 'before_item'   what comes after @*table, @itemize, @enumerate before
#                an @item
#
#c 'paragraph'
#
#a 'def_line'
#
#special for @verb, type is the character

# the main subroutine
sub _parse_texi($;$)
{
  my $self = shift;
  my $root = shift;

  $root = { 'contents' => [], 'type' => 'text_root' } if (!defined($root));
  my $current = $root;

  $self->{'conditionals_stack'} = [];

  my $line_nr;
  
 NEXT_LINE:
  while (1) {
    my $line;
    ($line, $line_nr) = _next_text($self, $line_nr);
    last if (!defined($line));

    if ($self->{'DEBUG'}) {
      $current->{'HERE !!!!'} = 1; # marks where we are in the tree
      local $Data::Dumper::Indent = 1;
      local $Data::Dumper::Purity = 1;
      print STDERR "".Data::Dumper->Dump([$root], ['$root']);
      my $line_text = '';
      $line_text = "$line_nr->{'line_nr'}.$line_nr->{'macro'}" if ($line_nr);
      print STDERR "NEW LINE($self->{'context_stack'}->[-1]:@{$self->{'conditionals_stack'}}:$line_text): $line";
      #print STDERR "CONTEXT_STACK ".join('|',@{$self->{'context_stack'}})."\n";
      delete $current->{'HERE !!!!'};
    }

    if (not 
        # raw format or verb
          (($current->{'cmdname'}
           and $block_commands{$current->{'cmdname'}}
            and ($block_commands{$current->{'cmdname'}} eq 'raw'
                 or $block_commands{$current->{'cmdname'}} eq 'conditional'))
          or 
           ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
            and $current->{'parent'}->{'cmdname'} eq 'verb')
          )
        # not def line
        and $self->{'context_stack'}->[-1] ne 'def') {
      print STDERR "BEGIN LINE\n" if ($self->{'DEBUG'});
      $line =~ s/^([^\S\n]*)//;
      push @{$current->{'contents'}}, { 'type' => 'empty_line', 
                                        'text' => $1,
                                        'parent' => $current };
    }


    while (1) {
      # in a raw or ignored conditional block command
      if ($current->{'cmdname'} and 
            $block_commands{$current->{'cmdname'}} and 
            ($block_commands{$current->{'cmdname'}} eq 'raw'
             or $block_commands{$current->{'cmdname'}} eq 'conditional')) {
        # r?macro may be nested
        if (($current->{'cmdname'} eq 'macro' 
              or $current->{'cmdname'} eq 'rmacro') 
             and $line =~ /^\s*\@r?macro\s+/) {
          $line =~ s/\s*\@(r?macro)//;
          push @{$current->{'contents'}}, { 'cmdname' => $1,
                                            'parent' => $current,
                                            'contents' => [],
                         'extra' => {'arg_line' => $line }};
          $current = $current->{'contents'}->[-1];
          last;
        # ifclear/ifset may be nested
        } elsif (($current->{'cmdname'} eq 'ifclear' 
                  or $current->{'cmdname'} eq 'ifset')
                and $line =~ /^\s*\@$current->{'cmdname'}/) {
          $line =~ s/\s*\@($current->{'cmdname'})//;
          push @{$current->{'contents'}}, { 'cmdname' => $1,
                                            'parent' => $current,
                                            'contents' => [],
                         'extra' => {'line' => $line }};
          $current = $current->{'contents'}->[-1];
          last;
        } elsif ($line =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $current->{'cmdname'})) {
          my $end_command = $2;
          my $raw_command = $current;
          $line =~ s/^(.*?)(\@end\s$current->{'cmdname'})//;
          push @{$current->{'contents'}}, 
            { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
              if ($1 ne '');
          # the condition $line !~ /^\s*@/ leads to no warning when followed by
          # any @-command.  This is in order to avoid warnings for correct
          # constructs, like @comment after @end raw
          $self->line_warn (sprintf($self->
                __("Superfluous argument to \@%s %s: %s"), 'end', $end_command,
                                    $line), $line_nr)
            if ($line =~ /\S/ and $line !~ /^\s*@/);
          # store toplevel macro specification
          if (($end_command eq 'macro' or $end_command eq 'rmacro') 
               and (! $current->{'parent'} 
                    or !$current->{'parent'}->{'cmdname'} 
                    or ($current->{'parent'}->{'cmdname'} ne 'macro'
                        and $current->{'parent'}->{'cmdname'} ne 'rmacro'))) {
            $current->{'extra'}->{'macrobody'} = 
               Texinfo::Convert::Texinfo::convert({ 'contents' 
                                             => $current->{'contents'} });
            if ($current->{'args'} and $current->{'args'}->[0]) {
              my $name = $current->{'args'}->[0]->{'text'};
              if (exists($self->{'macros'}->{$name})) {
                $self->line_warn (sprintf($self->__("macro `%s' previously defined"), 
                                          $name), $current->{'line_nr'});
                $self->line_warn (sprintf($self->__("here is the previous definition of `%s'"), 
                                   $name), $self->{'macros'}->{$name}->{'line_nr'});
              }
              $self->{'macros'}->{$current->{'args'}->[0]->{'text'}} = $current
                unless ($current->{'extra'}->{'invalid_syntax'});
            }
          }
          $current = $current->{'parent'};
          if ($block_commands{$end_command} eq 'conditional') {
            # don't store ignored @if*
            my $conditional = pop @{$current->{'contents'}};
            die "BUG: not a conditional ".print_current($conditional)
              if (!defined($conditional->{'cmdname'}
                  or $conditional->{'cmdname'} ne $end_command));
            # Ignore until end of line
            if ($line !~ /\n/) {
              ($line, $line_nr) = _new_line($self, $line_nr);
              print STDERR "IGNORE CLOSE line: $line" if ($self->{'DEBUG'});
            }
            print STDERR "CLOSED conditional $end_command\n" if ($self->{'DEBUG'});
            last;
          } else {
            print STDERR "CLOSED raw $end_command\n" if ($self->{'DEBUG'});
            $line = _start_empty_line_after_command($line, $current, $raw_command);
          }
        } else {
          if (@{$current->{'contents'}} 
              and $current->{'contents'}->[-1]->{'type'}
              and $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command'
              and $current->{'contents'}->[-1]->{'text'} !~ /\n/
              and $line !~ /\S/) {
            $current->{'contents'}->[-1]->{'text'} .= $line;
          } else {
            push @{$current->{'contents'}}, 
              { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          }
          last;
        }
      # in @verb. type should be 'brace_command_arg'
      } elsif ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
             and $current->{'parent'}->{'cmdname'} eq 'verb') { 
        # collect the first character if not already done
        if (!defined($current->{'parent'}->{'type'})) {
          if ($line =~ /^$/) {
            $current->{'parent'}->{'type'} = '';
            $self->line_error (sprintf($self->
                __("\@%s without associated character"), 'verb'), $line_nr);
          } else {
            $line =~ s/^(.)//;
            $current->{'parent'}->{'type'} = $1;
          }
        }
        my $char = quotemeta($current->{'parent'}->{'type'});
        if ($line =~ s/^(.*?)$char\}/\}/) {
          push @{$current->{'contents'}}, 
              { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
                if ($1 ne '');
          print STDERR "END VERB\n" if ($self->{'DEBUG'});
        } else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          print STDERR "LINE VERB: $line" if ($self->{'DEBUG'});
          last;
        }
      }

      # this mostly happens in the following cases:
      #   after expansion of user defined macro that doesn't end with EOL
      #   after a protection of @\n in @def* line
      while ($line eq '')
      {
        print STDERR "END OF TEXT not at end of line\n"
          if ($self->{'DEBUG'});
        ($line, $line_nr) = _next_text($self, $line_nr);
        if (!defined($line)) {
          # end of the file
          my $included_file;
          ($current, $included_file) = 
            _end_line ($self, $current, $line_nr);
          if (!$included_file) {
            $current = _close_commands($self, $current, $line_nr);
            return $root;
          }
        }
      }

      # handle user defined macros before anything else since
      # their expansion may lead to changes in the line
      # REMACRO
      if ($line =~ /^\@([[:alnum:]][[:alnum:]-]*)/ 
                and ($self->{'macros'}->{$1} 
                     or (exists $self->{'aliases'}->{$1} and 
                       $self->{'macros'}->{$self->{'aliases'}->{$1}}))) {
        $line =~ s/^\@([[:alnum:]][[:alnum:]-]*)//o;
        my $command = $1;
        $command = $self->{'aliases'}->{$command} 
           if (exists($self->{'aliases'}->{$command}));

        my $expanded_macro = $self->{'macros'}->{$command};
        my $args_number = scalar(@{$expanded_macro->{'args'}}) -1;
        my $arguments = [];
        if ($line =~ s/^\s*{\s*//) { # macro with args
          ($arguments, $line, $line_nr) = 
            _expand_macro_arguments ($self, $expanded_macro, $line, $line_nr);
        } elsif (($args_number >= 2) or ($args_number <1)) {
        # as agreed on the bug-texinfo mailing list, no warn when zero
        # arg and not called with {}.
          $self->line_warn (sprintf($self->__("\@%s defined with zero or more than one argument should be invoked with {}"), $command), $line_nr)
             if ($args_number >= 2);
        } else {
          if ($line !~ /\n/) {
            ($line, $line_nr) = _new_line($self, $line_nr);
            $line = '' if (!defined($line));
          }
          $line =~ s/^\s*// if ($line =~ /\S/);
          my $has_end_of_line = chomp $line;
          $arguments = [$line];
          $line = "\n" if ($has_end_of_line);
        }
        my $expanded = _expand_macro_body ($self, $expanded_macro, 
                                   $arguments, $line_nr);
        print STDERR "MACROBODY: $expanded".'||||||'."\n" 
           if ($self->{'DEBUG'}); 
        # empty result.  It is ignored here.
        if ($expanded eq '') {
          next;
        }
        if ($self->{'MAX_MACRO_CALL_NESTING'}
            and scalar(@{$self->{'macro_stack'}}) > $self->{'MAX_MACRO_CALL_NESTING'}) {
          $self->line_warn (sprintf($self->
              __("Macro call nested too deeply (set MAX_NESTED_MACROS to override; current value %d)"), $self->{'MAX_MACRO_CALL_NESTING'}), $line_nr);
          next;
        }
        if ($expanded_macro->{'cmdname'} eq 'macro') {
          my $found = 0;
          foreach my $macro (@{$self->{'macro_stack'}}) {
            if ($macro->{'args'}->[0]->{'text'} eq $command) {
              $self->line_error(sprintf($self->
                __("Recursive call of macro %s is not allowed; use \@rmacro if needed"), $command), $line_nr);
              $found = 1;
              last;
            }
          }
          next if ($found);
        }

        unshift @{$self->{'macro_stack'}}, $expanded_macro;
        print STDERR "UNSHIFT MACRO_STACK: $expanded_macro->{'args'}->[0]->{'text'}\n"
          if ($self->{'DEBUG'});
        my $expanded_lines = _text_to_lines($expanded);
        chomp ($expanded_lines->[-1]);
        pop @$expanded_lines if ($expanded_lines->[-1] eq '');
        print STDERR "MACRO EXPANSION LINES: ".join('|', @$expanded_lines)
                                     ."|\nEND LINES\n" if ($self->{'DEBUG'});
        next if (!@$expanded_lines);
        my $new_lines = _complete_line_nr($expanded_lines, 
                            $line_nr->{'line_nr'}, $line_nr->{'file_name'},
                            $expanded_macro->{'args'}->[0]->{'text'}, 1);
        $line_nr->{'end_macro'} = 1;
        unshift @{$self->{'input'}->[0]->{'pending'}}, [$line, $line_nr];
        my $new_text = shift @$new_lines;
        ($line, $line_nr) = ($new_text->[0], $new_text->[1]);
        unshift @{$self->{'input'}->[0]->{'pending'}}, @$new_lines;

      # Now handle all the cases that may lead to command closing
      # or following character association with an @-command, especially
      # accent command, that is handle @-command with braces that don't
      # always need a brace.

      # The condition below is only caught right after command opening,
      # otherwise we are in the 'args' and not right in the command container.
      } elsif ($current->{'cmdname'} and 
          (defined($brace_commands{$current->{'cmdname'}}) or 
            $self->{'definfoenclose'}->{$current->{'cmdname'}})
           and $line !~ /^{/) {
        # special case for @-command as argument of @itemize or @*table.
        if (_command_with_command_as_argument($current->{'parent'})) {
          delete $current->{'contents'};
          print STDERR "FOR PARENT \@$current->{'parent'}->{'parent'}->{'cmdname'} command_as_argument $current->{'cmdname'}\n" if ($self->{'DEBUG'});
          $current->{'type'} = 'command_as_argument' if (!$current->{'type'});
          $current->{'parent'}->{'parent'}->{'extra'}->{'command_as_argument'} 
            = $current;
          $current = $current->{'parent'};
        # now accent commands
        } elsif ($accent_commands{$current->{'cmdname'}}) {
          if ($line =~ /^[^\S\n]/) {
            if ($current->{'cmdname'} =~ /^[a-zA-Z]/) {
              $line =~ s/^([^\S\n]+)//;
              $current->{'extra'}->{'spaces'} = '' 
                if (!defined($current->{'extra'}->{'spaces'}));
              $current->{'extra'}->{'spaces'} .= $1;
            } else {
              $self->line_warn (sprintf($self->
                __("Accent command `\@%s' must not be followed by whitespace"),
                $current->{'cmdname'}), $line_nr);
              $current = $current->{'parent'};
            }
          } elsif ($line =~ /^\@/) {
            $self->line_error (sprintf($self->
              __("Use braces to give a command as an argument to \@%s"),
                $current->{'cmdname'}), $line_nr);
            $current = $current->{'parent'};
          } elsif ($line =~ s/^(.)//o) {
            print STDERR "ACCENT \@$current->{'cmdname'}\n" 
              if ($self->{'DEBUG'});
            # FIXME this is different than usual tree, no content here
            $current->{'args'} = [ { 'text' => $1, 'parent' => $current } ];
            if ($current->{'cmdname'} eq 'dotless' and $1 ne 'i' and $1 ne 'j') {
              $self->line_error (sprintf($self->
                 __("%c%s expects `i' or `j' as argument, not `%s'"), 
                 ord('@'), $current->{'cmdname'}, $1), $line_nr);
            }
            if ($current->{'cmdname'} =~ /^[a-zA-Z]/) {
              $current->{'args'}->[-1]->{'type'} = 'space_command_arg';
            }
            delete $current->{'contents'};
            $current = $current->{'parent'};
          } else { # The accent is at end of line
            # whitespace for commands with letter.
            print STDERR "STRANGE ACC \@$current->{'cmdname'}\n" if ($self->{'DEBUG'});
            $self->line_warn (sprintf($self->
               __("Accent command `\@%s' must not be followed by new line"),
               $current->{'cmdname'}), $line_nr);
            $current = $current->{'parent'};
          }
          next;
        } else {
          $self->line_error (sprintf($self->__("\@%s expected braces"), 
                           $current->{'cmdname'}), $line_nr);
          $current = $current->{'parent'};
        }
      # maybe a menu entry beginning: a * at the beginning of a menu line
      } elsif ($line =~ /^\*/ and $current->{'type'}
                and (($current->{'type'} eq 'preformatted'
                      and $current->{'parent'}->{'type'} 
                      and ($current->{'parent'}->{'type'} eq 'menu_comment'
                           # FIXME does menu_entry_description here work as intended?
                           or $current->{'parent'}->{'type'} eq 'menu_entry_description'))
                    # FIXME remove the next condition
                    or $current->{'type'} eq 'menu_entry_description')
                and @{$current->{'contents'}} 
                and $current->{'contents'}->[-1]->{'type'}
                and $current->{'contents'}->[-1]->{'type'} eq 'empty_line'
                and $current->{'contents'}->[-1]->{'text'} eq '') {
        print STDERR "MENU STAR\n" if ($self->{'DEBUG'});
        _abort_empty_line ($self, $current);
        $line =~ s/^\*//;
        push @{$current->{'contents'}}, { 'type' => 'menu_star',
                                          'text' => '*' };
      # a space after a * at the beginning of a menu line
      } elsif ($line =~ /^\s+/ and $current->{'contents'} 
               and @{$current->{'contents'}} 
               and $current->{'contents'}->[-1]->{'type'}
               and $current->{'contents'}->[-1]->{'type'} eq 'menu_star') {
        print STDERR "MENU ENTRY (certainly)\n" if ($self->{'DEBUG'});
        # this is the menu star collected previously
        pop @{$current->{'contents'}};
        $line =~ s/^(\s+)//;
        my $leading_text = '*' . $1;
        if ($current->{'type'} eq 'preformatted'
            and $current->{'parent'}->{'type'} 
            and $current->{'parent'}->{'type'} eq 'menu_comment') {
          my $menu = $current->{'parent'}->{'parent'};
          if (!@{$current->{'contents'}}) {
            pop @{$current->{'parent'}->{'contents'}};
            if (!scalar(@{$current->{'parent'}->{'contents'}})) {
              pop @{$menu->{'contents'}}; 
            }
          }
          $current = $menu;
          #print STDERR "Close MENU_COMMENT because new menu entry\n";
        } else {
          # first parent preformatted, third is menu_entry
          if ($current->{'type'} ne 'preformatted' 
              or $current->{'parent'}->{'type'} ne 'menu_entry_description'
              or $current->{'parent'}->{'parent'}->{'type'} ne 'menu_entry'
              or !$menu_commands{$current->{'parent'}->{'parent'}->{'parent'}->{'cmdname'}}) {
            warn "BUG: not in menu description";
          }
          $current = $current->{'parent'}->{'parent'}->{'parent'};
        }
        my $context = pop @{$self->{'context_stack'}};
        warn "BUG: not preformatted on context stack $context (after menu leading star)"
          if ($context ne 'preformatted');
        push @{$current->{'contents'}}, { 'type' => 'menu_entry',
                                          'parent' => $current,
                                        };
        $current = $current->{'contents'}->[-1];
        $current->{'args'} = [ { 'type' => 'menu_entry_leading_text',
                                 'text' => $leading_text,
                                 'parent' => $current },
                               { 'type' => 'menu_entry_name',
                                 'contents' => [],
                                 'parent' => $current } ];
        $current = $current->{'args'}->[-1];
      # * followed by something else than a space.
      } elsif ($current->{'contents'} and @{$current->{'contents'}} 
               and $current->{'contents'}->[-1]->{'type'}
               and $current->{'contents'}->[-1]->{'type'} eq 'menu_star') {
        print STDERR "ABORT MENU STAR ($line)\n" if ($self->{'DEBUG'});
        delete $current->{'contents'}->[-1]->{'type'};
      # after a separator in menu
      } elsif ($current->{'args'} and @{$current->{'args'}} 
               and $current->{'args'}->[-1]->{'type'}
               and $current->{'args'}->[-1]->{'type'} eq 'menu_entry_separator') {
        my $separator = $current->{'args'}->[-1]->{'text'};
        # separator is ::, we let it be in order to collect spaces below
        if ($separator eq ':' and $line =~ s/^(:)//) {
          $current->{'args'}->[-1]->{'text'} .= $1;
        # a . not followed by a space.  Not a separator.
        } elsif ($separator eq '.' and $line =~ /^\S/) {
          pop @{$current->{'args'}};
          $current = $current->{'args'}->[-1];
          $current = _merge_text ($self, $current, $separator);
        # here we collect spaces following separators.
        } elsif ($line =~ s/^([^\S\n]+)//) {
          # FIXME a trailing end of line could be considered to be part
          # of the separator. Right now it is part of the description,
          # since it is catched (in the next while) as one of the case below
          $current->{'args'}->[-1]->{'text'} .= $1;
        # now handle the menu part that was closed
        } elsif ($separator =~ /^::/) {
          print STDERR "MENU NODE no entry $separator\n" if ($self->{'DEBUG'});
          # it was previously registered as menu_entry_name, it is 
          # changed to node
          $current->{'args'}->[-2]->{'type'} = 'menu_entry_node';
          $current = _enter_menu_entry_node($self, $current, $line_nr);
        # end of the menu entry name  
        } elsif ($separator =~ /^:/) {
          print STDERR "MENU ENTRY $separator\n" if ($self->{'DEBUG'});
          push @{$current->{'args'}}, { 'type' => 'menu_entry_node',
                                        'contents' => [],
                                        'parent' => $current };
          $current = $current->{'args'}->[-1];
        # anything else is the end of the menu node following a menu_entry_name
        } else {
          print STDERR "MENU NODE $separator\n" if ($self->{'DEBUG'});
          $current = _enter_menu_entry_node($self, $current, $line_nr);
        }
        # REMACRO
      } elsif ($line =~ s/^\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o 
               or $line =~ s/^\@([[:alnum:]][[:alnum:]-]*)//o) {
        my $command = $1;
        $command = $self->{'aliases'}->{$command} 
           if (exists($self->{'aliases'}->{$command}));
        print STDERR "COMMAND $command\n" if ($self->{'DEBUG'});

        if ($command eq 'value') {
          if ($line =~ s/^{([\w\-]+)}//) {
            my $value = $1;
            if (exists($self->{'values'}->{$value})) {
              if (!ref($self->{'values'}->{$value})) {
                $line = $self->{'values'}->{$value} . $line;
              # the push @{$current->{'contents'}}, {}; prevents a trailing
              # text to be merged, to avoid having the value tree modified.
              } elsif (ref($self->{'values'}->{$value}) eq 'ARRAY') {
                # we don't know for sure, but if we don't do it here it 
                # won't be done
                _abort_empty_line ($self, $current);
                foreach my $content (@{$self->{'values'}->{$value}}) {
                  push @{$current->{'contents'}}, $content;
                }
                push @{$current->{'contents'}}, {};
              } elsif (ref($self->{'values'}->{$value}) eq 'HASH') {
                # we don't know for sure, but if we don't do it here it 
                # won't be done
                _abort_empty_line ($self, $current);
                my $content = $self->{'values'}->{$value};
                push @{$current->{'contents'}}, $content;
                push @{$current->{'contents'}}, {};
              }
            } else {
              # caller should expand something along 
              # gdt('@{No value for `{value}\'@}', {'value' => $value}, {'keep_texi'=> 1});
              push @{$current->{'contents'}}, { 'cmdname' => 'value',
                                                'type' => $value };
              $self->line_warn (
                  sprintf($self->__("undefined flag: %s"), $value), $line_nr);
            }
          } else {
            $self->line_error ($self->__("Bad syntax for \@value"), $line_nr);
          }
          next;
        }

        if (defined($deprecated_commands{$command})) {
          if ($deprecated_commands{$command} eq '') {
            $self->line_warn (sprintf($self->__("%c%s is obsolete."), 
                                ord('@'), $command), $line_nr);
          } else {
            $self->line_warn (sprintf($self->__("%c%s is obsolete; %s"),
                   ord('@'), $command, 
                   $self->__($deprecated_commands{$command})), $line_nr);
          }
        }

        if (not _abort_empty_line ($self, $current) 
               and $begin_line_commands{$command}) {
          $self->line_warn (sprintf($self->__("\@%s should only appear at a line beginning"), 
                                     $command), $line_nr);
        }

        my $invalid;
        # error messages for forbidden constructs, like @node in @r, 
        # block command on line command, @xref in @anchor or node...
        if ($current->{'parent'}) { 
          if ($current->{'parent'}->{'cmdname'}) {
          # FIXME in all the cases below, there is an error message even if
          # the command is an unknown command
            if ($accent_commands{$current->{'parent'}->{'cmdname'}}                            
                and !$in_accent_commands{$command}) {
              $self->line_warn (sprintf($self->__("\@%s should not appear in \@%s"), 
                                     $command, $current->{'parent'}->{'cmdname'}),
                           $line_nr);
              $invalid = 1;
            } elsif ((!$in_simple_text_commands{$command}
                      and ($self->{'simple_text_commands'}->{$current->{'parent'}->{'cmdname'}}
                           # following conditions arise because we distinguish
                           # the line arg which are restricted, and the 
                           # contents where any command may happen.
                           or ($current->{'type'}
                               and $current->{'type'} eq 'block_line_arg')
                           or ($current->{'type'} 
                               and $current->{'type'} eq 'misc_line_arg'
                               and ($root_commands{$current->{'parent'}->{'cmdname'}}
                                    or $current->{'parent'}->{'cmdname'} eq 'itemx'
                                    or $current->{'parent'}->{'cmdname'} eq 'item'))))
                     or ($full_text_commands{$current->{'parent'}->{'cmdname'}}
                      and !$in_full_text_commands{$command})) {
              $self->line_warn (sprintf($self->__("\@%s should not appear in \@%s"), 
                                     $command, $current->{'parent'}->{'cmdname'}),
                           $line_nr);
              $invalid = 1;
            }
          } elsif ($self->{'context_stack'}->[-1] eq 'def'
                   and !$in_simple_text_commands{$command}) {
              my $def_block = $current;
              while ($def_block->{'parent'} and (!$def_block->{'parent'}->{'type'} 
                                   or $def_block->{'parent'}->{'type'} ne 'def_line')) {
                $def_block = $def_block->{'parent'};
              }
 
              $self->line_warn (sprintf($self->__("\@%s should not appear in \@%s"), 
                                     $command, $def_block->{'parent'}->{'parent'}->{'cmdname'}),
                           $line_nr);
              $invalid = 1;
          }
        }

        # special case with @ followed by a newline protecting end of lines
        # in @def*
        last if ($self->{'context_stack'}->[-1] eq 'def' and $command eq "\n");

        unless ($self->{'no_paragraph_commands'}->{$command}) {
          my $paragraph = _begin_paragraph($self, $current);
          $current = $paragraph if ($paragraph);
        }

        if ($self->{'close_paragraph_commands'}->{$command}) {
          $current = _end_paragraph($self, $current, $line_nr);
        }
        if ($self->{'close_preformatted_commands'}->{$command}) {
          $current = _end_preformatted($self, $current, $line_nr);
        }

        # commands without braces and not block commands, ie no @end
        if (defined($self->{'misc_commands'}->{$command})) {
          if ($root_commands{$command} or $command eq 'bye') {
            $current = _close_commands($self, $current, $line_nr);
            # root_level commands leads to starting setting a new root
            # for the whole document and stuffing the preceding text
            # as the first content, this is done only once.
            if ($current->{'type'} and $current->{'type'} eq 'text_root') {
              if ($command ne 'bye') {
                $root = { 'type' => 'document_root', 'contents' => [$current] };
                $current->{'parent'} = $root;
                $current = $root;
              }
            } else {
              die if (!defined($current->{'parent'}));
              $current = $current->{'parent'};
            }
          }

          # noarg skipline skipspace text line lineraw /^\d$/
          my $arg_spec = $self->{'misc_commands'}->{$command};
          my $misc;

          if ($arg_spec eq 'noarg') {
            my $ignored = 0;
            if ($command eq 'insertcopying') {
              my $parent = $current;
              while ($parent) {
                if ($parent->{'cmdname'} and $parent->{'cmdname'} eq 'copying') {
                  $self->line_error (sprintf($self->__("\@%s not allowed inside `\@%s' block"), 
                                              $command, $parent->{'cmdname'}), $line_nr);
                  $ignored = 1;
                  last;
                }
                $parent = $parent->{'parent'};
              }
            } elsif ($in_heading_commands{$command}) {
              $self->line_error (sprintf($self->__("\@%s should only appear in heading or footing"),
                                              $command), $line_nr);
              $invalid = 1;
            }
            unless ($ignored) {
              $misc = {'cmdname' => $command,
                      'parent' => $current};
              push @{$current->{'contents'}}, $misc;
            }
            $misc->{'extra'}->{'invalid_nesting'} = 1 if ($invalid);
            $self->_register_global_command($command, $misc, $line_nr);

          # all the cases using the raw line
          } elsif ($arg_spec eq 'skipline' or $arg_spec eq 'lineraw'
                   or $arg_spec eq 'special') {
            # complete the line if there was a user macro expansion
            if ($line !~ /\n/) {
              my ($new_line, $new_line_nr) = _new_line($self, $line_nr);
              $line .= $new_line if (defined($new_line));
            }
            $misc = {'cmdname' => $command,
                     'parent' => $current};
            push @{$current->{'contents'}}, $misc;
            my $args = [];
            if ($arg_spec eq 'lineraw') {
              $args = [ $line ];
            } elsif ($arg_spec eq 'special') {
              $args 
                = $self->_parse_special_misc_command($line, $command, $line_nr);
              $misc->{'extra'}->{'arg_line'} = $line;
            }
            foreach my $arg (@$args) {
              push @{$misc->{'args'}},
                { 'type' => 'misc_arg', 'text' => $arg, 
                  'parent' => $current->{'contents'}->[-1] };
            }
            my $included_file;
            ($current, $included_file) = 
              _end_line ($self, $current, $line_nr);
            if ($command eq 'raisesections') {
              $self->{'sections_level'}++;
            } elsif ($command eq 'lowersections') {
              $self->{'sections_level'}--;
            } elsif ($command eq 'novalidate') {
              $self->{'novalidate'} = 1;
            }
            $misc->{'extra'}->{'invalid_nesting'} = 1 if ($invalid);
            $self->_register_global_command($command, $misc, $line_nr);

            last NEXT_LINE if ($command eq 'bye');
            last;
          } else {
            my $line_arg = 0;
            $line_arg = 1 if ($arg_spec ne 'skipspace');
            if ($command eq 'item' or $command eq 'itemx' 
               or $command eq 'headitem' or $command eq 'tab') {
              my $parent;
              # itemize or enumerate
              if ($parent = _item_container_parent($current)) {
                if ($command eq 'item') {
                  print STDERR "ITEM_CONTAINER\n" if ($self->{'DEBUG'});
                  $parent->{'items_count'}++;
                  $misc = { 'cmdname' => $command, 'parent' => $parent,
                            'contents' => [],
                            'extra' => 
                              {'item_number' => $parent->{'items_count'}} };
                  push @{$parent->{'contents'}}, $misc;
                  $current = $parent->{'contents'}->[-1];
                  $current = $self->_begin_preformatted($current);
                } else {
                  $self->line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
                }
              # *table
              } elsif ($parent = _item_line_parent($current)) {
                if ($command eq 'item' or $command eq 'itemx') {
                  print STDERR "ITEM_LINE\n" if ($self->{'DEBUG'});
                  $current = $parent;
                  _gather_previous_item($current, $command);
                  $misc = { 'cmdname' => $command, 'parent' => $current };
                  push @{$current->{'contents'}}, $misc;
                  $line_arg = 1;
                } else {
                  $self->line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
                }
              # multitable
              } elsif ($parent = _item_multitable_parent($current)) {
                if ($command eq 'item' or $command eq 'headitem'
                     or $command eq 'tab') {
                  if (!$parent->{'extra'}->{'max_columns'}) {
                    $self->line_warn (sprintf($self->__("\@%s in empty multitable"), $command), $line_nr);
                  } elsif ($command eq 'tab') {
                    my $row = $parent->{'contents'}->[-1];
                    die if (!$row->{'type'});
                    if ($row->{'type'} eq 'before_item') {
                      $self->line_error($self->__("\@tab before \@item"), $line_nr);
                    } elsif ($row->{'cells_count'} >= $parent->{'extra'}->{'max_columns'}) {
                      $self->line_error (sprintf($self->__("Too many columns in multitable item (max %d)"), $parent->{'extra'}->{'max_columns'}), $line_nr);
                    } else {
                      $row->{'cells_count'}++;
                      $misc = { 'cmdname' => $command,
                                'parent' => $row,
                                'contents' => [],
                                'extra' =>
                            {'cell_number' => $row->{'cells_count'}} };
                      push @{$row->{'contents'}}, $misc;
                      $current = $row->{'contents'}->[-1];
                      $current = $self->_begin_preformatted($current);
                      print STDERR "TAB\n" if ($self->{'DEBUG'});
                    }
                  } else {
                    print STDERR "ROW\n" if ($self->{'DEBUG'});
                    $parent->{'rows_count'}++;
                    my $row = { 'type' => 'row', 'contents' => [],
                                'cells_count' => 1,
                                'extra' => {'row_number' => $parent->{'rows_count'} },
                                'parent' => $parent };
                    push @{$parent->{'contents'}}, $row;
                    $misc =  { 'cmdname' => $command,
                               'parent' => $row,
                               'contents' => [],
                               'extra' => {'cell_number' => 1}};
                    push @{$row->{'contents'}}, $misc;
                    $current = $row->{'contents'}->[-1];
                    $current = $self->_begin_preformatted($current);
                  }
                } else {
                  $self->line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
                }
              } elsif ($command eq 'tab') {
                $self->line_error($self->__("ignoring \@tab outside of multitable"), $line_nr);
              } else {
                $self->line_error (sprintf($self->__("\@%s outside of table or list"), $command), $line_nr);
              }
              $misc->{'line_nr'} = $line_nr if (defined($misc));
            } else {
              $misc = { 'cmdname' => $command, 'parent' => $current,
                  'line_nr' => $line_nr };
              push @{$current->{'contents'}}, $misc;
              if ($self->{'sections_level'} and $root_commands{$command}
                   and $command ne 'node' and $command ne 'part') {
                $current->{'contents'}->[-1]->{'extra'}->{'sections_level'}
                  = $self->{'sections_level'};
              }
              # def*x
              if ($def_commands{$command}) {
                my $base_command = $command;
                $base_command =~ s/x$//;
                # check that the def*x is first after @def*, no paragraph
                # in-between.
                my $after_paragraph = 0;
                foreach my $content (@{$current->{'contents'}}) {
                  if ($content->{'type'} and $content->{'type'} eq 'paragraph') {
                    $after_paragraph = 1;
                    last;
                  } elsif ($content->{'type'} and $content->{'type'} eq 'preformatted') {
                    foreach my $preformatted_content (@{$content->{'contents'}}) {
                      if ((defined($preformatted_content->{'text'}) 
                           and $preformatted_content->{'text'} =~ /\S/)
                          or ($preformatted_content->{'cmdname'} 
                              and ($preformatted_content->{'cmdname'} ne 'c'
                                   and $preformatted_content->{'cmdname'} ne 'comment'))) {
                        $after_paragraph = 1;
                        last;
                      }
                    }
                    last if ($after_paragraph);
                  }
                }
                push @{$self->{'context_stack'}}, 'def';
                $current->{'contents'}->[-1]->{'type'} = 'def_line';
                $current->{'contents'}->[-1]->{'extra'} = 
                   {'def_command' => $base_command,
                    'original_def_cmdname' => $command};
                if ($current->{'cmdname'} 
                    and $current->{'cmdname'} eq $base_command) {
                  pop @{$current->{'contents'}};
                  _gather_def_item($current, $command);
                  push @{$current->{'contents'}}, $misc; 
                }
                if (!$current->{'cmdname'} 
                     or $current->{'cmdname'} ne $base_command
                     or $after_paragraph) {
                  $self->line_error(sprintf($self->__("Must be after `\@%s' to use `\@%s'"), $base_command, $command), $line_nr);
                  $current->{'contents'}->[-1]->{'extra'}->{'not_after_command'} = 1;
                }
              }
            }
            # a container for what is on the @-command line, considered to
            # be the @-command argument
            if ($line_arg) {
              $current = $current->{'contents'}->[-1];
              $current->{'args'} = [ { 'type' => 'misc_line_arg', 
                                      'contents' => [], 
                                      'parent' => $current } ];
              # @node is the only misc command with args separated with comma
              # FIXME a 3 lingering here deep into the code may not
              # be very wise...
              if ($command eq 'node') {
                $current->{'remaining_args'} = 3;
              } elsif ($command eq 'author') {
                my $parent = $current;
                my $found;
                while ($parent->{'parent'}) {
                  $parent = $parent->{'parent'};
                  last if ($parent->{'type'}
                          and $parent->{'type'} eq 'brace_command_context');
                  if ($parent->{'cmdname'}) {
                    if ($parent->{'cmdname'} eq 'titlepage') {
                      push @{$self->{'extra'}->{'author'}}, $current;
                      $current->{'extra'}->{'titlepage'} = $parent;
                      $found = 1;
                    } elsif ($parent->{'cmdname'} eq 'quotation' or
                        $parent->{'cmdname'} eq 'smallquotation') {
                      push @{$parent->{'extra'}->{'authors'}}, $current;
                      $current->{'extra'}->{'quotation'} = $parent;
                      $found = 1;
                    }
                    last if ($found);
                  }
                }
                if (!$found) {
                  $self->line_warn (sprintf($self->__(
               "\@%s not meaningful outside `\@titlepage' and `\@quotation' environments"),
                                 $command), $current->{'line_nr'});
                }
              } elsif ($command eq 'dircategory' and $self->{'current_node'}) {
                  $self->line_warn ($self->__("\@dircategory after first node"),
                               $line_nr);
              }

              $current = $current->{'args'}->[-1];
              push @{$self->{'context_stack'}}, 'line' 
                unless ($def_commands{$command});
            }
            $line = _start_empty_line_after_command($line, $current, $misc);
          }
          $misc->{'extra'}->{'invalid_nesting'} = 1 if ($invalid);

          if (!$self->_register_global_command($command, $misc, $line_nr)
              and $command eq 'dircategory') {
            push @{$self->{'info'}->{'dircategory_direntry'}}, $misc;
          }
        # @-command with matching @end opening
        } elsif (exists($block_commands{$command})) {
          if ($command eq 'macro' or $command eq 'rmacro') {
            my $macro = _parse_macro_command_line ($self, $command, $line, 
                                 $current, $line_nr);
            push @{$current->{'contents'}}, $macro;
            $current->{'contents'}->[-1]->{'extra'}->{'invalid_nesting'} = 1 
              if ($invalid);
            $current = $current->{'contents'}->[-1];
            last;
          } elsif ($block_commands{$command} eq 'conditional') {
            my $ifvalue_true = 0;
            if ($command eq 'ifclear' or $command eq 'ifset') {
              # REVALUE
              if ($line =~ /^\s+([\w\-]+)/) {
                my $name = $1;
                if ((exists($self->{'values'}->{$name}) and $command eq 'ifset')
                    or (!exists($self->{'values'}->{$name}) 
                         and $command eq 'ifclear')) {
                  $ifvalue_true = 1;
                }
                print STDERR "CONDITIONAL \@$command $name: $ifvalue_true\n" if ($self->{'DEBUG'});
              } else {
                $self->line_error (sprintf($self->__("%c%s requires a name"), 
                                           ord('@'), $command), $line_nr);
              }
            } elsif ($command =~ /^ifnot(.*)/) {
              $ifvalue_true = 1 if !($self->{'expanded_formats_hash'}->{$1}
                    # exception as explained in the texinfo manual
                    or ($1 eq 'info' 
                        and $self->{'expanded_formats_hash'}->{'plaintext'}));
              print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n" if ($self->{'DEBUG'});
            } else {
              die unless ($command =~ /^if(.*)/);
              $ifvalue_true = 1 if ($self->{'expanded_formats_hash'}->{$1}
                      or ($1 eq 'info' 
                          and $self->{'expanded_formats_hash'}->{'plaintext'}));
              print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n" if ($self->{'DEBUG'});
            }
            if ($ifvalue_true) {
              push @{$self->{'conditionals_stack'}}, $command;
            } else {
              push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                                'parent' => $current,
                                                'contents' => [] };
              $current = $current->{'contents'}->[-1];
            }
            # FIXME ignore what is remaining on the line, to eat 
            # the end of line?
            last;
          } else {
            my $block;
            # a menu command closes a menu_comment, but not the other
            # block commands. This won't catch menu commands buried in 
            # other formats (that are incorrect anyway).
            if ($menu_commands{$command} and $current->{'type'} 
                and (($current->{'type'} eq 'preformatted'
                     and $current->{'parent'}->{'type'} 
                     and ($current->{'parent'}->{'type'} eq 'menu_comment'
                          or $current->{'parent'}->{'type'} eq 'menu_entry_description'))
                   # FIXME remove the next conditions
                   or ($current->{'type'} eq 'menu_comment' 
                       or $current->{'type'} eq 'menu_entry_description'))) {

              my $menu;

              if ($current->{'type'} eq 'preformatted') {
                # This should not happen since preformatted was closed above
                warn "BUG: in preformatted in menu after an end preformatted";
                $menu = $current->{'parent'}->{'parent'};
                # don't keep empty menu_comment
                if (!@{$current->{'contents'}}) {
                  pop @{$current->{'parent'}->{'contents'}};
                  if (!scalar(@{$current->{'parent'}->{'contents'}})) {
                    pop @{$menu->{'contents'}};
                  }
                }
              } else {
                $menu = $current->{'parent'};
                pop @{$menu->{'contents'}}
                  if (!@{$current->{'contents'}});
              }
              my $context = pop @{$self->{'context_stack'}};
              warn "BUG: not preformatted on context stack $context (new menu)" 
                if ($context ne 'preformatted');
              
              if ($menu->{'type'} and $menu->{'type'} eq 'menu_entry') {
                $menu = $menu->{'parent'};
              }

              $current = $menu;
            }
            # the def command holds a line_def* which corresponds with the
            # definition line.  This allows to have a treatement similar
            # with def*x.
            if ($def_commands{$command}) {
              push @{$self->{'context_stack'}}, 'def';
              $block = { 'parent' => $current,
                         'cmdname' => $command,
                         'contents' => [] };
              push @{$current->{'contents'}}, $block;
              $current = $current->{'contents'}->[-1];
              push @{$current->{'contents'}}, { 
                                                'type' => 'def_line',
                                                'parent' => $current,
                                                'line_nr' => $line_nr,
                                                'extra' => 
                                                 {'def_command' => $command,
                                                  'original_def_cmdname' => $command}
                                                };
              $current->{'contents'}->[-1]->{'extra'}->{'invalid_nesting'} = 1 
                if ($invalid);
            } else {
              $block = { 'cmdname' => $command,
                         'parent' => $current,
                         'contents' => [] };
              push @{$current->{'contents'}}, $block;
            }
            $current = $current->{'contents'}->[-1];

            if ($block_arg_commands{$command}) {
              push @{$self->{'context_stack'}}, 'preformatted' 
                if ($preformatted_commands{$command});
              if ($region_commands{$command}) {
                if (@{$self->{'regions_stack'}}) {
                  $self->line_error (sprintf($self->__("Region %s inside region %s is not allowed"),
                                    $command, $self->{'regions_stack'}->[-1]->{'cmdname'}), 
                                    $line_nr);
                }
                push @{$self->{'regions_stack'}}, $block;
              }
              if ($menu_commands{$command}) {
                if ($self->{'context_stack'}->[-1] eq 'preformatted') {
                  push @{$self->{'context_stack'}}, 'preformatted';
                } else {
                  push @{$self->{'context_stack'}}, 'menu';
                }
                push @{$self->{'info'}->{'dircategory_direntry'}}, $block
                  if ($command eq 'direntry');
                if ($self->{'current_node'}) {
                  if ($command eq 'direntry' and $self->{'SHOW_MENU'}) {
                    $self->line_warn ($self->__("\@direntry after first node"),
                              $line_nr);
                  } elsif ($command eq 'menu') {
                    push @{$self->{'current_node'}->{'menus'}}, $current;
                  }
                } elsif ($command ne 'direntry' and $self->{'SHOW_MENU'}) {
                  $self->line_error (sprintf($self->__("\@%s seen before first \@node"), 
                                              $command), $line_nr);
                  $self->line_error ($self->__("perhaps your \@top node should be wrapped in \@ifnottex rather than \@ifinfo?"), 
                                $line_nr, 1);
                  if ($command eq 'menu') {
                    push @{$self->{'info'}->{'unassociated_menus'}}, $current;
                  }
                }
              }
              $current->{'args'} = [ {
                 'type' => 'block_line_arg',
                 'contents' => [],
                 'parent' => $current } ];
              
              $current->{'remaining_args'} = $block_commands{$command} -1 
                if ($block_commands{$command} =~ /^\d+$/ 
                    and $block_commands{$command} -1 > 0);
              $current = $current->{'args'}->[-1];
              push @{$self->{'context_stack'}}, 'line' 
                unless ($def_commands{$command});
            }
            $block->{'line_nr'} = $line_nr;
            $block->{'extra'}->{'invalid_nesting'} = 1 if ($invalid);
            $self->_register_global_command($command, $block, $line_nr);

            $line = _start_empty_line_after_command($line, $current, $block);
          }
        } elsif (defined($brace_commands{$command})
               or defined($self->{'definfoenclose'}->{$command})) {
          
          push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                            'parent' => $current, 
                                            'contents' => [] };
          $current->{'contents'}->[-1]->{'line_nr'} = $line_nr
            if ($keep_line_nr_brace_commands{$command});
          $current->{'contents'}->[-1]->{'extra'}->{'invalid_nesting'} = 1 
            if ($invalid);
          $current = $current->{'contents'}->[-1];
          if ($command eq 'click') {
            $current->{'extra'}->{'clickstyle'} = $self->{'clickstyle'};
          } elsif ($command eq 'kbd') {
            if ($self->{'context_stack'}->[-1] eq 'preformatted'
                and $self->{'kbdinputstyle'} ne 'distinct') {
              $current->{'extra'}->{'code'} = 1;
            } elsif ($self->{'kbdinputstyle'} eq 'code'
                     or ($self->{'kbdinputstyle'} eq 'example'
                         and $self->_in_code($current->{'parent'}))) {
              $current->{'extra'}->{'code'} = 1;
            }
          }
          if ($self->{'definfoenclose'}->{$command}) {
            $current->{'type'} = 'definfoenclose_command';
            $current->{'extra'} = { 
                 'begin' => $self->{'definfoenclose'}->{$command}->[0], 
                 'end' => $self->{'definfoenclose'}->{$command}->[1] };
          }
        } elsif ($no_brace_commands{$command}) {
          push @{$current->{'contents'}},
                 { 'cmdname' => $command, 'parent' => $current };
          # FIXME generalize?
          if ($command eq '\\' and $self->{'context_stack'}->[-1] ne 'math') {
            $self->line_warn (sprintf($self->__("\@%s should only appear in math context"), 
                                        $command), $line_nr);
          }
          if ($command eq "\n") {
            my $included_file;
            ($current, $included_file) = 
              _end_line ($self, $current, $line_nr);
            last;
          }
        } else {
          $self->line_error (sprintf($self->__("Unknown command `%s'"), 
                                                      $command), $line_nr);
        }

      } elsif ($line =~ s/^([{}@,:\t.])//) {
        my $separator = $1;
        print STDERR "SEPARATOR: $separator\n" if ($self->{'DEBUG'});
        if ($separator eq '@') {
          # this may happen with a @ at the very end of a file, therefore
          # not followed by anything.
          $self->line_error ($self->__("Unexpected \@"), $line_nr);
        } elsif ($separator eq '{') {
          _abort_empty_line ($self, $current);
          if ($current->{'cmdname'} 
               and (defined($brace_commands{$current->{'cmdname'}})
                     or $self->{'definfoenclose'}->{$current->{'cmdname'}})) {
            my $command = $current->{'cmdname'};
            $current->{'args'} = [ { 'parent' => $current,
                                   'contents' => [] } ];
            $current->{'remaining_args'} = $brace_commands{$command} -1
                  if ($brace_commands{$command} and $brace_commands{$command} -1);
            $current->{'line_nr'} = $line_nr if ($brace_commands{$command});
            if ($self->{'definfoenclose'}->{$command}) {
              $current->{'remaining_args'} = 0;
            }
            $current = $current->{'args'}->[-1];
            if ($context_brace_commands{$command}) {
              if ($command eq 'caption' or $command eq 'shortcaption') {
                my $float;
                if (!$current->{'parent'}->{'parent'} 
                    or !$current->{'parent'}->{'parent'}->{'cmdname'}
                    or $current->{'parent'}->{'parent'}->{'cmdname'} ne 'float') {
                  $float = $current->{'parent'};
                  while ($float->{'parent'} and !($float->{'cmdname'}
                                                  and $float->{'cmdname'} eq 'float')) {
                    $float = $float->{'parent'};
                  }
                  if (!($float->{'cmdname'} and $float->{'cmdname'} eq 'float')) {
                    $self->line_error (sprintf($self->__("\@%s is not meaningful outside `\@float' environment"),
                                               $command), $line_nr);
                    $float = undef;
                  } else {
                    $self->line_warn (sprintf($self->__("\@%s should be right below `\@float'"),
                                               $command), $line_nr);
                  }
                } else {
                  $float = $current->{'parent'}->{'parent'};
                }
                if ($float) {
                  if ($float->{'extra'}->{$command}) {
                    $self->line_warn (sprintf($self->__("Ignoring multiple \@%s"),
                                              $command), $line_nr);
                  } else {
                    $current->{'parent'}->{'extra'}->{'float'} = $float;
                    $float->{'extra'}->{$command} = $current->{'parent'};
                  }
                }
              }
              push @{$self->{'context_stack'}}, $current->{'parent'}->{'cmdname'};
              $line =~ s/([^\S\n]*)//;
              $current->{'type'} = 'brace_command_context';
              push @{$current->{'contents'}}, { 'type' => 'empty_spaces_before_argument', 
                                        'text' => $1,
                                        'parent' => $current };
            } else {
              $current->{'type'} = 'brace_command_arg';
              push @{$current->{'contents'}}, 
                 {'type' => 'empty_spaces_before_argument',
                  'text' => '' } 
                   if ($brace_commands{$current->{'parent'}->{'cmdname'}}
                     and ($brace_commands{$current->{'parent'}->{'cmdname'}} > 1
                        or $simple_text_commands{$current->{'parent'}->{'cmdname'}}));
            }
            print STDERR "OPENED \@$current->{'parent'}->{'cmdname'}, remaining: "
              .(defined($current->{'parent'}->{'remaining_args'}) ? "remaining: $current->{'parent'}->{'remaining_args'}, " : '')
              .($current->{'type'} ? "type: $current->{'type'}" : '')."\n"
               if ($self->{'DEBUG'});
          } elsif ($current->{'parent'}
                    and (($current->{'parent'}->{'cmdname'}
                          and $current->{'parent'}->{'cmdname'} eq 'multitable')
                         or ($current->{'parent'}->{'type'} 
                             and $current->{'parent'}->{'type'} eq 'def_line'))) {
            push @{$current->{'contents'}},
                 { 'type' => 'bracketed', 'contents' => [],
                   'parent' => $current };
            $current = $current->{'contents'}->[-1];
            push @{$current->{'contents'}}, 
                {'type' => 'empty_spaces_before_argument',
                 'text' => '' };
            print STDERR "BRACKETED in def/multitable\n" if ($self->{'DEBUG'});

          } elsif ($self->{'context_stack'}->[-1] eq 'math') {
            push @{$current->{'contents'}},
                 { 'type' => 'bracketed', 'contents' => [],
                   'parent' => $current };
            $current = $current->{'contents'}->[-1];
            print STDERR "BRACKETED in math\n" if ($self->{'DEBUG'});
          } else {
            $self->line_error (sprintf($self->__("Misplaced %c"),
                                             ord('{')), $line_nr);
          }

        } elsif ($separator eq '}') {
          _abort_empty_line ($self, $current);
          #print STDERR "GGGGG". _print_current ($current);
          if ($current->{'type'} and ($current->{'type'} eq 'bracketed')) {
            $current = $current->{'parent'};
           # the following will not happen for footnote if there is 
           # a paragraph withing the footnote
          } elsif ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and (exists $brace_commands{$current->{'parent'}->{'cmdname'}}
                         or $self->{'definfoenclose'}->{$current->{'parent'}->{'cmdname'}})) {
            # for math and footnote out of paragraph
            if ($context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
              my $context_command = pop @{$self->{'context_stack'}};
              die "BUG: def_context $context_command "._print_current($current) 
                if ($context_command ne $current->{'parent'}->{'cmdname'});
            }
            # first is the arg.
            
            if ($brace_commands{$current->{'parent'}->{'cmdname'}} 
                and ($brace_commands{$current->{'parent'}->{'cmdname'}} > 1
                   or $simple_text_commands{$current->{'parent'}->{'cmdname'}})
                and $current->{'parent'}->{'cmdname'} ne 'math') {
              $self->_isolate_last_space($current);
              $self->_register_command_arg($current, 'brace_command_contents');
              # Remove empty arguments, as far as possible
              _remove_empty_content_arguments($current);
            }
            my $closed_command = $current->{'parent'}->{'cmdname'};
            print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'DEBUG'});
            delete $current->{'parent'}->{'remaining_args'};
            if (defined($brace_commands{$closed_command}) 
                 and $brace_commands{$closed_command} == 0
                 and @{$current->{'contents'}}) {
              $self->line_warn (sprintf($self->__("Command \@%s does not accept arguments"), 
                                        $closed_command), $line_nr);
            }
            if ($current->{'parent'}->{'cmdname'} eq 'anchor') {
              $current->{'parent'}->{'line_nr'} = $line_nr;
              my $parsed_anchor = _parse_node_manual($current);
              if (_check_node_label($self, $parsed_anchor,
                                $current->{'parent'}->{'cmdname'}, $line_nr)) {
                _register_label($self, $current->{'parent'},
                  $parsed_anchor, $line_nr);
                if (@{$self->{'regions_stack'}}) {
                  $current->{'extra'}->{'region'} = $self->{'regions_stack'}->[-1];
                }
              }
            } elsif ($ref_commands{$current->{'parent'}->{'cmdname'}}) {
              my $ref = $current->{'parent'};
              if (@{$ref->{'args'}}) {
                my @args = @{$ref->{'extra'}->{'brace_command_contents'}};
                if (!defined($args[0])) {
                  $self->line_warn (sprintf($self->__("Command \@%s missing a node argument"),
                                        $closed_command), $line_nr);
                } else {
                  my $parsed_ref_node = _parse_node_manual($ref->{'args'}->[0]);
                  $ref->{'extra'}->{'node_argument'} = $parsed_ref_node;
                  if ($closed_command ne 'inforef' 
                           and !defined($args[3]) and !defined($args[4])
                           and !$parsed_ref_node->{'manual_content'}) {
                    push @{$self->{'internal_references'}}, $ref;
                  }
                }
              }
            } elsif ($current->{'parent'}->{'cmdname'} eq 'image') {
              my $image = $current->{'parent'};
              if (!@{$image->{'args'}} 
                  or !@{$image->{'extra'}->{'brace_command_contents'}}
                  or !defined($image->{'extra'}->{'brace_command_contents'}->[0])) {
                $self->line_error(
                   $self->__("\@image missing filename argument"), $line_nr);
              }
            } elsif($current->{'parent'}->{'cmdname'} eq 'dotless') {
              my $dotless = $current->{'parent'};
              if (@{$current->{'contents'}}) {
                my $text = $current->{'contents'}->[0]->{'text'};
                if (!defined ($text)
                  or ($text ne 'i' and $text ne 'j')) {
                  $self->line_error (sprintf($self->
                    __("%c%s expects `i' or `j' as argument, not `%s'"), 
                    ord('@'), $dotless->{'cmdname'}, 
                    Texinfo::Convert::Texinfo::convert($current)), $line_nr);
                }
              }
            } elsif ($explained_commands{$current->{'parent'}->{'cmdname'}}) {
              my $explained = $current->{'parent'};
              if (!@{$explained->{'args'}} 
                  or !@{$explained->{'extra'}->{'brace_command_contents'}}
                  or !defined($explained->{'extra'}->{'brace_command_contents'}->[0])) {
                $self->line_warn(
                   sprintf($self->__("\@%s missing first argument"),
                           $explained->{'cmdname'}), $line_nr);
              } else {
                my $normalized_type
                  = Texinfo::Convert::NodeNameNormalization::normalize_node(
                      {'contents' =>
                       $explained->{'extra'}->{'brace_command_contents'}->[0]});
                $explained->{'extra'}->{'normalized'} = $normalized_type;
                if (!$explained->{'extra'}->{'brace_command_contents'}->[1]) {
                  if ($self->{'explained_commands'}->{$explained->{'cmdname'}}->{$normalized_type}) {
                    $explained->{'extra'}->{'explanation_contents'} 
                      = $self->{'explained_commands'}->{$explained->{'cmdname'}}->{$normalized_type};
                  }
                } else {
                  $self->{'explained_commands'}->{$explained->{'cmdname'}}->{$normalized_type} 
                    = $explained->{'extra'}->{'brace_command_contents'}->[1];
                }
              }
            } elsif (_command_with_command_as_argument($current->{'parent'}->{'parent'})
                 and scalar(@{$current->{'contents'}}) == 0) {
               print STDERR "FOR PARENT \@$current->{'parent'}->{'parent'}->{'parent'}->{'cmdname'} command_as_argument braces $current->{'cmdname'}\n" if ($self->{'DEBUG'});
               $current->{'parent'}->{'type'} = 'command_as_argument' 
                  if (!$current->{'parent'}->{'type'});
               $current->{'parent'}->{'parent'}->{'parent'}->{'extra'}->{'command_as_argument'} 
                  = $current->{'parent'};
            }
            $self->_register_global_command($current->{'parent'}->{'cmdname'},
                                            $current->{'parent'}, $line_nr);
            if ($command_ignore_space_after{$current->{'parent'}->{'cmdname'}}) {
              push @{$current->{'parent'}->{'parent'}->{'contents'}}, 
                 {'type' => 'empty_spaces_after_close_brace',
                  'text' => '' };                          
            }
            $current = $current->{'parent'}->{'parent'};
            $current = $self->_begin_preformatted ($current)
               if ($close_preformatted_commands{$closed_command});
          # footnote caption closing, when there is a paragraph inside.
          } elsif ($context_brace_commands{$self->{'context_stack'}->[-1]}) {
             # closing the context under broader situations
             $current = _end_paragraph($self, $current, $line_nr);
             if ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and $brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}} eq $self->{'context_stack'}->[-1]) {
              my $context_command = pop @{$self->{'context_stack'}};
              die "BUG: def_context $context_command "._print_current($current) 
                if ($context_command ne $current->{'parent'}->{'cmdname'});
              print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'DEBUG'});
              my $closed_command = $current->{'parent'}->{'cmdname'};
              $self->_register_global_command($current->{'parent'}->{'cmdname'},
                                              $current->{'parent'}, $line_nr);
              $current = $current->{'parent'}->{'parent'};
              $current = $self->_begin_preformatted ($current)
                 if ($close_preformatted_commands{$closed_command});
            }
          } else {
            $self->line_error (sprintf($self->__("Misplaced %c"),
                                     ord('}')), $line_nr);
          }
        } elsif ($separator eq ','
                 and $current->{'parent'}->{'remaining_args'}) {
          _abort_empty_line ($self, $current);
          if ($brace_commands{$current->{'parent'}->{'cmdname'}} 
              and ($brace_commands{$current->{'parent'}->{'cmdname'}} > 1
                 or $simple_text_commands{$current->{'parent'}->{'cmdname'}})) {
            $self->_isolate_last_space($current);
            $self->_register_command_arg($current, 'brace_command_contents');
          } else {
            $self->_isolate_last_space($current);
            if (exists $block_commands{$current->{'parent'}->{'cmdname'}}) {
              $self->_register_command_arg($current, 'block_command_line_contents');
            }
          }
          my $type = $current->{'type'};
          $current = $current->{'parent'};
          $current->{'remaining_args'}--;
          push @{$current->{'args'}},
               { 'type' => $type, 'parent' => $current, 'contents' => [] };
          $current = $current->{'args'}->[-1];
          push @{$current->{'contents'}}, 
                 {'type' => 'empty_spaces_before_argument',
                  'text' => '' };                          
        } elsif ($separator eq ',' and $current->{'type'}
            and $current->{'type'} eq 'misc_line_arg'
            and $current->{'parent'}->{'cmdname'} 
            and $current->{'parent'}->{'cmdname'} eq 'node') {
          $self->line_warn ($self->__("Superfluous arguments for node"), $line_nr);
        # end of menu node (. must be followed by a space to stop the node).
        } elsif (($separator =~ /[,\t.]/ and $current->{'type'}
               and $current->{'type'} eq 'menu_entry_node')
               or ($separator eq ':' and $current->{'type'}
                 and $current->{'type'} eq 'menu_entry_name')) {
          $current = $current->{'parent'};
          push @{$current->{'args'}}, { 'type' => 'menu_entry_separator',
                                 'text' => $separator,
                                 'parent' => $current };
        } else {
          $current = _merge_text ($self, $current, $separator);
        }
      # Misc text except end of line
      } elsif ($line =~ s/^([^{}@,:\t.\n]+)//) {
        my $new_text = $1;
        $current = _merge_text ($self, $current, $new_text);
      # end of line
      } else {
        if ($self->{'DEBUG'}) {
          print STDERR "END LINE: ". _print_current($current)."\n";
        }
        if ($line =~ s/^(\n)//) {
          $current = _merge_text ($self, $current, $1);
        } else {
          die "BUG: text remaining and `$line'\n" if (scalar(@{$self->{'input'}}));
        }
        #print STDERR "END LINE AFTER MERGE END OF LINE: ". _print_current($current)."\n";
        my $included_file;
        ($current, $included_file) = 
            _end_line ($self, $current, $line_nr);
        last;
      }
    }
  }
  while (@{$self->{'conditionals_stack'}}) { 
    my $end_conditional = pop @{$self->{'conditionals_stack'}};
    $self->line_error (sprintf($self->__("Expected \@end %s"), $end_conditional), $line_nr);
  }
  $current = _close_commands($self, $current, $line_nr);

  if (@{$self->{'context_stack'}} != 1) {
    # This happens in 2 cases in the tests:
    #   @verb not closed on misc commands line
    #   def line escaped with @ ending the file
    if ($self->{'DEBUG'}) {
      print STDERR "CONTEXT_STACK no empty end _parse_texi: ".join('|', @{$self->{'context_stack'}})."\n";
    }
    @{$self->{'context_stack'}} = ($self->{'context'});
  }
  return $root;
}


# parse special line @-commands, unmacro, set, clear, clickstyle.
# Also remove spaces or ignore text, as specified in the misc_commands hash.
sub _parse_special_misc_command($$$$)
{
  my $self = shift;
  my $line = shift;
  my $command = shift;
  my $line_nr = shift;
  my $args = [];

  if ($command eq 'set') {
    # REVALUE
    if ($line =~ /^\s+([\w\-]+)\s*(.*?)\s*$/) {
      my $name = $1;
      my $arg = $2;
      $args = [$name, $arg];
      $self->{'values'}->{$name} = $arg;
    } else {
      $self->line_error (sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'clear') {
    # REVALUE
    if ($line =~ /^\s+([\w\-]+)/) {
      $args = [$1];
      delete $self->{'values'}->{$1};
    } else {
      $self->line_error (sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'unmacro') {
    # REMACRO
    if ($line =~ /^\s+([[:alnum:]][[:alnum:]\-]*)/) {
      $args = [$1];
      delete $self->{'macros'}->{$1};
      print STDERR "UNMACRO $1\n" if ($self->{'DEBUG'});
    } else {
      $self->line_error (sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'clickstyle') {
    # REMACRO
    if ($line =~ /^\s+@([[:alnum:]][[:alnum:]\-]*)({})?\s*/) {
      $args = ['@'.$1];
      $self->{'clickstyle'} = $1;
      my $remaining = $line;
      $remaining =~ s/^\s+@([[:alnum:]][[:alnum:]\-]*)({})?\s*//;
      $self->line_warn (sprintf($self->__("Remaining argument on \@%s line: %s"), $command, $remaining), $line_nr) if ($remaining);
    } else {
      $self->line_error (sprintf($self->__("\@%s should only accept a \@-command as argument, not `%s'"), $command, $line), $line_nr);
    }
  } else {
    die "Unknown special command $command\n";
  }
  return ($args);
}

sub _trim_spaces_comment_from_content($)
{
  Texinfo::Common::trim_spaces_comment_from_content($_[0]);
}

# at the end of a @-command line with arguments, parse the resulting 
# text, to collect aliases, definfoenclose and collect errors on 
# wrong arguments.
sub _parse_line_command_args($$$)
{
  my $self = shift;
  my $line_command = shift;
  my $line_nr = shift;

  my $args;

  my $command = $line_command->{'cmdname'};
  my $arg = $line_command->{'args'}->[0];

  if ($self->{'DEBUG'}) {
    print STDERR "MISC ARGS \@$command\n";
    if (@{$arg->{'contents'}}) {
      my $idx = 0;
      foreach my $content (@{$arg->{'contents'}}) {
        my $name = '';
        $name = '@' . $content->{'cmdname'} if ($content->{'cmdname'});
        my $type = ', t: ';
        $type .= $content->{'type'} if ($content->{'type'});
        my $text = ', ';
        $type .= $content->{'text'} if ($content->{'text'});
        print STDERR "   -> $idx $name $type $text\n";
        $idx++;
      }
    }
  }

  my @contents = @{$arg->{'contents'}};

  _trim_spaces_comment_from_content(\@contents);

  if (! @contents) {
    $self->line_error (sprintf($self->__("\@%s missing argument"), 
       $command), $line_nr);
    $line_command->{'extra'}->{'missing_argument'} = 1;
    return undef;
  }

  if (@contents > 1
         or (!defined($contents[0]->{'text'}))) {
    $self->line_error (sprintf($self->__("Superfluous argument to \@%s"),
       $command), $line_nr);
  }
  return undef if (!defined($contents[0]->{'text'}));
  
  my $line = $contents[0]->{'text'};  

  if ($command eq 'alias') {
    # REMACRO
    if ($line =~ s/^([[:alnum:]][[:alnum:]-]*)(\s*=\s*)([[:alnum:]][[:alnum:]-]*)$//) {
      my $new_command = $1;
      my $existing_command = $3;
      $args = [$1, $3];
      $self->{'aliases'}->{$new_command} = $existing_command;
      if (exists($block_commands{$existing_command})) {
        $self->line_warn (sprintf($self->
                             __("Environment command %s as argument to \@%s"), 
                             $existing_command, $command), $line_nr);
      }
    } else {
      $self->line_error (sprintf($self->
                             __("Bad argument to \@%s"), $command), $line_nr);
    }

  } elsif ($command eq 'definfoenclose') {
    # REMACRO
    if ($line =~ s/^([[:alnum:]][[:alnum:]\-]*)\s*,\s*([^\s,]+)\s*,\s*([^\s,]+)$//) {
      $args = [$1, $2, $3 ];
      $self->{'definfoenclose'}->{$1} = [ $2, $3 ];
      print STDERR "DEFINFOENCLOSE \@$1: $2, $3\n" if ($self->{'DEBUG'});
    } else {
      $self->line_error (sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
    }
  } elsif ($command eq 'columnfractions') {
    my @possible_fractions = split (/\s+/, $line);
    if (!@possible_fractions) {
      $self->line_error (sprintf($self->__("Empty \@%s"), $command), 
                             $line_nr);
    } else {
      foreach my $fraction (@possible_fractions) {
        if ($fraction =~ /^(\d*\.\d+)|(\d+)\.?$/) {
          push @$args, $fraction;
        } else {
          $self->line_error (sprintf($self->
                              __("column fraction not a number: %s"),
                              $fraction), $line_nr);
        }
      }
    }
  } elsif ($command eq 'sp') {
    if ($line =~ /^([0-9]+)$/) {
      $args = [$1];
    } else {
      $self->line_error (sprintf($self->__("\@sp arg must be numeric, not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'defindex' || $command eq 'defcodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      if ($forbidden_index_name{$name}) {
        $self->line_error (sprintf($self->
                                __("Reserved index name %s"),$name), $line_nr);
      } else {
        my $in_code = 0;
        $in_code = 1 if ($command eq 'defcodeindex');
        $args = [$name];
        $self->{'index_names'}->{$name} = {$name => $in_code};
        $self->_register_index_commands($name);
      }
    } else {
      $self->line_error (sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'synindex' || $command eq 'syncodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)\s+([[:alnum:]][[:alnum:]\-]*)$/) {
      my $index_from = $1;
      my $index_to = $2;
      $self->line_error (sprintf($self->__("Unknown from index `%s' in \@%s"), $index_from, $command), $line_nr)
        unless $self->{'index_names'}->{$index_from};
      $self->line_error (sprintf($self->__("Unknown to index name `%s' in \@%s"), $index_to, $command), $line_nr)
        unless $self->{'index_names'}->{$index_to};
      if ($self->{'index_names'}->{$index_from} 
           and $self->{'index_names'}->{$index_to}) {
        my $current_to = $index_to;
        # find the merged indices recursively avoiding loops
        while ($current_to ne $index_from 
               and $self->{'merged_indices'}->{$current_to}) {
          $current_to = $self->{'merged_indices'}->{$current_to};
        }
        if ($current_to ne $index_from) {
          my $in_code = 0;
          $in_code = 1 if ($command eq 'syncodeindex');
          $self->{'merged_indices'}->{$index_from} = $current_to;
          foreach my $prefix (keys(%{$self->{'index_names'}->{$index_from}})) {
            $self->{'index_names'}->{$current_to}->{$prefix} = $in_code;
          }
          $args = [$index_from, $index_to];
        } else {
          $self->line_warn (sprintf($self->__("\@%s leads to a merging of %s in itself, ignoring"), 
                             $command, $index_from), $line_nr);
        }
      }
    } else {
      $self->line_error (sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'printindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      if (!exists($self->{'index_names'}->{$name})) {
        $self->line_error (sprintf($self->__("Unknown index `%s' in \@printindex"),
                                    $name), $line_nr);
      
      } else {
        if ($self->{'merged_indices'}->{$name}) {
          $self->line_warn (sprintf($self->__("Printing an index `%s' merged in another one `%s'"), 
                                     $name, $self->{'merged_indices'}->{$name}),
                             $line_nr); 
        }
        if (!defined($self->{'current_node'}) 
            and !defined($self->{'current_section'})
            and !scalar(@{$self->{'regions_stack'}})) {
          $self->line_warn (sprintf($self->__("Printindex before document beginning: \@printindex %s"), 
                                    $name), $line_nr);
        }
        $args = [$name];
      }
    } else {
      $self->line_error (sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif (grep {$_ eq $command} ('everyheadingmarks', 'everyfootingmarks',
                                  'evenheadingmarks', 'oddheadingmarks',
                                  'evenfootingmarks', 'oddfootingmarks')) {
    if ($line eq 'top' or $line eq 'bottom') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@%s arg must be `top' or `bottom', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'fonttextsize') {
    if ($line eq '10' or $line eq '11') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("Only \@%s 10 or 11 is supported, not `%s'"),$command, $line), $line_nr);
    }
  } elsif ($command eq 'footnotestyle') {
    if ($line eq 'separate' or $line eq 'end') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@%s arg must be `separate' or `end', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'setchapternewpage') {
    if ($line eq 'on' or $line eq 'off' or $line eq 'odd') {
      $args = [$1];
    } else {
      $self->line_error (sprintf($self->__("\@%s arg must be `on', `off' or `odd', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'need') { # only a warning
    if (($line =~ /^([0-9]+(\.[0-9]*)?)$/) or
             ($line =~ /^(\.[0-9]+)$/)) {
      $args = [$1];
    } else {
      $self->line_error (sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'paragraphindent') {
    if ($line =~ /^([\w\-]+)$/) {
      my $value = $1;
      if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis') {
        $args = [$1];
      } else {
        $self->line_error (sprintf($self->__("\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"), $value), $line_nr);
      } 
    } else {
      $self->line_error (sprintf($self->__("\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'firstparagraphindent') {
    if ($line eq 'none' or $line eq 'insert') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@firstparagraphindent arg must be `none' or `insert', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'exampleindent') {
    if ($line =~ /^([0-9]+)/) {
      $args = [$1];
    } elsif ($line =~ /^(asis)$/) {
      $args = [$1];
    } else {
      $self->line_error (sprintf($self->__("\@exampleindent arg must be numeric/`asis', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'frenchspacing' 
           or $command eq 'xrefautomaticsectiontitle'
           or $command eq 'codequoteundirected'
           or $command eq 'codequotebacktick') {
    if ($line eq 'on' or $line eq 'off') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("Expected \@%s on or off, not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'kbdinputstyle') {
    if ($line eq 'code' or $line eq 'example' or $line eq 'distinct') {
      $self->{'kbdinputstyle'} = $line;
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@kbdinputstyle arg must be `code'/`example'/`distinct', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'allowcodebreaks') {
    if ($line eq 'true' or $line eq 'false') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@allowcodebreaks arg must be `true' or `false', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'urefbreakstyle') {
    if ($line eq 'after' or $line eq 'before' or $line eq 'none') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("\@urefbreakstyle arg must be `after'/`before'/`none', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'headings') {
    if ($line eq 'off' or $line eq 'on' or $line eq 'single' 
       or $line eq 'double' or  $line eq 'singleafter' or $line eq 'doubleafter') {
      $args = [$line];
    } else {
      $self->line_error (sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  }
  return $args;
}

1;
__END__
# Below is stub documentation.

=head1 NAME

Texinfo::Parser - Parse Texinfo code in a Perl tree

=head1 SYNOPSIS

  use Texinfo::Parser;
  my $parser = Texinfo::Parser::parser();
  my $tree = $parser->parse_texi_file("somefile.texi");
  my ($errors, $errors_count) = $parser->errors();
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'};
  }

  my ($index_names, $merged_indices_hash, $index_entries_arrays)
      = $parser->indices_information();
  my $float_types_arrays = $parser->floats_information();
  my $internal_references_array
    = $parser->internal_references_information();
  # An hash reference on normalized node/float/anchor names
  my $labels_information = $parser->labels_information();
  # A hash reference, keys are @-command names, value is an 
  # array reference holding all the corresponding @-commands.
  my $global_commands_information = $parser->global_commands_information();
  # a hash reference on some document informations (encodings, 
  # input file name, dircategory and direntry list, for exampel).
  my $global_informations = $parser->global_informations();

=head1 DESCRIPTION

Texinfo::Parser will parse Texinfo text into a perl tree.  In one pass
it expands user defined @-commands, conditionals (@ifset, @ifinfo...)
and @value and constructs the tree.  Some extra information is gathered
while doing the tree, for example the block command associated with @end,
the number of row in a multitable, the node associated with a section.




=head2 EXPORT

None by default.


=head2 METHODS

The following method is used to construct a new C<Texinfo::Parser> object:

=over

=item $parser = Texinfo::Parser::parser($options);

This method creates a new parser.  The options may be provided as a hash
reference.  There are two types of options.  The first type of options
change the way the parser behave, they are described right here.  The 
other type of options allow to give to the parser some information as if 
it came from texinfo code, for example allow to set aliases (as with 
C<@alias>), values (as with C<@set>), merged indices (as with 
C<@synindex>).  These options are described below in L</TEXINFO PARSER OPTIONS>.

=over

=item SHOW_MENU

If false, no menu related error are reported.  Default is true.

=item expanded_formats

An array reference of the output formats for which C<@ifI<FORMAT>> 
conditional blocks should be expanded.  Default is empty.

The raw block formats (within C<@html> blocks, for example) are 
alwyas kept.

=item include_directories

An array reference of directories in which C<@include> files should be 
searched for.  Default contains the working directory, F<.>.

=item INLINE_INSERTCOPYING

If set, C<@insertcopying> is replaced by the C<@copying> content as if
C<@insertcopying> was a user-defined macro.  In the default case, it is 
considered to be a simple @-command and kept as is in the tree.

=item IGNORE_BEFORE_SETFILENAME

If set, and C<@setfilename> exists, everything before C<@setfilename>
is put in a special container type, @C<preamble_before_setfilename>.
This option is set in the default case.

=item gettext

If set, the function reference is used to translate error and warning
messages.  It takes a string as argument and returns a string.  The default 
function returns the error message as is.

=item MAX_MACRO_CALL_NESTING

Maximal number of nested user-defined macro calls.  Default is 100000.

=begin :comment

Used by Sectioning only
=item TOP_NODE_UP

Text for the up node of the Top node.  The default is C<(dir)>.  The
string may contain @-commands.

=end :comment

=back

=back

=head2 TEXINFO PARSER OPTIONS

=over

=item aliases

A hash reference.  The key is a command name, the value is the alias, as
could be set by C<@alias>.

=item explained_commands

A hash reference of explained commands (currently abbr or acronym).
The value is also a hash reference.  The key of this hash is a normalized
first argument of these commands, the value is a content array
corresponding to the explanation associated with this first argument.

For example giving as an option:

  'explained_commands' 
    => {'acronym' => {'EU' => [{'text' => 'European Union'}]} 

is the same as having the following texinfo code in the document:

  @acronym{EU, European Union}

=item indices

If it is a hash reference, the keys are index names, the values are
index prefix hash references.  The index prefix hash reference values are
prefix, the value is set if the corresponding index entries should be
formatted as if in C<@code>.

If it is an array reference, it is a list of index names, as if they were
entered as

  @defindex name

=back

=head1 SEE ALSO

L<Texinfo manual|http://www.gnu.org/s/texinfo/manual/texinfo/>

=begin :comment

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=end :comment

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License,
or (at your option) any later version.


=cut
