# Report.pm: prepare error messages and translate strings.
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

require Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration      use Texinfo::Parser ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
  errors
  gdt
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
);

$VERSION = '0.01';


package Texinfo::Report;

use 5.00405;
use strict;

use Locale::Messages;
# to be able to load a parser if none was given to gdt.
use Texinfo::Parser;

# return the errors and warnings
sub errors ($)
{
  my $self = shift;
  #print STDERR "REPORT ERRORS $self $self->{'errors_warnings'}\n";
  return ($self->{'errors_warnings'}, $self->{'error_nrs'});
}

sub __($$)
{
  my $self = shift;
  return &{$self->{'gettext'}}(@_);
}

sub new($)
{
  my $self = shift;
  $self->{'errors_warnings'} = [];
  #print STDERR "REPORT NEW $self $self->{'errors_warnings'}\n";
  $self->{'errors_nrs'} = 0;
  $self->{'gettext'} = sub {return $_[0];} if (!defined($self->{'gettext'}));
  return $self;
}

# format a line warning
sub line_warn($$$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  return if (!defined($line_number) or $self->{'ignore_notice'});
  my $file = $line_number->{'file_name'};
  # otherwise out of source build fail since the file names are different
  $file =~ s/^.*\/// if ($self->get_conf('TEST'));
  my $warn_line;
  if ($line_number->{'macro'} ne '') {
    $warn_line = sprintf($self->__(
                             "%s:%d: warning: %s (possibly involving \@%s)\n"),
             $file, $line_number->{'line_nr'}, $text, $line_number->{'macro'});
  } else {
    $warn_line = sprintf($self->__("%s:%d: warning: %s\n"),
                         $file, $line_number->{'line_nr'}, $text);
  }
  warn $warn_line if ($self->get_conf('DEBUG'));
  push @{$self->{'errors_warnings'}},
       { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line,
         %{$line_number} };
}

# format a line error
sub line_error($$$;$)
{
  my $self = shift;
  my $text = shift;
  chomp ($text);
  my $line_number = shift;
  my $continuation = shift;
  return if ($self->{'ignore_notice'});
  if (defined($line_number)) {
    my $file = $line_number->{'file_name'};
    $file =~ s/^.*\/// if ($self->get_conf('TEST'));
    my $macro_text = '';
    $macro_text = " (possibly involving \@$line_number->{'macro'})"
       if ($line_number->{'macro'} ne '');
    my $error_text = "$file:$line_number->{'line_nr'}: $text$macro_text\n";
    warn "$error_text" if ($self->get_conf('DEBUG'));
    my $type = 'error';
    $type = 'error continuation' if ($continuation);
    push @{$self->{'errors_warnings'}},
         { 'type' => $type, 'text' => $text, 'error_line' => $error_text,
           %{$line_number} };
  }
  $self->{'error_nrs'}++ unless ($continuation);
}

sub document_warn ($$)
{
  my $self = shift;
  my $text = shift;
  return if ($self->{'ignore_notice'});
  chomp ($text);
  my $warn_line = sprintf($self->__("warning: %s\n"), $text);
  push @{$self->{'errors_warnings'}},
    { 'type' => 'warning', 'text' => $text, 'error_line' => $warn_line};
}

sub document_error ($$)
{
  my $self = shift;
  my $text = shift;
  return if ($self->{'ignore_notice'});
  chomp ($text);
  $text .= "\n";
  push @{$self->{'errors_warnings'}},
    { 'type' => 'error', 'text' => $text, 'error_line' => $text };
  $self->{'error_nrs'}++;
}

sub file_line_warn($$$;$) {
  my $self = shift;
  my $text = shift;
  return if ($self->{'ignore_notice'});
  chomp($text);
  my $file = shift;
  my $line_nr = shift;

  my $warn_line;
  if (!defined($line_nr)) {
    $warn_line = "$file: $text\n";
  } else {
    $warn_line = "$file:$line_nr: $text\n";
  }
  #print STDERR "REPORT FILE_LINE_WARN $self $self->{'errors_warnings'}\n";
  push @{$self->{'errors_warnings'}},
    { 'type' => 'warning', 'text' => $warn_line, 'error_line' => $warn_line};
}

# i18n

my $DEFAULT_LANGUAGE = 'en';

# we want a reliable way to switch locale, so we don't use the system
# gettext.
Locale::Messages->select_package ('gettext_pp');

# FIXME make those configurable?  Set them with call to new?
my $strings_textdomain = 'texinfo_document';
my $messages_textdomain = 'texinfo';

# libintl converts between encodings but doesn't decode them into the
# perl internal format.  This is only caled if the encoding is a proper
# perl encoding.
sub _encode_i18n_string($$)
{
  my $string = shift;
  my $encoding = shift;
  return Encode::decode($encoding, $string);
}

