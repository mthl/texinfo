# Copyright (C) 2017-2018  Free Software Foundation, Inc.
#
# This file is part of GNU Texinfo.
#
# GNU Texinfo is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GNU Texinfo is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Texinfo.  If not, see <http://www.gnu.org/licenses/>.

AC_INIT([texinfo-js], [0.0.90], [bug-texinfo@gnu.org])
AC_CONFIG_SRCDIR([info.js])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign readme-alpha])
AM_SILENT_RULES([yes])

AC_PATH_PROG([MAKEINFO], [makeinfo])
if test "x$ac_cv_path_MAKEINFO" = "x"; then
   AC_MSG_ERROR([makeinfo not found])
fi

npm_path="${srcdir}/node_modules/.bin${PATH_SEPARATOR}$PATH"

AC_PATH_PROG([ESLINT], [eslint], [], [$npm_path])
AM_CONDITIONAL([HAVE_ESLINT], [test "x$ac_cv_path_ESLINT" != "x"])

AC_PATH_PROG([TSC], [tsc], [], [$npm_path])
AM_CONDITIONAL([HAVE_TYPESCRIPT], [test "x$ac_cv_path_TSC" != "x"])

AC_PATH_PROG([UGLIFYJS], [uglifyjs], [], [$npm_path])
AM_CONDITIONAL([HAVE_UGLIFYJS], [test "x$ac_cv_path_UGLIFYJS" != "x"])

AC_PATH_PROG([MODERNIZR], [modernizr], [], [$npm_path])
AM_CONDITIONAL([HAVE_MODERNIZR], [test "x$ac_cv_path_MODERNIZR" != "x"])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
