# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Texinfo-Parser.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;

#use Test;
use Test::More;
BEGIN { plan tests => 95 };
use lib '../texi2html/lib/Unicode-EastAsianWidth/lib/';
#push @INC, '../texi2html/lib/Unicode-EastAsianWidth/lib/';
use Texinfo::Convert::Paragraph;
use Texinfo::Convert::Line;
use Texinfo::Convert::UnFilled;
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
    $result .= $para->add_text($arg);
  }
  $result .= $para->end();
  if (defined($reference)) {
    is ($result, $reference, $name);
  } else {
    print STDERR "$result\n";
  }
}

test_para(['word'], "word\n", 'word');
test_para(['word other'], "word other\n", 'two_words');
test_para(['word  other'], "word other\n", 'two_words two spaces');
test_para(['word ', ' other'], "word other\n", 'two_words feed, space inside');
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
test_para(["aaaa bbbbbbb cccccccc dddddddddddd eeeeeeeeeeee fffffffff ggggggg"],
"   aaaa
 bbbbbbb
 cccccccc
 dddddddddddd
 eeeeeeeeeeee
 fffffffff
 ggggggg
",
   'indent_indent_next', {'max' => 6, 'indent_length' => 3, 'indent_length_next' => 1});
test_para(["aaaa bbbbbbb cccccccc dddddddddddd eeeeeeeeeeee fffffffff ggggggg"], 
"    aaaa
bbbbbbb
cccccccc
dddddddddddd
eeeeeeeeeeee
fffffffff
ggggggg
",
   'indent_no_indent_next', {'max' => 12, 'indent_length' => 4, 'indent_length_next' => 0});
test_para(["aaaa bbbbbbb cccccccc dddddddddddd eeeeeeeeeeee fffffffff ggggggg"],
"    aaaa
    bbbbbbb
    cccccccc
    dddddddddddd
    eeeeeeeeeeee
    fffffffff
    ggggggg
",
   'indent_undef_indent_next', {'max' => 12, 'indent_length' => 4});
test_para(["aaaa bbbbbbb cccccccc dddddddddddd eeeeeeeeeeee fffffffff ggggggg"], 
"aaaa bbbbbbb
   cccccccc
   dddddddddddd
   eeeeeeeeeeee
   fffffffff
   ggggggg
",
   'indent_next_no_indent', {'max' => 12, 'indent_length' => 0, 'indent_length_next' => 3});
test_para(["aaaa bbbbbbb cccccccc dddddddddddd eeeeeeeeeeee fffffffff ggggggg"],
"aaaa bbbbbbb
   cccccccc
   dddddddddddd
   eeeeeeeeeeee
   fffffffff
   ggggggg
",
   'indent_next_undef_indent', {'max' => 12, 'indent_length_next' => 3});
test_para(["aaaa"], "  aaaa\n", 'indent_and_counter_lower', 
  {'indent_length' => 8, 'counter' => 6});
test_para(["aaaa"], "aaaa\n", 'indent_zero_and_counter', 
  {'indent_length' => 0, 'counter' => 6});
test_para(["aaaa"], "aaaa\n", 'indent_and_counter_higher', 
  {'indent_length' => 3, 'counter' => 6});
test_para(["aaaa bbbbbbb cccccccc dddddddddddd"],
  "aaaa bbbbbbb\ncccccccc dddddddddddd\n",
  "counter_and_line", {'counter' => 60});


