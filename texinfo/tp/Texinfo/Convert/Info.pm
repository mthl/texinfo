# Info.pm: output tree as Info.
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

package Texinfo::Convert::Info;

use 5.00405;
use strict;

use Texinfo::Convert::Plaintext;

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Texinfo::Convert::Plaintext);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration       use Texinfo::Covert::Text ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  convert
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';

my $STDIN_DOCU_NAME = 'stdin';
my $INFO_EXTENSION = 'info';

sub output($)
{
  my $self = shift;
  my $root = shift;

  my $result;

  push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                     'locations' => []};
  my $header = $self->_info_header();
  pop @{$self->{'count_context'}};
  if (defined($self->{'output_dir'}) and ! -d $self->{'output_dir'}) {
    if (!mkdir($self->{'output_dir'}, oct(755))) {
      $self->document_error(sprintf($self->__(
             "Can't create directories `%s': %s"), 
             $self->{'output_dir'}, $!));
      return undef;
    }
  }
  my $header_bytes = $self->count_bytes($header);
  my $elements = Texinfo::Structuring::split_by_node($root);

  my $fh;
  if (! $self->{'output_file'} eq '') {
    $fh = $self->Texinfo::Common::open_out ($self->{'output_file'}, 
                                            $self->{'encoding'});
    if (!$fh) {
      $self->document_error(sprintf($self->__("Could not open %s for writing: $!"),
                                    $self->{'output_file'}));
      return undef;
    }
  }
  if (!defined($elements)) {
    $self->document_warn($self->__("Document without nodes."));
    my $output = $header.$self->_convert($root);
    my ($footnotes) = $self->_footnotes();
    $output .= $footnotes;
    if ($fh) {
      print $fh $output;
      close ($fh);
    } else {
      $result = $output;
    }
  } else {
    my $out_file_nr = 1;
    my @indirect_files;
    if ($fh) {
      print $fh $header;
    } else {
      $result = $header;
    }
    $self->{'count_context'}->[-1]->{'bytes'} += $header_bytes;
    my $first_node_bytes_count = $header_bytes;
    my @nodes = @$elements;
    while (@nodes) {
      my $node = shift @nodes;
      my $node_text = $self->_convert_node($node);
      if ($fh) {
        print $fh $node_text;
      } else {
        $result .= $node_text;
      }
      if (defined($self->{'SPLIT_SIZE'}) 
          and $self->{'count_context'}->[-1]->{'bytes'} > 
                  $out_file_nr * $self->{'SPLIT_SIZE'} and @nodes and $fh) {
        close ($fh);
        if ($out_file_nr == 1) {
          unless (rename ($self->{'output_file'}, 
                          $self->{'output_file'}.'-'.$out_file_nr)) {
            $self->document_error(sprintf($self->__("Rename %s failed: $!"), 
                                         $self->{'output_file'}));
          }
          push @{$self->{'opened_files'}}, 
                   $self->{'output_file'}.'-'.$out_file_nr;
          push @indirect_files, [$self->{'output_filename'}.'-'.$out_file_nr,
                                 $first_node_bytes_count];
          #print STDERR join(' --> ', @{$indirect_files[-1]}) ."\n";
        }
        $out_file_nr++;
        $fh = $self->Texinfo::Common::open_out (
                               $self->{'output_file'}.'-'.$out_file_nr, 
                               $self->{'encoding'});
        if (!$fh) {
           $self->document_error(sprintf(
                  $self->__("Could not open %s for writing: $!"),
                  $self->{'output_file'}.'-'.$out_file_nr));
           return undef;
        }
        print $fh $header;
        $self->{'count_context'}->[-1]->{'bytes'} += $header_bytes;
        push @indirect_files, [$self->{'output_filename'}.'-'.$out_file_nr,
                               $self->{'count_context'}->[-1]->{'bytes'}];
        #print STDERR join(' --> ', @{$indirect_files[-1]}) ."\n";
      }
    }
    my $tag_text = '';
    if ($out_file_nr > 1) {
      close ($fh);
      $fh = $self->Texinfo::Common::open_out($self->{'output_file'}, 
                                             $self->{'encoding'});
      if (!$fh) {
        $self->document_error(sprintf(
              $self->__("Could not open %s for writing: $!"),
              $self->{'output_file'}.'-'.$out_file_nr));
        return undef;
      }
      $tag_text = $header;
      $tag_text .= "\x{1F}\nIndirect:";
      foreach my $indirect (@indirect_files) {
        $tag_text .= "\n$indirect->[0]: $indirect->[1]";
      }
    }
    $tag_text .= "\n\x{1F}\nTag Table:\n";
    if ($out_file_nr > 1) {
      $tag_text .=  "(Indirect)\n";
    }
    foreach my $label (@{$self->{'count_context'}->[-1]->{'locations'}}) {
      next unless ($label->{'root'});
      my $prefix = 'Ref';
      $prefix = 'Node' if ($label->{'root'}->{'cmdname'} eq 'node');
      my ($label_text) = $self->convert_line({'type' => 'code',
        'contents' => $label->{'root'}->{'extra'}->{'node_content'}});
      $tag_text .=  "$prefix: $label_text\x{7F}$label->{'bytes'}\n";
    }
    $tag_text .=  "\x{1F}\nEnd Tag Table\n";
    my $coding = $self->{'encoding'};
    $coding = $self->{'documentencoding'} if (!defined($coding));
    if ($coding and $coding ne 'us-ascii') {
      $tag_text .= "\n\x{1F}\nLocal Variables:\ncoding: $coding\nEnd:\n";
    }
    if ($fh) {
      print $fh $tag_text;
    } else {
      $result .= $tag_text;
    }
  }
  return $result;
}

