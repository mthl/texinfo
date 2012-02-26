use strict;

use Test::More;
BEGIN { plan tests => 1 };

use lib 'maintain/lib/Unicode-EastAsianWidth/lib/';
use lib 'maintain/lib/libintl-perl/lib/';
use lib 'maintain/lib/Text-Unidecode/lib/';
use Texinfo::Parser qw(parse_texi_text);
use Texinfo::Structuring;
use Texinfo::Convert::Texinfo;

use Data::Dumper;

ok(1);

sub _get_in($)
{
  my $fragment = shift;

  my $in = '@node Top
@top top

@menu
* chap1::
* chap @code{in code} 2::
* lone node::
* (the manual)::

'.$fragment.
'
@end menu

@menu
* unnumbered1::
@end menu

@node chap1
@chapter chap

@menu
* sec0::
* sec1::  D1
 GGG

Menu comment

* label: sec2.  D2 
@end menu

@node sec0
@section sec0

@menu
* subsec::
@end menu

@node subsec
@subsection sss

@node sec1
@section sec1

@node sec2
@section sec2

@node chap @code{in code} 2, lone node, chap1, Top
@chapter chapter @code{in code} 2

@menu
* sec 2-0::
* sec 2-1::
@end menu

@node sec 2-0
@section sec 2-0

@node sec 2-1
@section sec 2-1

@node lone node, chap1, unnumbered1, Top

@menu
* inter node::
* inter node 2::
@end menu

@node inter node

@node inter node 2

@node unnumbered1, , lone node, Top
@unnumbered unnumbered1

@menu
* sec un0:: D
* sec un1::
* (some no manual) sec::
@end menu

@node sec un0
@section un0

@node sec un1
@section un1

';
return $in;
}

my $in_detailmenu = _get_in('@detailmenu
* sec1::
@end detailmenu');

my $parser = Texinfo::Parser::parser();
my $tree = $parser->parse_texi_text($in_detailmenu);
my $master_menu = Texinfo::Structuring::do_master_menu($parser);
my $out = Texinfo::Convert::Texinfo::convert($master_menu);

my $reference = '@detailmenu
 --- The Detailed Node Listing ---

chap

* sec0::
* sec1::  D1
 GGG
* label: sec2.  D2 

chapter @code{in code} 2

* sec 2-0::
* sec 2-1::

lone node

* inter node::
* inter node 2::

unnumbered1

* sec un0:: D
* sec un1::
* (some no manual) sec::
@end detailmenu
';
#print STDERR $out;
is ($reference, $out, 'master menu');



