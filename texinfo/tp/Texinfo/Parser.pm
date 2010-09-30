# Parser.pm: parse texinfo code into a tree.
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
# Parts come from texi2html.pl or texi2html.init.


package Texinfo::Parser;

use 5.00405;
use Data::Dumper;
use strict;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Texinfo::Parser ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  parser
  tree_to_texi      
  parse_texi_text
  parse_texi_line
  errors
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

# i18n
sub N__($)
{
  return $_[0];
}

sub __($$)
{
  my $parser = shift;
  return &{$parser->{'gettext'}}(@_);
}

my %default_configuration = (
  'test' => 0,
  'debug' => 0,
  'gettext' => sub {return $_[0];},
  'context' => '_root',
  'aliases' => {},
  'indices' => [],
  'values' => {},
  'macros' => {}
);

my %no_brace_commands;             # commands never taking braces

foreach my $no_brace_command ('*',' ',"\t","\n",'-', '|', '/',':','!',
                              '?','.','@','}','{',) {
  $no_brace_commands{$no_brace_command} = 1;
}

# commands taking a line as argument or no argument.
# sectioning commands and def* commands are added below.
# index commands are added dynamically.
my %misc_commands = (
  'node' => {'arg' => 'line'}, # special arg
  'bye' => {'skip' => 'line'}, # no arg
  # set, clear
  'set' => {'arg' => 'special'}, # special arg
  #'clear' => {'arg' => 1, 'skip' => 'line'}, # special arg
  'clear' => {'arg' => 'special'}, # special arg
  'unmacro' => {'arg' => 1}, 
  # comments
  'comment' => {'arg' => 'lineraw'},
  'c' => {'arg' => 'lineraw'},
  # special
  'definfoenclose' => {'arg' => 'special'},
  'alias' => {'args' => 'special'}, 
  # file names
  'setfilename' => {'arg' => 'line'},
  'verbatiminclude'=> {'arg' => 'line'},

  'raisesections' => {'skip' => 'line'},  # no arg
  'lowersections' => {'skip' => 'line'}, # no arg
  'contents' => {}, # no arg
  'shortcontents' => {}, # no arg
  'summarycontents'=> {}, # no arg
  'insertcopying'=> {}, # no arg
  'clickstyle' => {'arg' => 1}, # arg should be an @-command
  # more relevant in preamble
  'documentencoding' => {'arg' => 1, 'skip' => 'line'},
  'setcontentsaftertitlepage' => {}, # no arg
  'setshortcontentsaftertitlepage' => {}, # no arg
  'novalidate' => {}, # no arg
  'dircategory'=> {'arg' => 'line'}, # line. Position with regard 
                   # with direntry is significant
  'pagesizes' => {'arg' => 'line'}, # can have 2 args 
                           # or one? 200mm,150mm 11.5in
  'finalout' => {'skip' => 'line'}, # no arg
  'paragraphindent' => {'skip' => 'line', 'arg' => 1}, # arg none asis 
                       # or a number and forbids anything else on the line
  'firstparagraphindent' => {'skip' => 'line', 'arg' => 1}, # none insert
  'frenchspacing' => {'arg' => 1, 'skip' => 'line'}, # on off
                                 # not so sure about 'skip' => 'line'
  'fonttextsize' => {'arg' => 1}, # 10 11
  'allowcodebreaks' => {'arg' => 1, 'skip' => 'line'}, # false or true
  'exampleindent' => {'skip' => 'line', 'arg' => 1}, # asis or a number
  'footnotestyle'=> {'skip' => 'line', 'arg' => 1}, # end and separate
                           # and nothing else on the line
  'afourpaper' => {'skip' => 'line'}, # no arg
  'afivepaper' => {'skip' => 'line'}, # no arg
  'afourlatex' => {'skip' => 'line'}, # no arg
  'afourwide' => {'skip' => 'line'}, # no arg
  'headings'=> {'skip' => 'line', 'arg' => 1},
              #off on single double singleafter doubleafter
              # interacts with setchapternewpage
  'setchapternewpage' => {'skip' => 'line', 'arg' => 1}, # off on odd
  # FIXME for the following the @this* commands are not defined. Also
  # @value and maybe macro invocations may also be delayed.
  'everyheading' => {'arg' => 'line'}, # @*heading @*footing use @|
  'everyfooting' => {'arg' => 'line'}, # + @thispage @thissectionname @thissectionnum
  'evenheading' => {'arg' => 'line'},  # @thissection @thischaptername @thischapternum 
  'evenfooting' => {'arg' => 'line'},  # @thischapter @thistitle @thisfile
  'oddheading' => {'arg' => 'line'},
  'oddfooting' => {'arg' => 'line'},
  'smallbook' => {'skip' => 'line'}, # no arg
  'syncodeindex' => {'skip' => 'line', 'arg' => 2},
                    # args are index identifiers
  'synindex' => {'skip' => 'line', 'arg' => 2},
  'defindex' => {'skip' => 'line', 'arg' => 'special'}, # one identifier arg
  'defcodeindex' => {'skip' => 'line', 'arg' => 'special'}, # one identifier arg
  'documentlanguage' => {'skip' => 'line', 'arg' => 1},
                                                 # language code arg
  'kbdinputstyle' => {'skip' => 'whitespace', 'arg' => 1}, # code 
                                                  #example distinct
  'everyheadingmarks' => {'skip' => 'line', 'arg' => 1}, # top bottom
  'everyfootingmarks' => {'skip' => 'whitespace', 'arg' => 1},
  'evenheadingmarks' => {'skip' => 'whitespace', 'arg' => 1},
  'oddheadingmarks' => {'skip' => 'whitespace', 'arg' => 1},
  'evenfootingmarks' => {'skip' => 'whitespace', 'arg' => 1},
  'oddfootingmarks' => {'skip' => 'whitespace', 'arg' => 1},
  # not valid for info (should be in @iftex)
  'cropmarks' => {}, # no arg

  # formatting
  'center' => {'arg' => 'line'},
  'printindex' => {'arg' => 1, 'skip' => 'line'},
  'listoffloats' => {'arg' => 'line'},
  # especially in titlepage
  'shorttitle' => {'arg' => 'line'},
  'shorttitlepage' => {'arg' => 'line'},
  'settitle' => {'arg' => 'line'},
  'author' => {'arg' => 'line'},
  'subtitle' => {'arg' => 'line'},
  'title' => {'arg' => 'line'},
  'sp' => {'skip' => 'line', 'arg' => 1}, # no arg 
                              # at the end of line or a numerical arg
  'page' => {}, # no arg (pagebreak)
  'need' => {'skip' => 'line', 'arg' => 1}, # one numerical/real arg
  # formatting
  'noindent' => {'skip' => 'whitespace'}, # no arg
  'indent' => {'skip' => 'whitespace'},
  'exdent' => {'skip' => 'space'},
  'headitem' => {'skip' => 'space'},
  'item' => {'skip' => 'space'}, # or line, depending on the context
  'itemx' => {'skip' => 'space'},
  'tab' => {'skip' => 'space'}, 
  # not valid for info (should be in @iftex)
  'vskip' => {'arg' => 'lineraw'}, # arg line in TeX
  # obsolete @-commands.
  'refill' => {}, # no arg (obsolete, to be ignored)
  # Remove spaces and end of lines after the 
  # commands? If no, they can lead to empty lines
  'quote-arg' => {'skip' => 'line'},
  'allow-recursion' => {'skip' => 'line'},
);

# command with braces. value is the max number of arguments.
my %brace_commands;    

# accent commands. They may be called with and without braces.
my %accent_commands;

foreach my $no_arg_command ('TeX','LaTeX','bullet','copyright','registeredsymbol','dots','enddots','equiv','error','expansion','arrow','minus','point','print','result','today','aa','AA','ae','oe','AE','OE','o','O','ss','l','L','DH','dh','TH','th','exclamdown','questiondown','pounds','ordf','ordm','comma','euro','geq','leq','tie','textdegree','quotedblleft','quotedblright','quoteleft','quoteright','quotedblbase','quotesinglbase','guillemetleft','guillemetright','guillemotleft','guillemotright','guilsinglleft','guilsinglright') {
  $brace_commands{$no_arg_command} = 0;
}

foreach my $accent_command ('"','~','^','`',"'",',','=') {
  $accent_commands{$accent_command} = 1;
  $brace_commands{$accent_command} = 1;
}