# this also determines the output file
sub _info_header($)
{
  my $self = shift;
  my $input_basename;
  if (defined($self->{'info'}->{'input_file_name'})) {
    $input_basename = $self->{'info'}->{'input_file_name'};
  } else {
    # This could happen if called on a piece of texinfo
    $input_basename = '';
  }
  $input_basename =~ s/^.*\///;
  $input_basename = $STDIN_DOCU_NAME if ($input_basename eq '-');
  my $output_file;
  if (defined($self->{'OUTFILE'})) {
    $output_file = $self->{'OUTFILE'};
  } else {
    if ($self->{'extra'} and $self->{'extra'}->{'setfilename'}
           and $self->{'extra'}->{'setfilename'}->{'extra'}
           and defined($self->{'extra'}->{'setfilename'}->{'extra'}->{'text_arg'})) {
      $output_file = $self->{'extra'}->{'setfilename'}->{'extra'}->{'text_arg'};
    } elsif ($input_basename ne '') {
      $output_file = $input_basename;
      $output_file =~ s/\.te?x(i|info)?$//;
      $output_file .= '.'.$INFO_EXTENSION;
    } else {
      $output_file = '';
    }
    if (defined($self->{'SUBDIR'}) and $output_file ne '') {
      $output_file = "$self->{'SUBDIR'}/$output_file";
    }
  }
  $self->{'output_file'} = $output_file if ($output_file ne '');
  my $output_basename = $output_file;
  $output_basename =~ s/^.*\///;
  $self->{'output_filename'} = $output_basename;
  my $output_dir = $output_file;
  $output_dir =~ s|[^/]*$||;
  if ($output_dir ne '') {
    $self->{'output_dir'} = $output_dir;
  }

  # FIXME version/program
  my $text = "This is $output_basename, produced by makeinfo version 4.13 from $input_basename.";
  my $paragraph = Texinfo::Convert::Paragraph->new();
  my $result = $paragraph->add_text($text);
  $result .= $paragraph->end();
  $result .= "\n";
  $self->{'empty_lines_count'} = 1;

  if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
    $self->_set_global_multiple_commands();
    my $copying = $self->_convert({'contents' => 
          $self->{'extra'}->{'copying'}->{'contents'}});
    $result .= $copying;
    $self->_unset_global_multiple_commands();
  }
  if ($self->{'info'}->{'dircategory_direntry'}) {
    $self->{'ignored_commands'}->{'direntry'} = 0;
    foreach my $command (@{$self->{'info'}->{'dircategory_direntry'}}) {
      if ($command->{'cmdname'} eq 'dircategory') {
          if ($command->{'extra'} 
               and defined($command->{'extra'}->{'text_arg'})) {
          $result .= "\nINFO-DIR-SECTION $command->{'extra'}->{'text_arg'}\n";
        }
      } elsif ($command->{'cmdname'} eq 'direntry') {
        $result .= "START-INFO-DIR-ENTRY\n";
        my $direntry = $self->_convert($command);
        $result .= $direntry;
        $result .= "END-INFO-DIR-ENTRY\n";
      }
    }
    $self->{'ignored_commands'}->{'direntry'} = 1;
  }
  return $result;
}

