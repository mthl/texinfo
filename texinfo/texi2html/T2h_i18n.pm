#+##############################################################################
#
# T2h_i18n.pm: Internationalization for texi2html
#
#    Copyright (C) 1999, 2000  Free Software Foundation, Inc.
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

package T2h_i18n;

use strict;

our (@ISA, @EXPORT);

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw($T2H_WORDS pretty_date);
use vars qw(
           $T2H_LANGUAGES
);

########################################################################
# Language dependencies:
# To add a new language extend T2H_WORDS hash and create $T2H_<...>_WORDS hash
# To redefine one word, simply do:
# $T2h_i18n::T2H_LANGUAGES->{<language>}->{<word>} = 'whatever' in your personal init file.
#
my $T2H_WORDS_EN =
{
 # titles  of pages
 'ToC_Title'       => 'Table of Contents',
 'Overview_Title'  => 'Short Table of Contents',
 'Index_Title'     => 'Index',
 'About_Title'     => 'About This Document',
 'Footnotes_Title' => 'Footnotes',
 'See'             => 'See',
 'see'             => 'see',
 'section'         => 'section',
 # If necessary, we could extend this as follows:
 #  # text for buttons
 #  'Top_Button' => 'Top',
 #  'ToC_Button' => 'Contents',
 #  'Overview_Button' => 'Overview',
 #  'Index_button' => 'Index',
 #  'Back_Button' => 'Back',
 #  'FastBack_Button' => 'FastBack',
 #  'Prev_Button' => 'Prev',
 #  'Up_Button' => 'Up',
 #  'Next_Button' => 'Next',
 #  'Forward_Button' =>'Forward',
 #  'FastWorward_Button' => 'FastForward',
 #  'First_Button' => 'First',
 #  'Last_Button' => 'Last',
 #  'About_Button' => 'About'
};

my $T2H_WORDS_DE =
{
 'ToC_Title'       => 'Inhaltsverzeichniss',
 'Overview_Title'  => 'Kurzes Inhaltsverzeichniss',
 'Index_Title'     => 'Index',
 'About_Title'     => '&Uuml;ber dieses Dokument',
 'Footnotes_Title' => 'Fu&szlig;noten',
 'See'             => 'Siehe',
 'see'             => 'siehe',
 'section'         => 'Abschnitt',
};

my $T2H_WORDS_NL =
{
 'ToC_Title'       => 'Inhoudsopgave',
 'Overview_Title'  => 'Korte inhoudsopgave',
 'Index_Title'     => 'Index',      #Not sure ;-)
 'About_Title'     => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!', #No translation available!
 'See'             => 'Zie',
 'see'             => 'zie',
 'section'         => 'sectie',
};

my $T2H_WORDS_ES =
{
 'ToC_Title'       => '&iacute;ndice General',
 'Overview_Title'  => 'Resumen del Contenido',
 'Index_Title'     => 'Index',      #Not sure ;-)
 'About_Title'     => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'Fu&szlig;noten',
 'See'             => 'V&eacute;ase',
 'see'             => 'v&eacute;ase',
 'section'         => 'secci&oacute;n',
};

my $T2H_WORDS_NO =
{
 'ToC_Title'       => 'Innholdsfortegnelse',
 'Overview_Title'  => 'Kort innholdsfortegnelse',
 'Index_Title'     => 'Indeks',     #Not sure ;-)
 'About_Title'     => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!',
 'See'             => 'Se',
 'see'             => 'se',
 'section'         => 'avsnitt',
};

my $T2H_WORDS_PT =
{
 'ToC_Title'       => 'Sum&aacute;rio',
 'Overview_Title'  => 'Breve Sum&aacute;rio',
 'Index_Title'     => '&Iacute;ndice', #Not sure ;-)
 'About_Title'     => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!',
 'See'             => 'Veja',
 'see'             => 'veja',
 'section'         => 'Se&ccedil;&atilde;o',
};

my $T2H_WORDS_FR =
{
 'ToC_Title'       => 'Table des mati&egrave;res',
 'Overview_Title'  => 'R&eacute;sum&eacute;e du contenu',
 'Index_Title'     => 'Index',
 'About_Title'     => 'A propos de ce document',
 'Footnotes_Title' => 'Notes de bas de page',
 'See'             => 'Voir',
 'see'             => 'voir',
 'section'         => 'section',
};

$T2H_LANGUAGES =
{
 'en' => $T2H_WORDS_EN,
 'de' => $T2H_WORDS_DE,
 'nl' => $T2H_WORDS_NL,
 'es' => $T2H_WORDS_ES,
 'no' => $T2H_WORDS_NO,
 'pt' => $T2H_WORDS_PT,
 'fr' => $T2H_WORDS_FR,
};

sub set_language($)
{
    my $lang = shift;
    if (defined($lang) && exists($T2H_LANGUAGES->{$lang}) && defined($T2H_LANGUAGES->{$lang}))
    {
        return $T2H_LANGUAGES->{$lang};
    }
    else
    {
         return undef;
    }
}


my @MONTH_NAMES_EN =
    (
     'January', 'February', 'March', 'April', 'May',
     'June', 'July', 'August', 'September', 'October',
     'November', 'December'
    );

my @MONTH_NAMES_DE =
    (
     'Januar', 'Februar', 'M&auml;rz', 'April', 'Mai',
     'Juni', 'Juli', 'August', 'September', 'Oktober',
     'November', 'Dezember'
    );

my @MONTH_NAMES_NL =
    (
     'Januari', 'Februari', 'Maart', 'April', 'Mei',
     'Juni', 'Juli', 'Augustus', 'September', 'Oktober',
     'November', 'December'
    );

my @MONTH_NAMES_ES =
    (
     'enero', 'febrero', 'marzo', 'abril', 'mayo',
     'junio', 'julio', 'agosto', 'septiembre', 'octubre',
     'noviembre', 'diciembre'
    );

my @MONTH_NAMES_NO =
    (

     'januar', 'februar', 'mars', 'april', 'mai',
     'juni', 'juli', 'august', 'september', 'oktober',
     'november', 'desember'
    );

my @MONTH_NAMES_PT =
    (
     'Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio',
     'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro',
     'Novembro', 'Dezembro'
    );

my @MONTH_NAMES_FR =
(
 'Janvier', 'F&eacute;vrier', 'Mars', 'Avril', 'Mai',
 'Juin', 'Juillet', 'Ao&ucirc;t', 'Septembre', 'Octobre',
 'Novembre', 'D&eacute;cembre'
);

my $MONTH_NAMES =
{
 'en' => \@MONTH_NAMES_EN,
 'de' => \@MONTH_NAMES_DE,
 'es' => \@MONTH_NAMES_ES,
 'nl' => \@MONTH_NAMES_NL,
 'no' => \@MONTH_NAMES_NO,
 'pt' => \@MONTH_NAMES_PT,
 'fr' => \@MONTH_NAMES_FR
};

sub pretty_date($) 
{
    my $lang = shift;
    my($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);

    ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    $year += ($year < 70) ? 2000 : 1900;
    # obachman: Let's do it as the Americans do
    return($MONTH_NAMES->{$lang}[$mon] . ", " . $mday . " " . $year);
}

