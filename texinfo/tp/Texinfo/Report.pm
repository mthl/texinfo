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



package Texinfo::Report;

use 5.00405;
use strict;


sub __($$)
{
  my $self = shift;
  return &{$self->{'gettext'}}(@_);
}

sub new 
{
  my $self = shift;
  $self->{'errors_warnings'} = [];
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
  $file =~ s/^.*\/// if ($self->{'test'});
  my $warn_line;
  if ($line_number->{'macro'} ne '') {
    $warn_line = sprintf($self->__(
                             "%s:%d: warning: %s (possibly involving \@%s)\n"),
             $file, $line_number->{'line_nr'}, $text, $line_number->{'macro'});
  } else {
    $warn_line = sprintf($self->__("%s:%d: warning: %s\n"),
                         $file, $line_number->{'line_nr'}, $text);
  }
  warn $warn_line if ($self->{'debug'});
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
    $file =~ s/^.*\/// if ($self->{'test'});
    my $macro_text = '';
    $macro_text = " (possibly involving \@$line_number->{'macro'})"
       if ($line_number->{'macro'} ne '');
    my $error_text = "$file:$line_number->{'line_nr'}: $text$macro_text\n";
    warn "$error_text" if ($self->{'debug'});
    my $type = 'error';
    $type = 'error continuation' if ($continuation);
    push @{$self->{'errors_warnings'}},
         { 'type' => $type, 'text' => $text, 'error_line' => $error_text,
           %{$line_number} };
  }
  $self->{'error_nrs'}++ unless ($continuation);
}


1;
