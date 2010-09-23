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
  tree
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
  'error' => 'generate', # the contrary could be 'return'
  'force' => 0,
  'no_warn' => 0,
  'error_limit' => 100,
  'test' => 0,
  'debug' => 0,
  'gettext' => sub {return $_[0];},
  'aliases' => {},
  'indices' => []
);

my %no_brace_commands;             # commands never taking braces

foreach my $no_brace_command ('*',' ',"\t","\n",'-', '|', '/',':','!',
                              '?','.','@','}','{',)
{
  $no_brace_commands{$no_brace_command} = 1;
}

# command with braces. value is the max number of arguments.
my %brace_commands;    

# accent commands. They may be called with and without braces.
my %accent_commands;

foreach my $no_arg_command ('TeX','LaTeX','bullet','copyright','registeredsymbol','dots','enddots','equiv','error','expansion','arrow','minus','point','print','result','today','aa','AA','ae','oe','AE','OE','o','O','ss','l','L','DH','dh','TH','th','exclamdown','questiondown','pounds','ordf','ordm','comma','euro','geq','leq','tie','textdegree','quotedblleft','quotedblright','quoteleft','quoteright','quotedblbase','quotesinglbase','guillemetleft','guillemetright','guillemotleft','guillemotright','guilsinglleft','guilsinglright')
{
  $brace_commands{$no_arg_command} = 0;
}

foreach my $accent_command ('"','~','^','`',"'",',','=')
{
  $accent_commands{$accent_command} = 0;
  $brace_commands{$accent_command} = 1;
}

foreach my $accent_command('ringaccent','H','dotaccent','u','ubaraccent','udotaccent','v','ogonek')
{
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

# commands delimiting blocks, typically with an @end.
# Value is either the number of arguments on the line separated by
# commas or the type of command, 'raw', 'def' or 'multitable'.
my %block_commands;
foreach my $bracketed_line_argument_command(#'multitable',
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
)
{
  $block_commands{$bracketed_line_argument_command} = 'def';
  $block_commands{$bracketed_line_argument_command.'x'} = 'def';
}

$block_commands{'multitable'} = 'multitable';

foreach my $block_command(
  'menu', 'detailmenu', 'direntry',
  'cartouche', 'group', 'raggedright', 'flushleft', 'flushright',
  'titlepage', 'copying', 'documentdescription',
  'example', 'smallexample', 'display', 'smalldisplay', 'lisp',
  'smalllisp', 'format', 'smallformat')
{
  $block_commands{$block_command} = 0;
}

# macro is special
foreach my $raw_command ('html', 'tex', 'xml', 'docbook', 'verbatim', 
                         'ignore', 'macro')
{
  $block_commands{$raw_command} = 'raw';
}

foreach my $block_command_one_arg('table', 'ftable', 'vtable',
  'itemize', 'enumerate', 'quotation', 'small_quotation') # 'macro' ?
{
  $block_commands{$block_command_one_arg} = 1;
}

$block_commands{'float'} = 2;

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
    push @default_index_names, $name;
  }
}

foreach my $other_forbidden_index_name ('info','ps','pdf','htm',
   'log','aux','dvi','texi','txi','texinfo','tex','bib')
{
  $forbidden_index_name{$other_forbidden_index_name} = 1;
}

