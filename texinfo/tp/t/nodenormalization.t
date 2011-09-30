use Test::More;
BEGIN { plan tests => 3 };
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use lib '../texi2html/lib/libintl-perl/lib/';
use lib '../texi2html/lib/Text-Unidecode/lib/';
use Texinfo::Convert::NodeNameNormalization qw(normalize_node);
use Texinfo::Parser;
use Data::Dumper;

use strict;

# Currently, tests check that NodeNameNormalization do not break with complete 
# Texinfo trees, not that the output is correct.

my $srcdir = $ENV{'srcdir'};
if (defined($srcdir)) {
  $srcdir =~ s/\/*$/\//;
} else {
  $srcdir = '';
}

my $strings_textdomain = 'texinfo_document';
Locale::Messages->select_package ('gettext_pp');
Locale::Messages::bindtextdomain ('texinfo_document', 't/locales');

my $parser = Texinfo::Parser::parser({'TEST' => 1,
                                        'include_directories' => [
                                          't/include_dir/',
                                          't/include/',
                                          $srcdir.'t/include/'],});

my $invalid_line = '@noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent';

my $tree = $parser->parse_texi_text($invalid_line);
#print STDERR Data::Dumper->Dump([$tree]);
my $normalized_invalid = normalize_node($tree);
#print STDERR "Invalid: $normalized_invalid\n";

# misc commands are ignored, this implies @node and sectioning contents
# are ignored...
my $node_texi = '@node Top

in node

@top top section

in top section
';
my $node_tree = $parser->parse_texi_text($node_texi);
my $normalized_node = normalize_node($node_tree);
is ($normalized_node, '', 'node ignored');

# try on a full manual, but with node and sections commented out
# as they are ignored
my $texinfo_manual = '@setfilename toto.info

@definfoenclose some, ;, ;

@documentlanguage fr

@settitle test manual

@copying

Your rights
@sp 2
Here
@end copying

@paragraphindent 6

@c @node Top
@c @top top @~e

@insertcopying

@noindent
Para. @LaTeX{}, @sc{@AA{} bbb}. @image{unknown,,,}. @ref{index}
@anchor{anchor}. @abbr{ABR, expl}. @abbr{ABR}. 
@~@@. @some{infoenclosed}. @today{}.

@cindex index

@html
in html
@end html

@multitable {a@TeX{}} {b}
@item gg @tab hhh
@end multitable

@example
in example
@vtable @emph
@item item

@itemx itemx
in vtable.
@end vtable

@deffn a b {c} d e f
in deffn
@end deffn

@exdent exdented

@end example

@flushright
right
@end flushright

@float Theor@`eme, label
in float

@math{a \frac{a}{b} @\ @minus{}}

@caption{in caption}
@end float

@menu
* index::
@end menu

@c @node index
@c @appendix appendix

@printindex cp

@heading list of floats

@listoffloats Theor@`eme

@bye
';

my $manual_tree = $parser->parse_texi_text($texinfo_manual);
my $check_texinfo = Texinfo::Convert::Texinfo::convert($manual_tree);
is ($texinfo_manual, $check_texinfo, 'check manual parsing');

#print STDERR Data::Dumper->Dump([$manual_tree]);
my $normalized_manual = normalize_node($manual_tree);
#print STDERR "Manual: $normalized_manual\n";

ok($normalized_manual =~ /^[\w\-]+$/, 'normalized tree is a valid id');
