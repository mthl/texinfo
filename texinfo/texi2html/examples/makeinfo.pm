# -*-perl-*-
#+##############################################################################
#
# makeinfo.pm: output html in the makeinfo style.
#
# This is obsoleted and irrelevant now, in 2010 (though still used in some 
# tests) since a makeinfo-like default is used when called as makeinfo or 
# texi2any.
#
#    Copyright (C) 2003, 2005, 2008 Free Software Foundation, Inc.
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
# Originally written by Patrice Dumas.
#
#-##############################################################################

#html_default_load();
t2h_default_load_format('html');

set_default('TOP_FILE', 'index.html');

set_default('SHOW_MENU', 1);

set_default('USE_NODES', 1);

set_default('SPLIT', 'node');

set_default('NODE_FILES', 1);

set_default('USE_SETFILENAME', 1);

set_default('HEADERS', 1);

set_default('SHORT_REF', 1);

set_default('NODE_NAME_IN_MENU', 1);

set_default('NODE_NAME_IN_INDEX', 0);

set_default('AVOID_MENU_REDUNDANCY', 0);

set_default('SPLIT_INDEX', 0);

$MENU_SYMBOL = '*';

set_default('WORDS_IN_PAGE', 200);

set_default('footnotestyle', 'end');

set_default('USE_ACCESSKEY', 1);

set_default('USE_REL_REV', 1);

set_default('USE_LINKS', 1);

set_default('INLINE_CONTENTS', 1);

set_default('OVERVIEW_LINK_TO_TOC', 1);

if (get_conf('HEADER_IN_TABLE'))
{
    @SECTION_BUTTONS =
    (
     \"node: ", \$Texi2HTML::NODE{This}, [ 'NodeNext', \$Texi2HTML::NODE{NodeNext} ] , \",", [ 'NodePrev', \$Texi2HTML::NODE{NodePrev} ], \",", [ 'NodeUp', \$Texi2HTML::NODE{NodeUp} ], 'NodeForward'
    );

    @TOP_BUTTONS = @SECTION_BUTTONS;
    @MISC_BUTTONS = @SECTION_BUTTONS;
}

push @command_handler_process, \&makeinfo_like_initialize_variables;

my $makekinfo_like_footnote_absolute_number;
my %makekinfo_like_paragraph_in_footnote_nr;

sub makeinfo_like_initialize_variables()
{
   $makekinfo_like_footnote_absolute_number = 0;
   %makekinfo_like_paragraph_in_footnote_nr = ();
}

my $default_init_out = $init_out;
$init_out = \&makeinfo_like_init_out;

sub makeinfo_like_init_out()
{
   &$default_init_out();
   $NAVIGATION_TEXT{'NodeForward'} = ' &gt; ';
}

# FIXME: images not in paragraphs are in <div class="block-image">


$foot_line_and_ref  = \&makeinfo_like_foot_line_and_ref;
$foot_section       = \&makeinfo_like_foot_lines;
$paragraph          = \&makeinfo_like_paragraph;
$index_summary      = \&makeinfo_like_index_summary;
$summary_letter     = \&makeinfo_like_summary_letter;
$index_entry        = \&makeinfo_like_index_entry;
$index_letter       = \&makeinfo_like_index_letter;
$print_index        = \&makeinfo_like_print_index;
$listoffloats       = \&makeinfo_like_listoffloats;
$listoffloats_entry = \&makeinfo_like_listoffloats_entry;
$menu_link          = \&makeinfo_like_menu_link;
$menu_description   = \&makeinfo_like_menu_description;
$menu_comment       = \&makeinfo_like_menu_comment;
$menu               = \&makeinfo_like_menu;

sub makeinfo_like_foot_line_and_ref($$$$$$$$)
{
    my $foot_num = shift;
    my $relative_num = shift;
    my $footid = shift;
    my $docid = shift;
    my $from_file = shift;
    my $footnote_file = shift;
    my $lines = shift;
    my $state = shift;
    
    $makekinfo_like_footnote_absolute_number++;

    # this is a bit obscure, this allows to add an anchor only if formatted
    # as part of the document.
    $docid = '' if ($state->{'outside_document'} or $state->{'multiple_pass'});

    if ($from_file eq $footnote_file)
    { 
        $from_file = $footnote_file = '';
    }

    my $foot_anchor = "<sup>" . &$anchor($docid, "$footnote_file#$footid", $relative_num) . "</sup>";
    $foot_anchor = &$anchor($docid, "$footnote_file#$footid", "($relative_num)") if ($state->{'preformatted'});

    return ($lines, $foot_anchor);
}

