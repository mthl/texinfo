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
require 5.0;

#package Texi2HTML::Config;

#use strict;
sub set_encoding($)
{
    my $encoding = shift;
    main::echo_warn("Nothing specific done for encodings (due to the perl version)");
    return undef;
}

use vars qw(%cross_ref_texi_map %cross_ref_simple_map_texi
            %cross_ref_style_map_texi);

%cross_ref_texi_map = %texi_map;
%cross_ref_simple_map_texi = %simple_map_texi;
%cross_ref_style_map_texi = ();

foreach my $command (keys(%style_map_texi))
{
    $cross_ref_style_map_texi{$command} = {}; 
    foreach my $key (keys (%{$style_map_texi{$command}}))
    {
#print STDERR "$command, $key, $style_map_texi{$command}->{$key}\n";
         $cross_ref_style_map_texi{$command}->{$key} = 
              $style_map_texi{$command}->{$key};
    }
}

foreach my $key (keys(%unicode_map))
{
    if ($unicode_map{$key} ne '')
    {
        $cross_ref_texi_map{$key} = '_' . lc($unicode_map{$key});
    }
}

$cross_ref_simple_map_texi{"\n"} = ' ';

foreach my $key (keys(%cross_ref_style_map_texi))
{
    if (($unicode_accents{$key} or ($key eq 'tieaccent') or ($key eq 'dotless')) 
        and (ref($cross_ref_style_map_texi{$key}) eq 'HASH'))
    {
        $cross_ref_style_map_texi{$key}->{'function'} = \&cross_manual_accent;
    }
}

# This function is used to construct a link name from a node name as 
# described in the proposal I posted on texinfo-pretest.
sub cross_manual_links($$)
{
    my $nodes_hash = shift;
    my $cross_reference_hash = shift;

    $main::simple_map_texi_ref = \%cross_ref_simple_map_texi;
    $main::style_map_texi_ref = \%cross_ref_style_map_texi;
    $main::texi_map_ref = \%cross_ref_texi_map;
    my $normal_text_kept = $normal_text;
    $normal_text = \&cross_manual_normal_text;
    foreach my $key (keys(%$nodes_hash))
    {
        my $node = $nodes_hash->{$key};
        next if ($node->{'index_page'});
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
            unless ($node->{'external_node'})
            {
                if (defined($cross_reference_hash->{$node->{'cross_manual_target'}}))
                {
                    main::echo_error("Node equivalent with `$node->{'texi'}' allready used `$cross_reference_hash->{$node->{'cross_manual_target'}}'");
                }
                else 
                {
                    $cross_reference_hash->{$node->{'cross_manual_target'}} = $node->{'texi'};
                }
            }
            #print STDERR "$node->{'texi'}: $node->{'cross_manual_target'}\n";
        }
    }
    $normal_text = $normal_text_kept;
    $main::simple_map_texi_ref = \%simple_map_texi;
    $main::style_map_texi_ref = \%style_map_texi;
    $main::texi_map_ref = \%texi_map;
}

sub t2h_cross_manual_line($)
{
    my $text = shift;
    $main::simple_map_texi_ref = \%cross_ref_simple_map_texi;
    $main::style_map_texi_ref = \%cross_ref_style_map_texi;
    $main::texi_map_ref = \%cross_ref_texi_map;
    my $normal_text_kept = $normal_text;
    $normal_text = \&cross_manual_normal_text;
    
    my $cross_ref = main::remove_texi($text);

    $normal_text = $normal_text_kept;
    $main::simple_map_texi_ref = \%simple_map_texi;
    $main::style_map_texi_ref = \%style_map_texi;
    $main::texi_map_ref = \%texi_map;
    return $cross_ref;
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

1;
