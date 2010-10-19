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
# Parts (also from Patrice Dumas) come from texi2html.pl or texi2html.init.


package Texinfo::Parser;

use 5.00405;
use Data::Dumper;
# to expand file names in @include
use Texinfo::Convert::Text;
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
  parse_texi_file
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
  'macros' => {},
  'expanded_formats' => [],
  'include_directories' => [ '.' ],
  'clickstyle' => 'arrow'
);

my %no_brace_commands;             # commands never taking braces

foreach my $no_brace_command ('*',' ',"\t","\n",'-', '|', '/',':','!',
                              '?','.','@','}','{','\\') {
  $no_brace_commands{$no_brace_command} = 1;
}

# commands taking a line as argument or no argument.
# sectioning commands and def* commands are added below.
# index commands are added dynamically.
my %misc_commands = (
  'node'             => 'line', # special arg
  'bye'              => 'skipline', # no arg
  # set, clear
  'set'               => 'special', # special arg
  'clear'             => 'special', # special arg
  'unmacro'           => 'special', 
  # comments
  'comment'           => 'lineraw',
  'c'                 => 'lineraw',
  # special
  'definfoenclose'    => 5,
  'alias'             => 3, 
  # number of arguments is not known in advance.
  'columnfractions'   => 1, 
  # file names
  'setfilename'       => 'text',
  'verbatiminclude'   => 'text',
  'include'           => 'text',

  'raisesections'     => 'skipline',  # no arg
  'lowersections'     => 'skipline', # no arg
  'contents'          => 'noarg', # no arg
  'shortcontents'     => 'noarg', # no arg
  'summarycontents'   => 'noarg', # no arg
  'insertcopying'     => 'noarg', # no arg
  'clickstyle'        => 'special', # arg should be an @-command
  # more relevant in preamble
  'setcontentsaftertitlepage'      => 'skipline', # no arg
  'setshortcontentsaftertitlepage' => 'skipline', # no arg
  'documentencoding'  => 'text', # or 1?
  'novalidate'        => 'skipline', # no arg
  'dircategory'       => 'text', # line. Position with regard 
                                 # with direntry is significant
  'pagesizes'         => 'line', # can have 2 args 
                           # or one? 200mm,150mm 11.5in
  'finalout'          => 'skipline', # no arg
  'paragraphindent'   => 1, # arg none asis 
                       # or a number and forbids anything else on the line
  'firstparagraphindent' => 1, # none insert
  'frenchspacing'     => 1, # on off
  'fonttextsize'      => 1, # 10 11
  'allowcodebreaks'   => 1, # false or true
  'exampleindent'     => 1, # asis or a number
  'footnotestyle'     => 1, # end and separate, nothing else on the line
  'afourpaper'        => 'skipline', # no arg
  'afivepaper'        => 'skipline', # no arg
  'afourlatex'        => 'skipline', # no arg
  'afourwide'         => 'skipline', # no arg
  'headings'          => 1, #off on single double singleafter doubleafter
                            # interacts with setchapternewpage
  'setchapternewpage' => 1, # off on odd

  # FIXME for the following the @this* commands are not defined. Also
  # @value and maybe macro invocations may also be delayed.
  'everyheading' => 'lineraw', # @*heading @*footing use @|
  'everyfooting' => 'lineraw', # + @thispage @thissectionname @thissectionnum
  'evenheading'  => 'lineraw',  # @thissection @thischaptername @thischapternum 
  'evenfooting'  => 'lineraw',  # @thischapter @thistitle @thisfile
  'oddheading'   => 'lineraw',
  'oddfooting'   => 'lineraw',
  'smallbook'    => 'skipline', # no arg
  'syncodeindex' => 2,
                    # args are index identifiers
  'synindex'     => 2,
  'defindex'     => 1, # one identifier arg
  'defcodeindex' => 1, # one identifier arg
  'documentlanguage'  => 'text',     # language code arg
  'kbdinputstyle'     => 1,          # code example distinct
  'everyheadingmarks' => 1, # top bottom
  'everyfootingmarks' => 1,
  'evenheadingmarks'  => 1,
  'oddheadingmarks'   => 1,
  'evenfootingmarks'  => 1,
  'oddfootingmarks'   => 1,
  # not valid for info (should be in @iftex)
  'cropmarks'         => 'skipline', # no arg

  # formatting
  'center'            => 'line',
  # FIXME Verify the index exists?
  'printindex'        => 1,
  'listoffloats'      => 'line',
  # especially in titlepage
  'shorttitle'        => 'line',
  'shorttitlepage'    => 'line',
  'settitle'          => 'line',
  'author'            => 'line',
  'subtitle'          => 'line',
  'title'             => 'line',
  'sp'                => 1, # numerical arg
  'page'              => 'skipline', # no arg (pagebreak)
  'need'              => 1, # one numerical/real arg
  # formatting
  'noindent'          => 'skipspace', # no arg
  'indent'            => 'skipspace',
  'exdent'            => 'skipspace',
  'headitem'          => 'skipspace',
  'item'              => 'skipspace', # or line, depending on the context
  'itemx'             => 'skipspace',
  'tab'               => 'skipspace', 
  # not valid for info (should be in @iftex)
  'vskip'             => 'lineraw', # arg line in TeX
  # obsolete @-commands.
  'refill'            => 'noarg', # no arg (obsolete, to be ignored)
  # Remove spaces and end of lines after the 
  # commands? If no, they can lead to empty lines
  'quote-arg'         => 'skipline',
  'allow-recursion'   => 'skipline',
);

# command with braces. value is the max number of arguments.
my %brace_commands;    

# accent commands. They may be called with and without braces.
my %accent_commands;

foreach my $no_arg_command ('TeX','LaTeX','bullet','copyright','registeredsymbol','dots','enddots','equiv','error','expansion','arrow','minus','point','print','result','today','aa','AA','ae','oe','AE','OE','o','O','ss','l','L','DH','dh','TH','th','exclamdown','questiondown','pounds','ordf','ordm','comma','euro','geq','leq','tie','textdegree','quotedblleft','quotedblright','quoteleft','quoteright','quotedblbase','quotesinglbase','guillemetleft','guillemetright','guillemotleft','guillemotright','guilsinglleft','guilsinglright','click') {
  $brace_commands{$no_arg_command} = 0;
}

foreach my $accent_command ('"','~','^','`',"'",',','=',
                           'ringaccent','H','dotaccent','u','ubaraccent',
                           'udotaccent','v','ogonek','tieaccent') {
  $accent_commands{$accent_command} = 1;
  $brace_commands{$accent_command} = 1;
}

foreach my $one_arg_command ('asis','b','cite','clicksequence','code','command','ctrl','dfn','dmn','emph','env','file','headitemfont','i','slanted','sansserif','kbd','key',,'option','r','samp','sc','strong','t','indicateurl','var','verb','titlefont','w','hyphenation','anchor','dotless') {
  $brace_commands{$one_arg_command} = 1;
}

