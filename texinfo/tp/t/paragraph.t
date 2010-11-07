# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Texinfo-Parser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;

#use Test;
use Test::More;
BEGIN { plan tests => 33 };
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
#push @INC, '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Convert::Paragraph;
ok(1, "modules loading"); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

sub test_para($$$;$)
{
  my $args = shift;
  my $reference = shift;
  my $name = shift;
  my $conf = shift;

  my $result = '';
  #$conf = {'debug' => 1} if (!defined($conf));
  $conf = {} if (!defined($conf));
  my $para = Texinfo::Convert::Paragraph->new($conf);
  foreach my $arg (@$args) {
    $result .= $para->wrap_next($arg);
  }
  $result .= $para->end();
  is ($result, $reference, $name);
  #print STDERR "$result\n";
}

test_para(['word'], "word\n", 'word');
test_para(['word other'], "word other\n", 'two_words');
test_para(['word '], "word\n", 'trailing spaces');
test_para([' word'], "word\n", 'leading spaces');
test_para([' ', ' word'], "word\n", 'double leading spaces');
test_para(['word other'], "word\nother\n", 'two_words_max', {'max' => 2});
test_para(['word other'], "word\nother\n", 'two_words_max_less_one', {'max' => 3});
test_para(['word other'], "word\nother\n", 'two_words_max_exact', {'max' => 4});
test_para(['word other'], "word\nother\n", 'two_words_max_plus_one', {'max' => 5});
test_para(['word other'], "word\nother\n", 'two_words_max_plus_two', {'max' => 6});
test_para(['word o'], "word\no\n", 'word_letter_max_exact', {'max' => 5});
test_para(['word o'], "word o\n", 'word_letter_max_plus_two', {'max' => 6});
test_para(['word  other'], "word other\n", 'two_words_two_spaces');
test_para(['word.  other'], "word.  other\n", 'two_words_dot');
test_para(['word. other'], "word.  other\n", 'two_words_dot_one_space');
test_para(['word.) other'], "word.)  other\n", 'two_words_dot_paren_one_space');
test_para(['worD.  other'], "worD. other\n", 'two_words_dot_upper');
test_para(['word','other'], "wordother\n", 'concatenate');
test_para(['word','other'], "wordother\n", 'concatenate_max', {'max' => 2});
test_para(['word ','other'], "word\nother\n", 'two_elements_max', {'max' => 2});
test_para(['word',' other'], "word\nother\n", 'two_elements_space_max', {'max' => 2});
test_para(["\x{7b2c}\x{4e00} ",'other'], "\x{7b2c}\n\x{4e00}\nother\n", 'east_asian', {'max' => 2});
test_para(['word.  other'], "word. other\n", 'two_words_dot_frenchspacing', {'frenchspacing' => 1});
test_para(["aa.)\x{7b2c} b"], "aa.)\x{7b2c} b\n", 'end_sentence_east_asian');

my $para = Texinfo::Convert::Paragraph->new();
my $result = '';
$result .= $para->wrap_next('aa.)');
$result .= $para->add_next('_');
$result .= $para->wrap_next(' after');
$result .= $para->end();
is ("aa.)_  after\n", $result, 'add char after end sentence');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->end_line();
$result .= $para->wrap_next(' after');
$result .= $para->end();
is ("\nafter\n", $result, 'space after end_line');
#print STDERR "$result";

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->wrap_next('aa.)');
$result .= $para->add_pending_word();
is ('aa.)', $result, 'call add_pending_word');
$result = $para->end_line();
is ("\n", $result, 'call end_line after add_pending_word');
$result = $para->end();
is ('', $result, 'call end after end_line');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->wrap_next('aa.)');
$result .= $para->add_pending_word();
$result .= $para->wrap_next(' after');
$result .= $para->end();
is ("aa.)  after\n", $result, 'space after sentence and add_pending_word');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->wrap_next('aA');
$result .= $para->add_next('.', undef, 1);
$result .= $para->wrap_next(' after');
$result .= $para->end();
is ("aA.  after\n", $result, 'force end sentence after upper case');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->wrap_next('aA');
$result .= $para->wrap_next('.');
$result .= $para->wrap_next(' after');
$result .= $para->end();
is ("aA. after\n", $result, 'end sentence after upper case');


1;