foreach my $accent_command('ringaccent','H','dotaccent','u','ubaraccent','udotaccent','v','ogonek') {
  $accent_commands{$accent_command} = 1;
  $brace_commands{$accent_command} = 1;
}

foreach my $one_arg_command ('asis','b','cite','clicksequence','click','code','command','ctrl','dfn','dmn','emph','env','file','headitemfont','i','slanted','sansserif','kbd','key','math','option','r','samp','sc','strong','t','indicateurl','var','verb','titlefont','w','hyphenation','anchor','footnote','shortcaption','caption','dotless') {
  $brace_commands{$one_arg_command} = 1;
}

foreach my $two_arg_command('email','acronym','abbr') {
  $brace_commands{$two_arg_command} = 2;
}

foreach my $three_arg_command('uref','url','inforef') {
  $brace_commands{$three_arg_command} = 3;
}

foreach my $five_arg_command('xref','ref','pxref','inforef','image') {
  $brace_commands{$five_arg_command} = 5;
}

# Commands that enclose full texts
my %context_brace_commands;
foreach my $context_brace_command ('footnote', 'caption', 'shortcaption') {
  $context_brace_commands{$context_brace_command} = $context_brace_command;
}

$context_brace_commands{'math'} = 'math';

my %no_paragraph_contexts;
foreach my $no_paragraph_context ('math', 'preformatted', 'menu') {
  $no_paragraph_contexts{$no_paragraph_context} = 1;
};

my %menu_commands;
foreach my $menu_command ('menu', 'detailmenu', 'direntry') {
  $menu_commands{$menu_command} = 1;
};

# commands delimiting blocks, typically with an @end.
# Value is either the number of arguments on the line separated by
# commas or the type of command, 'raw', 'def' or 'multitable'.
my %block_commands;

# commands that have a possible content before an item
my %block_item_commands;

# commands that forces closing an opened paragraph.
my %close_paragraph_commands;

my %def_commands;
foreach my $def_command(
  'deffn',
  'defvr',
  'deftypefn',
  'deftypeop',
  'deftypevr',
  'defcv',
  'deftypecv',
  'defop',
  'deftp',
  'defun',
  'defmac',
  'defspec',
  'defvar',
  'defopt',
  'deftypefun',
  'deftypevar',
  'defivar',
  'deftypeivar',
  'defmethod',
  'deftypemethod'
) {
  $block_commands{$def_command} = 'def';
  $misc_commands{$def_command.'x'} = {'arg' => 'line'};
  $def_commands{$def_command} = 1;
  $def_commands{$def_command.'x'} = 1;
}

$block_commands{'multitable'} = 'multitable';
$block_item_commands{'multitable'} = 1;

foreach my $block_command(
  'menu', 'detailmenu', 'direntry',
  'cartouche', 'group', 'raggedright', 'flushleft', 'flushright',
  'titlepage', 'copying', 'documentdescription') {
  $block_commands{$block_command} = 0;
}

my %preformatted_commands;
foreach my $preformatted_command(
  'example', 'smallexample', 'display', 'smalldisplay', 'lisp',
  'smalllisp', 'format', 'smallformat') {
  $block_commands{$preformatted_command} = 0;
  $preformatted_commands{$preformatted_command} = 1;
}

# macro is special
foreach my $raw_command ('html', 'tex', 'xml', 'docbook', 'verbatim', 
                         'ignore', 'macro', 'rmacro') {
  $block_commands{$raw_command} = 'raw';
}

# 'macro' ?
foreach my $block_command_one_arg('table', 'ftable', 'vtable',
  'itemize', 'enumerate', 'quotation', 'small_quotation') {
  $block_commands{$block_command_one_arg} = 1;
  $block_item_commands{$block_command_one_arg} = 1 
    unless ($block_command_one_arg =~ /quotation/);
}


$block_commands{'float'} = 2;

my %item_container_commands;
foreach my $item_container_command ('itemize', 'enumerate') {
  $item_container_commands{$item_container_command} = 1;
}

my %item_line_commands;
foreach my $item_line_command ('table', 'ftable', 'vtable') {
  $item_line_commands{$item_line_command} = 1;
}

my %deprecated_commands = (
  'ctrl' => '',
  'allow-recursion' => N__('recursion is always allowed'),
  'quote-arg' => N__('arguments are quoted by default'),
);

my %forbidden_index_name = ();
my @default_index_names;

my %index_names = (
 'cp' => { 'prefixes' => {'cp' => 0,'c' => 0}},
 'fn' => { 'prefixes' => {'fn' => 1, 'f' => 1}},
 'vr' => { 'prefixes' => {'vr' => 1, 'v' => 1}},
 'ky' => { 'prefixes' => {'ky' => 1, 'k' => 1}},
 'pg' => { 'prefixes' => {'pg' => 1, 'p' => 1}},
 'tp' => { 'prefixes' => {'tp' => 1, 't' => 1}}
);

foreach my $name(keys(%index_names)) {
  foreach my $prefix (keys %{$index_names{$name}->{'prefixes'}}) {
    $forbidden_index_name{$prefix} = 1;
    push @default_index_names, $prefix;
  }
}

foreach my $other_forbidden_index_name ('info','ps','pdf','htm',
   'log','aux','dvi','texi','txi','texinfo','tex','bib') {
  $forbidden_index_name{$other_forbidden_index_name} = 1;
}


# commands that should only appear at the root level and contain up to
# the next root command
my %root_commands;

foreach my $sectioning_command (
    'top',
    'chapter',
    'unnumbered',
    'chapheading',
    'appendix',
    'section',
    'unnumberedsec',
    'heading',
    'appendixsec',
    'subsection',
    'unnumberedsubsec',
    'subheading',
    'appendixsubsec',
    'subsubsection',
    'unnumberedsubsubsec',
    'subsubheading',
    'appendixsubsubsec',
    'part',
    'appendixsection',
    'majorheading',
    'chapheading',
    'centerchap'
) {
  $misc_commands{$sectioning_command} = { 'arg' => 'line' };
  $root_commands{$sectioning_command} = 1
    unless ($sectioning_command =~ /heading/);
}

$root_commands{'node'} = 1;

my %default_no_paragraph_commands;
my %begin_line_commands;

foreach my $command ('node', 'end') {
  $begin_line_commands{$command} = $command;
}

foreach my $no_paragraph_command ('unmacro', 'rmacro', 'titlefont', 'include', 
          '*', 'caption', 'shortcaption', 'image') {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
}

foreach my $no_paragraph_command (keys(%misc_commands)) {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
  $begin_line_commands{$no_paragraph_command} = 1;
}

foreach my $misc_not_begin_line ('comment', 'c', 'sp', 'refill', 
                                'noindent', 'indent') {
  delete $begin_line_commands{$misc_not_begin_line};
}

foreach my $block_command (keys(%block_commands)) {
  $begin_line_commands{$block_command} = 1;
  $default_no_paragraph_commands{$block_command} = 1;
  $close_paragraph_commands{$block_command} = 1 
     unless ($block_commands{$block_command} eq 'raw');
}
$close_paragraph_commands{'verbatim'} = 1;

foreach my $close_paragraph_command ('titlefont', 'insertcopying', 'sp',
  'verbatiminclude', 'page', 'item', 'itemx', 'tab', 'headitem', 
  'printindex', 'listoffloats') {
  $close_paragraph_commands{$close_paragraph_command} = 1;
}


# deep copy of a structure
sub _deep_copy ($)
{
  my $struct = shift;
  my $string = Data::Dumper->Dump([$struct], ['struct']);
  eval $string;
  return $struct;
}

# initialize a parser
sub parser($;$)
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

  } else {
    bless $parser, $class;
    $conf = shift;
  }

  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if (exists($default_configuration{$key})) {
        if (ref($conf->{$key}) ne 'CODE') {
          $parser->{$key} = _deep_copy($conf->{$key});
        } else {
          $parser->{$key} = $conf->{$key};
        }
      } else {
        warn "$key not a possible configuration in Texinfo::Parser::parser\n";
      }
    }
  }
  $parser->{'misc_commands'} = _deep_copy (\%misc_commands);
  $parser->{'no_paragraph_commands'} = { %default_no_paragraph_commands };
  foreach my $name (@{$parser->{'indices'}}, @default_index_names) {
    $parser->{'misc_commands'}->{$name.'index'} = { 'arg' => 'line' };
    $parser->{'no_paragraph_commands'}->{$name.'index'} = 1;
  }
  $parser->{'errors_warnings'} = [];
  $parser->{'errors_nrs'} = 0;
  $parser->{'context_stack'} = [ $parser->{'context'} ];
  return $parser;
}

