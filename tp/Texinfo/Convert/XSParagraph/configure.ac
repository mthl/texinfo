AC_INIT([texinfo], [6.0])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])

AC_PROG_CC

gl_EARLY
gl_INIT

LT_INIT

AC_DEFUN([lookup_perl_conf],
         [echo Getting Perl conf value $1
          AC_SUBST([PERL_CONF_$1], [`$srcdir/fetch_conf.pl $1`])
         ])

AC_DEFUN([lookup_perl_flags],
         [echo Getting Perl flags for $1

          conf_value=`$srcdir/fetch_conf.pl $1`
          echo conf value is $conf_value

          # Remove any flags that aren't -I or -D
          conf_value=`echo $conf_value | sed -e 's/-@<:@^ID@:>@@<:@^ @:>@*//g'`
          echo cleaned is $conf_value

          AC_SUBST([PERL_CONF_$1], [$conf_value])
         ])


lookup_perl_flags([ccflags])
lookup_perl_flags([cccdlflags])

lookup_perl_conf([archlibexp])
lookup_perl_conf([cc])
lookup_perl_conf([privlibexp])

# TODO: would be nice to be able to do lookup_perl_conf([ccflags cccdlflags])
# A for loop doesn't work; it has to be expanded at m4 time

AC_PATH_PROG([PERL], [perl])
AC_PATH_PROG([XSUBPP], [xsubpp])

AC_CONFIG_FILES([Makefile lib/Makefile])
AC_CONFIG_HEADERS([config.h:config.in])
AC_OUTPUT