# handle translations of in-document strings.
sub gdt($$;$$)
{
  my $self = shift;
  my $message = shift;
  my $context = shift;
  my $conf = shift;

  my $encoding = $self->{'encoding_name'};

  my $re = join '|', map { quotemeta $_ } keys %$context
      if (defined($context) and ref($context));

  my $saved_env_LC_ALL = $ENV{'LC_ALL'};
  my $saved_LANGUAGE = $ENV{'LANGUAGE'};
#  my $saved_LANG = $ENV{'LANG'};
#  my $saved_LC_ALL = POSIX::setlocale (LC_ALL);
#  my $saved_LC_CTYPE = POSIX::setlocale (LC_CTYPE);
#  my $saved_LC_MESSAGES = POSIX::setlocale (LC_MESSAGES);

  Locale::Messages::textdomain($strings_textdomain);
  Locale::Messages::bind_textdomain_codeset($strings_textdomain, $encoding)
    if ($encoding and $encoding ne 'us-ascii');
  if (!($encoding and $encoding eq 'us-ascii') and $self->{'perl_encoding'}) {
    Locale::Messages::bind_textdomain_filter($strings_textdomain,
      \&_encode_i18n_string, $self->{'perl_encoding'});
  }

  # FIXME do that in the converters when @documentlanguage is found.
  my $lang = $self->get_conf('documentlanguage');
  $lang = $DEFAULT_LANGUAGE if (!defined($lang));
  my @langs = ($lang);
  if ($lang =~ /^([a-z]+)_([A-Z]+)/) {
    my $main_lang = $1;
    my $region_code = $2;
    push @langs, $main_lang;
  }

  my $locales = '';

  foreach my $language (@langs) {
    if ($encoding) {
      $locales .= "$language.$encoding:";
    } else {
      $locales .= "$language:";
    }
    # always try us-ascii, the charset should always be a subset of
    # all charset, and should resort to @-commands if needed for non
    # ascii characters
    if (!$encoding or ($encoding and $encoding ne 'us-ascii')) {
      $locales .= "$language.us-ascii:";
    }
  }
  $locales =~ s/:$//;
  #print STDERR "$locales $message\n";
  # END FIXME

  Locale::Messages::nl_putenv("LANGUAGE=$locales");

  my $result;
  if (!defined($context) or ref($context)) {
    $result = Locale::Messages::gettext($message);
  } else {
    $result = Locale::Messages::pgettext($context, $message);
  }

  Locale::Messages::textdomain($messages_textdomain);
  # old perl complains 'Use of uninitialized value in scalar assignment'
  if (!defined($saved_LANGUAGE)) {
    delete ($ENV{'LANGUAGE'});
  } else {
    $ENV{'LANGUAGE'} = $saved_LANGUAGE;
  }
  if (!defined($saved_env_LC_ALL)) {
    delete ($ENV{'LC_ALL'});
  } else {
    $ENV{'LC_ALL'} = $saved_env_LC_ALL;
  }
#  my $new_LC_ALL = POSIX::setlocale (LC_ALL);
#  my $new_LC_CTYPE = POSIX::setlocale (LC_CTYPE);
#  my $new_LC_MESSAGES = POSIX::setlocale (LC_MESSAGES);
#  my $new_env_LC_ALL = 'UNDEF';
#  $new_env_LC_ALL = $ENV{'LC_ALL'} if defined($ENV{'LC_ALL'});
#  my $saved_str_env_LC_ALL = $saved_env_LC_ALL;
#  $saved_str_env_LC_ALL = 'UNDEF' if (!defined($saved_str_env_LC_ALL));

#  print STDERR "  LC_ALL $saved_LC_ALL $new_LC_ALL ENV: $saved_str_env_LC_ALL $new_env_LC_ALL\n";
#  print STDERR "  LC_CTYPE $saved_LC_CTYPE $new_LC_CTYPE\n";
#  print STDERR "  LC_MESSAGES $saved_LC_MESSAGES $new_LC_MESSAGES\n";
#  my $new_LANG = 'UNDEF';
#  $new_LANG = $ENV{'LANG'} if defined($ENV{'LANG'});
#  my $saved_str_LANG = $saved_LANG;
#  $saved_str_LANG = 'UNDEF' if (!defined($saved_str_LANG));
#  print STDERR "  LANG $saved_str_LANG $new_LANG\n";

  my $parser_conf;
  # we change the substituted brace-enclosed strings to values, that
  # way they are substituted, including when they are Texinfo trees.
  if (defined($re)) {
    # next line taken from libintl perl, copyright Guido. sub __expand
    $result =~ s/\{($re)\}/\@value\{$1\}/g;
    foreach my $substitution(keys %$context) {
      #print STDERR "$result $substitution $context->{$substitution}\n";
      $parser_conf->{'values'}->{$substitution} = $context->{$substitution};
    }
  }
  # FIXME reuse a parser?
  if ($self->get_conf('DEBUG')) {
    $parser_conf->{'DEBUG'} = 1;
    print STDERR "GDT $result\n";
  }
  my $parser = Texinfo::Parser::parser($parser_conf);

  # FIXME it doesn't seems to be used anywhere.
  if ($conf->{'paragraph'}) {
    $result = $parser->parse_texi_text($result);
  } else {
    $result = $parser->parse_texi_line($result);
  }
  return $result;
}