sub parse_texi_text($$;$)
{
  my $self = shift;
  my $text = shift;
  my $lines_nr = shift;
  if (!ref($text)) {
    my $chomped = chomp($text);
    $text = [ map {$_."\n"} split (/\n/, $text, -1) ];
    chomp($text->[-1]) unless ($chomped);
  }
  if (defined($lines_nr) and !ref($lines_nr)) {
    my $first_line = $lines_nr;
    $lines_nr = [];
    foreach my $index(0..scalar(@$text)-1) {
       $lines_nr->[$index] = { 'line_nr' => ($index+$first_line),
                                'file_name' => '', 'macro' => '' };
    }
  }
  return $self->_internal_parse_text($text, $lines_nr);
}

sub parse_texi_line($$;$)
{
  my $self = shift;
  return $self->_internal_parse_text([$_[0]], [$_[1]], 1);
}

sub tree_to_texi ($);

sub errors ($)
{
  my $self = shift;
  return ($self->{'errors_warnings'}, $self->{'error_nrs'});
}


# internal sub

# for debugging
sub _print_current($)
{
  my $current = shift;
  my $type = '';
  my $cmd = '';
  my $parent_string = '';
  $type = "($current->{'type'})" if (defined($current->{'type'}));
  $cmd = "\@$current->{'cmdname'}" if (defined($current->{'cmdname'}));
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
  return "$cmd$type : $args $contents\n$parent_string";
}

sub _line_warn($$$)
{
  my $parser = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  return if (!defined($line_number));
  my $file = $line_number->{'file_name'};
  # otherwise out of source build fail since the file names are different
  $file =~ s/^.*\/// if ($parser->{'test'});
  my $warn_line;
  if ($line_number->{'macro'} ne '') {
    $warn_line = sprintf($parser->__(
                             "%s:%d: warning: %s (possibly involving \@%s)\n"),
             $file, $line_number->{'line_nr'}, $text, $line_number->{'macro'});
  } else {
    $warn_line = sprintf($parser->__("%s:%d: warning: %s\n"),
                         $file, $line_number->{'line_nr'}, $text);
  }
  warn $warn_line if ($parser->{'debug'});
  push @{$parser->{'errors_warnings'}},
       { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line,
         %{$line_number} };
}

#  if ($error_nrs >= $parser->{'error_limit'}) {
#    warn $parser->__("Too many errors!  Gave up.\n")

sub _line_error($$$)
{
  my $parser = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  if (defined($line_number)) {
    my $file = $line_number->{'file_name'};
    $file =~ s/^.*\/// if ($parser->{'test'});
    my $macro_text = '';
    $macro_text = " (possibly involving \@$line_number->{'macro'})" 
       if ($line_number->{'macro'} ne '');
    my $error_text = "$file:$line_number->{'line_nr'}: $text$macro_text\n";
    warn "$error_text" if ($parser->{'debug'});
    push @{$parser->{'errors_warnings'}},
         { 'type' => 'error', 'text' => $text, 'error_line' => $error_text,
           %{$line_number} };
  }
  $parser->{'error_nrs'}++;
}

sub _parse_macro_command($$$$$;$)
{
  my $self = shift;
  my $command = shift;
  my $line = shift;
  my $parent = shift;
  my $line_nr = shift;
  my $macro = { 'cmdname' => $command, 'parent' => $parent, 'contents' => [],
               'special' => {'macro_line' => $line} };
  #if ($line =~ /^\s+(\w[\w-]*)\s*(.*)/) {
  if ($line =~ /^\s+([\w\-]+)\s*(.*)/) {
    my $macro_name = $1;
    my $args_def = $2;
    my @args;

    if ($args_def =~ s/^\s*{\s*(.*?)\s*}\s*//) {
      @args = split(/\s*,\s*/ , $1);
    }
 
    if ($args_def =~ /^\s*[^\@]/) {
      $self->_line_error(sprintf($self->__("Bad syntax for \@%s"), $command),
                         $line_nr);
    }
    print STDERR "MACRO \@$command $macro_name\n" if ($self->{'debug'});

    $macro->{'args'} = [ 
      { 'type' => 'macro_name', 'text' => $macro_name, 
          'parent' => $macro } ];
    my $index = 0;
    foreach my $formal_arg (@args) {
      push @{$macro->{'args'}}, 
        { 'type' => 'macro_arg', 'text' => $formal_arg, 
          'parent' => $macro};
      $self->_line_error(sprintf($self->__("Bad or empty \@$command formal argument: %s"),
                                           $formal_arg), $line_nr)
            if ($formal_arg !~ /^[\w\-]+$/);
      $macro->{'special'}->{'args_index'}->{$formal_arg} = $index;
      $index++;
    }
  } else {
    _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
  }
  return $macro;
}

sub _begin_paragraph ($$)
{
  my $self = shift;
  my $current = shift;

  if ((!$current->{'type'} or $current->{'type'} eq 'before_item') 
      and !$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
    push @{$current->{'contents'}}, 
            { 'type' => 'paragraph', 'parent' => $current, 'contents' => [] };
    $current = $current->{'contents'}->[-1];
    print STDERR "PARAGRAPH\n" if ($self->{'debug'});
    return $current;
  }
  return 0;
}

sub _close_brace_command($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  my $located_line_nr = $line_nr;
  # use the beginning of the @-command for the error message
  # line number if available. FIXME. not implemented
  $located_line_nr = $current->{'parent'}->{'line_nr'}
    if ($current->{'parent'}->{'line_nr'});
  _line_error ($self, sprintf($self->__("%c%s missing close brace"),
               ord('@'), $current->{'parent'}->{'cmdname'}), $located_line_nr);
  $current = $current->{'parent'}->{'parent'};
  return $current;
}

sub _end_paragraph ($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  while ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
          and exists $brace_commands{$current->{'parent'}->{'cmdname'}}
          and !exists $context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
    $current = _close_brace_command($self, $current, $line_nr);
  }
  if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
    print STDERR "CLOSE PARA\n" if ($self->{'debug'});
    $current = $current->{'parent'};
  }
  return $current;
}

# a command arg means closing until that command is found
# no command arg means closing until the root or a root_command
# is found.
sub _end_block_command($$$;$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;
  my $command = shift;

  $current = _end_paragraph($self, $current, $line_nr);

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
    if ($current->{'cmdname'}
        and exists($block_commands{$current->{'cmdname'}})) {
      $self->_line_error(sprintf($self->__("No matching `%cend %s'"),
                                   ord('@'), $current->{'cmdname'}), $line_nr);
      pop @{$self->{'context_stack'}} if 
         ($preformatted_commands{$current->{'cmdname'}}
           or $menu_commands{$current->{'cmdname'}});
      $current = $current->{'parent'};
    } elsif ($current->{'parent'}->{'cmdname'}
             and exists $context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
      $current = _close_brace_command($self, $current, $line_nr);
      pop @{$self->{'context_stack'}};
    } else { # silently close containers and @-commands without @end
      $current = $current->{'parent'};
    }

    $current = _end_paragraph($self, $current, $line_nr);
  }

  if ($command and $current->{'cmdname'} 
    and $current->{'cmdname'} eq $command) {
    pop @{$self->{'context_stack'}} if 
       ($preformatted_commands{$current->{'cmdname'}} 
         or $menu_commands{$current->{'cmdname'}});
    $current = $current->{'parent'}
  }
  return $current;
}

# begin paragraph if needed.  If not try to merge with the previous
# content if it is also some text.
sub _merge_text ($$$)
{
  my $self = shift;
  my $current = shift;
  my $text = shift;

  my $paragraph = _begin_paragraph($self, $current) if ($text =~ /\S/);

  if (!$paragraph and 
    $current->{'contents'} and @{$current->{'contents'}} and
    exists($current->{'contents'}->[-1]->{'text'}) and 
#   !$current->{'contents'}->[-1]->{'type'} and 
    $current->{'contents'}->[-1]->{'text'} !~ /\n/) {
    $current->{'contents'}->[-1]->{'text'} .= $text;
    print STDERR "MERGED TEXT: $text|||\n" if ($self->{'debug'});
  }
  else {
    $current = $paragraph if ($paragraph);
    push @{$current->{'contents'}}, { 'text' => $text, 'parent' => $current };
    print STDERR "NEW TEXT: $text|||\n" if ($self->{'debug'});
  }
  return $current;
}

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

