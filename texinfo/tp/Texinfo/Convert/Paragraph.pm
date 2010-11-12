# Paragraph.pm: handle paragraph text.
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

# this module has nothing Texinfo specific.  In contrast with existing
# modules Text::Wrap, Text::Format, it keeps a state of the paragraph 
# and wait for text to be feed.

package Texinfo::Convert::Paragraph;

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
              'word_counter' => 0, 'space' => '', 'frenchspacing' => 0};
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      $self->{$key} = $conf->{$key};
    }
  }
  bless $self, $class;
}

# for debugging
sub dump($)
{
  my $self = shift;
  my $word = 'UNDEF';
  $word = $self->{'word'} if (defined($self->{'word'}));
  my $end_sentence = 'UNDEF';
  $end_sentence = $self->{'end_sentence'} if (defined($self->{'end_sentence'}));
  print STDERR "para ($self->{'counter'}+$self->{'word_counter'}) word: $word, space `$self->{'space'}' end_sentence: $self->{'end_sentence'}\n"; 
}

# end a line.
sub end_line($)
{
  my $paragraph = shift;
  return '' if ($paragraph->{'protected_spaces'});
  $paragraph->{'counter'} = 0;
  $paragraph->{'space'} = '';
  if ($paragraph->{'indent_length_next'}) {
    $paragraph->{'indent_length'} = $paragraph->{'indent_length_next'};
    delete $paragraph->{'indent_length_next'};        
  }
  print STDERR "END_LINE\n" if ($paragraph->{'debug'});
  return "\n";
}

# put a pending word and spaces in the result string.
sub add_pending_word($)
{
  my $paragraph = shift;
  my $result = '';

  if (defined($paragraph->{'word'})) {
    if ($paragraph->{'indent_length'} > $paragraph->{'counter'}) {
      $result .= ' ' x ($paragraph->{'indent_length'} - $paragraph->{'counter'});
      $paragraph->{'counter'} = $paragraph->{'indent_length'};
      print STDERR "INDENT($paragraph->{'counter'}+$paragraph->{'word_counter'})\n" 
                   if ($paragraph->{'debug'});
    } elsif ($paragraph->{'space'}) {
      $result .= $paragraph->{'space'};
      $paragraph->{'counter'} += length($paragraph->{'space'});
      print STDERR "ADD_SPACES($paragraph->{'counter'}+$paragraph->{'word_counter'})\n" 
         if ($paragraph->{'debug'});
      
    }
    $result .= $paragraph->{'word'};
    $paragraph->{'counter'} += $paragraph->{'word_counter'};
    print STDERR "ADD_WORD[$paragraph->{'word'}]+$paragraph->{'word_counter'} ($paragraph->{'counter'})\n"
      if ($paragraph->{'debug'});
    $paragraph->{'word'} = undef;
    $paragraph->{'word_counter'} = 0;
    $paragraph->{'space'} = '';
  }
  return $result;
}

# end a paragraph
sub end($)
{
  my $paragraph = shift;
  print STDERR "PARA END\n" if ($paragraph->{'debug'});
  my $result = $paragraph->add_pending_word();
  $result .= "\n" if ($paragraph->{'counter'} != 0);
  # This is only useful if the paragraph is reused.
  $paragraph->{'counter'} = 0;
  $paragraph->{'space'} = '';
  $paragraph->{'word'} = undef;
  $paragraph->{'word_counter'} = 0;
  return $result;
}

# add a word and/or spaces and end of sentence.
sub add_next($;$$$)
{
  my $paragraph = shift;
  my $word = shift;
  my $space = shift;
  my $end_sentence = shift;
  my $result = '';

  if (defined($word)) {
    $paragraph->{'word'} = '' if (!defined($paragraph->{'word'}));
    $paragraph->{'word'} .= $word;
    $paragraph->{'word_counter'} += length($word);
    print STDERR "WORD+ $word -> $paragraph->{'word'}\n" if ($paragraph->{'debug'});
    # The $paragraph->{'counter'} != 0 is here to avoid having an
    # additional line output when the text is longer than the max.
    if ($paragraph->{'counter'} != 0 and 
        $paragraph->{'counter'} + $paragraph->{'word_counter'} + 
           length($paragraph->{'space'}) > $paragraph->{'max'}) {
      $result .= $paragraph->end_line();
    }
  }
  if (defined($space)) {
    $result .= $paragraph->add_pending_word();
    $paragraph->{'space'} = $space;
    if ($paragraph->{'counter'} + length($paragraph->{'space'}) 
                    > $paragraph->{'max'}) {
      $result .= $paragraph->end_line();
    }
  }
  if (defined($end_sentence)) {
    $paragraph->{'end_sentence'} = $end_sentence;
  }
  return $result;
}

