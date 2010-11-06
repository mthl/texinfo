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
              'space' => '', 'frenchspacing' => 0};
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      $self->{$key} = $conf->{$key};
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

# end a line.
sub _end_line($)
{
  my $paragraph = shift;
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
      print STDERR "INDENT($paragraph->{'counter'})\n" if ($paragraph->{'debug'});
    } elsif ($paragraph->{'space'}) {
      $result .= $paragraph->{'space'};
      $paragraph->{'counter'} += _string_width($paragraph->{'space'});
      print STDERR "ADD_SPACES($paragraph->{'counter'})\n" if ($paragraph->{'debug'});
      
    }
    $result .= $paragraph->{'word'};
    $paragraph->{'counter'} += _string_width($paragraph->{'word'});
    print STDERR "ADD_WORD[$paragraph->{'word'}]($paragraph->{'counter'})\n"
      if ($paragraph->{'debug'});
    $paragraph->{'word'} = undef;
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
  return $result;
}

# add a word and/or spaces.
sub add_next($;$$)
{
  my $paragraph = shift;
  my $word = shift;
  my $space = shift;
  my $result = '';

  if (defined($word)) {
    $paragraph->{'word'} = '' if (!defined($paragraph->{'word'}));
    $paragraph->{'word'} .= $word;
    print STDERR "WORD+ $word -> $paragraph->{'word'}\n" if ($paragraph->{'debug'});
    # The $paragraph->{'counter'} != 0 is here to avoid having an
    # additional line output when the text is longer than the max.
    if ($paragraph->{'counter'} != 0 and 
        $paragraph->{'counter'} + _string_width($paragraph->{'word'}) + 
           _string_width($paragraph->{'space'}) > $paragraph->{'max'}) {
      $result .= $paragraph->_end_line();
    }
  }
  if (defined($space)) {
    $result .= $paragraph->add_pending_word();
    $paragraph->{'space'} = $space;
    if ($paragraph->{'counter'} + _string_width($paragraph->{'space'}) 
                    > $paragraph->{'max'}) {
      $result .= $paragraph->_end_line();
    }
  }
  return $result;
}

my $end_sentence_character = quotemeta('.?!');
my $after_punctuation_characters = quotemeta('"\')]');

# wrap a text.
sub wrap_next($$)
{
  my $paragraph = shift;
  my $text = shift;
  my $result = '';

  while ($text ne '') {
    if ($paragraph->{'debug'}) {
      my $word = 'UNDEF';
      $word = $paragraph->{'word'} if (defined($paragraph->{'word'}));
      print STDERR "($paragraph->{'counter'}) s `$paragraph->{'space'}', w `$word'\n";
    }
    if ($text =~ s/^\s+//) {
      print STDERR "SPACES($paragraph->{'counter'})\n" if ($paragraph->{'debug'});
      my $added_word = $paragraph->{'word'};
      $result .= $paragraph->add_pending_word();
      if (defined($added_word)) {
        if (!$paragraph->{'frenchspacing'}
             and $added_word =~ /[$end_sentence_character][$after_punctuation_characters]*$/
             and $added_word !~ /[[:upper:]][$end_sentence_character][$after_punctuation_characters]*$/) {
          $paragraph->{'space'} = '  ';
          print STDERR "NEW_SPACE_2\n" if ($paragraph->{'debug'});
        } else {
          $paragraph->{'space'} = ' ';
          print STDERR "NEW_SPACE_1\n" if ($paragraph->{'debug'});
        }
      } else {
        $paragraph->{'space'} = ' ';
      }
      if ($paragraph->{'counter'} + _string_width($paragraph->{'space'}) 
                      > $paragraph->{'max'}) {
        $result .= $paragraph->_end_line();
      }
    } elsif ($text =~ s/^(\p{Unicode::EastAsianWidth::InFullwidth})//) {
      my $added = $1;
      print STDERR "EAST_ASIAN\n" if ($paragraph->{'debug'});
      $paragraph->{'word'} = '' if (!defined($paragraph->{'word'}));
      $paragraph->{'word'} .= $added;
      if ($paragraph->{'counter'} != 0 and
          $paragraph->{'counter'} + _string_width($paragraph->{'word'}) 
                               > $paragraph->{'max'}) {
        $result .= $paragraph->_end_line();
      }
      $result .= $paragraph->add_pending_word();
      $paragraph->{'space'} = '';
    } elsif ($text =~ s/^([^\s\p{Unicode::EastAsianWidth::InFullwidth}]+)//) {
      $result .= $paragraph->add_next($1);
    }
  }
  return $result;
}

1;
