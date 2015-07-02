AC_INIT([texinfo], [6.0])
AM_INIT_AUTOMAKE
LT_INIT
AC_CONFIG_MACRO_DIR([m4])

AC_DEFUN([lookup_perl_conf],
         [echo Getting Perl conf value $1
          AC_SUBST([PERL_CONF_$1], [`./fetch_conf.pl $1`])
         ])
AC_PROG_CC
lookup_perl_conf([ccflags])
lookup_perl_conf([cccdlflags])
lookup_perl_conf([archlibexp])
# TODO: would be nice to be able to do lookup_perl_conf([ccflags cccdlflags])
# A for loop doesn't work; it has to be expanded at m4 time

AC_PATH_PROG([PERL], [perl])
AC_PATH_PROG([XSUBPP], [xsubpp])


AC_CONFIG_FILES([Makefile])
AC_OUTPUT