my %misc_commands = (
  'node' => {'arg' => 'line'}, # special arg
  'bye' => {'skip' => 'line'}, # no arg
  # set, clear
  'set' => {'arg' => 'lineraw'}, # special arg
  'clear' => {'arg' => 1, 'skip' => 'line'}, # special arg
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
  'pagesizes' => {'skip' => 'line', 'arg' => 'line'}, # can have 2 args 
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
  $default_no_paragraph_commands{'end '.$block_command} = 1;
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
        if ($key eq 'test' and $conf->{$key}) {
          $parser->{'force'} = 1;
          $parser->{'error_limit'} = 1000;
          $parser->{'error'} = 'return';
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

sub tree ($)
{
  my $self = shift;
  return $self->{'tree'};
}

sub errors ($)
{
  my $self = shift;
  return $self->{'errors_warnings'};
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
  return if ($parser->{'no_warn'});
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
  if ($parser->{'generate'}) {
    warn $warn_line;
  } else {
    warn $warn_line if ($parser->{'debug'});
    push @{$parser->{'errors_warnings'}},
         { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line,
           %{$line_number} };
  }
}

my $error_nrs = 0;
sub _check_errors($)
{
  my $parser = shift;
  $error_nrs ++;
  if ($error_nrs >= $parser->{'error_limit'}) {
    warn $parser->__("Too many errors!  Gave up.\n")
      if ($parser->{'error'} eq 'generate');
    return 1;
  }
  return 0;
}

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
    if ($parser->{'error'} eq 'generate') {
      warn "$error_text";
    } else {
      warn "$error_text" if ($parser->{'debug'});
      push @{$parser->{'errors_warnings'}},
           { 'type' => 'error', 'text' => $text, 'error_line' => $error_text,
             %{$line_number} };
    }
    return 1 unless ($parser->{'force'});
  }
  return (_check_errors($parser));
}

sub _parse_macro_command($$)
{
  my $line = shift;
  my $parent = shift;
  my $macro;
  if ($line =~ /^\s+(\w[\w-]*)\s*(.*)/) {
    my $macro_arg_name = $1;
    my $macro_arg_args = $2;
    $macro = { 'cmdname' => 'macro', 'parent' => $parent, 'contents' => [] };
    $macro->{'args'} = [ 
      { 'type' => 'macro_arg_name', 'text' => $macro_arg_name, 
          'parent' => $macro },
      { 'type' => 'macro_arg_args', 'text' => $macro_arg_args, 
          'parent' => $macro} ];
  }
  return $macro;
}

sub _begin_paragraph ($$)
{
  my $self = shift;
  my $current = shift;

  if ((!$current->{'type'} or $current->{'type'} eq 'container') 
      and !$no_paragraph_contexts{$self->{'context'}->[-1]}) {
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
  # line number if available.
  $located_line_nr = $current->{'parent'}->{'line_nr'}
    if ($current->{'parent'}->{'line_nr'});
  my $error = _line_error ($self,
                           sprintf($self->__("%c%s missing close brace"),
               ord('@'), $current->{'parent'}->{'cmdname'}), $located_line_nr);
  $current = $current->{'parent'}->{'parent'};
  return ($current, $error);
}

sub _end_paragraph ($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  while ($current->{'type'} and $current->{'type'} eq 'brace_command_arg') {
    my $error;
    ($current, $error) = _close_brace_command($self, $current, $line_nr);
    return ($current, $error) if ($error);
  }
  if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
    print STDERR "CLOSE PARA\n" if ($self->{'debug'});
    $current = $current->{'parent'};
  }
  return ($current, 0);
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

  my $error;
  ($current, $error) = _end_paragraph($self, $current, $line_nr);
  return ($current, $error) if ($error);

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
      my $error = $self->_line_error(
                           sprintf($self->__("No matching `%cend %s'"),
                                   ord('@'), $current->{'cmdname'}), $line_nr);
      $current = $current->{'parent'};
    } elsif ($current->{'parent'}->{'cmdname'}
             and exists $context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
      ($current, $error) = _close_brace_command($self, $current, $line_nr);
      pop @{$self->{'context'}};
    } else { # silently close containers and @-commands without @end
      $current = $current->{'parent'};
    }

    return ($current, $error) if ($error);
    ($current, $error) = _end_paragraph($self, $current, $line_nr);
    return ($current, $error) if ($error);
  }

  $current = $current->{'parent'}
    if ($command and $current->{'cmdname'}
        and $current->{'cmdname'} eq $command);
  return ($current, 0);
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
#c 'container'   FIXME what comes after @*table, @itemize, @enumerate before
#                an @item
#
#c 'paragraph'
#
#special for @verb, type is the character