sub _new_line ($$)
{
  my $text = shift;
  my $lines_array = shift;
  my $new_line = '';
  my $line_nr;

  while (@$text) {
    my $new_text = shift @$text;
    # FIXME error? Or accept? Or nothing special?
    #next if ($new_text = '');

    $new_line .= $new_text;
    $line_nr = shift @$lines_array;

    my $chomped_text = $new_text;
    if (@$text and !chomp($chomped_text)) {
      next; 
    }
    last;
  }
  return ($new_line, $line_nr);
}

sub _expand_macro_arguments($$$$$$)
{
  my $self = shift;
  my $macro = shift;
  my $line = shift;
  my $line_nr = shift;
  my $text = shift;
  my $lines_array = shift;
  my $braces_level = 1;
  my $arguments = [ '' ];
  my $arg_nr = 0;
  my $args_total = scalar(@{$macro->{'args'}}) -1;

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
          
          print STDERR "MACRO ARG: $separator: $protected_char\n" if ($self->{'debug'});
        } else {
          $arguments->[-1] .= '\\';
          print STDERR "MACRO ARG: $separator\n" if ($self->{'debug'});
        }
      } elsif ($separator eq ',') {
        if (scalar(@$arguments) < $args_total and $braces_level == 1) {
          push @$arguments, '';
          $line =~ s/^\s*//;
          print STDERR "MACRO NEW ARG\n" if ($self->{'debug'});
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
      print STDERR "MACRO ARG end of line\n" if ($self->{'debug'});
      $arguments->[-1] .= $line;

      if (@$text) {
        ($line, $line_nr) = _new_line($text, $lines_array);
      } else {
        _line_error ($self, sprintf($self->__("\@%s missing close brace"), 
           $macro->{'args'}->[0]->{'text'}), $line_nr_orig);
        return ($arguments, "\n", $line_nr);
      }
    }
  }
  print STDERR "END MACRO ARGS EXPANSION(".scalar(@$arguments)."): ".
                  join("|\n", @$arguments) ."|\n" if ($self->{'debug'});
  return ($arguments, $line, $line_nr);
}

