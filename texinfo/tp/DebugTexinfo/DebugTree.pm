# DebugTree.pm: debug a Texinfo::Parser tree.
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

# Example of calls
# with creation of elements and pages:
# ./texi2any.pl --set DEBUGTREE --set USE_NODES=0 --split section file.texi
# no elements nor pages
# ./texi2any.pl --set DEBUGTREE file.texi

use Texinfo::Convert::Converter;

package DebugTexinfo::DebugTree;

@ISA = qw(Texinfo::Convert::Converter);

sub output($$)
{
  my $self = shift;
  my $root = shift;
  my $elements;
  my $pages;
  if ($self) {
    if ($self->get_conf('USE_NODES')) {
      $elements = Texinfo::Structuring::split_by_node($root);
    } elsif (defined($self->get_conf('USE_NODES'))) {
      #print STDERR "U sections\n";
      $elements = Texinfo::Structuring::split_by_section($root);
    }
    if ($elements and ($self->get_conf('SPLIT') 
                       or !$self->get_conf('MONOLITHIC'))) {
      #print STDERR "S ".$self->get_conf('SPLIT')."\n";
      $pages = Texinfo::Structuring::split_pages($elements,
                                                 $self->get_conf('SPLIT'));
    }
  }
  if ($pages) {
    #print STDERR "PPP $pages\n";
    $root = {'type' => 'pages_root',
             'contents' => $pages };
  } elsif ($elements) {
    $root = {'type' => 'elements_root',
             'contents' => $elements };
  }
  return _print_tree($self, $root);
}

sub _print_tree($$;$$);

sub _print_tree($$;$$)
{
  my $self = shift;
  my $root = shift;
  my $level = shift;
  my $argument = shift;
  $level = 0 if (!defined($level));

  my $result = ' ' x $level;
  if ($argument) {
    $result .= '%';
    $level++;
  }
  if ($root->{'cmdname'}) {
    $result .= "\@$root->{'cmdname'} ";
  }
  if (defined($root->{'type'})) {
    $result .= "$root->{'type'} ";
  }
  if (defined($root->{'text'})) {
    my $text = $root->{'text'};
    $text =~ s/\n/\\n/g;
    $result .= "|$text|";
  }
  $result .= "\n";
  if ($root->{'args'}) {
    foreach my $arg (@{$root->{'args'}}) {
      $result .= _print_tree ($self, $arg, $level +1, 1);
    }
  }
  if ($root->{'contents'}) {
    foreach my $content (@{$root->{'contents'}}) {
      $result .= _print_tree ($self, $content, $level+1);
    }
  }
  return $result;
}