# the main subroutine
sub _internal_parse_text($$;$$)
{
  my $self = shift;
  my $text = shift;
  my $lines_array = shift;
  my $no_para = shift;

  # FIXME find on the tree
  my $in_menu;
  my $in_deff_line;
  my $new_line = '';

  my $root = { 'contents' => [] };
  $self->{'tree'} = $root;
  $self->{'context'} = [ '_root' ];
  my $current = $root;

  # This holds the line number.  Similar with line_nr, but simpler.
  my $line_index = 1;
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
     
    my $line = $new_line;
    $new_line = '';
    $line_index++;

    if ($self->{'debug'}) {
      $current->{'HERE !!!!'} = 1;
      local $Data::Dumper::Indent = 1;
      local $Data::Dumper::Purity = 1;
      print STDERR "".Data::Dumper->Dump([$root], ['$root']);
      print STDERR "NEW LINE: $line";
      delete $current->{'HERE !!!!'};
    }

    if ($line !~ /\S/ and not 
        # raw format or verb
        ($current->{'cmdname'} and
          (
           ($block_commands{$current->{'cmdname'}}
            and $block_commands{$current->{'cmdname'}} eq 'raw')
          or 
           ($current->{'type'} and $current->{'parent'}->{'cmdname'}
            and $current->{'parent'}->{'cmdname'} eq 'verb')
          ))
        # not in math or preformatted
        and !$no_paragraph_contexts{$self->{'context'}->[-1]}) {
      print STDERR "EMPTY LINE\n" if ($self->{'debug'});
      my $error;
      ($current, $error) = _end_paragraph($self, $current, $line_nr);
      return undef if ($error);
      push @{$current->{'contents'}}, { 'type' => 'normal_line', 
                                        'text' => $line,
                                        'parent' => $current };
      next;
    }
    # to determine if it is a menu entry, check ^*, and if set, add
    # : to the separators list.

    if ($in_menu) {
      if ($line =~ s/^(\*\s+)//) {
        my $leading_text = $1;
        #push @separators, ':';
        push @{$current->{'contents'}}, 
            { 'type' => 'menu_entry',
              'args' => [ { 'type' => 'menu_entry_leading_text',
                            'text' => $leading_text } ]
            };
      }
    }

    while (1) {
      # in a raw block command
      if ($current->{'cmdname'} and 
            $block_commands{$current->{'cmdname'}} and 
            ($block_commands{$current->{'cmdname'}} eq 'raw')) {
        # special case for macro that may be nested
        my $macro;
        if ($current->{'cmdname'} eq 'macro' and $line =~ /^\s*\@macro\s+/) {
          my $mline = $line;
          $mline =~ s/\s*\@macro//;
          $macro = _parse_macro_command ($mline, $current);
        }
        if ($macro) {
          push @{$current->{'contents'}}, $macro;
          $current = $current->{'contents'}->[-1];
          last;
        }
        elsif ($line =~ /^(.*?)\@end\s([a-zA-Z][\w-]*)/o and ($2 eq $current->{'cmdname'})) {
          $line =~ s/^(.*?)(\@end\s$current->{'cmdname'})//;
          push @{$current->{'contents'}}, 
            { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
              if ($1 ne '');
          $current = $current->{'parent'};
          last unless ($line =~ /\S/);
        }
        else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          last;
        }
      }
      # in @verb
      elsif ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
             and $current->{'parent'}->{'cmdname'} eq 'verb') { 
             # type should be 'brace_command_arg'
        my $char = quotemeta($current->{'type'});
        if ($line =~ s/^(.*?)$char\}/\}/) {
          push @{$current->{'contents'}}, 
              { 'text' => $1, 'type' => 'raw', 'parent' => $current } 
                if ($1 ne '');
        } else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          last;
        }
      }
      $line =~ s/^([^{}@,:\t.]*)//;
      $current = _merge_text ($self, $current, $1) if ($1 ne '');
        
      if ($line =~ s/^\@end\s+([a-zA-Z][\w-]*)//) {
        my $end_command = $1;
        print STDERR "END COMMAND $end_command\n" if ($self->{'debug'});
        my $error;
        ($current, $error) = _end_block_command($self, $current, $line_nr,
                                                $end_command);
        return undef if ($error);
        last unless ($line =~ /\S/);
      }
      elsif ($line =~ s/^\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o 
               or $line =~ s/^\@([a-zA-Z][\w-]*)//o) {
        my $command = $1;
        $command = $self->{'aliases'}->{$command} 
           if (exists($self->{'aliases'}->{$command}));
        print STDERR "COMMAND $command\n" if ($self->{'debug'});
        unless ($self->{'no_paragraph_commands'}->{$command}) {
          my $paragraph = _begin_paragraph($self, $current);
          $current = $paragraph if ($paragraph);
        }
        if (defined($deprecated_commands{$command})) {
          if ($deprecated_commands{$command} eq '') {
            _line_warn($self, sprintf($self->__("%c%s is obsolete."), 
                                ord('@'), $command), $line_nr);
          }
          else {
            _line_warn($self, sprintf($self->__("%c%s is obsolete; %s"),
                   ord('@'), $command, 
                   $self->__($deprecated_commands{$command})), $line_nr);
          }
        }
        if (defined($self->{'misc_commands'}->{$command})) {
          if ($root_commands{$command}) {
            my $error;
            ($current, $error) = _end_block_command($self, $current, $line_nr);
            return undef if ($error);
          }
          my ($args, $line_arg, $error);
          ($line, $args, $line_arg, $error) 
             = $self->_parse_misc_command($line, $command, $line_nr);
          return undef if ($error);
          push @{$current->{'contents'}}, 
            { 'cmdname' => $command, 'parent' => $current };
              
          foreach my $arg (@$args) {
            push @{$current->{'contents'}->[-1]->{'args'}},
              { 'type' => 'misc_arg', 'text' => $arg, 
                'parent' => $current->{'contents'}->[-1] };
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
          # FIXME @tab and @item, special case for @item(x) in @table...
        } elsif (exists($block_commands{$command})) {
          my $macro;
          if ($command eq 'macro') {
            $macro = _parse_macro_command ($line, $current);
          }
          if ($macro) {
            push @{$current->{'contents'}}, $macro;
            $current = $current->{'contents'}->[-1];
            last;
          } else {
            my $error;
            ($current, $error) = _end_paragraph($self, $current, $line_nr);
            return undef if ($error);
            $line =~ s/\s*//;
            push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                              'parent' => $current };
            $current = $current->{'contents'}->[-1];
            if ($block_commands{$command} and 
                $block_commands{$command} =~ /^\d+$/) {
              $current->{'args'} = [ {
                 'type' => 'block_line_arg',
                 'contents' => [],
                 'parent' => $current } ];
              $current->{'remaining_args'} = $block_commands{$command} -1;
              $current = $current->{'args'}->[-1];
            }
            elsif ($command eq 'multitable') {
              if ($line =~ s/^\@columnfractions\s+//) { 
                # both a cmdname and block_line_arg
                $current->{'args'} = [ { 'cmdname' => 'columnfractions', 
                                         'type' => 'block_line_arg', 
                                         'parent' => $current, 
                                         'contents' => [] } ];
                $current = $current->{'args'}->[-1];
              }
            }
            else {
              last unless ($line =~ /\S/);
            }
          }
          # FIXME multitable and deff*
        }
        elsif ($line =~ s/^{// and (defined($brace_commands{$command}))) {
          push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                            'parent' => $current };
          $current = $current->{'contents'}->[-1];
          if ($command eq 'verb') {
            if ($line =~ /^$/) {
              $current->{'type'} = '';
              return undef
                if (_line_error ($self, sprintf($self->
                __("\@%s without associated character"), $command), $line_nr));
            }
            else {
              $line =~ s/^(.)//;
              $current->{'type'} = $1;
            }
          }
          if ($brace_commands{$command}) {
            $current->{'args'} = [ { 'parent' => $current, 
                                     'contents' => [] } ];
            $current->{'remaining_args'} = $brace_commands{$command} -1;
            $current = $current->{'args'}->[-1];
            # no type for footnote, such that it appears as a container
            # that holds paragraphs
            if ($context_brace_commands{$command}) {
               push @{$self->{'context'}}, $command;
            }
            else {
               $current->{'type'} = 'brace_command_arg';
            }
            print STDERR "OPENED \@$current->{'parent'}->{'cmdname'}, remaining $current->{'parent'}->{'remaining_args'} "
               .($current->{'type'} ? $current->{'type'} : '')."\n"
              if ($self->{'debug'});
          }
        } elsif ($accent_commands{$command}) {
          if ($command =~ /^[a-zA-Z]/) {
            $line =~ s/^\s*//;

          } elsif ($line =~ /^\s/) {
            _line_warn ($self, sprintf($self->
                __("Accent command `\@%s' must not be followed by whitespace"),
                $command), $line_nr);
          }

          if ($line =~ /^\@/) {
            return undef
              if _line_error ($self, sprintf($self->
                     __("Use braces to give a command as an argument to \@%s"),
                     $command), $line_nr);
          }
          if ($line =~ s/^(\S)//o) {
            my $accent = { 'cmdname' => $command, 'parent' => $current };
            $accent->{'args'} = [ { 'text' => $1, 'parent' => $accent } ];
            push @{$current->{'contents'}}, $accent;

          } else { # The accent is at end of line
            # FIXME warn? And test case? Maybe this is catched 
            # above, by "Accent command `@%s' must not be followed by
            # whitespace for commands with letter.
            push @{$current->{'contents'}},
                 { 'text' => $command, 'parent' => $current };
          }

        } elsif ($no_brace_commands{$command}) {
          push @{$current->{'contents'}},
               { 'cmdname' => $command, 'parent' => $current };

        } else {
          # unknown
        }

      } elsif ($line =~ s/^([{}@,:\t.])//) {
        my $separator = $1;
        print STDERR "SEPARATOR: $separator\n" if ($self->{'debug'});
        if ($separator eq '@') {
          return undef if _line_error ($self,
                                       $self->__("Unexpected \@"), $line_nr);
        } elsif ($separator eq '{') {
          if ($current->{'cmdname'}
              and ($block_commands{$current->{'cmdname'}} eq 'multitable'
                   or $block_commands{$current->{'cmdname'}} eq 'def')) {
            push @{$current->{'args'}},
                 { 'type' => 'bracketed', 'contents' => [],
                   'parent' => $current };
            $current = $current->{'args'}->[-1];

          } else {
            return undef
              if _line_error ($self, sprintf($self->__("Misplaced %c"),
                                             ord('{')), $line_nr);
          }

        } elsif ($separator eq '}') { 
          # FIXME use parents
          #_print_current ($current);
          if ($current->{'type'} and ($current->{'type'} eq 'bracketed')) {
             $current = $current->{'parent'};
          } elsif ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and $brace_commands{$current->{'parent'}->{'cmdname'}}) {
             if ($context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
               pop @{$self->{'context'}};
             }
             # first is the arg.
             print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'debug'});
             $current = $current->{'parent'}->{'parent'};
          } elsif ($context_brace_commands{$self->{'context'}->[-1]}) {
             my $error;
             ($current, $error) = _end_paragraph($self, $current, $line_nr);
             return undef if ($error);
             if ($current->{'parent'}
                   and $current->{'parent'}->{'cmdname'}
                   and $brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}}
                   and $context_brace_commands{$current->{'parent'}->{'cmdname'}} eq $self->{'context'}->[-1]) {
               pop @{$self->{'context'}};
               print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'debug'});
               $current = $current->{'parent'}->{'parent'};
            }
          } else {
            return undef
              if _line_error ($self, sprintf($self->__("Misplaced %c"),
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
        # menu node if there is a :
        # . must be followed by a space to stop the node name.
        # cf texi2html.pl l 13425
        elsif ($separator =~ /[,\t.]/ and $current->{'type'} eq 'FIXME') {

        # menu node
        } elsif ($separator eq ':' and $current->{'type'} eq 'FIXME') {

        } else {
          $current = _merge_text ($self, $current, $separator);
        }
      }
      else {
        if ($self->{'debug'}) {
          print STDERR "END LINE: ". _print_current($current)."\n";
        }
        if ($line ne '') {
          die "Remaining line: $line\n";
        }
        if ($current->{'type'}
            and ($current->{'type'} eq 'block_line_arg'
                 or $current->{'type'} eq 'misc_line_arg')) {
          if ($current->{'cmdname'}
              and $current->{'cmdname'} eq 'columnfractions') { 
            # the columnfraction content should be text only, maybe
            # followed by a comment.
            #print STDERR "COLUMNFRACTIONS: ".Data::Dumper->Dump([$current], ['$columnfractions']) if ($self->{'debug'});
            my @fractions;
            my $other_contents;
            if (!@{$current->{'contents'}}) {
              return undef
                if _line_error ($self, sprintf($self->__("Empty \@%s"),
                                $current->{'cmdname'}), $line_nr);

            } elsif (!defined($current->{'contents'}->[0]->{'text'})) {
              return undef 
                if _line_error ($self, sprintf($self->
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
                  return undef
                    if _line_error ($self, sprintf($self->
                                        __("column fraction not a number: %s"),
                                        $fraction), $line_nr);
                }
              }
            }
            $current = $current->{'parent'};
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
          }
          $current = $current->{'parent'};
        }
        last;
      }
    }
  }
  my $error;
  ($current, $error) = _end_block_command($self, $current, $line_nr);
  return undef if ($error);
  return $root;
}