sub makeinfo_like_foot_lines($)
{
    my $lines = shift;
    unshift @$lines, "<div class=\"footnote\">\n<hr>\n<h4>". gdt('Footnotes') ."</h4>\n";
    push (@$lines, "</div>\n");
    return $lines;
}

sub makeinfo_like_paragraph ($$$$$$$$$$$$$)
{
    my $text = shift;
    my $align = shift;
    my $indent = shift;
    my $paragraph_command = shift;
    my $paragraph_command_formatted = shift;
    my $paragraph_number = shift;
    my $format = shift;
    my $item_nr = shift;
    my $enumerate_style = shift;
    my $number = shift;
    my $command_stack_at_end = shift;
    my $command_stack_at_begin = shift;
    my $state = shift;
#print STDERR "format: $format\n" if (defined($format));
#print STDERR "paragraph @$command_stack_at_end; @$command_stack_at_begin\n";
    #$paragraph_command_formatted = '' if (!defined($paragraph_command_formatted) or
    #      exists($special_list_commands{$format}->{$paragraph_command}));
    return '' if ($text =~ /^\s*$/);
    if (defined($paragraph_number) and defined($$paragraph_number))
    {
         $$paragraph_number++;
         return $text  if (($format eq 'itemize' or $format eq 'enumerate') and
            ($$paragraph_number == 1));
    }
    my $open = '<p';
    if ($align)
    {
        $open .= " align=\"$paragraph_style{$align}\"";
    }

    my $footnote_text = '';
    if (defined($command_stack_at_begin->[0]) and $command_stack_at_begin->[0] eq 'footnote')
    {
        my $state = $Texi2HTML::THISDOC{'state'};
        $makekinfo_like_paragraph_in_footnote_nr{$makekinfo_like_footnote_absolute_number}++;
        if ($makekinfo_like_paragraph_in_footnote_nr{$makekinfo_like_footnote_absolute_number} <= 1)
        {
           $open.=' class="footnote"';
           my $document_file = $state->{'footnote_document_file'};
           if ($document_file eq $state->{'footnote_footnote_file'})
           {
               $document_file = '';
           }
           my $docid = $state->{'footnote_place_id'};
           my $doc_state = $state->{'footnote_document_state'};
           $docid = '' if ($doc_state->{'outside_document'} or $doc_state->{'multiple_pass'});
           my $foot_label = &$anchor($state->{'footnote_footnote_id'}, 
                 $document_file . "#$state->{'footnote_place_id'}", 
                 "$state->{'footnote_number_in_page'}");
           $footnote_text = "<small>[${foot_label}]</small> ";
        }
    }

    $text = $footnote_text.$text;

    my $top_stack = '';
    $top_stack = $command_stack_at_begin->[-1] if (scalar (@$command_stack_at_begin));
    if ($top_stack eq 'multitable')
# FIXME
# paragraph_number is not by cell, so it is not possible to know if it
# is the first paragraph in cell. Also currently there is no hook for a
# cell beginning which means that it is not possible to reset the cell 
# paragraph count at a cell beginning
# and (!defined($paragraph_number) or !defined($$paragraph_number) or $$paragraph_number == 1))
    {
       return $text;
    }

    return $open.'>'.$text.'</p>';
}


sub makeinfo_like_index_summary
{
    return '';
}

sub makeinfo_like_summary_letter
{
    return '';
}

