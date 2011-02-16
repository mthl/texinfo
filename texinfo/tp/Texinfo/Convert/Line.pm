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
# The delay to output a word is here to be able to detect when an upper
# case letter is before an end of line

package Texinfo::Convert::Line;

use 5.006;
use strict;

use Unicode::EastAsianWidth;

# initialize a line object.
sub new($;$)
{
  my $class = shift;
  my $conf = shift;
  my $self = {'indent_length' => 0, 'counter' => 0,
              'space' => '', 'frenchspacing' => 0, 'line_beginning' => 1,
              'lines_counter' => 0, 'end_line_count' => 0};
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if ($key eq 'text') {
        $self->{'counter'} = Texinfo::Convert::Unicode::string_width($conf->{$key});
        $self->{'line_beginning'} = 0 if ($self->{'counter'});
      } else {
        $self->{$key} = $conf->{$key};
      }
    }
  }
  bless $self, $class;
}

# for debug
sub dump($)
{
  my $self = shift;
  my $word = 'UNDEF';
  $word = $self->{'word'} if (defined($self->{'word'}));
  my $end_sentence = 'UNDEF';
  $end_sentence = $self->{'end_sentence'} if (defined($self->{'end_sentence'}));
  print STDERR "line ($self->{'line_beginning'},$self->{'counter'}) word: $word, space `$self->{'space'}' end_sentence: $end_sentence\n"; 
}

sub end_line($)
{
  my $line = shift;
  return $line->_end_line();
}

# end a line.
sub _end_line($)
{
  my $line = shift;
  my $result = $line->_add_pending_word();
  $line->{'line_beginning'} = 1;
  $line->{'space'} = '';
  $line->{'lines_counter'}++;
  $line->{'end_line_count'}++;
  $line->{'counter'} = 0;
  print STDERR "END_LINE.L\n" if ($line->{'DEBUG'});
  return "$result\n";
}

sub end_line_count($)
{
  my $line = shift;
  return $line->{'end_line_count'};
}

sub get_pending($)
{
  my $line = shift;
  my $result = '';
  if ($line->{'space'}) {
    $result .= $line->{'space'};
  }
  if (defined($line->{'word'})) {
    $result .= $line->{'word'};
  }
  return $result;
}

sub add_pending_word($)
{
  my $line = shift;
  $line->{'end_line_count'} = 0;
  return $line->_add_pending_word();
}
# put a pending word and spaces in the result string.
sub _add_pending_word($)
{
  my $line = shift;
  my $result = '';

  if (defined($line->{'word'})) {
    if ($line->{'line_beginning'}) {
      if ($line->{'indent_length'}) {
        $result .= ' ' x ($line->{'indent_length'} - $line->{'counter'});
        print STDERR "INDENT.L($line->{'counter'})\n" if ($line->{'DEBUG'});
      }
      $line->{'line_beginning'} = 0;
    } elsif ($line->{'space'}) {
      $result .= $line->{'space'};
      print STDERR "ADD_SPACES.L\n" if ($line->{'DEBUG'});
    }
    $line->{'space'} = '';
    $result .= $line->{'word'};
    print STDERR "ADD_WORD.L[$line->{'word'}]\n" if ($line->{'DEBUG'});
    $line->{'word'} = undef;
  }
  return $result;
}

# end a line
sub end($)
{
  my $line = shift;
  $line->{'end_line_count'} = 0;
  my $result = $line->_add_pending_word();
  $result .= $line->{'space'};
  print STDERR "END_LINE.L\n" if ($line->{'DEBUG'});
  return $result;
}

sub add_next($;$$$)
{
  my $line = shift;
  my $word = shift;
  my $space = shift;
  my $end_sentence = shift;
  $line->{'end_line_count'} = 0;
  return $line->_add_next($word, $space, $end_sentence);
}