sub tree_to_texi ($)
{
  my $root = shift;
  die "bad root type (".ref($root).") $root\n" if (ref($root) ne 'HASH');
  my $result = '';
  #print STDERR "$root ";
  #print STDERR "$root->{'type'}" if (defined($root->{'type'}));
  #print STDERR "\n";
  if (defined($root->{'text'})) {
    $result .= $root->{'text'};
  }
  else {
    if ($root->{'cmdname'}) {
      #print STDERR "cmd: $root->{'cmdname'}\n";
      $result .= _expand_cmd_args_to_texi($root);
    }
    #print STDERR "$root->{'contents'} @{$root->{'contents'}}\n" if (defined($root->{'contents'}));
    if (defined($root->{'contents'})) {
      die "bad contents type(" . ref($root->{'contents'})
          . ") $root->{'contents'}\n" if (ref($root->{'contents'}) ne 'ARRAY');
      foreach my $child (@{$root->{'contents'}}) {
        $result .= tree_to_texi($child);
      }
    }
    if ($root->{'cmdname'} and (defined($block_commands{$root->{'cmdname'}}))) {
      $result .= '@end '.$root->{'cmdname'} ."\n"; # ."\n"?
    }
  }
  #print STDERR "tree_to_texi result: $result\n";
  return $result;
}