sub makeinfo_like_index_entry($$$$$$$$$$)
{
    my $text_href = shift;
    my $entry = shift;
    my $element_href = shift;
    my $element_text = shift;
    my $entry_file = shift;
    my $current_element_file = shift;
    my $entry_target = shift;
    my $entry_element_target = shift;
    my $in_region_not_in_output = shift;
    my $index_entry_ref = shift;

    return '' if ($entry !~ /\S/);
    my $element = $index_entry_ref->{'real_element'};
    if (defined($element))
    {
       my $element_set = 0;
       if (get_conf('NODE_NAME_IN_INDEX'))
       {
           if ($element->{'node'})
           {
               $element_set = 1;
           }
           elsif ($element->{'with_node'})
           {
               $element = $element->{'with_node'};
               $element_set = 1;
           }
       }
       elsif (defined(get_conf('NODE_NAME_IN_INDEX')))
       {
           if (!$element->{'node'})
           {
               $element_set = 1;
           }
           elsif ($element->{'with_section'})
           {
               $element = $element->{'with_section'};
               $element_set = 1;
           }
       }
       if ($element_set)
       {
           $element_href = main::href($element, $Texi2HTML::THIS_ELEMENT->{'file'},
                 $Texi2HTML::THISDOC{'line_nr'});
           $element_text = $element->{'text'};
       }
    }

    
    return '<li>' . $entry . ': ' .  &$anchor('', $element_href, $element_text)
    . "</li>\n";
}

sub makeinfo_like_index_letter($$$)
{
     my $letter = shift;
     my $id = shift;
     my $text = shift;
     return $text;
}

sub makeinfo_like_print_index($$)
{
    my $text = shift;
    my $name = shift;
    return '' if (!defined($text));
    return "<ul class=\"index-$name\" compact>\n" . $text . "</ul>\n";
}

sub makeinfo_like_listoffloats_entry($$$$)
{
    my $style_texi = shift;
    my $float = shift;
    my $float_style = shift;
    my $caption = shift;
    my $href = shift;

    if ($caption ne '')
    {
        return '<li>' . gdt('{href}: {caption}', { 'href' => &$anchor('', $href, $float_style), 'caption' => $caption }) . "</li>\n";
    }
    else
    {
        return '<li>' . &$anchor('', $href, $float_style) . "</li>\n";
    }
}

sub makeinfo_like_listoffloats($$$)
{
    my $style_texi = shift;
    my $style = shift;
    my $float_entries = shift;

    my $result = "<ul class=\"listoffloats\">\n" ;
    foreach my $float_entry (@$float_entries)
    {
         $result .= $float_entry;
    }
    return $result . "</ul>\n";
}

# a whole menu
#
# argument:
# the whole menu text (entries and menu comments)
#
# argument:
# whole menu text.
sub makeinfo_like_menu($)
{
    my $text = shift;
    $menu_entry_index=0;
    if ($text =~ /\S/)
    {
        return "<ul>\n" 
        . $text . "</ul>\n";
    }
}

# formats a menu entry link pointing to a node or section 
#
# arguments:
# the entry text
# the state, a hash reference holding informations about the context, with a 
#     usefull entry, 'preformatted', true if we are in a preformatted format
#     (a format keeping space between words). In that case a function
#     of the main program, main::do_preformatted($text, $state) might 
#     be used to format the text with the current format style.
# href is optionnal. It is the reference to the section or the node anchor
#     which should be used to make the link (typically it is the argument 
#     of a href= attribute in a <a> element).
sub makeinfo_like_menu_link($$$$$$$)
{
    my $entry = shift;
    my $state = shift;
    my $href = shift;
    my $node = shift;
    my $title = shift;
    my $ending = shift;
    my $has_title = shift;
    $title = '' unless ($has_title);
    if (($entry eq '') or get_conf('NODE_NAME_IN_MENU') or $state->{'preformatted'})
    {
        
        $title .= ':' if ($title ne '');
        $entry = "$title$node";
    }
    $menu_entry_index++;
    my $accesskey;
    $accesskey = "accesskey=\"$menu_entry_index\"" if (get_conf('USE_ACCESSKEY') and ($menu_entry_index < 10));
    $entry = &$anchor ('', $href, $entry, $accesskey) if (defined($href));
#    if ($state->{'preformatted'})
#    {
#        return '<li>' . main::do_preformatted($entry . $ending, $state);
#    }
    return "<li> $entry";
}

# formats a menu entry description, ie the text appearing after the node
# specification in a menu entry an spanning until there is another
# menu entry, an empty line or some text at the very beginning of the line
# (we consider that text at the beginning of the line begins a menu comment) 
#
# arguments:
# the description text
# the state. See menu_entry.
sub makeinfo_like_menu_description($$)
{
    my $text = shift;
    my $state = shift;
#    if ($state->{'preformatted'})
#    {
#        return main::do_preformatted($text, $state) . '</td></tr>';
#    }
    return "$text</li>\n";
}

1;
