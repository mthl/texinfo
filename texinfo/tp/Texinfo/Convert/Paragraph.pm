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
              'word_counter' => 0, 'space' => '', 'frenchspacing' => 0,
              'lines_counter' => 0, 'end_line_count' => 0};
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
  print STDERR "para ($self->{'counter'}+$self->{'word_counter'}) word: $word, space `$self->{'space'}' end_sentence: $end_sentence\n"; 
}

sub _cut_line($)
{
  my $paragraph = shift;
  return '' if ($paragraph->{'ignore_columns'});
  return $paragraph->_end_line();
}

sub end_line_count($)
{
  my $paragraph = shift;
  return $paragraph->{'end_line_count'};
}

sub end_line($)
{
  my $paragraph = shift;
  $paragraph->{'end_line_count'} = 0;
  return $paragraph->_end_line();
}

# end a line.
sub _end_line($)
{
  my $paragraph = shift;
  $paragraph->{'counter'} = 0;
  $paragraph->{'space'} = '';
  if (defined($paragraph->{'indent_length_next'})) {
    $paragraph->{'indent_length'} = $paragraph->{'indent_length_next'};
    delete $paragraph->{'indent_length_next'};        
  }
  $paragraph->{'lines_counter'}++;
  $paragraph->{'end_line_count'}++;
  print STDERR "END_LINE\n" if ($paragraph->{'DEBUG'});
  return "\n";
}

sub get_pending($)
{
  my $paragraph = shift;
  my $result = '';
  if ($paragraph->{'space'}) {
    $result .= $paragraph->{'space'};
  }
  if (defined($paragraph->{'word'})) {
    $result .= $paragraph->{'word'};
  }
  return $result;
}

sub add_pending_word($)
{
  my $paragraph = shift;
  $paragraph->{'end_line_count'} = 0;
  return $paragraph->_add_pending_word();
}