sub inhibit_end_sentence($)
{
  my $paragraph = shift;
  $paragraph->{'end_sentence'} = 0;
}

sub set_space_protected($$)
{
  my $paragraph = shift;
  my $space_protection = shift;
  $paragraph->{'protected_spaces'} = $space_protection;
  # flush the spaces already existing
  if ($space_protection) {
    my $new_space = $paragraph->{'space'};
    $paragraph->{'counter'} += length($new_space);
    $paragraph->{'space'} = '';
    return $new_space;
  }
  return '';
}

my $end_sentence_character = quotemeta('.?!');
my $after_punctuation_characters = quotemeta('"\')]');

# wrap a text.
sub add_text($$)
{
  my $paragraph = shift;
  my $text = shift;
  my $result = '';

  while ($text ne '') {
    if ($paragraph->{'debug'}) {
      my $word = 'UNDEF';
      $word = $paragraph->{'word'} if (defined($paragraph->{'word'}));
      print STDERR "($paragraph->{'counter'}+$paragraph->{'word_counter'}) s `$paragraph->{'space'}', w `$word'\n";
    }
    if ($text =~ s/^(\s+)//) {
      print STDERR "SPACES($paragraph->{'counter'})\n" if ($paragraph->{'debug'});
      my $added_word = $paragraph->{'word'};
      $result .= $paragraph->add_pending_word();
      if ($paragraph->{'protected_spaces'}) {
        $paragraph->{'space'} .= $1;
        if ($paragraph->{'space'} =~ s/\n/ /g 
           and !$paragraph->{'frenchspacing'} and $paragraph->{'end_sentence'}
           and length($paragraph->{'space'}) < 2) {
          $paragraph->{'space'} = '  ';
        }
        $result .= $paragraph->{'space'};
        $paragraph->{'counter'} += length($paragraph->{'space'});
        $paragraph->{'space'} = '';
      } else {
        if ($paragraph->{'counter'} != 0) {
          if (!$paragraph->{'frenchspacing'} and $paragraph->{'end_sentence'}) {
            $paragraph->{'space'} = '  ';
          } else {
            $paragraph->{'space'} = ' ';
          }
        }
      }
      delete $paragraph->{'end_sentence'};
      if ($paragraph->{'counter'} + length($paragraph->{'space'}) 
                      > $paragraph->{'max'}) {
        $result .= $paragraph->end_line();
      }
    } elsif ($text =~ s/^(\p{Unicode::EastAsianWidth::InFullwidth})//) {
      my $added = $1;
      print STDERR "EAST_ASIAN\n" if ($paragraph->{'debug'});
      $paragraph->{'word'} = '' if (!defined($paragraph->{'word'}));
      $paragraph->{'word'} .= $added;
      $paragraph->{'word_counter'} += 2;
      if ($paragraph->{'counter'} != 0 and
          $paragraph->{'counter'} + $paragraph->{'word_counter'} 
                               > $paragraph->{'max'}) {
        $result .= $paragraph->end_line();
      }
      $result .= $paragraph->add_pending_word();
      delete $paragraph->{'end_sentence'};
      $paragraph->{'space'} = '';
    } elsif ($text =~ s/^([^\s\p{Unicode::EastAsianWidth::InFullwidth}]+)//) {
      my $added_word = $1;
      $result .= $paragraph->add_next($added_word);
      # now check if it is considered as an end of sentence
      if (defined($paragraph->{'end_sentence'}) and 
          $added_word =~ /^[$after_punctuation_characters]*$/) {
        # do nothing in the case of a continuation of after_punctuation_characters
      } elsif ($paragraph->{'word'} =~ /[$end_sentence_character][$after_punctuation_characters]*$/
           and $paragraph->{'word'} !~ /[[:upper:]][$end_sentence_character][$after_punctuation_characters]*$/) {
        $paragraph->{'end_sentence'} = 1;
      }
    }
  }
  return $result;
}

1;