# Commands that enclose full texts
my %context_brace_commands;
foreach my $context_brace_command ('footnote', 'caption', 'shortcaption', 'math') {
  $context_brace_commands{$context_brace_command} = $context_brace_command;
  $brace_commands{$context_brace_command} = 1;
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

my %no_paragraph_contexts;
foreach my $no_paragraph_context ('math', 'preformatted', 'menu', 'def') {
  $no_paragraph_contexts{$no_paragraph_context} = 1;
};

my %menu_commands;
foreach my $menu_command ('menu', 'detailmenu', 'direntry') {
  $menu_commands{$menu_command} = 1;
};

# commands delimiting blocks, with an @end.
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
  $misc_commands{$def_command.'x'} = 'line';
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

my @out_formats = ('html', 'tex', 'xml', 'docbook');
# macro is special
foreach my $raw_command (@out_formats, 'verbatim', 
                         'ignore', 'macro', 'rmacro') {
  $block_commands{$raw_command} = 'raw';
}

foreach my $command (@out_formats, 'info', 'plaintext') {
  $block_commands{'if' . $command} = 'conditional';
  $block_commands{'ifnot' . $command} = 'conditional';
}

$block_commands{'ifset'} = 'conditional';
$block_commands{'ifclear'} = 'conditional';

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
  $misc_commands{$sectioning_command} = 'line';
  $root_commands{$sectioning_command} = 1
    unless ($sectioning_command =~ /heading/);
}

$root_commands{'node'} = 1;

my %default_no_paragraph_commands;
my %begin_line_commands;

foreach my $command ('node', 'end') {
  $begin_line_commands{$command} = $command;
}

foreach my $no_paragraph_command ('titlefont', 'caption', 'shortcaption', 
          'image', '*') {
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
                                'vskip') {
  delete $begin_line_commands{$misc_not_begin_line};
}

my %block_arg_commands;
foreach my $block_command (keys(%block_commands)) {
  $begin_line_commands{$block_command} = 1;
  $default_no_paragraph_commands{$block_command} = 1;
  $close_paragraph_commands{$block_command} = 1 
     unless ($block_commands{$block_command} eq 'raw' or 
             $block_commands{$block_command} eq 'conditional');
  $block_arg_commands{$block_command} = 1 
    if ($block_command eq 'multitable' 
        or $def_commands{$block_command}
        or ($block_commands{$block_command} 
            and $block_commands{$block_command} =~ /^\d+$/));
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
    $parser->{'misc_commands'}->{$name.'index'} = 'line';
    $parser->{'no_paragraph_commands'}->{$name.'index'} = 1;
  }
  $parser->{'errors_warnings'} = [];
  $parser->{'errors_nrs'} = 0;
  $parser->{'context_stack'} = [ $parser->{'context'} ];
  foreach my $expanded_format(@{$parser->{'expanded_formats'}}) {
    $parser->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }
  return $parser;
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

# construct a line numbers array matching a lines array, based on information
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

  return if (!defined($first_line));

  $macro = '' if (!defined($macro));
  $file = '' if (!defined($file));
  my $new_lines = [];

  my $line_index = $first_line;
  foreach my $index(0..scalar(@$lines)-1) {
     $line_index = $index+$first_line if (!$fixed_line_number);
     $new_lines->[$index] = [ $lines->[$index],  
                            { 'line_nr' => $line_index,
                              'file_name' => $file, 'macro' => $macro } ];
  }
  return $new_lines;
}

# The main entry point
sub parse_texi_text($$;$)
{
  my $self = shift;
  my $text = shift;
  my $lines_nr = shift;

  return undef if (!defined($text));

  my $lines_array = [];
  if (!ref($text)) {
    $text = _text_to_lines($text);
  }
  $lines_nr = [] if (!defined($lines_nr));
  if (!ref($lines_nr)) {
    $lines_array = _complete_line_nr($text, $lines_nr);
  } else {
    while (@$text) {
      my $line_nr = shift @$lines_nr;
      my $line = shift @$text;
      push @$lines_array, [$line, $line_nr];
    }
  }
  $self->{'input'} = [{'pending' => $lines_array}];
  return $self->_parse_texi();
}

sub parse_texi_file ($$)
{
  my $self = shift;
  my $file_name = shift;
  my $filehandle = do { local *FH };
  # FIXME error message
  open ($filehandle, $file_name) or return undef;
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
  $self->{'input'} = [{
       'pending' => [ [$line, { 'line_nr' => $line_nr,
                      'file_name' => $file_name, 'macro' => '' }] ],
       'name' => $file_name,
       'line_nr' => $line_nr,
       'fh' => $filehandle
        }];
  return $self->_parse_texi(\@first_lines);
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
  my $text = '';
  $type = "($current->{'type'})" if (defined($current->{'type'}));
  $cmd = "\@$current->{'cmdname'}" if (defined($current->{'cmdname'}));
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
  return "$cmd$type : $args $text $contents\n$parent_string";
}

# format a line warning
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

# format a line error
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

