# -*-perl-*-
#+##############################################################################
#
# utf8.pm: convert accented letters to utf8
#
# This style doesn't work when outputting info.
#
#    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
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
set_default('USE_ISO', 0);
set_from_init_file('ENCODING_NAME', 'utf-8');

use Encode;
use Unicode::Normalize;

foreach my $key (keys(%unicode_accents), 'dotless')
{
    $style_map{$key}->{'function'} = \&t2h_utf8_accent;
    $style_map_texi{$key}->{'function'} = \&t2h_utf8_accent;
    $style_map_pre{$key}->{'function'} = \&t2h_utf8_accent;
}

foreach my $key (%things_map)
{
    if (exists($unicode_map{$key}) and ($unicode_map{$key} ne ''))
    {
        $things_map{$key} = chr(hex($unicode_map{$key}));
        $texi_map{$key} = chr(hex($unicode_map{$key}));
        $sorting_things_map{$key} = chr(hex($unicode_map{$key}));
        $pre_map{$key} = chr(hex($unicode_map{$key}));
    }
}

$normal_text       = \&t2h_utf8_normal_text;

1;
