# Process this file with autoconf to produce a configure script.
# $Id: configure.ac,v 1.102 2011-10-01 23:09:22 pertusus Exp $
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
AC_INIT([GNU Texinfo], [4.13], [bug-texinfo@gnu.org])

dnl Must come before AM_INIT_AUTOMAKE.
AC_CONFIG_AUX_DIR([build-aux])
dnl tar-ustar because we have long filenames for some test files
AM_INIT_AUTOMAKE([1.10.1 readme-alpha dist-lzma tar-ustar])

# Minimum Autoconf version required.
AC_PREREQ(2.59)

# Where to generate output; srcdir location.
AC_CONFIG_HEADERS([config.h:config.in])dnl Keep filename to 8.3 for MS-DOS.
AC_CONFIG_SRCDIR([makeinfo/makeinfo.c])

AM_CONDITIONAL([TEXI2HTML],[false])

dnl Misc variable settings
PACKAGE_DATE=`${SHELL} "$srcdir"/build-aux/mdate-sh "$srcdir"/configure.ac`
AC_SUBST([PACKAGE_DATE])

# Checks for programs.
AC_PROG_CC

# Since we use gnulib: gl_EARLY must be called as soon as possible after
# the C compiler is checked.  The others could be later, but we just
# keep everything together.
gl_EARLY

dnl Rest of Gnulib.
gl_INIT


# Since we make a helper library.
AC_PROG_RANLIB
AM_MISSING_PROG(HELP2MAN, help2man)

AC_PROG_INSTALL
AC_PROG_MAKE_SET

AC_PROG_LN_S
AM_PROG_MKDIR_P

# Happens with some automake version
if test z"$MKDIR_P" = 'z'; then
  MKDIR_P=$mkdir_p
  AC_SUBST([MKDIR_P])
fi

dnl gettext Makefiles may need MKINSTALLDIRS
MKINSTALLDIRS="\$(top_srcdir)/build-aux/install-sh -d"
AC_SUBST([MKINSTALLDIRS])

AC_ARG_VAR([PERL], [The path to the 'perl' executable.])
AC_PATH_PROG([PERL], [perl], [/usr/bin/env perl], [/opt/perl5/bin:"$PATH"])

# Needed on sysV68 for sigblock, sigsetmask.  But check for it in libc first.
AC_CHECK_FUNC(sigblock, , [AC_CHECK_LIB(bsd, sigblock)])

# Checks for header files.
AC_HEADER_STAT
AC_HEADER_STDC
AC_CHECK_HEADERS(fcntl.h io.h limits.h pwd.h string.h strings.h \
  termcap.h termio.h termios.h unistd.h \
  sys/fcntl.h sys/file.h sys/stream.h sys/time.h sys/ttold.h sys/wait.h)

# sys/ptem.h requires sys/stream.h for mblk_t on Solaris.
AC_CHECK_HEADERS([sys/ptem.h],,,
[#if HAVE_SYS_STREAM_H
#include <sys/stream.h>
#endif
])

AC_SYS_POSIX_TERMIOS
AC_HEADER_TIOCGWINSZ

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_OFF_T
AC_TYPE_SIGNAL
AC_C_CONST
AC_STRUCT_TM

# Checks for function declarations.
AC_CHECK_DECLS([memchr, strcoll, strerror])

# Checks for library functions.
AC_FUNC_STRCOLL
AC_FUNC_VPRINTF
# in theory only pre-sysvr3 systems needed this and it's not likely
# that anyone compiling new texinfo still has such a thing? we'll see.
# AC_FUNC_SETVBUF_REVERSED
AC_CHECK_FUNCS(bzero getcwd memset setlocale setvbuf sigaction sigprocmask \
               sigsetmask strchr)
AC_REPLACE_FUNCS(memcpy memmove strdup strerror)

# We want to recognize djgpp to avoid the useless warning about no
# term library.
AC_CANONICAL_BUILD

# We need to run some of our own binaries, most notably makedoc, but as
# long as we have this process, we also use our own makeinfo and
# install-info.
#
# This means that if we are cross compiling, we have to configure the
# package twice: once with the native compiler (this is done in a
# subdirectory $native_tools), and once with the cross compiler.
# The former is invoked automatically here, with --host=$build.
# $native_tools is also added to SUBDIRS in the main Makefile.am,
# so that make compiles the native tools first.
#
if test "$cross_compiling" = no; then
  native_tools=