sub _contents($$$)
{
  my $self = shift;
  my $section_root = shift;
  my $contents_or_shortcontents = shift;

  return ('', 0);
}

my $index_length_to_node = 41;

sub _printindex($$)
{
  my $self = shift;
  my $printindex = shift;

  my $index_name;

  if ($printindex->{'extra'} and $printindex->{'extra'}->{'misc_args'}
      and defined($printindex->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $printindex->{'extra'}->{'misc_args'}->[0];
  } else {
    return '';
  }

  # this is not redone for each index, only once
  if (!defined($self->{'index_entries'}) and $self->{'parser'}) {
    my ($index_names, $merged_indices, $index_entries)
       = $self->{'parser'}->indices_information();
    $self->{'index_entries'} = $self->Texinfo::Structuring::sort_indices($index_entries);
    $self->{'index_names'} = $index_names;
    $self->{'merged_indices'} = $merged_indices;
  }
  if (!$self->{'index_entries'} or !$self->{'index_entries'}->{$index_name}
      or ! @{$self->{'index_entries'}->{$index_name}}) {
    return '';
  }

  my $result = "\x{00}\x{08}[index\x{00}\x{08}]\n* Menu:\n\n";

  $self->_add_text_count($result);
  $self->_add_lines_count(3);

  # first determine the line numbers for the spacing of their formatting
  my %line_nrs;
  my $max_index_line_nr_string_length = 0;
  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    my $line_nr;
    if (defined ($self->{'index_entries_line_location'}->{$entry->{'command'}})) {
      $line_nr = $self->{'index_entries_line_location'}->{$entry->{'command'}}->{'lines'};
    }
    if (!defined($entry->{'node'})) {
      $line_nr = 0;
    } else {
      $line_nr = 3 if (defined($line_nr) and $line_nr < 3);
      $line_nr = 4 if (!defined($line_nr));
    }
    my $index_line_nr_string_length = 
      Texinfo::Convert::Unicode::string_width($line_nr);
    $max_index_line_nr_string_length = $index_line_nr_string_length 
     if ($max_index_line_nr_string_length < $index_line_nr_string_length);
    $line_nrs{$entry} = $line_nr;
  }

  # this is used to count entries that are the same
  my %entry_counts = ();

  # FIXME second maybe should be index_prefix of each entry?
  my $in_code = $self->{'index_names'}->{$index_name}->{$index_name};

  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    #my @keys = keys(%$entry);
    #print STDERR "$index_name $entry: @keys\n";
    my $entry_tree = {'contents' => $entry->{'content'}};
    $entry_tree->{'type'} = 'code' if ($in_code);
    my $entry_text = '';
    $entry_text .= $self->convert_line($entry_tree, {'indent' => 0});

    my $entry_nr = '';
    if (!defined($entry_counts{$entry_text})) {
      $entry_counts{$entry_text} = 0;
    } else {
      $entry_counts{$entry_text}++;
      $entry_nr = ' <'.$entry_counts{$entry_text}.'>';
    }
    my $entry_line = "* $entry_text${entry_nr}: ";
    $self->_add_text_count($entry_line);
    
    my $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    if ($line_width < $index_length_to_node) {
      my $spaces = ' ' x ($index_length_to_node - $line_width);
      $entry_line .= $spaces;
      $self->_add_text_count($spaces);
    }
    my $node_text;
    if (!defined($entry->{'node'})) {
      $node_text = $self->gdt('(outside of any node)');
    } else {
      $node_text = {'type' => 'code',
                'contents' => $entry->{'node'}->{'extra'}->{'node_content'}};
    }
    $entry_line .= $self->convert_line($node_text);
    $entry_line .= '.';
    $self->_add_text_count('.');

    $result .= $entry_line;

    my $line_nr = $line_nrs{$entry};
    my $line_nr_spaces = sprintf("%${max_index_line_nr_string_length}d", $line_nr);
    my $line_part = "(line ${line_nr_spaces})";
    $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    my $line_part_width = Texinfo::Convert::Unicode::string_width($line_part);
    if ($line_width + $line_part_width +1 > $self->{'fillcolumn'}) {
      $line_part = "\n" . ' ' x ($self->{'fillcolumn'} - $line_part_width) 
           . "$line_part\n";
      $self->_add_lines_count(1);
    } else { 
      $line_part 
        = ' ' x ($self->{'fillcolumn'} - $line_part_width - $line_width)
           . "$line_part\n";
    }
    $self->_add_lines_count(1);
    $self->_add_text_count($line_part);
    $result .= $line_part;
  }

  $result .= "\n"; 
  $self->_add_text_count("\n");
  $self->_add_lines_count(1);
  
  return $result;
}


