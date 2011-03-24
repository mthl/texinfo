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
    $converter->{$key} = $defaults{$key};
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
      $converter->{'setcontentsaftertitlepage'} = 1 
         if ($converter->{'extra'}->{'contents'} 
               and $converter->{'extra'}->{'setcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      $converter->{'setshortcontentsaftertitlepage'} = 1 
         if (($converter->{'extra'}->{'shortcontents'} 
              or $converter->{'extra'}->{'summarycontents'})
               and $converter->{'extra'}->{'setshortcontentsaftertitlepage'}
               and $converter->{'structuring'}
               and $converter->{'structuring'}->{'sectioning_root'});
      $converter->{'gettext'} = $converter->{'parser'}->{'gettext'};
      foreach my $global_command ($converter->_global_commands()) {
        if (defined($converter->{'extra'}->{$global_command})) {
          my $root = $converter->{'extra'}->{$global_command};
          #if (ref($root) eq 'ARRAY') {
          #  $root = $converter->{'extra'}->{$global_command}->[0];
          #}
          if (ref($root) ne 'ARRAY') {
            $converter->_informative_command($root);
          }
        }
      }
      delete $conf->{'parser'};
    }
    foreach my $key (keys(%$conf)) {
      if (!exists($defaults{$key})) {
        # many things may be passed down
        #warn "$key not a possible configuration in $name\n";
      } else {
        $converter->{$key} = $conf->{$key};
        $converter->{'set'}->{$key} = 1;
      }
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

sub _unset_global_multiple_commands($)
{
  my $converter = shift;

  foreach my $global_command ($converter->_global_commands()) {
    if (defined($converter->{'extra'}->{$global_command})
        and ref($converter->{'extra'}->{$global_command}) eq 'ARRAY') {
      my $root = $converter->{'extra'}->{$global_command}->[0];
      next if ($converter->{'set'}->{$root->{'cmdname'}} 
               or !exists($defaults{$root->{'cmdname'}}));
      $converter->{$root->{'cmdname'}} = $defaults{$root->{'cmdname'}};
    }
  }
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

  # determine output file and output file name
  if (!defined($self->{'OUTFILE'})) {
    if (defined($setfilename)) {
      $self->{'OUTFILE'} = $setfilename;
      if (!$self->{'USE_SETFILENAME_EXTENSION'}) {
        $self->{'OUTFILE'} =~ s/\.[^\.]*$//;
        $self->{'OUTFILE'} .= '.'.$self->{'EXTENSION'} 
          if (defined($self->{'EXTENSION'}) and $self->{'EXTENSION'} ne '');
      }
    } elsif ($input_basename ne '') {
      $self->{'OUTFILE'} = $input_basename;
      $self->{'OUTFILE'} =~ s/\.te?x(i|info)?$//;
      $self->{'OUTFILE'} .= '.'.$self->{'EXTENSION'} 
        if (defined($self->{'EXTENSION'}) and $self->{'EXTENSION'} ne '');
    } else {
      $self->{'OUTFILE'} = '';
    }
    if (defined($self->{'SUBDIR'}) and $self->{'OUTFILE'} ne '') {
      $self->{'OUTFILE'} = "$self->{'SUBDIR'}/$self->{'OUTFILE'}";
    }
  }

  my $output_basename = $self->{'OUTFILE'};
  # this is a case that should happen rarely: one wants to get 
  # the result in a string and there is a setfilename.
  if ($self->{'OUTFILE'} eq '' and defined($setfilename)) {
    $output_basename = $setfilename;
  }
  $output_basename =~ s/^.*\///;
  $self->{'output_filename'} = $output_basename;
  my $output_dir = $self->{'OUTFILE'};
  $output_dir =~ s|[^/]*$||;
  if ($output_dir ne '') {
    $self->{'output_dir'} = $output_dir;
  }
}

1;
