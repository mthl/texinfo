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

package Texi2HTML::I18n;

use strict;

use File::Copy;
use Data::Dumper;

our (@ISA, @EXPORT);

use Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(pretty_date);
use vars qw(
           $T2H_LANGUAGES
);

our $WORDS;
my $language;
my $i18n_dir = 'i18n'; # name of the directory containing the per language files
my $translation_file = 'translations.pl'; # file containing all the translations
my @known_languages = ('de', 'nl', 'es', 'no', 'pt', 'fr'); # The supported
                                               # languages

########################################################################
# Language dependencies:
# To add a new language extend the WORDS hash and create $T2H_<...>_WORDS hash
# To redefine one word, simply do:
# $T2h_i18n::T2H_LANGUAGES->{<language>}->{<word>} = 'whatever' in your personal init file.
#
my $T2H_WORDS_EN =
{
 # titles  of pages
 #'Table of Contents'       => 'Table of Contents',
 #'Short Table of Contents'  => 'Short Table of Contents',
 #'Index'     => 'Index',
 #'About This Document'     => 'About This Document',
 #'Footnotes' => 'Footnotes',
 #'See'             => 'See',
 #'see'             => 'see',
 #'section'         => 'section',
 'About This Document'       => '',
 'Table of Contents'         => '',
 'Short Table of Contents',  => '',
 'Index'                     => '',
 'Footnotes'                 => '',
 'See'                       => '',
 'see'                       => '',
 'section'                   => '',
 'Top'                       => '',
 'Untitled Document'         => '',
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
 'January' => '', 
 'February' => '',
 'March' => '', 
 'April' => '',
 'May' => '',
 'June' => '',
 'July' => '',
 'August' => '',
 'September' => '',
 'October' => '',
 'November' => '',
 'December' => '', 
 'T2H_today' => '%s, %d %d',
};

my $T2H_WORDS_DE =
{
 'Table of Contents'       => 'Inhaltsverzeichniss',
 'Short Table of Contents'  => 'Kurzes Inhaltsverzeichniss',
 'Index'     => 'Index',
 'About This Document'     => '&Uuml;ber dieses Dokument',
 'Footnotes' => 'Fu&szlig;noten',
 'See'             => 'Siehe',
 'see'             => 'siehe',
 'section'         => 'Abschnitt',
 'January' => 'Januar', 
 'February' => 'Februar',
 'March' => 'M&auml;rz', 
 'April' => 'April',
 'May' => 'Mai',
 'June' => 'Juni',
 'July' => 'Juli',
 'August' => 'August',
 'September' => 'September',
 'October' => 'Oktober',
 'November' => 'November',
 'December' => 'Dezember', 
};

my $T2H_WORDS_NL =
{
 'Table of Contents'       => 'Inhoudsopgave',
 'Short Table of Contents'  => 'Korte inhoudsopgave',
 'Index'     => 'Index',      #Not sure ;-)
 'About This Document'     => 'No translation available!', #No translation available!
 'Footnotes' => 'No translation available!', #No translation available!
 'See'             => 'Zie',
 'see'             => 'zie',
 'section'         => 'sectie',
 'January' => 'Januari', 
 'February' => 'Februari',
 'March' => 'Maart', 
 'April' => 'April',
 'May' => 'Mei',
 'June' => 'Juni',
 'July' => 'Juli',
 'August' => 'Augustus',
 'September' => 'September',
 'October' => 'Oktober',
 'November' => 'November',
 'December' => 'December', 
};

my $T2H_WORDS_ES =
{
 'Table of Contents'       => '&iacute;ndice General',
 'Short Table of Contents'  => 'Resumen del Contenido',
 'Index'     => 'Index',      #Not sure ;-)
 'About This Document'     => 'No translation available!', #No translation available!
 'Footnotes' => 'Fu&szlig;noten',
 'See'             => 'V&eacute;ase',
 'see'             => 'v&eacute;ase',
 'section'         => 'secci&oacute;n',
 'January' => 'enero', 
 'February' => 'febrero',
 'March' => 'marzo', 
 'April' => 'abril',
 'May' => 'mayo',
 'June' => 'junio',
 'July' => 'julio',
 'August' => 'agosto',
 'September' => 'septiembre',
 'October' => 'octubre',
 'November' => 'noviembre',
 'December' => 'diciembre', 
};

