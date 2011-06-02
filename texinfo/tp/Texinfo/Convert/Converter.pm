# Converter.pm: Common code for Converters.
#
# Copyright 2011 Free Software Foundation, Inc.
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

package Texinfo::Convert::Converter;

use 5.00405;
use strict;

use Texinfo::Report;
use Texinfo::Common;

use vars qw(@ISA);
@ISA = qw(Texinfo::Report);

my %defaults = (
  'frenchspacing'        => 'off',
  'paragraphindent'      => 3,
  'firstparagraphindent' => 'none',
  'ENABLE_ENCODING'      => 1,
  'footnotestyle'        => 'end',
  'fillcolumn'           => 72,
#  'perl_encoding'        => 'ascii',
#  'encoding_name'      => 'us-ascii',
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'documentlanguage'     => undef,
  'NUMBER_FOOTNOTES'     => 1,
  'SPLIT_SIZE'           => 300000,
  'expanded_formats'     => undef,
  'include_directories'  => undef,
  'NUMBER_SECTIONS'      => 1,
  'output_format'        => undef,

  'DEBUG'                => 0,
  'TEST'                 => 0,
);

sub _defaults($)
{
  return %defaults;
}

sub _initialize($)
{
}

sub _global_commands($)
{
  return ();
}

sub _initialize_global_command($$$)
{
}