1;

__END__

=head1 NAME

Texinfo::Report - Error storing and string translations for Texinfo modules

=head1 SYNOPSIS

  @ISA = qw(Texinfo::Report);

  $converter->Texinfo::Report::new();
  
  if ($warning_happened) {
    $converter->line_warn(sprintf($converter->__("\@%s is wrongly used"),
                       $current->{'cmdname'}), $current->{'line_nr'});
  }
  
  my ($errors, $errors_count) = $converter->errors();
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'};
  }

  my $tree_translated = $converter->gdt('See {reference} in @cite{{book}}',
                       {'reference' => $tree_reference,
                        'book'  => {'text' => $book_name}});


=head1 DESCRIPTION

The Texinfo::Report module helps with string translations and errors 
handling.  It is used by Texinfo modules, Texinfo::Parser and 
Texinfo::Convert::Converter.  To use this module, the usual way is
to inherit Texinfo::Report methods and initialize Texinfo::Report
variables for a I<$converter> object, by calling 
C<Texinfo::Report::new()> on the I<$converter> object.  This is done by 
Texinfo::Convert::Converter, for instance, so every module that inherits
Texinfo::Convert::Converter can automatically use the Texinfo::Report
methods in an object oriented way.

Besides the C<new> method, C<gdt> is used for strings translations, 
C<errors> to report errors and the other methods to store errors
(and warnings).

=head1 METHODS

No method is exported in the default case.  

The C<new> method initializes Texinfo::Report related fields:

  $converter->Texinfo::Report::new()

The C<gdt> method is used to translate strings to be output in 
converted documents, and return a texinfo tree.

=over

=item $tree = $converter->gdt($string, $replaced_substrings)

The I<$string> is a string to be translated.  The function returns a 
Texinfo tree, as the string is interpreted as Texinfo code after
translation.  I<$replaced_substrings> is an optional 
hash reference specifying some 
substitution to be done after the translation.  The key of 
the I<$replaced_substrings> hash reference identifies what is to 
be substituted, the value is some texinfo tree or array content 
that is substituted in the resulting texinfo tree.
In the string to be translated word in brace matching keys of 
I<$replaced_substrings> are replaced.

For example in the following call, the string 
I<See {reference} in @cite{{book}}> is translated, then
parsed as a Texinfo string, with I<{reference}> substituted by
I<$tree_reference> in the resulting tree, and I<{book}> 
replaced by the associated texinfo tree text element:

  $tree = $converter->gdt('See {reference} in @cite{{book}}',
                       {'reference' => $tree_reference,
                        'book'  => {'text' => $book_name}});

C<gdt> uses the information in the I<$converter> to know the
encoding and documentlanguage.  More precisely, 
C<< $converter->{'encoding_name'} >>, C<< $converter->{'perl_encoding'} >>
and C<< $converter->get_conf('documentlanguage') >> are used.

C<gdt> use a gettext-like infrastructure to retrieve the 
translated strings, using the I<texinfo_document> domain.

=back

The errors collected are available through the C<errors> method, the other
methods allow to register errors and warnings.

=over

=item ($error_warnings_list, $error_count) = errors ($converter)

This function returns as I<$error_count> the count of errors since
calling C<new>.  The I<$error_warnings_list> is an array of hash references
one for each error, warning or error line continuation.  Each of these has 
the following keys:

=over

=item type

May be C<warning>, C<error>, or C<error continuation> (for a continuation of
an error line).

=item text

The text of the error.

=item error_line

The text of the error formatted with the file name, line number and macro
name, as needed.

=item line_nr

The line number of the error or warning.

=item file_name

The file name where the error or warning occurs.

=item macro

The user macro name that is expanded at the location of 
the error or warning.

=back

=item $converter->line_warn($text, $line_nr)

=item $converter->line_error($text, $line_nr, $continuation)

Register a warning or an error.  The I<$text> is the text of the
error or warning.  The optional I<$line_nr> holds the information
on the error or warning location.  It is associated with the I<line_nr> 
key of Texinfo tree elements as described in L<Texinfo::Parser/line_nr>
for the @-commands.  The I<$line_nr> structure is described in L</errors>
above.  If I<$continuation> is set, the line is an error message continuation
line and not a new error.

=item $converter->document_warn($text)

=item $converter->document_error($text)

Register a document-wide error or warning.  I<$text> is the error or
warning message.

=item $converter->file_line_warn($text, $file, $line_nr)

Register the warning message I<$text> for file I<$file>, with, optionally
the line I<$line_nr> in the file.

=back

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010, 2011 Free Software Foundation, Inc.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License,
or (at your option) any later version.

=cut