sub _expand_cmd_args_to_texi ($) {
  my $cmd = shift;
  my $result = '@'.$cmd->{'cmdname'};
  #print STDERR "Expand $result\n";
  my $cmd_with_braces = 1 if (defined($brace_commands{$cmd->{'cmdname'}}));
  $result .= '{' if ($cmd_with_braces);
  if ($cmd->{'cmdname'} eq 'verb') {
     $result .= $cmd->{'type'}.$cmd->{'args'}->[0]->{'text'}.$cmd->{'type'};
  }
  # must be before the next condition
  elsif ($block_commands{$cmd->{'cmdname'}}
         and ($block_commands{$cmd->{'cmdname'}} eq 'def'
              or $block_commands{$cmd->{'cmdname'}} eq 'multitable')) {
     foreach my $arg (@{$cmd->{'args'}}) {
        my $arg_expanded = tree_to_texi ($arg);
        $arg_expanded = '{'.$arg_expanded.'}'
          if ($arg->{'type'} and $arg->{'type'} eq 'bracketed');
        $result .= ' '.$arg_expanded;
     }
  } elsif (($cmd_with_braces
            or ($block_commands{$cmd->{'cmdname'}}
                and $block_commands{$cmd->{'cmdname'}} ne 'raw')) 
           and defined($cmd->{'args'})) {
    die "bad args type (".ref($cmd->{'args'}).") $cmd->{'args'}\n"
      if (ref($cmd->{'args'}) ne 'ARRAY');
    foreach my $arg (@{$cmd->{'args'}}) {
       $result .= tree_to_texi ($arg) . ', ';
    }
    $result =~ s/, $//;
  }
  elsif ($cmd->{'cmdname'} eq 'macro') {
    $result .= ' ' .$cmd->{'args'}->[0]->{'text'}. ' '
               . $cmd->{'args'}->[1]->{'text'};
  }
  elsif (defined($cmd->{'args'})) {
    #print STDERR "".Data::Dumper->Dump([$cmd]);
    foreach my $arg (@{$cmd->{'args'}}) {
      $result .= ' '
        unless ($cmd->{'cmdname'} eq 'c' or $cmd->{'cmdname'} eq 'comment');
      $result .= tree_to_texi ($arg);
    }
    #die "Shouldn't have args: $cmd->{'cmdname'}\n";
  }
  if ($cmd_with_braces) {
    $result .= '}';
  }
  elsif (defined($block_commands{$cmd->{'cmdname'}})) {
    # there is an end of line if there is a comment, for example
    chomp($result);
    $result .= "\n";
  }
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

#print STDERR "HHHHHHHHH $line $command\n";
  $skip_spec = $self->{'misc_commands'}->{$command}->{'skip'}
    if (defined($self->{'misc_commands'}->{'skip'}));
  $arg_spec = $misc_commands{$command}->{'arg'}
    if (defined($misc_commands{$command}->{'arg'}));

  if ($command eq 'alias') {
    if ($line =~ s/(\s+)([a-zA-Z][\w-]*)(\s*=\s*)([a-zA-Z][\w-]*)(\s*)//) {
      $self->{'aliases'}->{$2} = $4;
      $args = [$2, $4];
    } else {
      my $error = _line_error ($self, sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
      return ('', '', '', $error);
    }

  } elsif ($command eq 'definfoenclose') {
    if ($line =~ s/^\s+([a-z][\w\-]*)\s*,\s*([^\s]+)\s*,\s*([^\s]+)//) {
      $args = [$1, $2, $3 ];
      $self->{'info_enclose'}->{$1} = [ $2, $3 ];
    } else {
      my $error = _line_error ($self, sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
      return ('', '', '', $error);
    } # FIXME warn about garbage remaining on the line?

  } elsif ($command eq 'set') {
    if ($line =~ /^(\s+)([\w\-]+)(\s+)(.*)$/) {
      $args = [$2, $4];
    } else {
      my $error = _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
      return ('', '', '', $error);
    }
    $line = '';

  } elsif ($command eq 'defindex' || $command eq 'defcodeindex') {
    if ($line =~ s/^\s+(\w+)\s*//) {
      my $name = $1;
      if ($forbidden_index_name{$name}) {
        my $error = _line_error($self, sprintf($self->
                                __("Reserved index name %s"),$name), $line_nr);
        return ('', '', '', $error);
      } else {
        $self->{'misc_commands'}->{$name.'index'} = { 'arg' => 'line' };
      }
    } else {
      my $error = _line_error ($self, sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
      return ('', '', '', $error);
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
    my $arg_nr = $misc_commands{$command}->{'arg'};
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
  return ($line, $args, $line_arg, '');
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