sub _expand_macro_body($$$$) {
  my $self = shift;
  my $macro = shift;
  my $args = shift;
  my $line_nr = shift;

  my $macrobody = $macro->{'special'}->{'macrobody'};
  my $args_total = scalar(@{$macro->{'args'}}) -1;
  my $args_index = $macro->{'special'}->{'args_index'};

  my $i;
  for ($i=0; $i<=$args_total; $i++) {
    $args->[$i] = "" unless (defined($args->[$i]));
  }
#  line_error (sprintf(__("Macro `%s' called with too many args"), $name), $line_nr) if (defined($args->[$i + 1]));

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
          _line_error ($self, sprintf($self->__("\\ in macro expansion followed `%s' instead of parameter name or \\"), $arg), $line_nr);
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
sub _internal_parse_text($$;$$)
{
  my $self = shift;
  my $text = shift;
  my $lines_array = shift;
  my $no_para = shift;

  my $root = { 'contents' => [] };
  $self->{'tree'} = $root;
  my $current = $root;

  my $line_nr;
  
 NEXT_LINE:
  while (@$text) {
    my $line;
    ($line, $line_nr) = _new_line($text, $lines_array);

    if ($self->{'debug'}) {
      $current->{'HERE !!!!'} = 1; # marks where we are in the tree
      local $Data::Dumper::Indent = 1;
      local $Data::Dumper::Purity = 1;
      print STDERR "".Data::Dumper->Dump([$root], ['$root']);
      print STDERR "NEW LINE($self->{'context_stack'}->[-1]): $line";
      delete $current->{'HERE !!!!'};
    }

    if ($line !~ /\S/ and not 
        # raw format or verb
          (($current->{'cmdname'}
           and $block_commands{$current->{'cmdname'}}
            and $block_commands{$current->{'cmdname'}} eq 'raw')
          or 
           ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
            and $current->{'parent'}->{'cmdname'} eq 'verb')
          )
        # not in math or preformatted
        and !$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
      print STDERR "EMPTY LINE\n" if ($self->{'debug'});
      $current = _end_paragraph($self, $current, $line_nr);
      push @{$current->{'contents'}}, { 'type' => 'normal_line', 
                                        'text' => $line,
                                        'parent' => $current };
      next;
    } elsif ($line !~ /\S/ and $current->{'type'} 
               and $current->{'type'} eq 'menu_entry_description') {
      # first parent is menu_entry
      $current = $current->{'parent'}->{'parent'};
      push @{$current->{'contents'}}, { 'type' => 'after_description_line', 
                                        'text' => $line,
                                        'parent' => $current };
      push @{$current->{'contents'}}, { 'type' => 'menu_comment',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      next;
    } elsif ($current->{'type'} 
              and ($current->{'type'} eq 'menu_comment'
                    or $current->{'type'} eq 'menu_entry_description')) {
      if ($line =~ s/^(\*\s+)//) {
        print STDERR "MENU ENTRY (certainly)\n" if ($self->{'debug'});
        my $leading_text = $1;
        if ($current->{'type'} eq 'menu_comment') {
          my $menu = $current->{'parent'};
          pop @{$menu->{'contents'}} if (!@{$current->{'contents'}});
          $current = $menu;
        } else {
          # first parent is menu_entry
          $current = $current->{'parent'}->{'parent'};
        }
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
      }
    }

    while (1) {
      # in a raw block command
      if ($current->{'cmdname'} and 
            $block_commands{$current->{'cmdname'}} and 
            ($block_commands{$current->{'cmdname'}} eq 'raw')) {
        # special case for macro that may be nested
        if (($current->{'cmdname'} eq 'macro' 
              or $current->{'cmdname'} eq 'rmacro') 
             and $line =~ /^\s*\@r?macro\s+/) {
          $line =~ s/\s*\@(r?macro)//;
          push @{$current->{'contents'}}, { 'cmdname' => $1,
                                            'parent' => $current,
                                            'contents' => [],
                         'special' => {'macro_line' => $line }};
          $current = $current->{'contents'}->[-1];
          last;
        } elsif ($line =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $current->{'cmdname'})) {
          my $end_command = $2;
          $line =~ s/^(.*?)(\@end\s$current->{'cmdname'})//;
          push @{$current->{'contents'}}, 
            { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
              if ($1 ne '');
          # store toplevel macro specification
          if (($end_command eq 'macro' or $end_command eq 'rmacro') 
               and (! $current->{'parent'} 
                    or !$current->{'parent'}->{'cmdname'} 
                    or ($current->{'parent'}->{'cmdname'} ne 'macro'
                        and $current->{'parent'}->{'cmdname'} ne 'rmacro'))) {
            $current->{'special'}->{'macrobody'} = 
               tree_to_texi({ 'contents' => $current->{'contents'} });
            if ($current->{'args'} and $current->{'args'}->[0]) {
              $self->{'macros'}->{$current->{'args'}->[0]->{'text'}} = $current;
            }
          }
          $current = $current->{'parent'};
          last unless ($line =~ /\S/);
        } else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          last;
        }
      # in @verb
      } elsif ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
             and $current->{'parent'}->{'cmdname'} eq 'verb') { 
             # type should be 'brace_command_arg'
        my $char = quotemeta($current->{'parent'}->{'type'});
        if ($line =~ s/^(.*?)$char\}/\}/) {
          push @{$current->{'contents'}}, 
              { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
                if ($1 ne '');
          print STDERR "END VERB\n" if ($self->{'debug'});
        } else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          print STDERR "LINE VERB: $line" if ($self->{'debug'});
          last;
        }
      }
      $line =~ s/^([^{}@,:\t.]*)//;
      $current = _merge_text ($self, $current, $1) if ($1 ne '');
        
      if ($line =~ s/^\@end\s+([a-zA-Z][\w-]*)//) {
        my $end_command = $1;
        print STDERR "END $end_command\n" if ($self->{'debug'});
        $current = _end_block_command($self, $current, $line_nr,
                                                $end_command);
        last unless ($line =~ /\S/);
      } elsif ($line =~ s/^\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o 
               or $line =~ s/^\@([a-zA-Z][\w-]*)//o) {
        my $command = $1;
        $command = $self->{'aliases'}->{$command} 
           if (exists($self->{'aliases'}->{$command}));
        print STDERR "COMMAND $command\n" if ($self->{'debug'});

        if ($self->{'macros'}->{$command}) {
          my $expanded_macro = $self->{'macros'}->{$command};
          my $args_number = scalar(@{$expanded_macro->{'args'}}) -1;
          my $arguments = [];
          if ($line =~ s/^\s*{\s*//) { # macro with args
            ($arguments, $line, $line_nr) = 
              _expand_macro_arguments ($self, $expanded_macro, $line, $line_nr,
                                       $text, $lines_array);
          } elsif (($args_number >= 2) or ($args_number <1)) {
            _line_warn($self, sprintf($self->__("\@%s defined with zero or more than one argument should be invoked with {}"), $command), $line_nr);
          } else {
            $arguments = [$line];
            $line = "\n";
          } 
          my $expanded = _expand_macro_body ($self, $expanded_macro, 
                                     $arguments, $line_nr);
          print STDERR "MACROBODY: $expanded".'||||||'."\n" 
             if ($self->{'debug'}); 
          
          next;
        }

        if ($command eq 'value') {
          if ($line =~ s/^{([\w\-]+)}//) {
            my $value = $1;
            if (exists($self->{'values'}->{$value})) {
              $line = $self->{'values'}->{$value} . $line;
            } else {
              # caller should expand something along 
              # gdt('@{No value for `{value}\'@}', {'value' => $value}, {'keep_texi'=> 1});
              push @{$current->{'contents'}}, { 'cmdname' => 'value',
                                                'type' => $value };
              _line_warn ($self, 
                  sprintf($self->__("undefined flag: %s"), $value), $line_nr);
            }
          } else {
            _line_error ($self, $self->__("Bad syntax for \@value"), $line_nr);
          }
        }

        if (defined($deprecated_commands{$command})) {
          if ($deprecated_commands{$command} eq '') {
            _line_warn($self, sprintf($self->__("%c%s is obsolete."), 
                                ord('@'), $command), $line_nr);
          } else {
            _line_warn($self, sprintf($self->__("%c%s is obsolete; %s"),
                   ord('@'), $command, 
                   $self->__($deprecated_commands{$command})), $line_nr);
          }
        }

        last if ($self->{'context_stack'}->[-1] eq 'def' and $command eq "\n");

        unless ($self->{'no_paragraph_commands'}->{$command}) {
          my $paragraph = _begin_paragraph($self, $current);
          $current = $paragraph if ($paragraph);
        }

        if ($close_paragraph_commands{$command}) {
          $current = _end_paragraph($self, $current, $line_nr);
        }

        if (defined($self->{'misc_commands'}->{$command})) {
          if ($root_commands{$command}) {
            $current = _end_block_command($self, $current, $line_nr);
          }
            
          my ($args, $line_arg, $special);
          ($line, $args, $line_arg, $special) 
             = $self->_parse_misc_command($line, $command, $line_nr);

          if ($command eq 'item' or $command eq 'itemx' 
               or $command eq 'headitem' or $command eq 'tab') {
            my $parent;
            # itemize or enumerate
            if ($parent = _item_container_parent($current)) {
              if ($command eq 'item') {
                print STDERR "ITEM_CONTAINER\n" if ($self->{'debug'});
                push @{$parent->{'contents'}},
                  { 'cmdname' => $command, 'parent' => $parent, 
                    'contents' => [] };
                $current = $parent->{'contents'}->[-1];
              } else {
                $self->_line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
              }
            # *table
            } elsif ($parent = _item_line_parent($current)) {
              if ($command eq 'item' or $command eq 'itemx') {
                print STDERR "ITEM_LINE\n" if ($self->{'debug'});
                $current = $parent;
                push @{$current->{'contents'}}, 
                  { 'cmdname' => $command, 'parent' => $current };
                $line_arg = $line;
              } else {
                $self->_line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
              }
            # multitable
            } elsif ($parent = _item_multitable_parent($current)) {
              if ($command eq 'item' or $command eq 'headitem'
                   or $command eq 'tab') {
                if (!$parent->{'special'}->{'max_columns'}) {
                  $self->_line_warn (sprintf($self->__("\@%s in empty multitable"), $command), $line_nr);
                } elsif ($command eq 'tab') {
                  my $row = $parent->{'contents'}->[-1];
                  die if (!$row->{'type'});
                  if ($row->{'type'} eq 'before_item') {
                    $self->_line_warn($self->__("\@tab before \@item"), $line_nr);
                  } elsif ($row->{'special'}->{'cell_number'} > $parent->{'special'}->{'max_columns'}) {
                    $self->_line_error (sprintf($self->__("Too many columns in multitable item (max %d)"), $parent->{'special'}->{'max_columns'}), $line_nr);
                  } else {
                    $row->{'special'}->{'cell_number'}++;
                    push @{$row->{'contents'}}, { 'cmdname' => $command,
                                                'parent' => $row };
                    $current = $row->{'contents'}->[-1];
                    print STDERR "TAB\n" if ($self->{'debug'});
                  }
                } else {
                  print STDERR "ROW\n" if ($self->{'debug'});
                  my $row = { 'type' => 'row', 'contents' => [],
                              'special' => { 'cell_number' => 1 },
                              'parent' => $parent };
                  push @{$parent->{'contents'}}, $row;
                  push @{$row->{'contents'}}, { 'cmdname' => $command,
                                                'parent' => $row };
                  $current = $row->{'contents'}->[-1];
                }
              } else {
                $self->_line_error (sprintf($self->__("\@%s not meaningful inside `\@%s' block"), $command, $parent->{'cmdname'}), $line_nr);
              }
            } elsif ($command eq 'tab') {
              $self->_line_error($self->__("ignoring \@tab outside of multitable"), $line_nr);
            } else {
              $self->_line_error (sprintf($self->__("\@%s outside of table or list"), $command), $line_nr);
            }
          } else {
            push @{$current->{'contents'}}, 
              { 'cmdname' => $command, 'parent' => $current };
            $current->{'contents'}->[-1]->{'special'} = $special 
                                              if (defined($special));
            if ($def_commands{$command}) {
              my $base_command = $command;
              $base_command =~ s/x$//;
              if (!$current->{'cmdname'} 
                   or $current->{'cmdname'} ne $base_command) {
                $self->_line_error(sprintf($self->__("Must be in `\@%s' environment to use `\@%s'"), $base_command, $command), $line_nr);
              }
              push @{$self->{'context_stack'}}, 'def';
              $current->{'contents'}->[-1]->{'type'} = 'def_line';
            }
              
            foreach my $arg (@$args) {
              push @{$current->{'contents'}->[-1]->{'args'}},
                { 'type' => 'misc_arg', 'text' => $arg, 
                  'parent' => $current->{'contents'}->[-1] };
            }
          }
          if (defined($line_arg)) {
            $line = $line_arg;
            $current = $current->{'contents'}->[-1];
            $current->{'args'} = [ { 'type' => 'misc_line_arg', 
                                     'contents' => [], 
                                     'parent' => $current } ];
            # @node is the only misc command with args separated with comma
            # FIXME a 4 lingering here deep into the code may not
            # be very wise...
            $current->{'remaining_args'} = 4 if ($command eq 'node');
            $current = $current->{'args'}->[-1];
          }

          last NEXT_LINE if ($command eq 'bye');

        } elsif (exists($block_commands{$command})) {
          if ($command eq 'macro' or $command eq 'rmacro') {
            my $macro = _parse_macro_command ($self, $command, $line, 
                                 $current, $line_nr);
            push @{$current->{'contents'}}, $macro;
            $current = $current->{'contents'}->[-1];
            last;
          } else {
            $line =~ s/\s*//;
            # the def command holds a line_def* which corresponds with the
            # definition line.  This allows to have a treatement similar
            # with def*x.
            if ($def_commands{$command}) {
              push @{$self->{'context_stack'}}, 'def';
              push @{$current->{'contents'}}, { 
                                                'parent' => $current,
                                                'cmdname' => $command,
                                                'contents' => [] };
              $current = $current->{'contents'}->[-1];
              push @{$current->{'contents'}}, { 
                                                'type' => 'def_line',
                                                'parent' => $current,
                                                };
            } else {
              push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                                'parent' => $current,
                                                'contents' => [] };
            }
            $current = $current->{'contents'}->[-1];
            my $arg_number = $block_commands{$command}
              if ($block_commands{$command} 
                  and $block_commands{$command} =~ /^\d+$/);
            if ($arg_number
                or $command eq 'multitable'
                or $def_commands{$command}) {
              $current->{'args'} = [ {
                 'type' => 'block_line_arg',
                 'contents' => [],
                 'parent' => $current } ];
              $current->{'remaining_args'} = $arg_number -1 if ($arg_number);
              $current = $current->{'args'}->[-1];
              if ($command eq 'multitable' 
                    and $line =~ s/^\@columnfractions\s+//) {
                # both an argument and an @-command
                $current->{'cmdname'} = 'columnfractions';
              }
            } else {
              push @{$self->{'context_stack'}}, 'preformatted' 
                if ($preformatted_commands{$command});
              if ($menu_commands{$command}) {
                push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                                 'parent' => $current,
                                                 'contents' => [] };
                push @{$self->{'context_stack'}}, 'menu';
                $current = $current->{'contents'}->[-1];
              }
              last unless ($line =~ /\S/);
            }
          }
        } elsif ($line =~ s/^{// and (defined($brace_commands{$command}))) {
          push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                            'parent' => $current };
          $current = $current->{'contents'}->[-1];
          if ($command eq 'verb') {
            if ($line =~ /^$/) {
              $current->{'type'} = '';
              _line_error ($self, sprintf($self->
                __("\@%s without associated character"), $command), $line_nr);
            } else {
              $line =~ s/^(.)//;
              $current->{'type'} = $1;
            }
          }
          $current->{'args'} = [ { 'parent' => $current, 
                                   'contents' => [] } ];
          $current->{'remaining_args'} = $brace_commands{$command} -1 if ($brace_commands{$command});
          $current = $current->{'args'}->[-1];
          # FIXME don't use type to distinguish context_brace_commands.
          if ($context_brace_commands{$command}) {
            push @{$self->{'context_stack'}}, $command;
          } else {
            $current->{'type'} = 'brace_command_arg';
          }
          print STDERR "OPENED \@$current->{'parent'}->{'cmdname'}, remaining: $current->{'parent'}->{'remaining_args'}, "
            .($current->{'type'} ? "type: $current->{'type'}" : '')."\n"
             if ($self->{'debug'});
        } elsif ($accent_commands{$command}) {
          if ($command =~ /^[a-zA-Z]/) {
            $line =~ s/^\s*//;
          } elsif ($line =~ /^\s/) {
            _line_warn ($self, sprintf($self->
                __("Accent command `\@%s' must not be followed by whitespace"),
                $command), $line_nr);
          }

          if ($line =~ /^\@/) {
            _line_error ($self, sprintf($self->
                     __("Use braces to give a command as an argument to \@%s"),
                     $command), $line_nr);
          }
          if ($line =~ s/^(\S)//o) {
            print STDERR "ACCENT \@$command\n" if ($self->{'debug'});
            my $accent = { 'cmdname' => $command, 'parent' => $current };
            $accent->{'args'} = [ { 'text' => $1, 'parent' => $accent } ];
            if ($command =~ /^[a-zA-Z]/) {
              $accent->{'args'}->[-1]->{'type'} = 'space_command_arg';
            }
            push @{$current->{'contents'}}, $accent;

          } else { # The accent is at end of line
            # FIXME warn? And test case? Maybe this is catched 
            # above, by "Accent command `@%s' must not be followed by
            # whitespace for commands with letter.
            print STDERR "STRANGE ACC \@$command\n" if ($self->{'debug'});
            push @{$current->{'contents'}},
                 { 'text' => $command, 'parent' => $current };
          }
        } elsif ($no_brace_commands{$command}) {
          push @{$current->{'contents'}},
               { 'cmdname' => $command, 'parent' => $current };

        } elsif(exists $brace_commands{$command}) {
          # special case of a command as argument of *table or itemize
          if ($current->{'parent'} and 
            ($current->{'parent'}->{'cmdname'} eq 'itemize'
             or $block_item_commands{$current->{'parent'}->{'cmdname'}})
             and (scalar(@{$current->{'contents'}}) == 0)) {
            push @{$current->{'contents'}}, {'cmdname' => $command,
                              'parent' => $current,
                              'type' => 'command_as_argument'};
          } else {
            _line_error ($self,
               sprintf($self->__("\@%s expected braces"), $command), $line_nr);
          }
        } else {
          # unknown
        }

      } elsif ($line =~ s/^([{}@,:\t.])//) {
        my $separator = $1;
        print STDERR "SEPARATOR: $separator\n" if ($self->{'debug'});
        if ($separator eq '@') {
          _line_error ($self, $self->__("Unexpected \@"), $line_nr);
        } elsif ($separator eq '{') {
          if ($current->{'parent'} 
              and (($current->{'parent'}->{'cmdname'}
                     and $current->{'parent'}->{'cmdname'} eq 'multitable')
                   or ($current->{'parent'}->{'type'} 
                       and $current->{'parent'}->{'type'} eq 'def_line'))) {
            push @{$current->{'contents'}},
                 { 'type' => 'bracketed', 'contents' => [],
                   'parent' => $current };
            $current = $current->{'contents'}->[-1];
            print STDERR "BRACKETED\n" if ($self->{'debug'});
          } else {
            _line_error ($self, sprintf($self->__("Misplaced %c"),
                                             ord('{')), $line_nr);
          }

        } elsif ($separator eq '}') { 
          # FIXME use parents
          #_print_current ($current);
          if ($current->{'type'} and ($current->{'type'} eq 'bracketed')) {
             $current = $current->{'parent'};
          } elsif ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and exists $brace_commands{$current->{'parent'}->{'cmdname'}}) {
             if ($context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
               pop @{$self->{'context_stack'}};
             }
             # first is the arg.
             print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'debug'});
             $current = $current->{'parent'}->{'parent'};
          # footnote caption closing
          } elsif ($context_brace_commands{$self->{'context_stack'}->[-1]}) {
             $current = _end_paragraph($self, $current, $line_nr);
             if ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and $brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}} eq $self->{'context_stack'}->[-1]) {
               pop @{$self->{'context_stack'}};
               print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'debug'});
               $current = $current->{'parent'}->{'parent'};
            }
          } else {
            _line_error ($self, sprintf($self->__("Misplaced %c"),
                                     ord('}')), $line_nr);
          }
        } elsif ($separator eq ','
                 and $current->{'parent'}->{'remaining_args'}) {
          $line =~ s/^\s*//;
          my $type = $current->{'type'};
          $current = $current->{'parent'};
          $current->{'remaining_args'}--;
          push @{$current->{'args'}},
               { 'type' => $type, 'parent' => $current, 'contents' => [] };
          $current = $current->{'args'}->[-1];
        }
        # end of menu node (. must be followed by a space to stop the node).
        elsif ($separator =~ /[,\t.]/ and $current->{'type'}
               and $current->{'type'} eq 'menu_entry_node') {
          if ($separator eq '.' and $line =~ /^\S/) {
            $current = _merge_text ($self, $current, $separator);
          } else {
            $line =~ s/^(\s*)//;
            $separator .= $1;
            print STDERR "MENU NODE $separator\n" if ($self->{'debug'});
            $current = $current->{'parent'};
            push @{$current->{'args'}}, { 'type' => 'menu_entry_separator',
                                 'text' => $separator,
                                 'parent' => $current };
            push @{$current->{'args'}}, { 'type' => 'menu_entry_description',
                                          'contents' => [],
                                          'parent' => $current };
            $current = $current->{'args'}->[-1];
          }
        # end of menu_entry_name
        } elsif ($separator eq ':' and $current->{'type'} 
                 and $current->{'type'} eq 'menu_entry_name') {
          # menu node. Transform the menu_entry_name in to a node, add the
          # separator and open a description
          if ($line =~ s/^(:\s*)//) {
            $separator .= $1;
            print STDERR "MENU ENTRY $separator\n" if ($self->{'debug'});
            $current->{'type'} = 'menu_entry_node';
            $current = $current->{'parent'};
            push @{$current->{'args'}}, { 'type' => 'menu_entry_separator',
                                 'text' => $separator,
                                 'parent' => $current };
            push @{$current->{'args'}}, { 'type' => 'menu_entry_description',
                                          'contents' => [],
                                          'parent' => $current };
          # end of the menu_entry_name, open the menu_entry_node.
          } else {
            $line =~ s/^(\s*)//;
            $separator .= $1;
            $current = $current->{'parent'};
            push @{$current->{'args'}}, { 'type' => 'menu_entry_separator',
                                 'text' => $separator,
                                 'parent' => $current };
            push @{$current->{'args'}}, { 'type' => 'menu_entry_node',
                                          'contents' => [],
                                          'parent' => $current };
          }
          $current = $current->{'args'}->[-1];
        } else {
          $current = _merge_text ($self, $current, $separator);
        }
      } else {
        if ($self->{'debug'}) {
          print STDERR "END LINE: ". _print_current($current)."\n";
        }
        if ($line ne '') {
          die "Remaining line: $line\n";
        }
        if ($current->{'type'} 
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
            if (!@{$current->{'contents'}}) {
              $empty_menu_entry_node = 1;
              push @{$current->{'contents'}}, $end_comment if ($end_comment);
            }
          }
          # we abort the menu entry if there is no node name
          if ($empty_menu_entry_node 
               or $current->{'type'} eq 'menu_entry_name') {
            print STDERR "FINALLY NOT MENU ENTRY\n" if ($self->{'debug'});
            my $menu = $current->{'parent'}->{'parent'};
            my $menu_entry = pop @{$menu->{'contents'}};
            if (@{$menu->{'contents'}} and $menu->{'contents'}->[-1]->{'type'}
                and $menu->{'contents'}->[-1]->{'type'} eq 'menu_comment') {
              $current = $menu->{'contents'}->[-1];
            } else {
              push @{$menu->{'contents'}}, {'type' => 'menu_comment',
                                             'parent' => $menu,
                                             'contents' => [] };
              $current = $menu->{'contents'}->[-1];
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
            $menu_entry = undef;
          } else {
            print STDERR "MENU ENTRY END LINE\n" if ($self->{'debug'});
            $current = $current->{'parent'};
            push @{$current->{'args'}}, { 'type' => 'menu_entry_description',
                                          'contents' => [],
                                          'parent' => $current };
            $current = $current->{'args'}->[-1];
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
            $current = $current->{'parent'}->{'parent'};
        # other block command lines
        } elsif ($current->{'type'}
            and $current->{'type'} eq 'block_line_arg') {
          # @multitable @columnfractions
          if ($current->{'cmdname'}
              and $current->{'cmdname'} eq 'columnfractions') { 
            # the columnfraction content should be text only, maybe
            # followed by a comment.
            #print STDERR "COLUMNFRACTIONS: ".Data::Dumper->Dump([$current], ['$columnfractions']) if ($self->{'debug'});
            my @fractions;
            my $other_contents;
            if (!@{$current->{'contents'}}) {
              _line_error ($self, sprintf($self->__("Empty \@%s"),
                                $current->{'cmdname'}), $line_nr);

            } elsif (!defined($current->{'contents'}->[0]->{'text'})) {
              _line_error ($self, sprintf($self->
                                 __("\@%s accepts only fractions as argument"),
                                 $current->{'cmdname'}), $line_nr);
              $other_contents = $current->{'contents'};

            } else {
              my $fraction_argument = shift @{$current->{'contents'}};
              # verify that the only remaining argument is a comment
              if (@{$current->{'contents'}}
                  and (!$current->{'contents'}->[0]->{'cmdname'} 
                       or ($current->{'contents'}->[0]->{'cmdname'} ne 'c'
                           and $current->{'contents'}->[0]->{'cmdname'}
                               ne 'comment'))) {
                _line_warn ($self, sprintf($self->
                         __("Unexpected argument on \@%s line: %s"), 
                         $current->{'cmdname'}, 
                         tree_to_texi( { $current->{'contents'} })), $line_nr);
              }
              $other_contents = $current->{'contents'};
              # now parse the fractions
              my @possible_fractions = split (/\s+/,
                                              $fraction_argument->{'text'});
              foreach my $fraction (@possible_fractions) {
                if ($fraction =~ /^(\d*\.\d+)|(\d+)\.?$/) {
                  push @fractions, $fraction;
                } else {
                  _line_error ($self, sprintf($self->
                                        __("column fraction not a number: %s"),
                                        $fraction), $line_nr);
                }
              }
            }
            $current = $current->{'parent'};
            $current->{'special'}->{'max_columns'} = scalar(@fractions);
            $current->{'args'} = [ { 'cmdname' => 'columnfractions',
                                     'parent' => $current } ];
            foreach my $content (@$other_contents) {
              $content->{'parent'} = $current;
              push @{$current->{'args'}}, $content;
            }
            $current = $current->{'args'}->[0];
            foreach my $fraction (@fractions) {
              push @{$current->{'args'}},
                   { 'type' => 'fraction', 'text' => $fraction,
                     'parent' => $current };
            }
          # @multitable args
          } elsif ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
                     and $current->{'parent'}->{'cmdname'} eq 'multitable') {
            my $line_arg = $current;
            my @prototype_rows;
            my @other_contents;
            # rearrange the row specifications as args, which mostly 
            # implies splitting non-bracketed text and reparenting.
            foreach my $content (@{$current->{'contents'}}) {
              if ($content->{'type'} and $content->{'type'} eq 'bracketed') {
                $content->{'parent'} = $current->{'parent'};
                push @prototype_rows, $content;
              } elsif ($content->{'text'}) {
                if ($content->{'text'} =~ /\S/) {
                  foreach my $prototype(split /\s+/, $content->{'text'}) {
                    push @prototype_rows, { 'text' => $prototype, 
                                  'parent' => $current->{'parent'},
                                  'type' => 'row_prototype' };
                  }
                }
              } else {
                if (!$content->{'cmdname'}) { 
                  _line_warn ($self, sprintf($self->
                         __("Unexpected argument on \@%s line: %s"), 
                         $current->{'cmdname'}, 
                         tree_to_texi( { $content->{'contents'} })), $line_nr);
                  push @other_contents, $content;
                } elsif ($content->{'cmdname'} eq 'c' 
                       and $content->{'cmdname'} eq 'comment') {
                  push @other_contents, $content;
                } else {
                  push @prototype_rows, $content;
                }
                $content->{'parent'} = $current->{'parent'};
              }
            }
            
            $current = $current->{'parent'};
            $current->{'special'}->{'max_columns'} = scalar(@prototype_rows);
            if (!scalar(@prototype_rows)) {
              $self->_line_warn ($self->__("empty multitable"), $line_nr);
            }
            $current->{'args'} = \@prototype_rows;
            $current->{'contents'} = \@other_contents;
            # this is in order to have $current->{'parent'} being the multitable
            
            $current = $line_arg;
          }
          $current = $current->{'parent'};
          if ($current->{'cmdname'} 
                and $block_item_commands{$current->{'cmdname'}}) {
            push @{$current->{'contents'}}, { 'type' => 'before_item',
               'contents' => [], 'parent', $current };
            $current = $current->{'contents'}->[-1];
          }
        # misc command line arguments
        } elsif ($current->{'type'} 
           and $current->{'type'} eq 'misc_line_arg') {
          # first parent is the @command, second is the parent
          $current = $current->{'parent'}->{'parent'};
        }
        last;
      }
    }
  }
  $current = _end_block_command($self, $current, $line_nr);
  return $root;
}