# parse a macro line
sub _parse_macro_command($$$$$;$)
{
  my $self = shift;
  my $command = shift;
  my $line = shift;
  my $parent = shift;
  my $line_nr = shift;
  my $macro = { 'cmdname' => $command, 'parent' => $parent, 'contents' => [],
               'special' => {'arg_line' => $line} };
  # REMACRO
  if ($line =~ /^\s+([[:alnum:]][[:alnum:]-]*)\s*(.*)/) {
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

# start a paragraph if in a context where paragraphs are to be started.
sub _begin_paragraph ($$)
{
  my $self = shift;
  my $current = shift;

  if ((!$current->{'type'} or $current->{'type'} eq 'before_item') 
      and !$no_paragraph_contexts{$self->{'context_stack'}->[-1]}) {
    die "BUG: contents undef "._print_current($current) 
       if (!defined($current->{'contents'}));

    push @{$current->{'contents'}}, 
            { 'type' => 'paragraph', 'parent' => $current, 'contents' => [] };
    $current = $current->{'contents'}->[-1];
    print STDERR "PARAGRAPH\n" if ($self->{'debug'});
    return $current;
  }
  return 0;
}

# currently doesn't do much more than
# return $_[0]->{'parent'}->{'parent'}
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

# close brace commands, that don't set a new context (ie @caption, @footnote)
# and then the paragraph
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
    } else { # silently close containers and @-commands without brace nor @end
      $current = $current->{'parent'};
    }

    # FIXME could there still be a paragraph to close?
    #$current = _end_paragraph($self, $current, $line_nr);
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
         or $current->{'contents'}->[-1]->{'type'} eq 'empty_spaces_before_argument')) {
      $no_merge_with_following_text = 1;
    }
    # Change this if you don't want to have preceding space added to
    # the text out of the paragraph
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
    print STDERR "MERGED TEXT: $text|||\n" if ($self->{'debug'});
  }
  else {
    push @{$current->{'contents'}}, { 'text' => $text, 'parent' => $current };
    print STDERR "NEW TEXT: $text|||\n" if ($self->{'debug'});
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

sub _next_text($$)
{
  my $self = shift;
  my $line_nr = shift;
 
  while (@{$self->{'input'}}) {
    my $current = $self->{'input'}->[0];
    if (@{$current->{'pending'}}) {
      my $new_text = shift @{$current->{'pending'}};
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
          
          print STDERR "MACRO ARG: $separator: $protected_char\n" if ($self->{'debug'});
        } else {
          $arguments->[-1] .= '\\';
          print STDERR "MACRO ARG: $separator\n" if ($self->{'debug'});
        }
      } elsif ($separator eq ',') {
        if ($braces_level == 1) {
          if (scalar(@$arguments) < $args_total) {
            push @$arguments, '';
            $line =~ s/^\s*//;
            print STDERR "MACRO NEW ARG\n" if ($self->{'debug'});
          } else {
            # implicit quoting when there is one argument.
            if ($args_total != 1) {
              _line_error ($self, sprintf($self->__("Macro `%s' called with too many args"), 
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
      print STDERR "MACRO ARG end of line\n" if ($self->{'debug'});
      $arguments->[-1] .= $line;

      ($line, $line_nr) = _new_line($self, $line_nr);
      if (!defined($line)) {
        _line_error ($self, sprintf($self->__("\@%s missing close brace"), 
           $name), $line_nr_orig);
        return ($arguments, "\n", $line_nr);
      }
    }
  }
  if ($args_total == 0 and $arguments->[0] =~ /\S/) {
    _line_error ($self, sprintf($self->__("Macro `%s' declared without argument called with an argument"), 
                                $name), $line_nr);
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
           or $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command')) {
    print STDERR "ABORT EMPTY additional text $additional_text, current $current->{'contents'}->[-1]->{'text'}|)\n" if ($self->{'debug'});
    $current->{'contents'}->[-1]->{'text'} .= $additional_text;
    if ($current->{'contents'}->[-1]->{'text'} eq '') {
      pop @{$current->{'contents'}} 
    } elsif ($current->{'contents'}->[-1]->{'type'} eq 'empty_line') {
      delete $current->{'contents'}->[-1]->{'type'};
    } elsif ($current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command') {
      $current->{'contents'}->[-1]->{'type'} = 'empty_spaces_after_command';
    }
    return 1;
  }
  return 0;
}

sub _isolate_last_space($$)
{
  my $self = shift;
  my $current = shift;
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
        $current->{'contents'}->[$index]->{'type'} = 'spaces_at_end';
      } else {
        $current->{'contents'}->[$index]->{'text'} =~ s/(\s+)$//;
        my $spaces = $1;
        my $new_spaces = { 'text' => $spaces, 'parent' => $current,
                           'type' => 'spaces_at_end' };
        if ($index == -1) {
          push @{$current->{'contents'}}, $new_spaces;
        } else {
          splice (@{$current->{'contents'}}, $index+1, 0, $new_spaces);
        }
      }
    }
  }
}

# close constructs and do stuff at end of line (or end of the document)
sub _end_line($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  # a line consisting only of spaces.
  if ($current->{'contents'} and @{$current->{'contents'}} 
      and $current->{'contents'}->[-1]->{'type'} 
      and $current->{'contents'}->[-1]->{'type'} eq 'empty_line') {
    print STDERR "END EMPTY LINE\n" if ($self->{'debug'});
    if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
      my $empty_line = pop @{$current->{'contents'}};
      $current = _end_paragraph($self, $current, $line_nr);
      push @{$current->{'contents'}}, $empty_line;
      $empty_line->{'parent'} = $current;
    } elsif ($current->{'type'} 
               and $current->{'type'} eq 'menu_entry_description') {
      # first parent is menu_entry
      my $empty_line = pop @{$current->{'contents'}};
      $current = $current->{'parent'}->{'parent'};
      
      push @{$current->{'contents'}}, { 'type' => 'after_description_line', 
                                        'text' => $empty_line->{'text'},
                                        'parent' => $current };
      push @{$current->{'contents'}}, { 'type' => 'menu_comment',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      print STDERR "MENU: END DESCRIPTION, OPEN COMMENT\n" if ($self->{'debug'});
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
        print STDERR "THEN MENU_COMMENT OPEN\n" if ($self->{'debug'});
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
                                  'contents' => [], 'parent' => $current };
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
    my $empty_text;
    # @multitable args
    if ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
               and $current->{'parent'}->{'cmdname'} eq 'multitable') {
      # parse the prototypes and put them in a special arg
      my @prototype_row;
      foreach my $content (@{$current->{'contents'}}) {
        if ($content->{'type'} and $content->{'type'} eq 'bracketed') {
          push @prototype_row, $content;
        } elsif ($content->{'text'}) {
          if ($content->{'text'} =~ /\S/) {
            foreach my $prototype(split /\s+/, $content->{'text'}) {
              push @prototype_row, { 'text' => $prototype, 
                            'type' => 'row_prototype' };
            }
          }
        } else {
          if (!$content->{'cmdname'}) { 
            _line_warn ($self, sprintf($self->
                   __("Unexpected argument on \@%s line: %s"), 
                   $current->{'cmdname'}, 
                   tree_to_texi( { $content->{'contents'} })), $line_nr);
          } elsif ($content->{'cmdname'} eq 'c' 
                 and $content->{'cmdname'} eq 'comment') {
          } else {
            push @prototype_row, $content;
          }
        }
      }
      
      my $multitable = $current->{'parent'};
      $multitable->{'special'}->{'max_columns'} = scalar(@prototype_row);
      if (!scalar(@prototype_row)) {
        $self->_line_warn ($self->__("empty multitable"), $line_nr);
      }
      $multitable->{'special'}->{'prototypes'} = \@prototype_row;

    }
    $current = $current->{'parent'};
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
    if ($current->{'cmdname'} 
          and $block_item_commands{$current->{'cmdname'}}) {
      push @{$current->{'contents'}}, { 'type' => 'before_item',
         'contents' => [], 'parent', $current };
      $current = $current->{'contents'}->[-1];
    }

  # misc command line arguments
  } elsif ($current->{'type'} 
           and $current->{'type'} eq 'misc_line_arg') {
    $self->_isolate_last_space($current);
    # first parent is the @command, second is the parent
    $current = $current->{'parent'};
    my $misc_cmd = $current;
    my $command = $current->{'cmdname'};
    print STDERR "MISC END \@$command\n" if ($self->{'debug'});
    if ($self->{'misc_commands'}->{$command}
        and $self->{'misc_commands'}->{$command} =~ /^\d$/) {
      my $args = _parse_line_command_args ($self, $current, $line_nr);
      $current->{'special'}->{'misc_args'} = $args if (defined($args));
    }
    $current = $current->{'parent'};
    # columnfractions 
    if ($command eq 'columnfractions') {
      # in a multitable, we are in a block_line_arg
      if (!$current->{'parent'} or !$current->{'parent'}->{'cmdname'} 
                   or $current->{'parent'}->{'cmdname'} ne 'multitable') {
        _line_error ($self, sprintf($self->__("\@%s only meaningful on a \@multitable line"), 
           $command), $line_nr);
      } else {
        $current = $current->{'parent'};
        $current->{'special'}->{'max_columns'} = 0;
        $current->{'special'}->{'max_columns'} = 
            scalar(@{$misc_cmd->{'special'}->{'misc_args'}})
              if (defined($misc_cmd->{'special'}->{'misc_args'}));
        push @{$current->{'contents'}}, { 'type' => 'before_item',
           'contents' => [], 'parent', $current };
        $current = $current->{'contents'}->[-1];
      }
    }
   # do that last in order to have the line processed if one of the above
   # case is also set.
  } elsif ($current->{'contents'} and @{$current->{'contents'}}
      and $current->{'contents'}->[-1]->{'type'}
      and $current->{'contents'}->[-1]->{'type'} eq 'empty_line_after_command') {
    # empty line after a @menu. Reparent to the menu
    if ($current->{'type'} 
        and $current->{'type'} eq 'menu_comment') {
      print STDERR "EMPTY LINE AFTER MENU\n" if ($self->{'debug'});
      my $empty_line = pop @{$current->{'contents'}};
      $empty_line->{'parent'} = $current->{'parent'};
      unshift @{$current->{'parent'}->{'contents'}}, $empty_line;
    }
  }
  return $current;
}

sub _end_line_and_include_file ($$$)
{
  my $self = shift;
  my $current = shift;
  my $line_nr = shift;

  my $included_file = 0;

  if ($current->{'type'} and $current->{'type'} eq 'misc_line_arg'
    and $current->{'parent'}->{'cmdname'} 
    and $current->{'parent'}->{'cmdname'} eq 'include') {
    $self->_isolate_last_space($current);
    my $filename = Texinfo::Convert::Text::convert ($current);
    chomp($filename);
    my $file;
    if ($filename =~ m,^(/|\./|\.\./),) {
      $file = $filename if (-e $filename and -r $filename);
    } else {
      foreach my $dir (@{$self->{'include_directories'}}) {
        $file = "$dir/$filename" if (-e "$dir/$filename" and -r "$dir/$filename");
        last if (defined($file));
      }
    }
    if (defined($file)) {
      my $filehandle = do { local *FH };
      if (open ($filehandle, $file)) {
        $included_file = 1;
        print STDERR "Included $file($filehandle)\n" if ($self->{'debug'});
        $included_file = 1;
        unshift @{$self->{'input'}}, { 
          'name' => $file,
          'line_nr' => 1,
          'pending' => [],
          'fh' => $filehandle };
      } else {
        _line_error ($self, sprintf($self->__("\@%s: Cannot open %s: %s"), 
           'include', $filename, $!), $line_nr);
      }
    } else {
      _line_error ($self, sprintf($self->__("\@%s: Cannot find %s"), 
         'include', $filename), $line_nr);
    }
  }
  if ($included_file) {
    # remove completly the include file command
    $current = $current->{'parent'}->{'parent'};
    pop @{$current->{'contents'}};
  } else {
    $current = _end_line ($self, $current, $line_nr);
  }
  return ($current, $included_file);
}

sub _start_empty_line_after_command($$) {
  my $line = shift;
  my $current = shift;
  $line =~ s/^([^\S\n]*)//;
  push @{$current->{'contents'}}, { 'type' => 'empty_line_after_command',
                                    'text' => $1,
                                    'parent' => $current };
  return $line;
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
sub _parse_texi($$;$)
{
  my $self = shift;
  my $first_lines = shift;

  my $root = { 'contents' => [] };
  my $current = $root;
  if ($first_lines) {
    foreach my $line (@$first_lines) {
      push @{$current->{'contents'}}, { 'text' => $line,
                                        'type' => 'preamble' };
    }
  }

  $self->{'conditionals_stack'} = [];

  my $line_nr;
  
 NEXT_LINE:
  while (1) {
    my $line;
    ($line, $line_nr) = _next_text($self, $line_nr);
    last if (!defined($line));

    if ($self->{'debug'}) {
      $current->{'HERE !!!!'} = 1; # marks where we are in the tree
      local $Data::Dumper::Indent = 1;
      local $Data::Dumper::Purity = 1;
      print STDERR "".Data::Dumper->Dump([$root], ['$root']);
      my $line_text = '';
      $line_text = "$line_nr->{'line_nr'}.$line_nr->{'macro'}" if ($line_nr);
      print STDERR "NEW LINE($self->{'context_stack'}->[-1]:@{$self->{'conditionals_stack'}}:$line_text): $line";
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
      print STDERR "BEGIN LINE\n" if ($self->{'debug'});
      $line =~ s/([^\S\n]*)//;
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
                         'special' => {'arg_line' => $line }};
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
                         'special' => {'line' => $line }};
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
          if ($block_commands{$end_command} eq 'conditional') {
            # don't store ignored @if*
            my $conditional = pop @{$current->{'contents'}};
            die "BUG: not a conditional ".print_current($conditional)
              if (!defined($conditional->{'cmdname'}
                  or $conditional->{'cmdname'} ne $end_command));
            # Ignore until end of line
            if ($line !~ /\n/) {
              ($line, $line_nr) = _new_line($self, $line_nr);
              print STDERR "IGNORE CLOSE line: $line" if ($self->{'debug'});
            }
            print STDERR "CLOSED conditional $end_command\n" if ($self->{'debug'});
            last;
          } else {
            print STDERR "CLOSED raw $end_command\n" if ($self->{'debug'});
            $line = _start_empty_line_after_command($line, $current);
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
            _line_error ($self, sprintf($self->
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
          print STDERR "END VERB\n" if ($self->{'debug'});
        } else {
          push @{$current->{'contents'}}, 
             { 'text' => $line, 'type' => 'raw', 'parent' => $current };
          print STDERR "LINE VERB: $line" if ($self->{'debug'});
          last;
        }
      }

      # this mostly happens in the following cases:
      #   after expansion of user defined macro that doesn't end with EOL
      #   after a protection of @\n in @def* line
      while ($line eq '')
      {
        print STDERR "END OF TEXT not at end of line\n"
          if ($self->{'debug'});
        ($line, $line_nr) = _next_text($self, $line_nr);
        if (!defined($line)) {
          # end of the file
          my $included_file;
          ($current, $included_file) = 
            _end_line_and_include_file ($self, $current, $line_nr);
          if (!$included_file) {
            $current = _end_block_command($self, $current, $line_nr);
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
          _line_warn($self, sprintf($self->__("\@%s defined with zero or more than one argument should be invoked with {}"), $command), $line_nr);
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
           if ($self->{'debug'}); 
        # empty result.  It is ignored here.
        next if ($expanded eq '');
        my $expanded_lines = _text_to_lines($expanded);
        chomp ($expanded_lines->[-1]);
        pop @$expanded_lines if ($expanded_lines->[-1] eq '');
        print STDERR "MACRO EXPANSION LINES: ".join('|', @$expanded_lines)
                                     ."|\nEND LINES\n" if ($self->{'debug'});
        next if (!@$expanded_lines);
        my $new_lines = _complete_line_nr($expanded_lines, 
                            $line_nr->{'line_nr'}, $line_nr->{'file_name'},
                            $expanded_macro->{'args'}->[0]->{'text'}, 1);
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
        if ($current->{'parent'} and $current->{'parent'}->{'parent'} 
            and $current->{'parent'}->{'parent'}->{'cmdname'} and
           ($current->{'parent'}->{'parent'}->{'cmdname'} eq 'itemize'
             or $item_line_commands{$current->{'parent'}->{'parent'}->{'cmdname'}})
             and (scalar(@{$current->{'parent'}->{'contents'}}) == 1
                  or (scalar(@{$current->{'parent'}->{'contents'}}) == 2
                   and defined($current->{'parent'}->{'contents'}->[0]->{'text'})
                   and $current->{'parent'}->{'contents'}->[0]->{'text'}
                                      =~ /^[^\S\n]*/))) {
          delete $current->{'contents'};
          print STDERR "FOR PARENT \@$current->{'parent'}->{'parent'}->{'cmdname'} command_as_argument $current->{'cmdname'}\n" if ($self->{'debug'});
          $current->{'type'} = 'command_as_argument';
          $current = $current->{'parent'};

        # now accent commands
        } elsif ($accent_commands{$current->{'cmdname'}}) {
          if ($line =~ /^[^\S\n]/) {
            if ($current->{'cmdname'} =~ /^[a-zA-Z]/) {
              $line =~ s/^([^\S\n]+)//;
              $current->{'special'}->{'spaces'} = '' 
                if (!defined($current->{'special'}->{'spaces'}));
              $current->{'special'}->{'spaces'} .= $1;
            } else {
              _line_warn ($self, sprintf($self->
                __("Accent command `\@%s' must not be followed by whitespace"),
                $current->{'cmdname'}), $line_nr);
              $current = $current->{'parent'};
            }
         } elsif ($line =~ /^\@/) {
            _line_error ($self, sprintf($self->
              __("Use braces to give a command as an argument to \@%s"),
                $current->{'cmdname'}), $line_nr);
            $current = $current->{'parent'};
          } elsif ($line =~ s/^(.)//o) {
            print STDERR "ACCENT \@$current->{'cmdname'}\n" 
              if ($self->{'debug'});
            $current->{'args'} = [ { 'text' => $1, 'parent' => $current } ];
            if ($current->{'cmdname'} =~ /^[a-zA-Z]/) {
              $current->{'args'}->[-1]->{'type'} = 'space_command_arg';
            }
            delete $current->{'contents'};
            $current = $current->{'parent'};
          } else { # The accent is at end of line
            # whitespace for commands with letter.
            print STDERR "STRANGE ACC \@$current->{'cmdname'}\n" if ($self->{'debug'});
            _line_warn ($self, sprintf($self->
               __("Accent command `\@%s' must not be followed by new line"),
               $current->{'cmdname'}), $line_nr);
            $current = $current->{'parent'};
          }
          next;
        } else {
          _line_error ($self,
             sprintf($self->__("\@%s expected braces"), 
                           $current->{'cmdname'}), $line_nr);
          $current = $current->{'parent'};
        }
      # maybe a menu entry beginning: a * at the beginning of a menu line
      } elsif ($line =~ /^\*/ and $current->{'type'}
                and ($current->{'type'} eq 'menu_comment'
                    or $current->{'type'} eq 'menu_entry_description')
                and @{$current->{'contents'}} 
                and $current->{'contents'}->[-1]->{'type'}
                and $current->{'contents'}->[-1]->{'type'} eq 'empty_line'
                and $current->{'contents'}->[-1]->{'text'} eq '') {
        print STDERR "MENU STAR\n" if ($self->{'debug'});
        _abort_empty_line ($self, $current);
        $line =~ s/^\*//;
        push @{$current->{'contents'}}, { 'type' => 'menu_star',
                                          'text' => '*' };
      # a space after a * at the beginning of a menu line
      } elsif ($line =~ /^\s+/ and $current->{'contents'} 
               and @{$current->{'contents'}} 
               and $current->{'contents'}->[-1]->{'type'}
               and $current->{'contents'}->[-1]->{'type'} eq 'menu_star') {
        print STDERR "MENU ENTRY (certainly)\n" if ($self->{'debug'});
        # this is the menu star collected previously
        pop @{$current->{'contents'}};
        $line =~ s/^(\s+)//;
        my $leading_text = '*' . $1;
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
      # * followed by something else than a space.
      } elsif ($current->{'contents'} and @{$current->{'contents'}} 
               and $current->{'contents'}->[-1]->{'type'}
               and $current->{'contents'}->[-1]->{'type'} eq 'menu_star') {
        print STDERR "ABORT MENU STAR ($line)\n" if ($self->{'debug'});
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
          print STDERR "MENU NODE no entry $separator\n" if ($self->{'debug'});
          # it was previously registered as menu_entry_name, it is 
          # changed to node
          $current->{'args'}->[-2]->{'type'} = 'menu_entry_node';
          push @{$current->{'args'}}, { 'type' => 'menu_entry_description',
                                        'contents' => [],
                                        'parent' => $current };
          $current = $current->{'args'}->[-1];
        # end of the menu entry name  
        } elsif ($separator =~ /^:/) {
          print STDERR "MENU ENTRY $separator\n" if ($self->{'debug'});
          push @{$current->{'args'}}, { 'type' => 'menu_entry_node',
                                        'contents' => [],
                                        'parent' => $current };
          $current = $current->{'args'}->[-1];
        # anything else is the end of the menu node following a menu_entry_name
        } else {
          print STDERR "MENU NODE $separator\n" if ($self->{'debug'});
          push @{$current->{'args'}}, { 'type' => 'menu_entry_description',
                                        'contents' => [],
                                        'parent' => $current };
          $current = $current->{'args'}->[-1];
        }
        # REMACRO
      } elsif ($line =~ s/^\@(["'~\@\}\{,\.!\?\s\*\-\^`=:\|\/\\])//o 
               or $line =~ s/^\@([[:alnum:]][[:alnum:]-]*)//o) {
        my $command = $1;
        $command = $self->{'aliases'}->{$command} 
           if (exists($self->{'aliases'}->{$command}));
        print STDERR "COMMAND $command\n" if ($self->{'debug'});

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
          next;
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

        if (not _abort_empty_line ($self, $current) 
               and $begin_line_commands{$command}) {
          _line_warn($self, sprintf($self->__("\@%s should only appear at a line beginning"), 
                                     $command), $line_nr);
        }

        if ($command eq 'end') {
          # REMACRO
          if ($line =~ s/^\s+([[:alnum:]][[:alnum:]-]*)//) {
            my $end_command = $1;
            if (!exists $block_commands{$end_command}) {
              _line_warn ($self, 
                sprintf($self->__("Unknown \@end %s"), $end_command), $line_nr);
              $current = _merge_text ($self, $current, "\@end $end_command");
              last;
            }
            print STDERR "END BLOCK $end_command\n" if ($self->{'debug'});
            if ($block_commands{$end_command} eq 'conditional') {
              if (@{$self->{'conditionals_stack'}} 
                  and $self->{'conditionals_stack'}->[-1] eq $end_command) {
                pop @{$self->{'conditionals_stack'}};
                # Ignore until end of line
                if ($line !~ /\n/) {
                  ($line, $line_nr) = _new_line($self, $line_nr);
                }
              } else {
                _line_error ($self, 
                  sprintf($self->__("Unmatched `%c%s'"), 
                       ord('@'), 'end'), $line_nr);
              }
              last;
            }
            $current = _end_block_command($self, $current, $line_nr,
                                                $end_command);
          }
          $line = _start_empty_line_after_command($line, $current);
          next;
        }
        # special case with @ followed by a newline protecting end of lines
        # in @def*
        last if ($self->{'context_stack'}->[-1] eq 'def' and $command eq "\n");

        unless ($self->{'no_paragraph_commands'}->{$command}) {
          my $paragraph = _begin_paragraph($self, $current);
          $current = $paragraph if ($paragraph);
        }

        if ($close_paragraph_commands{$command}) {
          $current = _end_paragraph($self, $current, $line_nr);
        }

        # commands without braces and not block commands, ie no @end
        if (defined($self->{'misc_commands'}->{$command})) {
          if ($root_commands{$command}) {
            $current = _end_block_command($self, $current, $line_nr);
          }

          # noarg skipline skipspace line lineraw /^\d$/
          my $arg_spec = $self->{'misc_commands'}->{$command};

          if ($arg_spec eq 'noarg') {
            push @{$current->{'contents'}}, {'cmdname' => $command,
                                             'parent' => $current};
          # all the cases using the raw line
          } elsif ($arg_spec eq 'skipline' or $arg_spec eq 'lineraw'
                   or $arg_spec eq 'special') {
            # complete the line if there was a user macro expansion
            if ($line !~ /\n/) {
              my ($new_line, $new_line_nr) = _new_line($self, $line_nr);
              $line .= $new_line if (defined($new_line));
            }
            push @{$current->{'contents'}}, {'cmdname' => $command,
                                             'parent' => $current};
            my $args = [];
            if ($arg_spec eq 'lineraw') {
              $args = [ $line ];
            } elsif ($arg_spec eq 'special') {
              $args 
                = $self->_parse_special_misc_command($line, $command, $line_nr);
              $current->{'contents'}->[-1]->{'special'}->{'arg_line'} = $line;
            }
            foreach my $arg (@$args) {
              push @{$current->{'contents'}->[-1]->{'args'}},
                { 'type' => 'misc_arg', 'text' => $arg, 
                  'parent' => $current->{'contents'}->[-1] };
            }
            my $included_file;
            ($current, $included_file) = 
              _end_line_and_include_file ($self, $current, $line_nr);
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
                  $line_arg = 1;
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
                                                  'parent' => $row,
                                                  'contents' => [] };
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
                                                  'parent' => $row,
                                                  'contents' => [] };
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
              # def*x
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
            }
            # a container for what is on the @-command line, considered to
            # be the @-command argument
            if ($line_arg) {
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
            $line = _start_empty_line_after_command($line, $current);
          }
        # @-command with matching @end
        } elsif (exists($block_commands{$command})) {
          if ($command eq 'macro' or $command eq 'rmacro') {
            my $macro = _parse_macro_command ($self, $command, $line, 
                                 $current, $line_nr);
            push @{$current->{'contents'}}, $macro;
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
                print STDERR "CONDITIONAL \@$command $name: $ifvalue_true\n" if ($self->{'debug'});
              } else {
                _line_error ($self, sprintf($self->__("%c%s requires a name"), ord('@'), $command), $line_nr);
              }
            } elsif ($command =~ /^ifnot(.*)/) {
              $ifvalue_true = 1 if !($self->{'expanded_formats_hash'}->{$1});
              print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n" if ($self->{'debug'});
            } else {
              die unless ($command =~ /^if(.*)/);
              $ifvalue_true = 1 if ($self->{'expanded_formats_hash'}->{$1});
              print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n" if ($self->{'debug'});
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
            # a menu command closes a menu_comment, but not the other
            # block commands. This won't catch menu commands buried in 
            # other formats (that are incorrect anyway).
            if ($menu_commands{$command} and $current->{'type'} 
                   and $current->{'type'} eq 'menu_comment') {
              $current = $current->{'parent'};
              # don't keep empty menu_comment
              if (!@{$current->{'contents'}->[-1]->{'contents'}}) {
                pop @{$current->{'contents'}};
              }
            }
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
            if ($block_arg_commands{$command}) {
              $current->{'args'} = [ {
                 'type' => 'block_line_arg',
                 'contents' => [],
                 'parent' => $current } ];
              
              $current->{'remaining_args'} = $block_commands{$command} -1 
                if ($block_commands{$command} =~ /^\d+$/);
              $current = $current->{'args'}->[-1];
            } else {
              push @{$self->{'context_stack'}}, 'preformatted' 
                if ($preformatted_commands{$command});
              if ($menu_commands{$command}) {
                push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                                 'parent' => $current,
                                                 'contents' => [] };
                push @{$self->{'context_stack'}}, 'menu';
                $current = $current->{'contents'}->[-1];
                print STDERR "MENU_COMMENT OPEN\n" if ($self->{'debug'});
              }
              
            }
            $line = _start_empty_line_after_command($line, $current);
          }
        } elsif (defined($brace_commands{$command})
               or defined($self->{'definfoenclose'}->{$command})) {
          
            push @{$current->{'contents'}}, { 'cmdname' => $command, 
                                              'parent' => $current, 
                                              'contents' => [] };
            $current = $current->{'contents'}->[-1];
            if ($command eq 'click') {
              $current->{'special'}->{'clickstyle'} = $self->{'clickstyle'};
            }
            if ($self->{'definfoenclose'}->{$command}) {
              $current->{'type'} = 'definfoenclose_command';
              $current->{'special'} = { 
                   'begin' => $self->{'definfoenclose'}->{$command}->[0], 
                   'end' => $self->{'definfoenclose'}->{$command}->[1] };
          }
        } elsif ($no_brace_commands{$command}) {
          push @{$current->{'contents'}},
                 { 'cmdname' => $command, 'parent' => $current };
          # FIXME generalize?
          if ($command eq '\\' and $self->{'context_stack'}->[-1] ne 'math') {
            _line_warn  ($self, sprintf($self->__("\@%s should only appear in math context"), 
                                        $command), $line_nr);
          }
          if ($command eq "\n") {
            my $included_file;
            ($current, $included_file) = 
              _end_line_and_include_file ($self, $current, $line_nr);
            last;
          }
        } else {
          _line_error ($self, sprintf($self->__("Unknown command `%s'"), 
                                                      $command), $line_nr);
        }

      } elsif ($line =~ s/^([{}@,:\t.])//) {
        my $separator = $1;
        print STDERR "SEPARATOR: $separator\n" if ($self->{'debug'});
        if ($separator eq '@') {
          _line_error ($self, $self->__("Unexpected \@"), $line_nr);
        } elsif ($separator eq '{') {
          _abort_empty_line ($self, $current);
          if ($current->{'cmdname'} 
               and (defined($brace_commands{$current->{'cmdname'}})
                     or $self->{'definfoenclose'}->{$current->{'cmdname'}})) {
            my $command = $current->{'cmdname'};
            $current->{'args'} = [ { 'parent' => $current,
                                   'contents' => [] } ];
            $current->{'remaining_args'} = $brace_commands{$command} -1
                                             if ($brace_commands{$command});
            if ($self->{'definfoenclose'}->{$command}) {
              $current->{'remaining_args'} = 0;
            }
            $current = $current->{'args'}->[-1];
            if ($context_brace_commands{$command}) {
              push @{$self->{'context_stack'}}, $current->{'parent'}->{'cmdname'};
              $line =~ s/([^\S\n]*)//;
              push @{$current->{'contents'}}, { 'type' => 'empty_line', 
                                        'text' => $1,
                                        'parent' => $current };
            } else {
              $current->{'type'} = 'brace_command_arg';
              push @{$current->{'contents'}}, 
                 {'type' => 'empty_spaces_before_argument',
                  'text' => '' } 
                      if ($brace_commands{$current->{'parent'}->{'cmdname'}}
                           and $brace_commands{$current->{'parent'}->{'cmdname'}} > 1);
            }
            print STDERR "OPENED \@$current->{'parent'}->{'cmdname'}, remaining: $current->{'parent'}->{'remaining_args'}, "
              .($current->{'type'} ? "type: $current->{'type'}" : '')."\n"
               if ($self->{'debug'});
          } elsif (($current->{'parent'} 
                    and (($current->{'parent'}->{'cmdname'}
                          and $current->{'parent'}->{'cmdname'} eq 'multitable')
                         or ($current->{'parent'}->{'type'} 
                             and $current->{'parent'}->{'type'} eq 'def_line')))
                   or $self->{'context_stack'}->[-1] eq 'math') {
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
             # for math
             if ($context_brace_commands{$current->{'parent'}->{'cmdname'}}) {
               pop @{$self->{'context_stack'}};
             }
             # first is the arg.
             $self->_isolate_last_space($current) 
               if ($brace_commands{$current->{'parent'}->{'cmdname'}} 
                   and $brace_commands{$current->{'parent'}->{'cmdname'}} > 1);
             print STDERR "CLOSING \@$current->{'parent'}->{'cmdname'}\n" if ($self->{'debug'});
             $current = $current->{'parent'}->{'parent'};
          # footnote caption closing, when there is a paragraph inside.
          } elsif ($context_brace_commands{$self->{'context_stack'}->[-1]}) {
             # closing the context under broader situations
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
          _abort_empty_line ($self, $current);
          $self->_isolate_last_space($current);
          my $type = $current->{'type'};
          $current = $current->{'parent'};
          $current->{'remaining_args'}--;
          push @{$current->{'args'}},
               { 'type' => $type, 'parent' => $current, 'contents' => [] };
          $current = $current->{'args'}->[-1];
          push @{$current->{'contents'}}, 
                 {'type' => 'empty_spaces_before_argument',
                  'text' => '' };                          
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
        if ($self->{'debug'}) {
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
            _end_line_and_include_file ($self, $current, $line_nr);
        last;
      }
    }
  }
  while (@{$self->{'conditionals_stack'}}) { 
    my $end_conditional = pop @{$self->{'conditionals_stack'}};
    _line_error ($self, sprintf($self->__("Expected \@end %s"), $end_conditional), $line_nr);
  }
  $current = _end_block_command($self, $current, $line_nr);
  return $root;
}

# expand a tree to the corresponding texinfo.
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
      $result .= '@end '.$root->{'cmdname'};
    }
  }
  #print STDERR "tree_to_texi result: $result\n";
  return $result;
}

