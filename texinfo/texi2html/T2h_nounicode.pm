#+##############################################################################
#
# T2h_unicode.pm: Handle unicode for perl version not supporting it
#
#    Copyright (C) 2003  Free Software Foundation, Inc.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#-##############################################################################

# This requires perl version 5 or higher
require 5.008;

#package Texi2HTML::Config;

#use strict;
sub set_encoding($)
{
    my $encoding = shift;
    main::echo_warn("Nothing specific done for encodings (due to the perl version)");
    return undef;
}


# This function is used to construct a link name from a node name as 
# described in the proposal I posted on texinfo-pretest.
sub cross_manual_links($$)
{
    my $nodes_hash = shift;
    my $cross_reference_hash = shift;
    my %texi_map_kept = %texi_map;
    foreach my $key (keys(%unicode_map))
    {
        if ($unicode_map{$key} ne '')
        {
            $texi_map{$key} = '_' . lc($unicode_map{$key});
        }
    }
    my %kept_accents = ();
    foreach my $key (keys(%style_map_texi))
    {
        if (($main::style_type{$key} eq 'accent') and (ref($style_map_texi{$key}) eq 'HASH'))
        {
            $kept_accents{$key} = $style_map_texi{$key}->{'function'};
            $style_map_texi{$key}->{'function'} = \&cross_manual_accent;
        }
    }
    my %simple_map_kept = %simple_map_texi;
    $simple_map_texi{"\n"} = ' ';

    my $normal_text_kept = $normal_text;
    my $protect_text_kept = $protect_text;
    $normal_text = \&cross_manual_normal_text;
    #$protect_text = \&cross_manual_protect_text;
    foreach my $key (keys(%$nodes_hash))
    {
        my $node = $nodes_hash->{$key};
        next if ($node->{'external_node'} or $node->{'index_page'});
        if (!defined($node->{'texi'}))
        {
            # begin debug section 
            foreach my $key (keys(%$node))
            {
                #print STDERR "$key:$node->{$key}!!!\n";
            }
            # end debug section 
        }
        else 
        {
            $node->{'cross_manual_target'} = main::remove_texi($node->{'texi'});
            if (defined($cross_reference_hash->{$node->{'cross_manual_target'}}))
            {
                main::echo_error("Node equivalent with `$node->{'texi'}' allready used `$cross_reference_hash->{$node->{'cross_manual_target'}}'");
            }
            else 
            {
                $cross_reference_hash->{$node->{'cross_manual_target'}} = $node->{'texi'};
            }
            #print STDERR "$node->{'texi'}: $node->{'cross_manual_target'}\n";
        }
    }
    %texi_map = %texi_map_kept;
    %simple_map_texi = %simple_map_kept;
    foreach my $key (keys(%kept_accents))
    {
         $style_map_texi{$key}->{'function'} = $kept_accents{$key};
    }
    $normal_text = $normal_text_kept;
    #$protect_text = $protect_text_kept;
}

sub cross_manual_accent($$)
{
    my $accent = shift;
    my $args = shift;
                                                                                
    my $text = $args->[0];

    return '_' . lc($unicode_accents{$accent}->{$text})
        if (defined($unicode_accents{$accent}->{$text}));
    return ($text . '_' . lc($unicode_diacritical{$accent})) 
        if (defined($unicode_diacritical{$accent}));
    return ascii_accents($text, $accent);
}

sub cross_manual_normal_text($)
{
   my $text = shift;
   $text = main::normalise_space($text);
   my $result = '';
   while ($text ne '')
   {
        if ($text =~ s/^([A-Za-z0-9]+)//o)
        {
             $result .= $1;
        }
        elsif ($text =~ s/^ //o)
        {
             $result .= '-';
        }
        elsif ($text =~ s/^(.)//o)
        {
             if (exists($ascii_character_map{$1}))
             {
                  $result .= '_' . lc($ascii_character_map{$1});
             }
             else
             {
                  $result .= '_' . '00' . lc(sprintf("%02x",ord($1)));
             }
        }
        else
        {
             print STDERR "Bug: unknown character in node (likely in infinite loop)\n";
             sleep 1;
        }    
   }
   
   return $result;
}

#sub cross_manual_normal_text($)
#{
#    my $text = shift;
#    return $text;
#}

1;
