# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Pod-Simple-Texinfo.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
BEGIN { plan tests => 4 };
use Pod::Simple::Texinfo;
ok(1); # If we made it this far, we're ok.

#########################

sub run_test($$$)
{
  my $in = shift;
  my $out = shift;
  my $name = shift;

  my $parser = Pod::Simple::Texinfo->new();
  $parser->set_source(\$in);
  my $result;
  $parser->output_string(\$result);
  $parser->bare_output(1);
  $parser->run();
  if (defined($out)) {
    is ($result, $out, $name);
  } else {
    print "$name:\n";
    print STDERR $result;
  }
}

run_test ('=head1 T
X<aaa>
',
'@chapter T
@anchor{T}
@cindex aaa

', 'index in head');

run_test ('=head1 T

Para X<bb>
in para X<cc>  
qtil X<ff> ggg
n X<ww> X<ff> C<aa>.
C<JJ> X<tt>.
X<-r>X<+p>
X<fff>
X<WWW>
I<GG>X<DD>C<MM>.
',
'@chapter T
@anchor{T}

@cindex bb
@cindex cc
@cindex ff
@cindex ww
@cindex ff
@cindex tt
@cindex -r
@cindex +p
@cindex fff
@cindex WWW
@cindex DD
Para in para qtil ggg
n @code{aa}.
@code{JJ} .
@emph{GG}@code{MM}.

', 'index in paragaph');

run_test('=over

=item a
X<it> b

=item c
X<C<code>>

Para

=back
',
'@table @asis
@item a b
@anchor{a b}
@cindex it

@item c
@anchor{c}
@cindex @code{code}

Para

@end table

', 'index in item-text');

1;