sub tree_to_texi ($)
{
  my $root = shift;
  die "tree_to_texi: root undef\n" if (!defined($root));
  die "tree_to_texi: bad root type (".ref($root).") $root\n" 
     if (ref($root) ne 'HASH');
  my $result = '';
  #print STDERR "$root ";
  #print STDERR "$root->{'type'}" if (defined($root->{'type'}));
  #print STDERR "\n";
  if (defined($root->{'text'})) {
    $result .= $root->{'text'};
  } else {
    if ($root->{'cmdname'} 
       or ($root->{'type'} and ($root->{'type'} eq 'def_line'
                                or $root->{'type'} eq 'menu_entry'
                                or $root->{'type'} eq 'menu_comment'))) {
      #print STDERR "cmd: $root->{'cmdname'}\n";
      $result .= _expand_cmd_args_to_texi($root);
    }
    $result .= '{' if ($root->{'type'} and $root->{'type'} eq 'bracketed');
    #print STDERR "$root->{'contents'} @{$root->{'contents'}}\n" if (defined($root->{'contents'}));
    if (defined($root->{'contents'})) {
      die "bad contents type(" . ref($root->{'contents'})
          . ") $root->{'contents'}\n" if (ref($root->{'contents'}) ne 'ARRAY');
      foreach my $child (@{$root->{'contents'}}) {
        $result .= tree_to_texi($child);
      }
    }
    $result .= '}' if ($root->{'type'} and $root->{'type'} eq 'bracketed');
    if ($root->{'cmdname'} and (defined($block_commands{$root->{'cmdname'}}))) {
      $result .= '@end '.$root->{'cmdname'} ."\n"; # ."\n"?
    }
  }
  #print STDERR "tree_to_texi result: $result\n";
  return $result;
}

