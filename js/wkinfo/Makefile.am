AUTOMAKE_OPTIONS=foreign
ACLOCAL_AMFLAGS = -I m4

webextension_LTLIBRARIES = libmyappwebextension.la
webextensiondir = $(libdir)/MyApp/web-extension
libmyappwebextension_la_SOURCES = extension.c common.h infopath.c infopath.h
libmyappwebextension_la_CFLAGS = $(AM_CFLAGS) $(WEB_EXTENSION_CFLAGS)
libmyappwebextension_la_LIBADD = $(WEB_EXTENSION_LIBS)
libmyappwebextension_la_LDFLAGS = -module -avoid-version -no-undefined

bin_PROGRAMS=webkit

webkit_SOURCES=main.c common.h

AM_CFLAGS=`pkg-config --cflags gtk+-3.0 webkit2gtk-4.0`

AM_LDFLAGS=`pkg-config --libs gtk+-3.0 webkit2gtk-4.0`