my @directions = ('Next', 'Prev', 'Up');
sub _node($$)
{
  my $self = shift;
  my $node = shift;

  # May happen when only converting a fragment
  my $output_filename = $self->{'output_filename'};
  $output_filename = '' if (!defined($self->{'output_filename'}));

  my $result = "\x{1F}\nFile: $output_filename,  Node: ";
  $self->_add_text_count($result);
  $result .= $self->convert_line({'type' => 'code',
                           'contents' => $node->{'extra'}->{'node_content'}});
  foreach my $direction(@directions) {
    if ($node->{'node_'.lc($direction)}) {
      my $node_direction = $node->{'node_'.lc($direction)};
      my $text = ",  $direction: ";
      $self->_add_text_count($text);
      $result .= $text;
      if ($node_direction->{'extra'}->{'manual_content'}) {
        $result .= $self->convert_line({'type' => 'code',
                          'contents' => [{'text' => '('},
                             @{$node_direction->{'extra'}->{'manual_content'}},
                                          {'text' => ')'}]});
      }
      if ($node_direction->{'extra'}->{'node_content'}) {
        $result .= $self->convert_line({'type' => 'code',
                 'contents' => $node_direction->{'extra'}->{'node_content'}});
      }
    }
  }
  $result .="\n\n";
  $self->_add_text_count("\n\n");
  $self->_add_location($node);
  $self->{'count_context'}->[-1]->{'lines'} = 3;

  return $result;
}

my @image_files_extensions = ('png', 'jpg');
sub _image($$)
{
  my $self = shift;
  my $root = shift;
  my @extensions = @image_files_extensions;


  if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
    my $basefile = Texinfo::Convert::Text::convert(
      {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]});
    if (defined($root->{'extra'}->{'brace_command_contents'}->[4])) {
      my $extension = Texinfo::Convert::Text::convert(
        {'contents' => $root->{'extra'}->{'brace_command_contents'}->[4]});
      unshift @extensions, ".$extension";
      unshift @extensions, "$extension";
    }
    my $image_file;
    foreach my $extension (@extensions) {
      $image_file = 
         $self->Texinfo::Parser::_locate_include_file ($basefile.$extension);
      if (defined($image_file)) {
        last; 
      }
    }
    my $txt_file =
      $self->Texinfo::Parser::_locate_include_file ($basefile.'.txt');
    my $text = $self->_image_text($root, $basefile);
    if (defined($text)) {
      if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
        $text = '['.$text.']';
      }
    }

    my $result;

    if (defined($image_file)) {
      $image_file =~ s/\\/\\\\/g;
      $image_file =~ s/\"/\\\"/g;
      $result = "\x{00}\x{08}[image src=\"$image_file\"";

      if (defined($root->{'extra'}->{'brace_command_contents'}->[3])) {
        my $alt = Texinfo::Convert::Text::convert(
         {'contents' => $root->{'extra'}->{'brace_command_contents'}->[3]});
        $alt =~ s/\\/\\\\/g;
        $alt =~ s/\"/\\\"/g;
        $result .= " alt=\"$alt\"";
      }
      if (defined($text)) {
        $text =~ s/\\/\\\\/g;
        $text =~ s/\"/\\\"/g;
        $result .= " text=\"$text\"";
      }
      $result .= "\x{00}\x{08}]";
    } else {
      $result = $text;
    }
    if (defined($result)) {
      return $result;
    }
  }
  return '';
}

1;
