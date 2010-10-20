use strict;

use Test::More;

require 't/test_utils.pl';

my @test_cases = (
['all_commands',
'@defvr c--ategory d--efvr_name
d--efvr
@end defvr

@deftypefn c--ategory t--ype d--eftypefn_name a--rguments...
d--eftypefn
@end deftypefn

@deftypeop c--ategory c--lass t--ype d--eftypeop_name a--rguments...
d--eftypeop
@end deftypeop

@deftypevr c--ategory t--ype d--eftypevr_name
d--eftypevr
@end deftypevr

@defcv c--ategory c--lass d--efcv_name
d--efcv
@end defcv

@defop c--ategory c--lass d--efop_name a--rguments...
d--efop
@end defop

@deftp c--ategory d--eftp_name a--ttributes...
d--eftp
@end deftp

@defun d--efun_name a--rguments...
d--efun
@end defun

@defmac d--efmac_name a--rguments...
d--efmac
@end defmac

@defspec d--efspec_name a--rguments...
d--efspec
@end defspec

@defvar d--efvar_name
d--efvar
@end defvar

@defopt d--efopt_name
d--efopt
@end defopt

@deftypefun t--ype d--eftypefun_name a--rguments...
d--eftypefun
@end deftypefun

@deftypevar t--ype d--eftypevar_name
d--eftypevar
@end deftypevar

@defivar c--lass d--efivar_name
d--efivar
@end defivar

@deftypeivar c--lass t--ype d--eftypeivar_name
d--eftypeivar
@end deftypeivar

@defmethod c--lass d--efmethod_name a--rguments...
d--efmethod
@end defmethod

@deftypemethod c--lass t--ype d--eftypemethod_name a--rguments...
d--eftypemethod
@end deftypemethod
'],
['end_of_lines_protected',
'@deffn category deffn_name arguments @
   more {args @
  with end of line within} with 3 @@ @@@
 {one last arg}
deffn
@end deffn
'],
['empty_def_command',
'@deffn empty deffn
@end deffn

@deffn empty deffn with deffnx
@deffnx empty deffnx
@end deffn
'],
['end_of_line_protect_at_end',
'
@deffn category2 deffn_name2 arguments2 @'],
['end_of_lines_protected_in_footnote',
'@footnote{
@deffn category deffn_name arguments arg2 @
   more {args @
  with end of line within} with 3 @@ @@@
 {one last arg}
deffn
@end deffn
}
'],
# the command with type is compared with the corresponding command without type
['empty_deftype',
'@deftypefun {} f (const type& x)
Deftypefun.
@end deftypefun

@defun f (const type& x)
Defun.
@end defun

@deftypemethod c {} f (const type& x)
Deftypemethod.
@end deftypemethod

@defmethod c f (const type& x)
Defmethod.
@end defmethod
']
);

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('def', \@test_cases, $arg_test_case,
   $arg_generate, $arg_debug);