else
  native_tools=tools
  test -d "$native_tools" || mkdir "$native_tools"
  confdir=`(cd "$srcdir";pwd)`
  # Make sure the secondary configure won't fail with
  # "error: source directory already configured".
  rm -f config.status
  AC_MSG_NOTICE([[Doing configure of native tools (${build}).]])
  cd "$native_tools" || exit 1
  # Run secondary configure in alternate environment or
  # it gets the wrong CC etc.
  # env -i gives this build host configure a clean environment;
  # consequently, we have to re-initialize $PATH.
  env -i CC="$BUILD_CC" AR="$BUILD_AR" RANLIB="$BUILD_RANLIB" \
      PATH="$PATH" \
      tools_only=1 \
    ${confdir}/configure --build=${build} --host=${build} \
                         --disable-rpath --disable-nls
  cd .. || exit 1
  AC_MSG_NOTICE([[Continuing with main configure (${host}).]])
fi
AC_SUBST(native_tools)
AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])

# Some GNU/Linux systems (e.g., SuSE 4.3, 1996) don't have curses, but
# rather ncurses.  So we check for it.
TERMLIBS=
# Check for termlib before termcap because Solaris termcap needs libucb.
TERMLIB_VARIANTS="ncurses curses termlib termcap terminfo"
for termlib in ${TERMLIB_VARIANTS}; do
  AC_CHECK_LIB(${termlib}, tgetent,
     [TERMLIBS="${TERMLIBS} -l${termlib}"; break])
done
# don't bother warning on djgpp, it doesn't have a term library, it
# ports each termcap-needing program separately according to its needs.
if test -z "$TERMLIBS" && echo "$build" | grep -v djgpp >/dev/null; then
  AC_MSG_WARN([probably need a terminal library, one of: ${TERMLIB_VARIANTS}])
fi

# Checks for variables.
# HP-UX 9 (at least) needs -lncurses which defines termcap variables PC etc.
AC_MSG_CHECKING(for library with termcap variables)
AC_CACHE_VAL(ac_cv_var_ospeed,
[oldLIBS=$LIBS
for trylib in $termlib ${TERMLIB_VARIANTS}; do
   if test "x$trylib" != "x$termlib"; then
     LIBS="$oldLIBS -l$termlib -l$trylib"
   else
     LIBS="$oldLIBS -l$termlib"
   fi
   AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[#ifdef HAVE_NCURSES_TERMCAP_H
#include <ncurses/termcap.h>
#else
#ifdef HAVE_TERMCAP_H
#include <termcap.h>
#else
#undef PC
char *BC;
char **UP;
char PC;
short ospeed;
#endif
#endif
/* Make sure all variables actually exist.  AIX 4.3 has ospeed but no BC.
   --Andreas Ley <andy@rz.uni-karlsruhe.de> 24 Aug 2000.  */
BC++;
UP++;
PC++;
return ospeed != 0;
]])], [ac_cv_var_ospeed=$trylib; break])
done
LIBS=$oldLIBS
])
AC_MSG_RESULT($ac_cv_var_ospeed)
if test -n "$ac_cv_var_ospeed" \
   && test "x$termlib" != "x$ac_cv_var_ospeed"; then
  TERMLIBS="${TERMLIBS} -l${ac_cv_var_ospeed}"
fi
AC_SUBST(TERMLIBS)#

# Do not use <ncurses/termcap.h> unless we're linking with ncurses.
# Must come after the termlib tests.
if test "x$termlib" = xncurses; then
  # Use AC_CHECK_HEADERS so the HAVE_*_H symbol gets defined.
  AC_CHECK_HEADERS(ncurses/termcap.h)
fi

# For teTeX and TeX Live.
AC_CANONICAL_HOST
AC_ARG_ENABLE([multiplatform],
  [AS_HELP_STRING([--enable-multiplatform],
     [put executables into bin/PLATFORM and libraries into lib/PLATFORM])])dnl
# if enable_multiplatform is set in the environment, use that.
if test "x$enable_multiplatform" = xyes; then
  test "x$bindir" = 'x${exec_prefix}/bin' && bindir="$bindir/$host"
  test "x$libdir" = 'x${exec_prefix}/lib' && libdir="$libdir/$host"
fi

# Taken from the example in
# http://www.gnu.org/software/automake/manual/html_node/Conditionals.html.
AC_ARG_ENABLE(install-warnings,
  [  --disable-install-warnings  omit make install warnings about TeX files],
  [case "${enableval}" in
     yes) install_warnings=true ;;
      no) install_warnings=false ;;
       *) AC_MSG_ERROR(bad value ${enableval} for --enable-install-warnings) ;;
   esac],
   [install_warnings=true])
AM_CONDITIONAL(INSTALL_WARNINGS,
   test x"$install_warnings" = xtrue || test x"$install_warnings" = xyes)

USE_UNICODE=unknown
AC_ARG_WITH([encode],
    AC_HELP_STRING([--with-encode],
           [use encode (default: runtime detection)]),
    [if test $withval = 'no'; then
         USE_UNICODE=0
     else
         USE_UNICODE=1
     fi],
    [])

