dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)
AC_INIT([texi2html], [1.77], [users@texi2html.cvshome.org])
AM_INIT_AUTOMAKE([gnu 1.7 dist-bzip2 dist-zip])

dnl Disable Autoconf, Automake, and some other maintainer tools without the
dnl --enable-maintainer-mode argument.
AM_MAINTAINER_MODE

dnl Misc variable settings
PACKAGE_DATE=`"$srcdir"/mdate-sh "$srcdir"/configure.ac`
AC_SUBST([PACKAGE_DATE])

dnl Checks for programs.
AC_ARG_VAR([PERL], [The path to the `perl' executable.])
AC_PATH_PROG([PERL], [perl], [/usr/bin/env perl], [/opt/perl5/bin:"$PATH"])

AC_ARG_WITH([encode],
    AC_HELP_STRING([--with-encode],
           [use encode (default: detected)]),
    [if test $withval = 'no'; then
         USE_UNICODE=0
     else
         USE_UNICODE=1
     fi],
    [
     if $PERL -e "use Encode; use Unicode::Normalize;" > /dev/null 2>&1; 
     then USE_UNICODE=1
     else
         USE_UNICODE=0
     fi
     ])

AC_SUBST([USE_UNICODE])

t2h_try_translations=
AC_ARG_ENABLE([translations],
    AC_HELP_STRING([--enable-translations],
        [try to rebuild translation files (default: detected)]),
    [if test $enableval = 'no'; then
       t2h_try_translations='no'
     else
       t2h_try_translations='yes'
     fi],
    [ if $PERL -e "use 5.0; use Data::Dumper;" > /dev/null 2>&1;
     then
       t2h_try_translations='yes'
     else  
       t2h_try_translations='no'
     fi
    ])

if test "z$t2h_try_translations" = 'zyes'; then
    USE_DATA_DUMPER=1
    REQUIRE_DATA_DUMPER="use Data::Dumper"
else
    USE_DATA_DUMPER=0
    REQUIRE_DATA_DUMPER=1
fi
AC_SUBST([USE_DATA_DUMPER])
AC_SUBST([REQUIRE_DATA_DUMPER])

AC_PROG_INSTALL

dnl Checks for libraries.

dnl Checks for header files.

dnl Checks for typedefs, structures, and compiler characteristics.

dnl Checks for library functions.
# For teTeX and TeX Live.

AC_CANONICAL_HOST
AC_ARG_ENABLE(multiplatform,
  [  --enable-multiplatform  put executables in bin/PLATFORM])
test "x$enable_multiplatform" = xyes \
&& test "x$bindir" = 'x${exec_prefix}/bin' \
&& bindir="$bindir/$host"

AC_CONFIG_FILES([texi2html_configured.pl:texi2html.pl], 
   [chmod +x texi2html_configured.pl])
AC_CONFIG_FILES([check_texinfo.pl], [chmod +x check_texinfo.pl])
AC_CONFIG_FILES([manage_i18n.pl], [chmod +x manage_i18n.pl])

dnl The bulk config files.
AC_CONFIG_FILES([\
                 Makefile \
                 Tests/Makefile \
                 doc/Makefile 
                 ])
AC_OUTPUT
