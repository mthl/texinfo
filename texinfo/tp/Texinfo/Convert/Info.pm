# Info.pm: output tree as Info.
#
# Copyright 2010, 2011 Free Software Foundation, Inc.
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

sub output($)
{
  my $self = shift;
  my $root = shift;

  my $result;

  $self->_set_outfile();
  $self->{'input_basename'} = $STDIN_DOCU_NAME if ($self->{'input_basename'} eq '-');

  # no splitting when writing to the null device or to stdout
  if ($Texinfo::Common::null_device_file{$self->get_conf('OUTFILE')} 
       or $self->get_conf('OUTFILE') eq '-') {
    $self->force_conf('SPLIT_SIZE', undef);
  }

  push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0,
                                     'locations' => []};
  my $header = $self->_info_header();
  pop @{$self->{'count_context'}};
  return undef unless $self->_create_destination_directory();

  my $header_bytes = $self->count_bytes($header);
  my $elements = Texinfo::Structuring::split_by_node($root);

  my $fh;
  if (! $self->get_conf('OUTFILE') eq '') {
    $fh = $self->Texinfo::Common::open_out ($self->get_conf('OUTFILE'), 
                                            $self->{'perl_encoding'});
    if (!$fh) {
      $self->document_error(sprintf($self->__("Could not open %s for writing: %s"),
                                    $self->get_conf('OUTFILE'), $!));
      return undef;
    }
  }
  print STDERR "DOCUMENT\n" if ($self->get_conf('DEBUG'));
  my $out_file_nr = 0;
  my @indirect_files;
  if (!defined($elements) or $elements->[0]->{'extra'}->{'no_node'}) {
    $self->document_warn($self->__("Document without nodes."));
    my $output = $header.$self->_convert($root);
    my $footnotes = $self->_footnotes();
    $output .= $footnotes;
    if ($fh) {
      print $fh $output;
    } else {
      $result = $output;
    }
  } else {
    unless ($self->{'structuring'} and $self->{'structuring'}->{'top_node'}
     and $self->{'structuring'}->{'top_node'}->{'extra'}->{'normalized'} eq 'Top') {
      $self->document_warn($self->__("Document without Top node."));
    }
    $out_file_nr = 1;
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
      if (defined($self->get_conf('SPLIT_SIZE')) 
          and $self->{'count_context'}->[-1]->{'bytes'} > 
                  $out_file_nr * $self->get_conf('SPLIT_SIZE') 
          and @nodes and $fh) {
        close ($fh);
        if ($out_file_nr == 1) {
          unless (rename ($self->get_conf('OUTFILE'), 
                          $self->get_conf('OUTFILE').'-'.$out_file_nr)) {
            $self->document_error(sprintf($self->__("Rename %s failed: %s"), 
                                         $self->get_conf('OUTFILE'), $!));
          }
          push @{$self->{'opened_files'}}, 
                   $self->get_conf('OUTFILE').'-'.$out_file_nr;
          push @indirect_files, [$self->{'output_filename'}.'-'.$out_file_nr,
                                 $first_node_bytes_count];
          #print STDERR join(' --> ', @{$indirect_files[-1]}) ."\n";
        }
        $out_file_nr++;
        $fh = $self->Texinfo::Common::open_out (
                               $self->get_conf('OUTFILE').'-'.$out_file_nr, 
                               $self->{'perl_encoding'});
        if (!$fh) {
           $self->document_error(sprintf(
                  $self->__("Could not open %s for writing: %s"),
                  $self->get_conf('OUTFILE').'-'.$out_file_nr, $!));
           return undef;
        }
        print $fh $header;
        $self->{'count_context'}->[-1]->{'bytes'} += $header_bytes;
        push @indirect_files, [$self->{'output_filename'}.'-'.$out_file_nr,
                               $self->{'count_context'}->[-1]->{'bytes'}];
        #print STDERR join(' --> ', @{$indirect_files[-1]}) ."\n";
      }
    }
  }
  my $tag_text = '';
  if ($out_file_nr > 1) {
    close ($fh);
    $fh = $self->Texinfo::Common::open_out($self->get_conf('OUTFILE'), 
                                           $self->{'perl_encoding'});
    if (!$fh) {
      $self->document_error(sprintf(
            $self->__("Could not open %s for writing: %s"),
            $self->get_conf('OUTFILE'), $!));
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
  # This may happen for anchors in @insertcopying
  my %seen_anchors;
  foreach my $label (@{$self->{'count_context'}->[-1]->{'locations'}}) {
    next unless ($label->{'root'} and $label->{'root'}->{'extra'} 
                  and defined($label->{'root'}->{'extra'}->{'normalized'}));
    my $prefix;
    if ($label->{'root'}->{'cmdname'} eq 'node') {
      $prefix = 'Node';
    } else {
      if ($seen_anchors{$label->{'root'}->{'extra'}->{'normalized'}}) {
        $self->line_error(sprintf($self->__("\@%s `%s' output more than once"),
                       $label->{'root'}->{'cmdname'},
                 Texinfo::Convert::Texinfo::convert({'contents' =>
                      $label->{'root'}->{'extra'}->{'node_content'}})),
                      $label->{'root'}->{'line_nr'});
         next;
      } else {
        $seen_anchors{$label->{'root'}->{'extra'}->{'normalized'}} = $label;
      }
      $prefix = 'Ref';
    }
    push @{$self->{'count_context'}}, {'lines' => 0, 'bytes' => 0};
    my $label_text = _normalize_top_node($self->convert_line({'type' => 'code',
      'contents' => $label->{'root'}->{'extra'}->{'node_content'}}));
    pop @{$self->{'count_context'}};
    $tag_text .=  "$prefix: $label_text\x{7F}$label->{'bytes'}\n";
  }
  $tag_text .=  "\x{1F}\nEnd Tag Table\n";
  my $coding = $self->{'encoding_name'};
  if ($coding) {
    $tag_text .= "\n\x{1F}\nLocal Variables:\ncoding: $coding\nEnd:\n";
  }
  if ($fh) {
    print $fh $tag_text;
    close ($fh);
  } else {
    $result .= $tag_text;
  }
  return $result;
}

sub _info_header($)
{
  my $self = shift;

  # FIXME version/program
  #my $text = "This is $self->{'output_filename'}, produced by makeinfo version 4.13 from $self->{'input_basename'}.";
  my $paragraph = Texinfo::Convert::Paragraph->new();
  #my $result = $paragraph->add_text($text);
  my $result = $paragraph->add_text("This is ");
  # This ensures that spaces in file are kept.
  $result .= $paragraph->add_next($self->{'output_filename'});
  # FIXME version/program
  $result .= $paragraph->add_text(', produced by makeinfo version 4.13 from ');
  $result .= $paragraph->add_next($self->{'input_basename'});
  $result .= $paragraph->add_text('.');
  $result .= $paragraph->end();
  $result .= "\n";
  $self->{'empty_lines_count'} = 1;

  if ($self->{'extra'} and $self->{'extra'}->{'copying'}) {
    print STDERR "COPYING HEADER\n" if ($self->get_conf('DEBUG'));
    $self->_set_global_multiple_commands();
    $self->{'in_copying_header'} = 1;
    my $copying = $self->_convert({'contents' => 
          $self->{'extra'}->{'copying'}->{'contents'}});
    $result .= $copying;
    $result .= $self->_footnotes();
    delete $self->{'in_copying_header'};
    $self->_unset_global_multiple_commands();
  }
  if ($self->{'info'}->{'dircategory_direntry'}) {
    $self->{'ignored_commands'}->{'direntry'} = 0;
    foreach my $command (@{$self->{'info'}->{'dircategory_direntry'}}) {
      if ($command->{'cmdname'} eq 'dircategory') {
        if ($command->{'extra'} 
            and defined($command->{'extra'}->{'misc_content'})) {
          my $dircategory = "INFO-DIR-SECTION ".$self->convert_line(
             {'contents' => $command->{'extra'}->{'misc_content'}});
          $result .= $self->ensure_end_of_line($dircategory);
        }
        $self->{'empty_lines_count'} = 0;
      } elsif ($command->{'cmdname'} eq 'direntry') {
        $result .= "START-INFO-DIR-ENTRY\n";
        my $direntry = $self->_convert($command);
        $result .= $direntry;
        $result .= "END-INFO-DIR-ENTRY\n\n";
        $self->{'empty_lines_count'} = 1;
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

  # this is not redone for each index, only once
  if (!defined($self->{'index_entries'}) and $self->{'parser'}) {

    my ($index_names, $merged_indices, $index_entries)
       = $self->{'parser'}->indices_information();
    my $merged_index_entries 
      = Texinfo::Structuring::merge_indices($index_names, $merged_indices,
                                            $index_entries);
    $self->{'index_entries'} 
      = $self->Texinfo::Structuring::sort_indices($merged_index_entries,
                                                  $index_names);
    $self->{'index_names'} = $index_names;
  }
  if (!$self->{'index_entries'} or !$self->{'index_entries'}->{$index_name}
      or ! @{$self->{'index_entries'}->{$index_name}}) {
    return '';
  }

  my $result = '';
  $result .= $self->_add_newline_if_needed();
  my $heading = "\x{00}\x{08}[index\x{00}\x{08}]\n* Menu:\n\n";

  $result .= $heading;
  $self->_add_text_count($heading);
  $self->_add_lines_count(3);

  # first determine the line numbers for the spacing of their formatting
  my %line_nrs;
  my %entry_nodes;
  my $max_index_line_nr_string_length = 0;
  my %ignored_entries;
  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    my $line_nr;

    if (defined ($self->{'index_entries_line_location'}->{$entry->{'command'}})) {
      $line_nr = $self->{'index_entries_line_location'}->{$entry->{'command'}}->{'lines'};
      # ignore index entries in special regions that haven't been seen
    } elsif ($entry->{'region'}) {
      $ignored_entries{$entry} = 1;
      next;
    }

    my $node;
    if (defined($entry->{'node'})) {
      $node = $entry->{'node'};
    } elsif (defined($self->{'index_entries_line_location'}->{$entry->{'command'}}->{'node'})) {
      $node = $self->{'index_entries_line_location'}->{$entry->{'command'}}->{'node'};
    }
    $entry_nodes{$entry} = $node;
    if (!defined($node)) {
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

  # this is used to count entries that are the same
  my %entry_counts = ();

  foreach my $entry (@{$self->{'index_entries'}->{$index_name}}) {
    #my @keys = keys(%$entry);
    #print STDERR "$index_name $entry: @keys\n";
    next if ($ignored_entries{$entry});
    my $entry_tree = {'contents' => $entry->{'content'}};
    if ($entry->{'in_code'}) {
      $entry_tree->{'type'} = 'code';
    } else {
      $entry_tree->{'type'} = 'frenchspacing';
    }
    my $entry_text = '';
    $entry_text .= $self->convert_line($entry_tree, {'indent' => 0});
    next if ($entry_text !~ /\S/);
    if ($entry_text =~ /:/) {
      $self->line_warn (sprintf($self->__("Index entry in \@%s with : produces invalid Info: %s"),
                                 $entry->{'index_at_command'},
          Texinfo::Convert::Texinfo::convert($entry_tree)), 
                        $entry->{'command'}->{'line_nr'});
    }

    my $entry_nr = '';
    if (!defined($entry_counts{$entry_text})) {
      $entry_counts{$entry_text} = 0;
    } else {
      $entry_counts{$entry_text}++;
      $entry_nr = ' <'.$entry_counts{$entry_text}.'>';
      $self->_add_text_count($entry_nr);
    }
    my $entry_line = "* $entry_text${entry_nr}: ";
    $self->_add_text_count("* ".": ");
    #$self->_add_text_count($entry_line);
    
    my $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    if ($line_width < $index_length_to_node) {
      my $spaces = ' ' x ($index_length_to_node - $line_width);
      $entry_line .= $spaces;
      $self->_add_text_count($spaces);
    }
    my $node_text;
    my $node = $entry_nodes{$entry};

    if (!defined($node)) {
      $node_text = $self->gdt('(outside of any node)');
      # Warn, but only once.
      # FIXME when outside of sectioning commands this message was already
      # done by the Parser.
      if (!$self->{'index_entries_no_node'}->{$entry}) {
        $self->line_warn (sprintf($self->__("Entry for index `%s' outside of any node"),
                                 $index_name), $entry->{'command'}->{'line_nr'});
        $self->{'index_entries_no_node'}->{$entry} = 1;
      }
    } else {
      $node_text = {'type' => 'code',
                'contents' => $node->{'extra'}->{'node_content'}};
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

sub _error_outside_of_any_node($$)
{
  my $self = shift;
  my $root = shift;
  if (!$self->{'node'}) {
    $self->line_warn(sprintf($self->__("\@%s outside of any node"),
                     $root->{'cmdname'}), $root->{'line_nr'});
  }
}

sub _normalize_top_node($)
{
  my $node = shift;
  if ($node =~ /^top$/i) {
    return 'Top';
  }
  return $node;
}

my @directions = ('Next', 'Prev', 'Up');
sub _node($$)
{
  my $self = shift;
  my $node = shift;
  
  my $result = '';
  return '' if (!defined($node->{'extra'}->{'normalized'}));
  if (!$self->{'empty_lines_count'}) {
    $result .= "\n";
    $self->_add_text_count("\n");
  }

  # May happen when only converting a fragment
  my $output_filename = $self->{'output_filename'};
  if (defined($self->{'output_filename'})) {
    $output_filename = $self->{'output_filename'};
  } else {
    $output_filename = '';
  }

  $self->_add_location($node);
  my $node_begin = "\x{1F}\nFile: $output_filename,  Node: ";
  $result .= $node_begin;
  $self->_add_text_count($node_begin);
  my $node_text = _normalize_top_node($self->convert_line({'type' => 'code',
                           'contents' => $node->{'extra'}->{'node_content'}}));
  $result .= $node_text;
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
        $result .= _normalize_top_node($self->convert_line({'type' => 'code',
                 'contents' => $node_direction->{'extra'}->{'node_content'}}));
      }
    }
  }
  $result .="\n\n";
  $self->_add_text_count("\n\n");
  $self->{'count_context'}->[-1]->{'lines'} = 3;
  $self->{'empty_lines_count'} = 1;

  return $result;
}

my @image_files_extensions = ('.png', '.jpg');
sub _image($$)
{
  my $self = shift;
  my $root = shift;
  my @extensions = @image_files_extensions;

  my $lines_count = 0;

  if (defined($root->{'extra'}->{'brace_command_contents'}->[0])) {
    my $basefile = Texinfo::Convert::Text::convert(
      {'contents' => $root->{'extra'}->{'brace_command_contents'}->[0]},
      {'code' => 1});
    if (defined($root->{'extra'}->{'brace_command_contents'}->[4])) {
      my $extension = Texinfo::Convert::Text::convert(
        {'contents' => $root->{'extra'}->{'brace_command_contents'}->[4]},
        {'code' => 1});
      unshift @extensions, ".$extension";
      unshift @extensions, "$extension";
    }
    my $image_file;
    foreach my $extension (@extensions) {
      if ($self->Texinfo::Common::locate_include_file ($basefile.$extension)) {
        # use the basename and not the file found.  It is agreed that it is
        # better, since in any case the files are moved.
        $image_file = $basefile.$extension;
        last; 
      }
    }
    my $text = $self->_image_text($root, $basefile);
    if (defined($text)) {
      if (!$self->{'formatters'}->[-1]->{'_top_formatter'}) {
        $text = '['.$text.']';
      }
    } elsif (!defined($image_file)) {
      $self->line_warn(sprintf($self->__("Cannot find \@image file `%s.txt'"), $basefile), $root->{'line_nr'});
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
      if ($self->{'formatters'}->[-1]->{'_top_formatter'}) {
        $result .= "\n";
      }
    } elsif (defined($text)) {
      $result = $text;
      $lines_count = ($result =~ tr/\n/\n/);
    }
    if (defined($result)) {
      return ($result, $lines_count);
    }
  }
  return ('', 0);
}

1;