sub _expand_cmd_args_to_texi ($) {
  my $cmd = shift;
  my $cmdname = $cmd->{'cmdname'};
  $cmdname = '' if (!$cmd->{'cmdname'}); 
  my $result = '';
  $result = '@'.$cmdname if ($cmdname);
  #print STDERR "Expand $result\n";
  # must be before the next condition
  if ($block_commands{$cmdname}
         and ($def_commands{$cmdname}
              or $block_commands{$cmdname} eq 'multitable')
         and $cmd->{'args'}) {
     foreach my $arg (@{$cmd->{'args'}}) {
        my $arg_expanded = tree_to_texi ($arg);
        $result .= ' '.$arg_expanded;
     }
  } elsif ($block_commands{$cmdname}
            and $block_commands{$cmdname} ne 'raw'
            and defined($cmd->{'args'})) {
    die "bad args type (".ref($cmd->{'args'}).") $cmd->{'args'}\n"
      if (ref($cmd->{'args'}) ne 'ARRAY');
    $result .= ' ';
    foreach my $arg (@{$cmd->{'args'}}) {
       $result .= tree_to_texi ($arg) . ', ';
    }
    $result =~ s/, $//;
  } elsif ($cmdname eq 'macro' or $cmdname eq 'rmacro') {
   # my @args = @{$cmd->{'args'}};
   # my $name = shift @args;
   # $result .= ' ' .$name->{'text'};
   # if (@args) {
   #   $result .= ' {';
   #   foreach my $arg (@args) {
   #     $result .= $arg->{'text'} .', ';
   #   }
   #   $result =~ s/, $//;
   #   $result .= '}';
    $result .= $cmd->{'special'}->{'macro_line'};
  } elsif (defined($cmd->{'args'})) {
    my $braces;
    $braces = 1 if (($cmd->{'args'}->[0]->{'type'} 
                    and $cmd->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                    or ($context_brace_commands{$cmdname}));
    $result .= '{' if ($braces);
    $result .= ' ' if ($cmd->{'args'}->[0]->{'type'} 
                       and $cmd->{'args'}->[0]->{'type'} eq 'space_command_arg');
    if ($cmdname eq 'verb') {
      $result .= $cmd->{'type'};
    }
    #print STDERR "".Data::Dumper->Dump([$cmd]);
    my $arg_nr = 0;
    foreach my $arg (@{$cmd->{'args'}}) {
      if (exists($brace_commands{$cmdname})) {
        $result .= ', ' if ($arg_nr);
        $arg_nr++;
      } else {
        $result .= ' '
          unless ($cmdname eq 'c' or $cmdname eq 'comment' 
                  or $cmd->{'type'} and ($cmd->{'type'} eq 'menu_entry'
                                         or $cmd->{'type'} eq 'menu_comment'));
      }
      $result .= tree_to_texi ($arg);
    }
    if ($cmdname eq 'verb') {
      $result .= $cmd->{'type'};
    }
    #die "Shouldn't have args: $cmdname\n";
    $result .= '}' if ($braces);
  } elsif ($misc_commands{$cmdname}
      and $misc_commands{$cmdname}->{'skip'}) {
    if ($misc_commands{$cmdname}->{'skip'} eq 'space') {
      $result .= ' ';
    }
  }
  if ($misc_commands{$cmdname}
      and $misc_commands{$cmdname}->{'skip'}
      and $misc_commands{$cmdname}->{'skip'} eq 'line') {
    $result .="\n";
  }
  if (defined($block_commands{$cmdname})) {
    # there is an end of line if there is a comment, for example
    chomp($result);
    $result .= "\n" unless ($def_commands{$cmdname});
  }
  $result .= '{'.$cmd->{'type'}.'}' if ($cmdname eq 'value');
#  $result .= $cmd->{'special'}->{'arg'} if ($misc_commands{$cmdname} 
#     and $cmd->{'special'} and $cmd->{'special'}->{'arg'});
  $result .= "\n" if ($misc_commands{$cmdname} 
      and $cmd->{'special'} and $cmd->{'special'}->{'arg'});
  #print STDERR "Result: $result\n";
  return $result;
}

# return the line after preserving things according to misc_commands map.
sub _parse_misc_command($$$$)
{
  my $self = shift;
  my $line = shift;
  my $command = shift;
  my $line_nr = shift;
  my $args = [];
  my $line_arg;
  my $skip_spec = '';
  my $arg_spec = '';
  my $special;

  $skip_spec = $self->{'misc_commands'}->{$command}->{'skip'}
    if (defined($self->{'misc_commands'}->{$command}->{'skip'}));
  $arg_spec = $self->{'misc_commands'}->{$command}->{'arg'}
    if (defined($self->{'misc_commands'}->{$command}->{'arg'}));
#print STDERR "HHHHHHHHH $line $command arg_spec $arg_spec skip_spec $skip_spec\n";

  if ($command eq 'alias') {
    if ($line =~ s/(\s+)([a-zA-Z][\w-]*)(\s*=\s*)([a-zA-Z][\w-]*)(\s*)//) {
      $self->{'aliases'}->{$2} = $4;
      $args = [$2, $4];
    } else {
      _line_error ($self, sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
    }

  } elsif ($command eq 'definfoenclose') {
    if ($line =~ s/^\s+([a-z][\w\-]*)\s*,\s*([^\s]+)\s*,\s*([^\s]+)//) {
      $args = [$1, $2, $3 ];
      $self->{'info_enclose'}->{$1} = [ $2, $3 ];
    } else {
      _line_error ($self, sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
    } # FIXME warn about garbage remaining on the line?

  } elsif ($command eq 'set') {
    if ($line =~ /^(\s+)([\w\-]+)(\s+)(.*)$/) {
      $args = [$2, $4];
      $self->{'values'}->{$2} = $4;
    } else {
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
      $special = { 'arg' => $line };
    }
    $line = '';
  } elsif ($command eq 'clear') {
    if ($line =~ /^(\s+)([\w\-]+)/) {
      $args = [$2];
      delete $self->{'values'}->{$2};
    } else {
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'unmacro') {
    if ($line =~ /^(\s+)([\w\-]+)/) {
      $args = [$2];
      delete $self->{'macros'}->{$2};
    } else {
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'defindex' || $command eq 'defcodeindex') {
    if ($line =~ s/^\s+(\w+)\s*//) {
      my $name = $1;
      if ($forbidden_index_name{$name}) {
        _line_error($self, sprintf($self->
                                __("Reserved index name %s"),$name), $line_nr);
      } else {
        $self->{'misc_commands'}->{$name.'index'} = { 'arg' => 'line' };
      }
    } else {
      _line_error ($self, sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }

  } elsif ($arg_spec eq 'line' or $arg_spec eq 'lineraw') {
    $line =~ s/^[ \t]*// unless ($command eq 'c' or $command eq 'comment');
    $args = [ $line ];
    if ($arg_spec eq 'line') {
      $line_arg = $line;
    }
    else {
      $args = [ $line ];
    }
    $line = '';

  } elsif ($arg_spec) {
    my $arg_nr = $arg_spec;
    while ($arg_nr) {
      if ($line =~ s/^(\s+)(\S*)//o) {
        my $argument = $2;
        push @$args, $argument if ($argument ne '');
      } else {
        last;
      }
      $arg_nr--;
    }
  }

  if ($skip_spec eq 'line') {
    $line = '';
  }
  elsif ($skip_spec eq 'whitespace') {
    $line =~ s/^(\s*)//o;
  }
  elsif ($skip_spec eq 'space') {
    $line =~ s/^([ \t]*)//o;
  }
  # FIXME is the following useful?
  $line = '' if (!defined($line));
  return ($line, $args, $line_arg, $special);
}

1;
__END__
# Below is stub documentation.

=head1 NAME

Texinfo::Parser - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Texinfo::Parser;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Texinfo::Parser, created by h2xs. It looks like the
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

Patrice Dumas, E<lt>dumas@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.


=cut
