AC_INIT([texinfo], [6.0])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])

fetch_conf ()
{
          conf_value=`${PERL} -V:$1`
          echo got "$conf_value"
          # This turns a string like "cc='cc';" into a string like "cc".
          # We also turn \" into ", \' into ' and \\ into \.  There may 
          # be other \ sequences we want to process as well.  This is
          # the escape sequence for single-quoted strings in Perl.
          conf_value=`echo $conf_value \
              | sed -e 's/^@<:@^=@:>@*= *//'   \
                    -e 's/^'\\''//'            \
                    -e 's/ *; *$//'            \
                    -e 's/'\\''$//'            \
                    -e 's/\\\\"/"/g'           \
                    -e 's/\\\\'\\''/\\'\\''/g' \
                    -e 's/\\\\\\\\/\\\\/g'     `
          echo got "$conf_value"
} 

AC_DEFUN([lookup_perl_conf],
         [echo Getting Perl conf value $1
          fetch_conf $1
          AC_SUBST([PERL_CONF_$1], [$conf_value])
])

AC_DEFUN([lookup_perl_flags],
         [echo Getting Perl flags for $1

          fetch_conf $1

          # Remove any flags that aren't -I or -D
          conf_value=`echo $conf_value | sed -e 's/-@<:@^ID@:>@@<:@^ @:>@*//g'`
          echo cleaned is $conf_value

          AC_SUBST([PERL_CONF_$1], [$conf_value])
         ])

AC_PATH_PROG([PERL], [perl])

# It's essential that we use the same compiler that was used to build
# Perl.  Otherwise Perl's "config.h" will be incorrect.
lookup_perl_conf([cc])
CC=$conf_value

AC_PROG_CC

gl_EARLY
gl_INIT

LT_INIT


lookup_perl_flags([ccflags])
lookup_perl_flags([cccdlflags])

lookup_perl_conf([archlibexp])
lookup_perl_conf([privlibexp])

# TODO: would be nice to be able to do lookup_perl_conf([ccflags cccdlflags])
# A for loop doesn't work; it has to be expanded at m4 time

AC_PATH_PROG([XSUBPP], [xsubpp])

AC_CONFIG_FILES([Makefile lib/Makefile])
AC_CONFIG_HEADERS([config.h:config.in])
AC_OUTPUT