my $para = Texinfo::Convert::Paragraph->new();
my $result = '';
$result .= $para->add_text('aa.)');
$result .= $para->add_next('_');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.)_  after\n", 'add char after end sentence');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->end_line();
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "\nafter\n", 'space after end_line');
#print STDERR "$result";

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$result .= $para->add_pending_word();
is ($result, 'aa.)', 'call add_pending_word');
$result = $para->end_line();
is ($result, "\n", 'call end_line after add_pending_word');
$result = $para->end();
is ($result, '', 'call end after end_line');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$result .= $para->add_pending_word();
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.)  after\n", 'space after sentence and add_pending_word');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aA');
$result .= $para->add_next('.', undef, 1);
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aA.  after\n", 'force end sentence after upper case');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aA');
$result .= $para->add_text('.');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aA. after\n", 'end sentence after upper case');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$result .= $para->add_text('))');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.)))  after\n", 'continue with after_punctuation_characters');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$para->inhibit_end_sentence();
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.) after\n", 'inhibit end sentence');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$para->inhibit_end_sentence();
$result .= $para->add_next('_');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.)_ after\n", 'inhibit end sentence then add next');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$para->inhibit_end_sentence();
$result .= $para->add_text('aa.)');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.)aa.)  after\n", 'cancel inhibit end sentence');

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa.)');
$para->inhibit_end_sentence();
$result .= $para->add_text('))');
$result .= $para->add_text(' after');
$result .= $para->end();
is ($result, "aa.))) after\n", 'inhibit end sentence and ))');

$para = Texinfo::Convert::Paragraph->new({'max' => 2});
$result = '';
$para->set_space_protection(1,1);
$result .= $para->add_text('aa.)    bb ');
is ($result, 'aa.)    bb ', 'space protected 2 words');
$result = $para->add_text(' eee ');
is ($result, ' eee ', 'space protected more word');
$result = $para->add_text('   .)');
$result .= $para->add_next('_');
$result .= $para->add_text("\n");
is ($result, '   .)_  ', 'space protected and end of sentence and line added');
$result = $para->add_text("aa\n");
is ($result, 'aa ', 'protected space after end of line');
$result = $para->add_text(' . gg');
is ($result, ' . ', 'protected space with dot inside');
$result = $para->add_text(". \n");
$result .= $para->add_text("a");
is ($result, 'gg.  ', 'protected space end line with already a space');
$result = $para->add_text('  ');
$para->set_space_protection(0,0);
$result .= $para->add_text("c ");
is ($result, "a  \nc", 'end protected space end of line');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result .= $para->add_text('aa');
$para->set_space_protection(1,1);
$result .= $para->add_text('  f  f');
$para->set_space_protection(0,0);
$result .= $para->add_text("ggg\n");
is ($result, 'aa  f  fggg', 'protected space within words');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa');
$para->set_space_protection(1,1);
$result .= $para->add_text('  f  f ');
$para->set_space_protection(0,0);
$result .= $para->add_text("ggg\n");
is ($result, 'aa  f  f ggg', 'protected space and space within words');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa ');
$result .= $para->set_space_protection(1,1);
$result .= $para->add_text('  f  f ');
$para->set_space_protection(0,0);
$result .= $para->add_text("ggg\n");
is ($result, 'aa   f  f ggg', 'text space protected space and space within words');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa ');
$result .= $para->set_space_protection(1,1);
$result .= $para->add_text('  f  f ');
$para->set_space_protection(0,0);
$result .= $para->add_text(" ggg\n");
is ($result, 'aa   f  f  ggg', 'text space protected space and space after');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa ');
$result .= $para->set_space_protection(1,1);
$para->set_space_protection(0,0);
$result .= $para->add_text(" ggg\n");
is ($result, 'aa  ggg', 'empty protected 2 space');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa ');
$result .= $para->set_space_protection(1,1);
$para->set_space_protection(0,0);
$result .= $para->add_text("ggg\n");
is ($result, 'aa ggg', 'empty protected 1 before space');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa');
$result .= $para->set_space_protection(1,1);
$para->set_space_protection(0,0);
$result .= $para->add_text(" ggg\n");
is ($result, 'aa ggg', 'empty protected 1 after space');
$para->end();

$para = Texinfo::Convert::Paragraph->new();
$result = '';
$result = $para->add_text('aa ');
$result .= $para->set_space_protection(1,1);
$result .= $para->add_text(' ');
$para->set_space_protection(0,0);
$result .= $para->add_text(" ggg\n");
is ($result, 'aa   ggg', 'space protected space');
$para->end();


#print STDERR "$result";
#exit;

