#ifdef HAVE_CONFIG_H
  #include <config.h>
#endif

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "miscxs.h"

MODULE = Texinfo::MiscXSXS PACKAGE = Texinfo::MiscXSXS PREFIX = xs_

#  Copyright 2016 Free Software Foundation, Inc.
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.  

PROTOTYPES: DISABLE

int
xs_abort_empty_line (self, current, ...)
     HV *self
     HV *current
PREINIT:
     SV *additional_text = 0;
CODE:
     items -= 2;
     if (items > 0 && SvOK(ST(2)))
       {
         additional_text = ST(2);
       }
     RETVAL = xs_abort_empty_line (self, current, additional_text);
OUTPUT:
     RETVAL

HV *
xs_merge_text (self, current, text_in)
     HV *self
     HV *current
     SV *text_in

SV *
xs_unicode_text (text_in, ...)
     SV *text_in
 PREINIT:
     int in_code = 0;
     char *text;
     char *retval;
 CODE:
     items--;
     if (items > 0)
       {
         if (SvOK(ST(1)))
           in_code = (int) SvIV(ST(1));
       }
     /* Make sure the input is in UTF8. */
     if (!SvUTF8 (text_in))
       sv_utf8_upgrade (text_in);

     text = SvPV_nolen (text_in);

     retval = xs_unicode_text (text, in_code);

     RETVAL = newSVpv (retval, 0);
     SvUTF8_on (RETVAL);

 OUTPUT:
     RETVAL