my $T2H_WORDS_NO =
{
 'Table of Contents'       => 'Innholdsfortegnelse',
 'Short Table of Contents'  => 'Kort innholdsfortegnelse',
 'Index'     => 'Indeks',     #Not sure ;-)
 'About This Document'     => 'No translation available!', #No translation available!
 'Footnotes' => 'No translation available!',
 'See'             => 'Se',
 'see'             => 'se',
 'section'         => 'avsnitt',
 'January' => 'januar', 
 'February' => 'februar',
 'March' => 'mars', 
 'April' => 'april',
 'May' => 'mai',
 'June' => 'juni',
 'July' => 'juli',
 'August' => 'august',
 'September' => 'september',
 'October' => 'oktober',
 'November' => 'november',
 'December' => 'desember', 
};

my $T2H_WORDS_PT =
{
 'Table of Contents'       => 'Sum&aacute;rio',
 'Short Table of Contents'  => 'Breve Sum&aacute;rio',
 'Index'     => '&Iacute;ndice', #Not sure ;-)
 'About This Document'     => 'No translation available!', #No translation available!
 'Footnotes' => 'No translation available!',
 'See'             => 'Veja',
 'see'             => 'veja',
 'section'         => 'Se&ccedil;&atilde;o',
 'January' => 'Janeiro', 
 'February' => 'Fevereiro',
 'March' => 'Mar&ccedil;o', 
 'April' => 'Abril',
 'May' => 'Maio',
 'June' => 'Junho',
 'July' => 'Julho',
 'August' => 'Agosto',
 'September' => 'Setembro',
 'October' => 'Outubro',
 'November' => 'Novembro',
 'December' => 'Dezembro', 
};

my $T2H_WORDS_FR =
{
 'Table of Contents'       => 'Table des mati&egrave;res',
 'Short Table of Contents'  => 'R&eacute;sum&eacute;e du contenu',
 'Index'     => 'Index',
 'About This Document'     => 'A propos de ce document',
 'Footnotes' => 'Notes de bas de page',
 'See'             => 'Voir',
 'see'             => 'voir',
 'section'         => 'section',
 'January' => 'Janvier', 
 'February' => 'F&eacute;vrier',
 'March' => 'Mars', 
 'April' => 'Avril',
 'May' => 'Mai',
 'June' => 'Juin',
 'July' => 'Juillet',
 'August' => 'Ao&ucirc;t',
 'September' => 'Septembre',
 'October' => 'Octobre',
 'November' => 'Novembre',
 'December' => 'D&eacute;cembre', 
 'T2H_today' => 'le %2$d %1$s %3$d'
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
         $language = $lang;
         return 1;
    }
    else
    {
         return 0;
    }
}


my @MONTH_NAMES =
    (
     'January', 'February', 'March', 'April', 'May',
     'June', 'July', 'August', 'September', 'October',
     'November', 'December'
    );

sub pretty_date($) 
{
    my $lang = shift;
    my($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);

    ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    $year += ($year < 70) ? 2000 : 1900;
    # obachman: Let's do it as the Americans do
    #return($MONTH_NAMES->{$lang}[$mon] . ", " . $mday . " " . $year);
    return(sprintf(get_string('T2H_today'), (get_string($MONTH_NAMES[$mon]), $mday, $year)));
}

sub get_string($)
{
    my $string = shift;
    print STDERR "i18n: missing string $string\n" unless (exists ($T2H_LANGUAGES->{'en'}->{$string}));
    return $T2H_LANGUAGES->{$language}->{$string} if (defined ($T2H_LANGUAGES->{$language}->{$string}) and ($T2H_LANGUAGES->{$language}->{$string} ne ''));
    return $T2H_LANGUAGES->{'en'}->{$string} if (defined ($T2H_LANGUAGES->{'en'}->{$string}) and ($T2H_LANGUAGES->{'en'}->{$string} ne ''));
    return $string;
}

# Handle per language files
my $T2H_OBSOLETE_STRINGS = {};
$Data::Dumper::Purity = 1;

sub update_language_file($);