sub test_line($$$;$)
{
  my $args = shift;
  my $reference = shift;
  my $name = shift;
  my $conf = shift;

  my $result = '';
  #$conf = {'debug' => 1} if (!defined($conf));
  $conf = {} if (!defined($conf));
  my $line = Texinfo::Convert::Line->new($conf);
  foreach my $arg (@$args) {
    $result .= $line->add_text($arg);
  }
  $result .= $line->end();
  is ($result, $reference, "line $name");
  #print STDERR "$result\n";
}

test_line(["word\n"], "word\n", 'word');
test_line(['word other'], "word other", 'two_words');
test_line(['word '], 'word ', 'trailing spaces');
test_line(["word \n"], "word\n", 'trailing spaces eol');
test_line([' word'], "word", 'leading spaces');
test_line([' ', ' word'], "word", 'double leading spaces');
test_line(['word  other'], "word other", 'two_words_two_spaces');
test_line(['word.  other'], "word.  other", 'two_words_dot');
test_line(['word. other'], "word.  other", 'two_words_dot_one_space');
test_line(['word.) other'], "word.)  other", 'two_words_dot_paren_one_space');
test_line(['worD.  other'], "worD. other", 'two_words_dot_upper');
test_line(['word','other',"\n"], "wordother\n", 'concatenate');
test_line(["\x{7b2c}\x{4e00} ","other \n"], "\x{7b2c}\x{4e00} other\n", 'east_asian');
test_line(['word.  other'], "word. other", 'two_words_dot_frenchspacing', {'frenchspacing' => 1});
test_line(["aa.)\x{7b2c} b"], "aa.)\x{7b2c} b", 'end_sentence_east_asian');

my $line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$result .= $line->add_next('_');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.)_  after", 'line add char after end sentence');

$para = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->end_line();
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "\nafter", 'line space after end_line');
#print STDERR "$result";

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$result .= $line->add_pending_word();
is ($result, 'aa.)', 'line call add_pending_word');
$result = $line->end_line();
is ($result, "\n", 'line call end_line after add_pending_word');
$result = $line->end();
is ($result, "", 'line call end after end_line');

$para = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$result .= $line->add_pending_word();
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.)  after", 'line space after sentence and add_pending_word');

$para = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aA');
$result .= $line->add_next('.', undef, 1);
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aA.  after", 'line force end sentence after upper case');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aA');
$result .= $line->add_text('.');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aA. after", 'line end sentence after upper case');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$result .= $line->add_text('))');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.)))  after", 'line continue with after_punctuation_characters');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$line->inhibit_end_sentence();
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.) after", 'line inhibit end sentence');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$line->inhibit_end_sentence();
$result .= $line->add_next('_');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.)_ after", 'line inhibit end sentence then add next');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$line->inhibit_end_sentence();
$result .= $line->add_text('aa.)');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.)aa.)  after", 'line cancel inhibit end sentence');

$line = Texinfo::Convert::Line->new();
$result = '';
$result .= $line->add_text('aa.)');
$line->inhibit_end_sentence();
$result .= $line->add_text('))');
$result .= $line->add_text(' after');
$result .= $line->end();
is ($result, "aa.))) after", 'line inhibit end sentence and ))');

$line = Texinfo::Convert::Line->new();
$result = '';
$line->set_space_protection(1,1);
$result .= $line->add_text(' aa.)');
is ($result, " ", 'line space_protection leading space');
$result .= $line->add_text(' ');
$result .= $line->add_text('then');
$result .= $line->add_text('fff     g');
$line->set_space_protection(0,0);
$result .= $line->end();
is ($result, " aa.) thenfff     g", 'line space_protection and spaces');

my $unfilled = Texinfo::Convert::UnFilled->new({'indent_length' => 5});
$result = '';
$result .= $unfilled->add_text("something\n");
$result .= $unfilled->add_text("\n");
$result .= $unfilled->add_text(" other\n");
$result .= $unfilled->end();
is ($result, "     something\n\n      other\n", 'unfilled and indent');

1;