sub converter(;$)
{
  my $class = shift;
  my $converter = { 'set' => {} };

  my $conf;
  my $name = 'converter';

  if (ref($class) eq 'HASH') {
    $conf = $class;
    bless $converter;
  } elsif (defined($class)) {
    bless $converter, $class;
    $name = ref($class);
    $conf = shift;
  } else {
    bless $converter;
    $conf = shift;
    $name = ref($converter);
  }
  my %defaults = $converter->_defaults();
  foreach my $key (keys(%defaults)) {
    if (Texinfo::Common::valid_option($key)) {
      $converter->{'conf'}->{$key} = $defaults{$key};
    } else {
      $converter->{$key} = $defaults{$key};
    }
  }
  if (defined($conf)) {
    if ($conf->{'parser'}) {
      $converter->{'parser'} = $conf->{'parser'};
      $converter->{'extra'} 
         = $converter->{'parser'}->global_commands_information();
      $converter->{'info'} = $converter->{'parser'}->global_informations();
      if ($converter->{'info'} and $converter->{'info'}->{'perl_encoding'}) {
        $converter->{'perl_encoding'} = $converter->{'info'}->{'perl_encoding'};
        $converter->{'encoding_name'} = $converter->{'info'}->{'encoding_name'};
      }
      my $floats = $converter->{'parser'}->floats_information();
      my $labels = $converter->{'parser'}->labels_information();
      $converter->{'structuring'} = $converter->{'parser'}->{'structuring'};

      $converter->{'floats'} = $floats if ($floats);
      $converter->{'labels'} = $labels if ($labels);
      foreach my $global_command ($converter->_global_commands()) {
        if (defined($converter->{'extra'}->{$global_command})) {
          my $root = $converter->{'extra'}->{$global_command};
          #if (ref($root) eq 'ARRAY') {
          #  $root = $converter->{'extra'}->{$global_command}->[0];
          #}
          #if (ref($root) ne 'ARRAY') {
          #$converter->_informative_command($root);
          $converter->_initialize_global_command($global_command, $root);
          #}
        }
      }
      $converter->set_conf('setcontentsaftertitlepage', 1)
         if ($converter->get_conf('contents')
               and $converter->{'extra'}->{'setcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      $converter->set_conf('setshortcontentsaftertitlepage', 1)
         if ($converter->get_conf('shortcontents') 
               and $converter->{'extra'}->{'setshortcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      $converter->{'gettext'} = $converter->{'parser'}->{'gettext'};
      delete $conf->{'parser'};
    }
    foreach my $key (keys(%$conf)) {
      if (Texinfo::Common::valid_option($key)) {
        $converter->{'conf'}->{$key} = $conf->{$key};
      } elsif (!exists($defaults{$key})) {
        warn "$key not a possible configuration in $name\n";
      } else {
        $converter->{$key} = $conf->{$key};
      }
      $converter->{'set'}->{$key} = 1;
    }
  }
  if (!defined($converter->{'expanded_formats'})) {
    if ($converter->{'parser'}) {
      $converter->{'expanded_formats'} = $converter->{'parser'}->{'expanded_formats'};
    } else {
      $converter->{'expanded_formats'} = [];
    }
  }
  if (!defined($converter->{'include_directories'})) {
    if ($converter->{'parser'}) {
      $converter->{'include_directories'} = $converter->{'parser'}->{'include_directories'};
    } else {
      $converter->{'include_directories'} = [ '.' ];
    }
  }

  # turn the array to a hash for speed.  Not sure it really matters for such
  # a small array.
  foreach my $expanded_format(@{$converter->{'expanded_formats'}}) {
    $converter->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }

  $converter->_initialize();

  $converter->Texinfo::Report::new();

  return $converter;
}

sub _set_global_multiple_commands($;$)
{
  my $self = shift;
  my $multiple_commands_index = shift;
  # FIXME 0 (first) or -1 (last)?
  $multiple_commands_index = 0 if (!defined($multiple_commands_index));

  foreach my $global_command ($self->_global_commands()) {
    if (defined($self->{'extra'}->{$global_command})
        and ref($self->{'extra'}->{$global_command}) eq 'ARRAY') {
      my $root = $self->{'extra'}->{$global_command}->[$multiple_commands_index];
      if ($self->get_conf('DEBUG')) {
        print STDERR "SET_global_multiple_commands($multiple_commands_index) $global_command\n";
      }
      $self->_informative_command($root);
    }
  }
}

# Notice that set_conf is used, which means that it is not possible to
# customize what is done for those commands.
sub _unset_global_multiple_commands($)
{
  my $self = shift;

  foreach my $global_command ($self->_global_commands()) {
    if (defined($self->{'extra'}->{$global_command})
        and ref($self->{'extra'}->{$global_command}) eq 'ARRAY') {
      next if (!exists($defaults{$global_command}));
      if (Texinfo::Common::valid_option($global_command)) {
        if ($self->get_conf('DEBUG')) {
          my $default = 'UNDEF';
          $default = $defaults{$global_command} if (defined($defaults{$global_command}));
          print STDERR "UNSET_global_multiple_commands $global_command: $default\n";
        }
        $self->set_conf($global_command, $defaults{$global_command});
      } else {
        $self->{$global_command} = $defaults{$global_command};
      }
    }
  }
}

sub get_conf($$)
{
  my $self = shift;
  my $conf = shift;
  if (!Texinfo::Common::valid_option($conf)) {
    warn "BUG: unknown option $conf\n";
    return undef;
  }
  return $self->{'conf'}->{$conf};
}

sub set_conf($$$)
{
  my $self = shift;
  my $conf = shift;
  my $value = shift;
  if (!Texinfo::Common::valid_option($conf)) {
    warn "BUG: unknown option $conf\n";
    return undef;
  }
  if ($self->{'set'}->{$conf}) {
    return 0;
  } else {
    $self->{'conf'}->{$conf} = $value;
    return 1;
  }
}

sub force_conf($$$)
{
  my $self = shift;
  my $conf = shift; 
  my $value = shift;
  if (!Texinfo::Common::valid_option($conf)) {
    warn "BUG: unknown option $conf\n";
    return undef;
  }
  $self->{'conf'}->{$conf} = $value;
  return 1;
}

my $STDIN_DOCU_NAME = 'stdin';

# This is especially useful for unsplit manuals
sub _set_outfile($$$)
{
  my $self = shift;

  # determine input file base name
  my $input_basename;
  if (defined($self->{'info'}->{'input_file_name'})) {
    $input_basename = $self->{'info'}->{'input_file_name'};
  } else {
    # This could happen if called on a piece of texinfo
    $input_basename = '';
  }
  $input_basename =~ s/^.*\///;
  $self->{'input_basename'} = $input_basename;
  $input_basename = $STDIN_DOCU_NAME if ($input_basename eq '-');

  my $setfilename;
  $setfilename = $self->{'extra'}->{'setfilename'}->{'extra'}->{'text_arg'}
    if ($self->{'extra'} and $self->{'extra'}->{'setfilename'}
        and $self->{'extra'}->{'setfilename'}->{'extra'}
        and defined($self->{'extra'}->{'setfilename'}->{'extra'}->{'text_arg'}));

  my $document_name;
  # determine output file and output file name
  my $outfile;
  if (!defined($self->get_conf('OUTFILE'))) {
    if (defined($setfilename) and !$self->get_conf('NO_USE_SETFILENAME')) {
      $outfile = $setfilename;
      if (!$self->get_conf('USE_SETFILENAME_EXTENSION')) {
        $outfile =~ s/\.[^\.]*$//;
        $document_name = $outfile;
        $outfile .= '.'.$self->get_conf('EXTENSION') 
          if (defined($self->get_conf('EXTENSION')) 
              and $self->get_conf('EXTENSION') ne '');
      } else {
        $document_name = $outfile;
      }
    } elsif ($input_basename ne '') {
      $outfile = $input_basename;
      $outfile =~ s/\.te?x(i|info)?$//;
      $document_name = $outfile;
      $outfile .= '.'.$self->get_conf('EXTENSION') 
        if (defined($self->get_conf('EXTENSION')) 
            and $self->get_conf('EXTENSION') ne '');
    } else {
      $outfile = '';
      $document_name = $outfile;
    }
    if (defined($self->get_conf('SUBDIR')) and $outfile ne '') {
      $outfile = $self->get_conf('SUBDIR')."/$outfile";
    }
    $self->set_conf('OUTFILE', $outfile);
  } else {
    $document_name = $self->get_conf('OUTFILE');
    # FIXME use a different configuration variable?
    if (!$self->get_conf('USE_SETFILENAME_EXTENSION')) {
      $document_name =~ s/\.[^\.]*$//;
    }
  }

  my $output_basename = $self->get_conf('OUTFILE');
  # this is a case that should happen rarely: one wants to get 
  # the result in a string and there is a setfilename.
  if ($self->get_conf('OUTFILE') eq '' and defined($setfilename)
      and !$self->get_conf('NO_USE_SETFILENAME')) {
    $output_basename = $setfilename;
    $document_name = $setfilename;
    if (!$self->get_conf('USE_SETFILENAME_EXTENSION')) {
      $document_name =~ s/\.[^\.]*$//;
    }
  }
  # FIXME use a specific configuration variable (TOP_FILE, PREFIX)?
  $document_name =~ s/^.*\///;
  $self->{'document_name'} = $document_name;
  $output_basename =~ s/^.*\///;
  $self->{'output_filename'} = $output_basename;
  my $output_dir = $self->get_conf('OUTFILE');
  $output_dir =~ s|[^/]*$||;
  if ($output_dir ne '') {
    $self->{'destination_directory'} = $output_dir;
  }
}

my @MONTH_NAMES =
    (
     'January', 'February', 'March', 'April', 'May',
     'June', 'July', 'August', 'September', 'October',
     'November', 'December'
    );

# This is not used as code, but used to mark months as strings to be
# translated
if (0) {
  my $self;
  my @mark_month_for_translation = (
   $self->gdt('January'),
   $self->gdt('February'),
   $self->gdt('March'),
   $self->gdt('April'),
   $self->gdt('May'),
   $self->gdt('June'),
   $self->gdt('July'),
   $self->gdt('August'),
   $self->gdt('September'),
   $self->gdt('October'),
   $self->gdt('November'),
   $self->gdt('December')
  );
}

sub expand_verbatiminclude($$)
{
  my $self = shift;
  my $current = shift;

  return unless ($current->{'extra'} and defined($current->{'extra'}->{'text_arg'}));
  my $text = $current->{'extra'}->{'text_arg'};
  my $file = Texinfo::Common::locate_include_file($self, $text);

  my $verbatiminclude;

  if (defined($file)) {
    # FIXME encoding?
    if (!open(VERBINCLUDE, $file)) {
      $self->line_error (sprintf($self->__("Cannot read %s: %s"), $file, $!), 
                          $current->{'line_nr'});
    } else {
      $verbatiminclude = { 'cmdname' => 'verbatim',
                           'parent' => $current->{'parent'},
                           'extra' => 
                        {'text_arg' => $current->{'extra'}->{'text_arg'}} };
      while (<VERBINCLUDE>) {
        push @{$verbatiminclude->{'contents'}}, 
                  {'type' => 'raw', 'text' => $_ };
      }
    }
  } else {
    $self->line_error (sprintf($self->__("\@%s: Cannot find %s"), 
                    $current->{'cmdname'}, $text), $current->{'line_nr'});
  }
  return $verbatiminclude;
}

sub expand_today($)
{
  my $self = shift;
  if ($self->get_conf('TEST')) {
    return {'text' => 'a sunny day'};
  }
  my($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
   = localtime(time);
  $year += ($year < 70) ? 2000 : 1900;
  return $self->gdt('{month} {day}, {year}',
          { 'month' => $self->gdt($MONTH_NAMES[$mon]),
            'day' => $mday, 'year' => $year });
}

sub _create_destination_directory($)
{
  my $self = shift;
  if (defined($self->{'destination_directory'})
      and ! -d $self->{'destination_directory'}) {
    if (!mkdir($self->{'destination_directory'}, oct(755))) {
      $self->document_error(sprintf($self->__(
             "Can't create directories `%s': %s"), 
             $self->{'destination_directory'}, $!));
      return undef;
    }
  }
  return 1;
}

sub xml_protect_text($$)
{
  my $self = shift;
  my $text = shift;
  $text =~ s/&/&amp;/g;
  $text =~ s/</&lt;/g;
  $text =~ s/>/&gt;/g;
  $text =~ s/\"/&quot;/g;
  return $text;

}

# 'today' is not set here.
our %default_xml_commands_formatting; 
$default_xml_commands_formatting{'normal'} = {
               'TeX'          => 'TeX',
               'LaTeX'          => 'LaTeX',
# pertusus: unknown by makeinfo, not in texinfo manual (@* is the right thing)
#               'br', '<br>',     # paragraph break
               'bullet'       => '&bull;',
#               #'copyright' => '(C)',
               'copyright'    => '&copy;',
               'registeredsymbol'   => '&reg;',
               'dots'         => '&hellip;',
               'enddots'      => '...',
               'equiv'        => '&equiv;',
# FIXME i18n
               'error'        => 'error--&gt;',
               'expansion'    => '&rarr;',
               'arrow'        => '&rarr;',
               'click'        => '&rarr;',
               'minus'        => '-',
               'point'        => '&lowast;',
               'print'        => '-|',
               'result'       => '&rArr;',
               'aa'           => '&aring;',
               'AA'           => '&Aring;',
               'ae'           => '&aelig;',
               'oe'           => '&oelig;', #pertusus: also &#156;. &oelig; not in html 3.2
               'AE'           => '&AElig;',
               'OE'           => '&OElig;', #pertusus: also &#140;. &OElig; not in html 3.2
               'o'            =>  '&oslash;',
               'O'            =>  '&Oslash;',
               'ss'           => '&szlig;',
               'DH'           => '&ETH;',
               'dh'           => '&eth;',
               'TH'           => '&THORN;',
               'th'           => '&thorn;',
               'l'            => '&#322;',
               'L'            => '&#321;',
               'exclamdown'   => '&iexcl;',
               'questiondown' => '&iquest;',
               'pounds'       => '&pound;',
               'ordf'         => '&ordf;',
               'ordm'         => '&ordm;',
               'comma'        => ',',
               'euro'         => '&euro;',
               'geq'          => '&ge;',
               'leq'          => '&le;',
               'tie'          => '&nbsp;',
               'textdegree'          => '&deg;',
               'quotedblleft'          => '&ldquo;',
               'quotedblright'          => '&rdquo;',
               'quoteleft'          => '&lsquo;',
               'quoteright'          => '&rsquo;',
               'quotedblbase'          => '&bdquo;',
               'quotesinglbase'          => '&sbquo;',
               'guillemetleft'          => '&laquo;',
               'guillemetright'          => '&raquo;',
               'guillemotleft'          => '&laquo;',
               'guillemotright'          => '&raquo;',
               'guilsinglleft'          => '&lsaquo;',
               'guilsinglright'          => '&rsaquo;',
};

foreach my $text_no_brace_command (keys(%Texinfo::Convert::Text::text_no_brace_commands)) {
  $default_xml_commands_formatting{'normal'}->{$text_no_brace_command}
    = $Texinfo::Convert::Text::text_no_brace_commands{$text_no_brace_command};
}

sub xml_default_comment($$)
{
  my $self = shift;
  my $text = shift;
  $text =~ s/--+/-/go;
  return '<!-- ' . $text . ' -->' . "\n";
}

my %xml_accent_entities = (
          '"',  'uml',
          '~',  'tilde',
          '^',  'circ',
          '`',  'grave',
          "'", 'acute',
          ",", 'cedil',
          'ringaccent', 'ring',
          'ogonek', 'ogon',
         );

my %xml_accent_text_with_entities = (
      'ringaccent' => 'aA',
      "'"          => 'aeiouyAEIOUY',
      ','          => 'cC',
      '^'          => 'aeiouAEIOU',
      '`'          => 'aeiouAEIOU',
      '~'          => 'nNaoAO',
      '"'          => 'aeiouyAEIOU',
# according to http://www2.lib.virginia.edu/small/vhp/download/ISO.txt
# however this doesn't seems to work in firefox
#      'ogonek'     => 'aeiuAEIU',
);


sub xml_accent($$;$)
{
  my $text = shift;
  my $command = shift;
  my $use_numeric_entities = shift;
  my $accent = $command->{'cmdname'};
  
  return "&${text}$xml_accent_entities{$accent};" 
    if (defined($xml_accent_entities{$accent}) 
        and defined($xml_accent_text_with_entities{$accent}) 
        and ($text =~ /^[$xml_accent_text_with_entities{$accent}]$/));
  if ($use_numeric_entities
      and exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}) 
      and exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text})) {
    return '&#' . 
      hex($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text}). ';';
  }
  return $text . '&lt;' if ($accent eq 'v');
  return Texinfo::Convert::Text::ascii_accent($text, $command);
}