sub manage_i18n_files($)
{
    my $command = shift;
    if ($command eq 'update')
    {
        update_i18n_files();
    }
    elsif ($command eq 'merge')
    {
        merge_i18n_files();
    }
    else
    {
        warn "Unknown i18n command: $command\n";
    }
    exit 0;
}

sub merge_i18n_files
{
    die "No suitable $i18n_dir directory\n" unless (-d $i18n_dir and -r $i18n_dir);
    if (-f $translation_file)
    {
        unless (File::Copy::copy ($translation_file, "$translation_file.old"))
        {
            die "Error copying $translation_file to $translation_file.old\n";
        }
    }
    die "open $translation_file failed" unless (open (TRANSLATIONS, ">$translation_file"));
    foreach my $lang (@known_languages)
    {
         my $file = "$i18n_dir/$lang";
         next unless (-r $file);
         unless (open (FILE, $file))
         {
              warn "open $file failed: $!\n";
              return;
         }
         while (<FILE>)
         {
              print TRANSLATIONS;
         }
         close FILE;
    }
}
        

sub update_i18n_files
{
    die "No suitable $i18n_dir directory\n" unless (-d $i18n_dir and -w $i18n_dir);
    my @languages = @known_languages;
    if (@ARGV)
    {
        @languages = ();
        foreach my $lang (@ARGV)
        {
            unless (grep {$lang eq $_} @known_languages)
            {
                print STDERR "Unsupported language `$lang'\n";
                next;
            }
            push (@languages, $lang) unless (grep {$lang eq $_} @languages);
        }
    }
    unless (@languages)
    {
        warn "No languages to update\n" ;
        return;
    }
    foreach my $lang (@languages)
    {
        update_language_file($lang);
    }
    return 1;
}

sub update_language_file($)
{
    my $lang = shift;
    unless (grep {$lang eq $_} @known_languages)
    {
        print STDERR "Unsupported language `$lang'\n";
        return;
    }
    my $file = "$i18n_dir/$lang";
    if (-f $file)
    {
        eval { require($file) ;};
        if ($@)
        {
            warn "require $file failed: $@\n";
            return;
        }
        unless (File::Copy::copy ($file, "$file.old"))
        {
            warn "Error copying $file to $file.old\n";
            return;
        }
        if (!defined($T2H_LANGUAGES->{$lang}))
        {
            warn "T2H_LANGUAGES->{$lang} not defined in $file\n";
            return;
        }
    }
    unless (open (FILE, ">$file"))
    {
         warn "open $file failed: $!\n";
         return;
    }

    if (!defined($T2H_OBSOLETE_STRINGS->{$lang}))
    {
        $T2H_OBSOLETE_STRINGS->{$lang} = {};
    }
    foreach my $string (keys %{$T2H_OBSOLETE_STRINGS->{$lang}})
    {
        unless (exists($T2H_LANGUAGES->{$lang}->{$string}) and ($T2H_LANGUAGES->{$lang}->{$string} ne ''))
        {
             $T2H_LANGUAGES->{$lang}->{$string} = $T2H_OBSOLETE_STRINGS->{$lang}->{$string};
        }
    }
    
    my $words;
    foreach my $string (keys %{$T2H_LANGUAGES->{$lang}})
    {
        $words->{$string} = $T2H_LANGUAGES->{$lang}->{$string};
    }
    $T2H_LANGUAGES->{$lang} = {};
    $T2H_OBSOLETE_STRINGS->{$lang} = {};
    
    foreach my $string (keys %{$T2H_LANGUAGES->{'en'}})
    {
        if (exists($words->{$string}))
        {
             $T2H_LANGUAGES->{$lang}->{$string} = $words->{$string};
             delete $words->{$string};
        }
        else
        {
             $T2H_LANGUAGES->{$lang}->{$string} = '';
        }
    }
    $T2H_OBSOLETE_STRINGS->{$lang} = $words;
    print FILE "" . Data::Dumper->Dump([$T2H_LANGUAGES->{$lang}], [ "T2H_LANGUAGES->{'$lang'}" ]);
    print FILE "\n";
    print FILE Data::Dumper->Dump([$T2H_OBSOLETE_STRINGS->{$lang}], [ "T2H_OBSOLETE_STRINGS->{'$lang'}"]);
    print FILE "\n";
    print FILE "\n";
    close FILE;
}

1;