USE_EXTERNAL_EASTASIANWIDTH=no
AC_ARG_WITH([external-Unicode-EastAsianWidth],
   AC_HELP_STRING([--with-external-Unicode-EastAsianWidth],
      [use external Unicode-EastAsianWidth if found (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_EASTASIANWIDTH=yes
   fi]
)

AC_SUBST([USE_EXTERNAL_EASTASIANWIDTH])

USE_EXTERNAL_UNIDECODE=no
AC_ARG_WITH([external-Text-Unidecode],
    AC_HELP_STRING([--with-external-Text-Unidecode],
           [use external Text::Unidecode if found (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_UNIDECODE=yes
   fi]
)

AC_SUBST([USE_UNICODE])
AC_SUBST([USE_EXTERNAL_UNIDECODE])

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
t2h_po_dir='texi2html/'
AC_SUBST([t2h_po_dir])
t2h_po_top_builddir='../..'
AC_SUBST([t2h_po_top_builddir])

# i18n support.  To update to a new version of gettext, run:
# gettextize -f -c
AM_GNU_GETTEXT_VERSION([0.18.1])
AM_GNU_GETTEXT([external])

USE_EXTERNAL_LIBINTL=no
AC_ARG_WITH([external-libintl-perl],
   AC_HELP_STRING([--with-external-libintl-perl],
      [use external libintl-perl if found (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_LIBINTL=yes
   fi]
)

AC_SUBST([USE_EXTERNAL_LIBINTL])


# The test suite.
AC_CONFIG_FILES([install-info/tests/defs])
AC_CONFIG_FILES([util/defs])
AC_CHECK_PROGS([HEVEA], [hevea], [])
AC_CHECK_PROGS([TEX], [tex], [])
AC_CHECK_PROGS([PROVE], [prove], [])

tp_tests='no'
AC_ARG_ENABLE([tp-tests],
    AC_HELP_STRING([--enable-tp-tests],
        [run the parser and converters testsuite (default: detected)]),
    [if test $enableval = 'no'; then
       tp_tests='no'
     else
       tp_tests='yes'
     fi],
    [
     if test "z$PROVE" = 'z'; then
       tp_tests='no'
     elif $PERL -e "use 5.006; use Encode; use Test::More; use File::Basename; use File::Copy; use Data::Dumper; use Data::Compare; use Test::Deep; use Clone qw(clone); use Getopt::Long qw(GetOptions);" > /dev/null 2>&1;
     then
       tp_tests='yes'
     else  
       tp_tests='no'
     fi
    ])

AC_MSG_CHECKING([parser tests requirements])
AC_MSG_RESULT([$tp_tests])
AM_CONDITIONAL([TP_TESTS], [test "z$tp_tests" = 'zyes'])

AC_CONFIG_FILES([texi2html/texi2html_configured.pl:texi2html/texi2html.pl], 
   [chmod +x texi2html/texi2html_configured.pl])
AC_CONFIG_FILES([texi2html/check_texinfo.pl], [chmod +x texi2html/check_texinfo.pl])
AC_CONFIG_FILES([texi2html/manage_i18n.pl], [chmod +x texi2html/manage_i18n.pl])

dnl The bulk config files.
AC_CONFIG_FILES([\
  Makefile
  doc/Makefile
  gnulib/lib/Makefile
  info/Makefile
  install-info/Makefile
  install-info/tests/Makefile
  lib/Makefile
  makeinfo/Makefile
  makeinfo/tests/Makefile
  po/Makefile.in
  po_document/Makefile.in
  util/Makefile
  tp/Makefile
  texi2html/po_messages/POTFILES.in \
  texi2html/po_document/POTFILES.in \
  texi2html/po_messages/Makevars \
  texi2html/po_document/Makevars \
  texi2html/po_messages/Makefile.in
  texi2html/po_document/Makefile.in
  texi2html/Makefile \
  texi2html/test/Makefile \
  texi2html/test/contents/Makefile \
  texi2html/test/coverage/Makefile \
  texi2html/test/info_coverage/Makefile \
  texi2html/test/formatting/Makefile \
  texi2html/test/indices/Makefile \
  texi2html/test/invalid/Makefile \
  texi2html/test/misc/Makefile \
  texi2html/test/encodings/Makefile \
  texi2html/test/macros/Makefile \
  texi2html/test/manuals/Makefile \
  texi2html/test/nested_formats/Makefile \
  texi2html/test/sectioning/Makefile \
  texi2html/test/htmlxref/Makefile \
  texi2html/test/htmlxref-only_mono/Makefile \
  texi2html/test/htmlxref-only_split/Makefile \
  texi2html/test/xemacs_manual/Makefile \
  texi2html/test/texi2html_manual/Makefile \
  texi2html/test/tar_manual/Makefile \
  texi2html/test/singular_manual/Makefile \
  texi2html/test/layout/Makefile \
  texi2html/test/many_input_files/Makefile \
  texi2html/test/path_separator
])

AC_OUTPUT