# expand a command argument as texinfo.
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
        $result .= $arg_expanded;
    }
  } elsif (($cmd->{'special'} or $cmdname eq 'macro' or $cmdname eq 'rmacro') 
           and defined($cmd->{'special'}->{'arg_line'})) {
    $result .= $cmd->{'special'}->{'arg_line'};
  } elsif (($block_commands{$cmdname} or $cmdname eq 'node')
            and defined($cmd->{'args'})) {
    die "bad args type (".ref($cmd->{'args'}).") $cmd->{'args'}\n"
      if (ref($cmd->{'args'}) ne 'ARRAY');
    foreach my $arg (@{$cmd->{'args'}}) {
       $result .= tree_to_texi ($arg) . ',';
    }
    $result =~ s/,$//;
  } elsif (defined($cmd->{'args'})) {
    my $braces;
    $braces = 1 if (($cmd->{'args'}->[0]->{'type'} 
                    and $cmd->{'args'}->[0]->{'type'} eq 'brace_command_arg')
                    or ($context_brace_commands{$cmdname}));
    $result .= '{' if ($braces);
    if ($cmdname eq 'verb') {
      $result .= $cmd->{'type'};
    }
    if ($cmd->{'special'} and exists ($cmd->{'special'}->{'spaces'})) {
       $result .= $cmd->{'special'}->{'spaces'};
    }
    #print STDERR "".Data::Dumper->Dump([$cmd]);
    my $arg_nr = 0;
    foreach my $arg (@{$cmd->{'args'}}) {
      if (exists($brace_commands{$cmdname}) or ($cmd->{'type'} 
                    and $cmd->{'type'} eq 'definfoenclose_command')) {
        $result .= ',' if ($arg_nr);
        $arg_nr++;
      }
      $result .= tree_to_texi ($arg);
    }
    if ($cmdname eq 'verb') {
      $result .= $cmd->{'type'};
    }
    #die "Shouldn't have args: $cmdname\n";
    $result .= '}' if ($braces);
  }
  if ($misc_commands{$cmdname}
      and $misc_commands{$cmdname} eq 'skipline') {
    $result .="\n";
  }
  $result .= '{'.$cmd->{'type'}.'}' if ($cmdname eq 'value');
  #print STDERR "Result: $result\n";
  return $result;
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
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'clear') {
    # REVALUE
    if ($line =~ /^\s+([\w\-]+)/) {
      $args = [$1];
      delete $self->{'values'}->{$1};
    } else {
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'unmacro') {
    # REMACRO
    if ($line =~ /^\s+([[:alnum:]][[:alnum:]\-]*)/) {
      $args = [$1];
      delete $self->{'macros'}->{$1};
      print STDERR "UNMACRO $1\n" if ($self->{'debug'});
    } else {
      _line_error ($self, sprintf($self->
                    __("%c%s requires a name"), ord('@'), $command), $line_nr);
    }
  } elsif ($command eq 'clickstyle') {
    # REMACRO
    if ($line =~ /^\s+@([[:alnum:]][[:alnum:]\-]*)({})?\s*/) {
      $args = ['@'.$1];
      $self->{'clickstyle'} = $1;
      my $remaining = $line;
      $remaining =~ s/^\s+@([[:alnum:]][[:alnum:]\-]*)({})?\s*//;
      _line_warn ($self, sprintf($self->__("Remaining argument on \@%s line: %s"), $command, $remaining), $line_nr) if ($remaining);
    } else {
      _line_error ($self, sprintf($self->__("\@%s should only accept a \@-command as argument, not `%s'"), $command, $line), $line_nr);
    }
  } else {
    die "Unknown special command $command\n";
  }
  return ($args);
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

  if ($self->{'debug'}) {
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
  shift @contents 
    if ($contents[0] and $contents[0]->{'type'}
       and ($contents[0]->{'type'} eq 'empty_line_after_command'
            or $contents[0]->{'type'} eq 'empty_spaces_after_command'));

  if (@contents and $contents[-1]->{'cmdname'} 
      and ($contents[-1]->{'cmdname'} eq 'c' 
           or $contents[-1]->{'cmdname'} eq 'comment')) {
    pop @contents;
  }
  if (@contents and $contents[-1]->{'type'} 
      and $contents[-1]->{'type'} eq 'spaces_at_end') {
    pop @contents;
  }
  
  if (! @contents) {
    _line_error ($self, sprintf($self->__("\@%s missing argument"), 
       $command), $line_nr);
    return undef;
  }

  if (@contents > 1
         or (!defined($contents[0]->{'text'}))) {
    _line_error ($self, sprintf($self->__("Superfluous argument to \@%s"),
       $command), $line_nr);
  }
  return undef if (!defined($contents[0]->{'text'}));
  
  my $line = $contents[0]->{'text'};  

  if ($command eq 'alias') {
    # REMACRO
    if ($line =~ s/^([[:alnum:]][[:alnum:]-]*)(\s*=\s*)([[:alnum:]][[:alnum:]-]*)$//) {
      $self->{'aliases'}->{$1} = $3;
      $args = [$1, $3];
    } else {
      _line_error ($self, sprintf($self->
                             __("Bad argument to \@%s"), $command), $line_nr);
    }

  } elsif ($command eq 'definfoenclose') {
    # REMACRO
    if ($line =~ s/^([[:alnum:]][[:alnum:]\-]*)\s*,\s*([^\s,]+)\s*,\s*([^\s,]+)$//) {
      $args = [$1, $2, $3 ];
      $self->{'definfoenclose'}->{$1} = [ $2, $3 ];
      print STDERR "DEFINFOENCLOSE \@$1: $2, $3\n" if ($self->{'debug'});
    } else {
      _line_error ($self, sprintf($self->
                              __("Bad argument to \@%s"), $command), $line_nr);
    }
  } elsif ($command eq 'columnfractions') {
    my @possible_fractions = split (/\s+/, $line);
    if (!@possible_fractions) {
      _line_error ($self, sprintf($self->__("Empty \@%s"), $command), 
                             $line_nr);
    } else {
      foreach my $fraction (@possible_fractions) {
        if ($fraction =~ /^(\d*\.\d+)|(\d+)\.?$/) {
          push @$args, $fraction;
        } else {
          _line_error ($self, sprintf($self->
                              __("column fraction not a number: %s"),
                              $fraction), $line_nr);
        }
      }
    }
  } elsif ($command eq 'sp') {
    if ($line =~ /^([0-9]+)$/) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@sp arg must be numeric, not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'defindex' || $command eq 'defcodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      if ($forbidden_index_name{$name}) {
        _line_error($self, sprintf($self->
                                __("Reserved index name %s"),$name), $line_nr);
      } else {
        $args = [$name];
        $self->{'misc_commands'}->{$name.'index'} = 'line';
        $self->{'no_paragraph_commands'}->{$name.'index'} = 1;
      }
    } else {
      _line_error ($self, sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'synindex' || $command eq 'syncodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)\s+([[:alnum:]][[:alnum:]\-]*)$/) {
      my $index_from = $1;
      my $index_to = $2;
      _line_error ($self, sprintf($self->__("Unknown from index `%s' in \@%s"), $index_from, $command), $line_nr)
        unless $self->{'misc_commands'}->{$index_from.'index'};
      _line_error ($self, sprintf($self->__("Unknown to index name `%s' in \@%s"), $index_to, $command), $line_nr)
        unless $self->{'misc_commands'}->{$index_to.'index'};
      if ($self->{'misc_commands'}->{$index_from.'index'} 
           and $self->{'misc_commands'}->{$index_to.'index'}) {
        $args = [$index_from, $index_to];
      }
    } else {
      _line_error ($self, sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'printindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      $args = [$name];
    } else {
      _line_error ($self, sprintf($self->
                   __("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif (grep {$_ eq $command} ('everyheadingmarks', 'everyfootingmarks',
                                  'evenheadingmarks', 'oddheadingmarks',
                                  'evenfootingmarks', 'oddfootingmarks')) {
    if (($line =~ /^(top)$/) or ($line =~ /^(bottom)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@%s arg must be `top' or `bottom', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'fonttextsize') {
    if (($line =~ /^(10)$/) or ($line =~ /^(11)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("Only \@%s 10 or 11 is supported, not `%s'"),$command, $line), $line_nr);
    }
  } elsif ($command eq 'footnotestyle') {
    if ($line =~ /^([a-z]+)$/ and ($1 eq 'separate' or $1 eq 'end')) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@%s arg must be `separate' or `end', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'setchapternewpage') {
    if (($line =~ /^(on)$/) or ($line =~ /^(off)$/)
       or ($line =~ /^(odd)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@%s arg must be `on', `off' or `odd', not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'need') { # only a warning
    if (($line =~ /^([0-9]+(\.[0-9]*)?)$/) or
             ($line =~ /^(\.[0-9]+)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'paragraphindent') {
    if ($line =~ /^([\w\-]+)$/) {
      my $value = $1;
      if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis') {
        $args = [$1];
      } else {
        _line_error ($self, sprintf($self->__("\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"), $value), $line_nr);
      } 
    } else {
      _line_error ($self, sprintf($self->__("\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'firstparagraphindent') {
    if (($line =~ /^(none)$/) or ($line =~ /^(insert)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@firstparagraphindent arg must be `none' or `insert', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'exampleindent') {
    if ($line =~ /^([0-9]+)/) {
      $args = [$1];
    } elsif ($line =~ /^(asis)$/) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@exampleindent arg must be numeric/`asis', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'frenchspacing') {
    if (($line =~ /^(on)$/) or ($line =~ /^(off)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("Expected \@%s on or off, not `%s'"), $command, $line), $line_nr);
    }
  } elsif ($command eq 'kbdinputstyle') {
    if ($line =~ /^([a-z]+)$/ and ($1 eq 'code' or $1 eq 'example' or $1 eq 'distinct')) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@kbdinputstyle arg must be `code'/`example'/`distinct', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'allowcodebreaks') {
    if (($line =~ /^(true)$/) or ($line =~ /^(false)$/)) {
      $args = [$1];
    } else {
      _line_error ($self, sprintf($self->__("\@allowcodebreaks arg must be `true' or `false', not `%s'"), $line), $line_nr);
    }
  } elsif ($command eq 'headings') {
    my $valid_arg = 0;
    foreach my $possible_arg ('off','on','single','double',
                               'singleafter','doubleafter') {
      if ($line =~ /^($possible_arg)$/) {
        $args = [$1];
        $valid_arg = 1;
        last;
      }
    }
    unless ($valid_arg) {
      _line_error ($self, sprintf($self->__("Bad argument to \@%s: %s"), $command, $line), $line_nr);
    }
  }
  return $args;
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
