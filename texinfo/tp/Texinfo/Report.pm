# Report.pm: prepare error messages.
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
  errors
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';


package Texinfo::Report;

use 5.00405;
use strict;

# return the errors and warnings
sub errors ($)
{
  my $self = shift;
  #print STDERR "REPORT ERRORS $self $self->{'errors_warnings'}\n";
  return ($self->{'errors_warnings'}, $self->{'error_nrs'});
}

sub __($$)
{
  my $self = shift;
  return &{$self->{'gettext'}}(@_);
}

sub new($)
{
  my $self = shift;
  $self->{'errors_warnings'} = [];
  #print STDERR "REPORT NEW $self $self->{'errors_warnings'}\n";
  $self->{'errors_nrs'} = 0;
  $self->{'gettext'} = sub {return $_[0];} if (!defined($self->{'gettext'}));
  return $self;
}

# format a line warning
sub line_warn($$$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  return if (!defined($line_number));
  my $file = $line_number->{'file_name'};
  # otherwise out of source build fail since the file names are different
  $file =~ s/^.*\/// if ($self->get_conf('TEST'));
  my $warn_line;
  if ($line_number->{'macro'} ne '') {
    $warn_line = sprintf($self->__(
                             "%s:%d: warning: %s (possibly involving \@%s)\n"),
             $file, $line_number->{'line_nr'}, $text, $line_number->{'macro'});
  } else {
    $warn_line = sprintf($self->__("%s:%d: warning: %s\n"),
                         $file, $line_number->{'line_nr'}, $text);
  }
  warn $warn_line if ($self->get_conf('DEBUG'));
  push @{$self->{'errors_warnings'}},
       { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line,
         %{$line_number} };
}

# format a line error
sub line_error($$$;$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  my $continuation = shift;
  if (defined($line_number)) {
    my $file = $line_number->{'file_name'};
    $file =~ s/^.*\/// if ($self->get_conf('TEST'));
    my $macro_text = '';
    $macro_text = " (possibly involving \@$line_number->{'macro'})"
       if ($line_number->{'macro'} ne '');
    my $error_text = "$file:$line_number->{'line_nr'}: $text$macro_text\n";
    warn "$error_text" if ($self->get_conf('DEBUG'));
    my $type = 'error';
    $type = 'error continuation' if ($continuation);
    push @{$self->{'errors_warnings'}},
         { 'type' => $type, 'text' => $text, 'error_line' => $error_text,
           %{$line_number} };
  }
  $self->{'error_nrs'}++ unless ($continuation);
}

sub document_warn ($$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  my $warn_line = sprintf($self->__("warning: %s\n"), $text);
  push @{$self->{'errors_warnings'}},
    { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line};
}

sub document_error ($$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  $text .= "\n";
  push @{$self->{'errors_warnings'}},
    { 'type' => 'error', 'text' => $text, 'error_line' => $text };
  $self->{'error_nrs'}++;
}

sub file_line_warn($$$;$) {
  my $self = shift;
  my $text = shift;
  chomp($text);
  my $file = shift;
  my $line_nr = shift;

  my $warn_line;
  if (!defined($line_nr)) {
    $warn_line = "$file: $text\n";
  } else {
    $warn_line = "$file:$line_nr: $text\n";
  }
  #print STDERR "REPORT FILE_LINE_WARN $self $self->{'errors_warnings'}\n";
  push @{$self->{'errors_warnings'}},
    { 'type' => 'warning', 'text' => $warn_line, 'error_line' => $warn_line};
}


1;
