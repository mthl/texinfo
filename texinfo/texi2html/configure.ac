dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)
AC_INIT([texi2html], [5.0], [texi2html-bug@nongnu.org])
dnl 1.9 because we need tar-ustar, and tar-ustar because we have long 
dnl filenames for some test files
AM_INIT_AUTOMAKE([gnu 1.9 dist-bzip2 dist-zip tar-ustar])

dnl Disable Autoconf, Automake, and some other maintainer tools without the
dnl --enable-maintainer-mode argument.
AM_MAINTAINER_MODE

AM_CONDITIONAL([TEXI2HTML],[true])

AM_GNU_GETTEXT([external])
dnl it is not completly clear that we need that or not, since gettext is 
dnl not fully used.
AM_GNU_GETTEXT_VERSION([0.14])

dnl Misc variable settings
PACKAGE_DATE=`${SHELL} "$srcdir"/mdate-sh "$srcdir"/configure.ac`
AC_SUBST([PACKAGE_DATE])

dnl Checks for programs.
AC_PROG_LN_S
AM_PROG_MKDIR_P

# Happens with some automake version
if test z"$MKDIR_P" = 'z'; then
  MKDIR_P=$mkdir_p
  AC_SUBST([MKDIR_P])
fi

AC_ARG_VAR([PERL], [The path to the 'perl' executable.])
AC_PATH_PROG([PERL], [perl], [/usr/bin/env perl], [/opt/perl5/bin:"$PATH"])

USE_EXTERNAL_LIBINTL=no
AC_ARG_WITH([external-libintl-perl],
   AC_HELP_STRING([--with-external-libintl-perl],
      [use external libintl-perl if found (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_LIBINTL=yes
   fi]
)

if test z"$USE_NLS" = 'zyes'; then
   if test $USE_EXTERNAL_LIBINTL = 'yes'; then
      if $PERL -e "use Locale::Messages; Locale::TextDomain;" > /dev/null 2>&1;
      then :
      else 
        USE_EXTERNAL_LIBINTL=no
      fi
   fi
fi
AC_SUBST([USE_EXTERNAL_LIBINTL])

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

USE_EXTERNAL_EASTASIANWIDTH=no
AC_ARG_WITH([external-Unicode-EastAsianWidth],
   AC_HELP_STRING([--with-external-Unicode-EastAsianWidth],
      [use external Unicode-EastAsianWidth if found (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_EASTASIANWIDTH=yes
   fi]
)

if test z"$USE_UNICODE" = 'z1'; then
   if test $USE_EXTERNAL_EASTASIANWIDTH = 'yes'; then
      if $PERL -e "use Unicode::EastAsianWidth;" > /dev/null 2>&1;
      then :
      else 
        USE_EXTERNAL_EASTASIANWIDTH=no
      fi
   fi
fi
AC_SUBST([USE_EXTERNAL_EASTASIANWIDTH])

AC_ARG_WITH([unidecode],
    AC_HELP_STRING([--with-unidecode],
           [use Text::Unidecode (default: detected)]),
    [if test $withval = 'no'; then
         USE_UNIDECODE=0
     else
         USE_UNIDECODE=1
     fi],
    [
     USE_UNIDECODE=0
     if test $USE_UNICODE = 1; then
        if $PERL -e "use Text::Unidecode;" > /dev/null 2>&1; 
        then USE_UNIDECODE=1
        fi
     fi
     ])


AC_SUBST([USE_UNICODE])
AC_SUBST([USE_UNIDECODE])

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

# top_builddir and subdir differs between standalone texi2html and 
# texi2html in texinfo
t2h_po_dir=
AC_SUBST([t2h_po_dir])
t2h_po_top_builddir='..'
AC_SUBST([t2h_po_top_builddir])

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


dnl The bulk config files.
AC_CONFIG_FILES([ po_messages/Makefile.in po_document/Makefile.in \
                 po_messages/POTFILES.in \
                 po_document/POTFILES.in \
                 po_messages/Makevars \
                 po_document/Makevars \
                 Makefile \
                 Tests/Makefile \
                 test/Makefile \
                 test/contents/Makefile \
                 test/coverage/Makefile \
                 test/info_coverage/Makefile \
                 test/formatting/Makefile \
                 test/indices/Makefile \
                 test/invalid/Makefile \
                 test/misc/Makefile \
                 test/encodings/Makefile \
                 test/macros/Makefile \
                 test/manuals/Makefile \
                 test/nested_formats/Makefile \
                 test/sectionning/Makefile \
                 test/htmlxref/Makefile \
                 test/htmlxref-only_mono/Makefile \
                 test/htmlxref-only_split/Makefile \
                 test/xemacs_manual/Makefile \
                 test/texi2html_manual/Makefile \
                 test/tar_manual/Makefile \
                 test/singular_manual/Makefile \
                 test/layout/Makefile \
                 test/many_input_files/Makefile \
                 doc/Makefile \
                 test/path_separator
                 ])

dnl scripts
AC_CONFIG_FILES([texi2html_configured.pl:texi2html.pl], 
   [chmod +x texi2html_configured.pl])
AC_CONFIG_FILES([check_texinfo.pl], [chmod +x check_texinfo.pl])
AC_CONFIG_FILES([manage_i18n.pl], [chmod +x manage_i18n.pl])

AC_OUTPUT