# put a pending word and spaces in the result string.
sub _add_pending_word($)
{
  my $paragraph = shift;
  my $result = '';

  if (defined($paragraph->{'word'})) {
    if ($paragraph->{'indent_length'} > $paragraph->{'counter'}) {
      $result .= ' ' x ($paragraph->{'indent_length'} - $paragraph->{'counter'});
      $paragraph->{'counter'} = $paragraph->{'indent_length'};
      print STDERR "INDENT($paragraph->{'counter'}+$paragraph->{'word_counter'})\n" 
                   if ($paragraph->{'DEBUG'});
    } elsif ($paragraph->{'space'}) {
      $result .= $paragraph->{'space'};
      $paragraph->{'counter'} += length($paragraph->{'space'});
      print STDERR "ADD_SPACES($paragraph->{'counter'}+$paragraph->{'word_counter'})\n" 
         if ($paragraph->{'DEBUG'});
      
    }
    $result .= $paragraph->{'word'};
    $paragraph->{'counter'} += $paragraph->{'word_counter'};
    print STDERR "ADD_WORD[$paragraph->{'word'}]+$paragraph->{'word_counter'} ($paragraph->{'counter'})\n"
      if ($paragraph->{'DEBUG'});
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
  $paragraph->{'end_line_count'} = 0;
  print STDERR "PARA END\n" if ($paragraph->{'DEBUG'});
  my $result = $paragraph->_add_pending_word();
  if ($paragraph->{'counter'} != 0) {
    $result .= "\n"; 
    $paragraph->{'lines_counter'}++;
    $paragraph->{'end_line_count'}++;
  }
  return $result;
}

sub add_next($;$$$)
{
  my $paragraph = shift;
  my $word = shift;
  my $space = shift;
  my $end_sentence = shift;
  $paragraph->{'end_line_count'} = 0;
  return $paragraph->_add_next($word, $space, $end_sentence);
}

# add a word and/or spaces and end of sentence.
sub _add_next($;$$$)
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
    print STDERR "WORD+ $word -> $paragraph->{'word'}\n" if ($paragraph->{'DEBUG'});
    # The $paragraph->{'counter'} != 0 is here to avoid having an
    # additional line output when the text is longer than the max.
    if ($paragraph->{'counter'} != 0 and 
        $paragraph->{'counter'} + $paragraph->{'word_counter'} + 
           length($paragraph->{'space'}) > $paragraph->{'max'}) {
      $result .= $paragraph->_cut_line();
    }
  }
  if (defined($space)) {
    if ($paragraph->{'protect_spaces'}) {
      $result .= $paragraph->_add_text($space);
    } else {
      $result .= $paragraph->_add_pending_word();
      $paragraph->{'space'} = $space;
      if ($paragraph->{'counter'} + length($paragraph->{'space'}) 
                      > $paragraph->{'max'}) {
        $result .= $paragraph->_cut_line();
      }
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

sub set_space_protection($$;$$$)
{
  my $paragraph = shift;
  my $space_protection = shift;
  my $ignore_columns = shift;
  my $keep_end_lines = shift;
  my $frenchspacing = shift;
  $paragraph->{'protect_spaces'} = $space_protection 
    if defined($space_protection);
  $paragraph->{'ignore_columns'} = $ignore_columns
    if defined($ignore_columns);
  $paragraph->{'keep_end_lines'} = $keep_end_lines
    if defined($keep_end_lines);
  $paragraph->{'frenchspacing'} = $frenchspacing
    if defined($frenchspacing);
  # begin a word, to have something even if empty
  if ($space_protection) {
    $paragraph->_add_next('');
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
  $paragraph->{'end_line_count'} = 0;
  my $result = '';

  while ($text ne '') {
    if ($paragraph->{'DEBUG'}) {
      my $word = 'UNDEF';
      $word = $paragraph->{'word'} if (defined($paragraph->{'word'}));
      print STDERR "($paragraph->{'counter'}+$paragraph->{'word_counter'}) s `$paragraph->{'space'}', w `$word'\n";
    }
    if ($text =~ s/^(\s+)//) {
      my $spaces = $1;
      print STDERR "SPACES($paragraph->{'counter'})\n" if ($paragraph->{'DEBUG'});
      my $added_word = $paragraph->{'word'};
      if ($paragraph->{'protect_spaces'}) {
        
        $paragraph->{'word'} .= $spaces;
        $paragraph->{'word_counter'} += length($spaces);
        #$paragraph->{'space'} .= $spaces;
        if ($paragraph->{'word'} =~ s/\n/ /g 
           and !$paragraph->{'frenchspacing'} and $paragraph->{'end_sentence'}) {
          $paragraph->{'word'} =~ /(\s*)$/;
          if (length($1) < 2) {
            $paragraph->{'word'} =~ s/(\s*)$/  /;
            my $removed = $1;
            $paragraph->{'word_counter'} += length('  ') - length($removed);
          }
        }
        # The $paragraph->{'counter'} != 0 is here to avoid having an
        # additional line output when the text is longer than the max.
        if ($paragraph->{'counter'} != 0 and 
            $paragraph->{'counter'} + $paragraph->{'word_counter'} + 
               length($paragraph->{'space'}) > $paragraph->{'max'}) {
          $result .= $paragraph->_cut_line();
        }
      } else {
        $result .= $paragraph->_add_pending_word();
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
        $result .= $paragraph->_cut_line();
      }
      if ($spaces =~ /\n/ and $paragraph->{'keep_end_lines'}) {
        $result .= $paragraph->_end_line();
      }
    } elsif ($text =~ s/^(\p{Unicode::EastAsianWidth::InFullwidth})//) {
      my $added = $1;
      print STDERR "EAST_ASIAN\n" if ($paragraph->{'DEBUG'});
      $paragraph->{'word'} = '' if (!defined($paragraph->{'word'}));
      $paragraph->{'word'} .= $added;
      $paragraph->{'word_counter'} += 2;
      if ($paragraph->{'counter'} != 0 and
          $paragraph->{'counter'} + $paragraph->{'word_counter'} 
                               > $paragraph->{'max'}) {
        $result .= $paragraph->_cut_line();
      }
      $result .= $paragraph->_add_pending_word();
      delete $paragraph->{'end_sentence'};
      $paragraph->{'space'} = '';
    } elsif ($text =~ s/^([^\s\p{Unicode::EastAsianWidth::InFullwidth}]+)//) {
      my $added_word = $1;
      $result .= $paragraph->_add_next($added_word);
      # now check if it is considered as an end of sentence
      if (defined($paragraph->{'end_sentence'})
          and $added_word =~ /^[$after_punctuation_characters]*$/) {
        # do nothing in the case of a continuation of after_punctuation_characters
      } elsif ($paragraph->{'word'} =~ /[$end_sentence_character][$after_punctuation_characters]*$/
           and $paragraph->{'word'} !~ /[[:upper:]][$end_sentence_character][$after_punctuation_characters]*$/) {
        $paragraph->{'end_sentence'} = 1;
      } else {
        delete $paragraph->{'end_sentence'};
      }
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