# add a word and/or spaces and end of sentence.
sub _add_next($;$$$)
{
  my $line = shift;
  my $word = shift;
  my $space = shift;
  my $end_sentence = shift;
  my $result = '';

  if (defined($word)) {
    if (!defined($line->{'word'})) {
      $line->{'word'} = '';
      if ($line->{'end_sentence'} and !$line->{'frenchspacing'}
           and !$line->{'line_beginning'} and $line->{'space'}) {
        if ($word !~ /^\s/) {
          $line->{'space'} = '  ';
        }
        delete $line->{'end_sentence'};
      }
    }
    $line->{'word'} .= $word;
    print STDERR "WORD+.L $word -> $line->{'word'}\n" if ($line->{'DEBUG'});
  }
  if (defined($space)) {
    if ($line->{'protect_spaces'}) {
      $result .= $line->_add_text($space);
    } else {
      $result .= $line->_add_pending_word();
      $line->{'space'} = $space;
    }
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

sub set_space_protection($$;$$$)
{
  my $line = shift;
  my $space_protection = shift;
  my $ignore_columns = shift;
  my $keep_end_lines = shift;
  my $frenchspacing = shift;
  $line->{'protect_spaces'} = $space_protection 
    if defined($space_protection);
  $line->{'ignore_columns'} = $ignore_columns
    if defined($ignore_columns);
  # a no-op in fact
  $line->{'keep_end_lines'} = $keep_end_lines
    if defined($keep_end_lines);
  if (!$line->{'frenchspacing'} and $frenchspacing
    and $line->{'end_sentence'} and !$line->{'line_beginning'} 
    and $line->{'space'} and !defined($line->{'word'})) {
    $line->{'space'} = '  ';
    print STDERR "SWITCH.L frenchspacing end sentence space\n" if ($line->{'DEBUG'});
    delete $line->{'end_sentence'};
  }
  $line->{'frenchspacing'} = $frenchspacing
    if defined($frenchspacing);
  # begin a word, to have something even if empty
  if ($space_protection) {
    $line->_add_next('');
  }
  return '';
}

my $end_sentence_character = quotemeta('.?!');
my $after_punctuation_characters = quotemeta('"\')]');

# wrap a text.
sub add_text($$)
{
  my $line = shift;
  my $text = shift;
  $line->{'end_line_count'} = 0;
  my $result = '';

  while ($text ne '') {
    if ($line->{'DEBUG'}) {
      my $word = 'UNDEF';
      $word = $line->{'word'} if (defined($line->{'word'}));
      print STDERR "s `$line->{'space'}', w `$word'\n";
    }
    if ($text =~ s/^([^\S\n]+)//) {
      my $spaces = $1;
      print STDERR "SPACES.L\n" if ($line->{'DEBUG'});
      if ($line->{'protect_spaces'}) {
        $line->{'word'} .= $spaces;
      } else {
        my $added_word = $line->{'word'};
        $result .= $line->_add_pending_word();

        if (!$line->{'line_beginning'}) {
          if (!$line->{'frenchspacing'} and $line->{'end_sentence'}) {
            if (length($line->{'space'}) >= 1 or length($spaces) > 1) {
              $line->{'space'} = '  ';
              delete $line->{'end_sentence'};
            } else {
              $line->{'space'} = ' ';
            }
          } else {
            $line->{'space'} = ' ';
          }
        }
      }
    } elsif ($text =~ s/^([^\s\p{Unicode::EastAsianWidth::InFullwidth}]+)//) {
      my $added_word = $1;
      $result .= $line->_add_next($added_word);
      # now check if it is considered as an end of sentence
      if (defined($line->{'end_sentence'}) and 
        $added_word =~ /^[$after_punctuation_characters]*$/) {
        # do nothing in the case of a continuation of after_punctuation_characters
      } elsif ($line->{'word'} =~ /[$end_sentence_character][$after_punctuation_characters]*$/
           and $line->{'word'} !~ /[[:upper:]][$end_sentence_character][$after_punctuation_characters]*$/) {
        $line->{'end_sentence'} = 1;
        print STDERR "END_SENTENCE.L\n" if ($line->{'DEBUG'});
      } else {
        delete $line->{'end_sentence'};
        print STDERR "delete END_SENTENCE.L($line->{'end_sentence'}): text\n" 
          if (defined($line->{'end_sentence'}) and $line->{'DEBUG'});
      }
    } elsif ($text =~ s/^\n//) {
      $result .= $line->_end_line();
    } elsif ($text =~ s/^(\p{Unicode::EastAsianWidth::InFullwidth})//) {
      my $added = $1;
      print STDERR "EAST_ASIAN.L\n" if ($line->{'DEBUG'});
      $line->{'word'} = '' if (!defined($line->{'word'}));
      $line->{'word'} .= $added;
      $result .= $line->_add_pending_word();
      delete $line->{'end_sentence'};
      $line->{'space'} = '';
    } else {
      # FIXME
      # this should never happen, all cases are taken into account above.
      # however it happens with strange caracters that appear sometime and
      # look like invalid. Is it a perl bug? Maybe an invalid character in
      # the encoding?
      #die "Unknown caracter leading $text";
      last;
    }
  }
  return $result;
}

1;
