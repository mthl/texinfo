# Line.pm: handle line of text.
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

# this module has nothing Texinfo specific.  It is similar with 
# Texinfo::Convert::Paragraph, but simpler.
# It could be even simpler: there is no need to delay outputting a word.

package Texinfo::Convert::Line;

use 5.006;
use strict;

use Unicode::EastAsianWidth;
use Carp qw(cluck);

# initialize a paragraph object.
sub new($;$)
{
  my $class = shift;
  my $conf = shift;
  my $self = {'max' => 72, 'indent_length' => 0, 'counter' => 0,
              'space' => '', 'frenchspacing' => 0, 'line_beginning' => 1};
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if ($key eq 'text') {
        $self->{'counter'} = _string_width($conf->{$key});
        $self->{'line_beginning'} = 0 if ($self->{'counter'});
      } else {
        $self->{$key} = $conf->{$key};
      }
    }
  }
  bless $self, $class;
}

# string fixed length size takeing into account that east asian characters
# may take 2 spaces.
sub _string_width($)
{
  my $string = shift;

  if (! defined($string)) {
    Carp::cluck();
  } 
  my $width = 0;
  foreach my $character(split '', $string) {
    if ($character =~ /\p{Unicode::EastAsianWidth::InFullwidth}/) {
      $width += 2;
    } else {
      $width += 1;
    }
  }
  return $width;
}

# for debug
sub dump($)
{
  my $self = shift;
  my $word = 'UNDEF';
  $word = $self->{'word'} if (defined($self->{'word'}));
  my $end_sentence = 'UNDEF';
  $end_sentence = $self->{'end_sentence'} if (defined($self->{'end_sentence'}));
  print STDERR "line ($self->{'line_beginning'}) word: $word, space `$self->{'space'}' end_sentence: $self->{'end_sentence'}\n"; 
}

# end a line.
sub end_line($)
{
  my $line = shift;
  my $result = $line->add_pending_word();
  $line->{'line_beginning'} = 1;
  $line->{'space'} = '';
  print STDERR "END_LINE\n" if ($line->{'debug'});
  return "$result\n";
}

# put a pending word and spaces in the result string.
sub add_pending_word($)
{
  my $line = shift;
  my $result = '';

  if (defined($line->{'word'})) {
    if ($line->{'line_beginning'}) {
      if ($line->{'indent_length'}) {
        $result .= ' ' x ($line->{'indent_length'} - $line->{'counter'});
        print STDERR "INDENT($line->{'counter'})\n" if ($line->{'debug'});
      }
      $line->{'line_beginning'} = 0;
    } elsif ($line->{'space'}) {
      $result .= $line->{'space'};
      print STDERR "ADD_SPACES\n" if ($line->{'debug'});
    }
    $result .= $line->{'word'};
    print STDERR "ADD_WORD[$line->{'word'}]\n" if ($line->{'debug'});
    $line->{'word'} = undef;
  }
  return $result;
}

# end a paragraph
sub end($)
{
  my $line = shift;
  return $line->end_line();
}

# add a word and/or spaces and end of sentence.
sub add_next($;$$$)
{
  my $line = shift;
  my $word = shift;
  my $space = shift;
  my $end_sentence = shift;
  my $result = '';

  if (defined($word)) {
    $line->{'word'} = '' if (!defined($line->{'word'}));
    $line->{'word'} .= $word;
    print STDERR "WORD+ $word -> $line->{'word'}\n" if ($line->{'debug'});
  }
  if (defined($space)) {
    $result .= $line->add_pending_word();
    $line->{'space'} = $space;
  }
  if (defined($end_sentence)) {
    $line->{'end_sentence'} = $end_sentence;
  }
  return $result;
}

sub inhibit_end_sentence($)
{
  my $line = shift;
  $line->{'end_sentence'} = 0;
}

my $end_sentence_character = quotemeta('.?!');
my $after_punctuation_characters = quotemeta('"\')]');

# wrap a text.
sub add_text($$)
{
  my $line = shift;
  my $text = shift;
  my $result = '';

  while ($text ne '') {
    if ($line->{'debug'}) {
      my $word = 'UNDEF';
      $word = $line->{'word'} if (defined($line->{'word'}));
      print STDERR "s `$line->{'space'}', w `$word'\n";
    }
    if ($text =~ s/^\s+//) {
      print STDERR "SPACES\n" if ($line->{'debug'});
      my $added_word = $line->{'word'};
      $result .= $line->add_pending_word();
      if (!$line->{'begin'}) {
        if (!$line->{'frenchspacing'} and $line->{'end_sentence'}) {
          $line->{'space'} = '  ';
        } else {
          $line->{'space'} = ' ';
        }
      }
      delete $line->{'end_sentence'};
    } elsif ($text =~ s/^([^\s\p{Unicode::EastAsianWidth::InFullwidth}]+)//) {
      my $added_word = $1;
      $result .= $line->add_next($added_word);
      # now check if it is considered as an end of sentence
      if (defined($line->{'end_sentence'}) and 
        $added_word =~ /^[$after_punctuation_characters]*$/) {
        # do nothing in the case of a continuation of after_punctuation_characters
      } elsif ($line->{'word'} =~ /[$end_sentence_character][$after_punctuation_characters]*$/
           and $line->{'word'} !~ /[[:upper:]][$end_sentence_character][$after_punctuation_characters]*$/) {
        $line->{'end_sentence'} = 1;
      }
    } elsif ($text =~ s/^(\p{Unicode::EastAsianWidth::InFullwidth})//) {
      my $added = $1;
      print STDERR "EAST_ASIAN\n" if ($line->{'debug'});
      $line->{'word'} = '' if (!defined($line->{'word'}));
      $line->{'word'} .= $added;
      $result .= $line->add_pending_word();
      delete $line->{'end_sentence'};
      $line->{'space'} = '';
    }
  }
  return $result;
}

1;