sub xml_accent_numeric_entities($$)
{
  my $text = shift;
  my $command = shift;
  return xml_accent($text, $command, 1);
}

sub xml_accents($$)
{ 
  my $self = shift;
  my $accent = shift;
  my $format_accents;
  if ($self->get_conf('USE_NUMERIC_ENTITY')) {
    $format_accents = \&xml_accent_numeric_entities;
  } else {
    $format_accents = \&xml_accent;
  }
  
  if ($self->get_conf('ENABLE_ENCODING')) {
    if ($self->{'encoding_name'} and $self->{'encoding_name'} eq 'utf-8') {
      return Texinfo::Convert::Text::unicode_accents($accent, $format_accents);
    } elsif ($self->{'encoding_name'} 
           and $Texinfo::Common::eight_bit_encoding_aliases{$self->{'encoding_name'}}) {
      return Texinfo::Convert::Text::eight_bit_accents($accent, 
                                      $self->{'encoding_name'}, $format_accents);
    }
  }
  my ($contents, $innermost_accent, $stack)
      = Texinfo::Convert::Text::_find_innermost_accent_contents($accent);
  my $result = $self->_convert({'contents' => $contents});
  
  foreach my $accent_command (reverse(@$stack)) {
    $result = &$format_accents ($result, {'cmdname' => $accent_command});
  }
  return $result;
}

1;
