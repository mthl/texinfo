#ifdef HAVE_CONFIG_H
  /* configure generated header file */
  #include <xsparagraph_acconfig.h>
#endif

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "xspara.h"


MODULE = Texinfo::Convert::XSParagraph::XSParagraph PACKAGE = Texinfo::Convert::XSParagraph::XSParagraph PREFIX = xspara_

int
xspara_init ()

void
xspara_set_state (state)
     HV * state

void
xspara_get_state (state)
     HV * state

# Return a reference blessed into the XSParagraph class
# CLASS is ignored because we know it is "XSParagraph".  Optional
# CONF parameter.
SV *
xspara_new (class, ...)
        SV * class
    PREINIT:
        HV *hv;
        HV *pkg;
        HV *conf = 0;
        int id;
    CODE:
        items--;
        if (items > 0)
          {
            if (SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV)
              conf = (HV *) SvRV(ST(1));
          }
        /* id is ignored at the moment.  This call simply
           resets the state of the paragraph formatter. */
        id = xspara_new (conf);

        /* Create a new blessed hash reference, which the other functions
           need as their first argument. */
        /* Note that nothing is actually put in the hash yet. */
        pkg = gv_stashpv ("Texinfo::Convert::XSParagraph::XSParagraph", 0);
        hv = newHV ();
        RETVAL = newRV_inc ((SV *) hv);
        sv_bless (RETVAL, pkg);
    OUTPUT:
        RETVAL


int
xspara_end_line_count (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        RETVAL = xspara_end_line_count ();
        xspara_get_state (paragraph);
    OUTPUT:
        RETVAL

void
xspara__end_line (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        xspara__end_line ();
        xspara_get_state (paragraph);

char *
xspara_end_line (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        RETVAL = xspara_end_line ();
        xspara_get_state (paragraph);
    OUTPUT:
        RETVAL

char *
xspara_get_pending (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        RETVAL = xspara_get_pending ();
        xspara_get_state (paragraph);
    OUTPUT:
        RETVAL

# ... is for add_spaces
SV *
xspara_add_pending_word (paragraph, ...)
        HV * paragraph
    PREINIT:
        int add_spaces = 0;
        char *retval;
    CODE:
        items -= 1;
        if (items > 0)
          {
            if (SvOK(ST(1)))
              {
                add_spaces = (int)SvIV(ST(1));;
              }
          }
        //xspara_set_state (paragraph);
        retval = xspara_add_pending_word (add_spaces);
        xspara_get_state (paragraph);

        RETVAL = newSVpv (retval, 0);
        SvUTF8_on (RETVAL);
    OUTPUT:
        RETVAL

SV *
xspara_end (paragraph)
        HV * paragraph
    PREINIT:
        char *retval;
    CODE:
        //xspara_set_state (paragraph);
        retval = xspara_end ();
        xspara_get_state (paragraph);

        RETVAL = newSVpv (retval, 0);
        SvUTF8_on (RETVAL);
    OUTPUT:
        RETVAL


SV *
xspara_add_text (paragraph, text_in)
        HV * paragraph
        SV * text_in
    PREINIT:
        char *text;
        char *retval;
    CODE:
        /* Always convert the input to UTF8 with sv_utf8_upgrade, so we can 
           process it properly in xspara_add_next. */
        if (!SvUTF8 (text_in))
          sv_utf8_upgrade (text_in);

        text = SvPV_nolen (text_in);

        //xspara_set_state (paragraph);
        retval = xspara_add_text (text);
        xspara_get_state (paragraph);

        RETVAL = newSVpv (retval, 0);
        SvUTF8_on (RETVAL);

    OUTPUT:
        RETVAL

SV *
xspara_add_next (paragraph, text_in, ...)
        HV * paragraph
        SV * text_in
    PREINIT:
        char *text;
        STRLEN text_len;
        char *retval;
        SV *arg_in;
        int transparent = 0;
    CODE:
        items -= 2;
        if (items > 0)
          {
            items--;
            arg_in = ST(2);
            if (SvOK(arg_in))
              transparent = (int)SvIV(arg_in);
          }

        /* Always convert the input to UTF8 with sv_utf8_upgrade, so we can 
           process it properly in xspara_add_next. */
        if (!SvUTF8 (text_in))
          sv_utf8_upgrade (text_in);
        text = SvPV (text_in, text_len);

        //xspara_set_state (paragraph);
        retval = xspara_add_next (text, text_len, transparent);
        xspara_get_state (paragraph);

        RETVAL = newSVpv (retval, 0);
        SvUTF8_on (RETVAL);

    OUTPUT:
        RETVAL


void
xspara_remove_end_sentence (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        xspara_remove_end_sentence ();
        xspara_get_state (paragraph);

void
xspara_add_end_sentence (paragraph, value)
        HV * paragraph
        SV * value
    PREINIT:
        int intvalue = 0;
    CODE:
        if (SvOK(value))
          intvalue = (int)SvIV(value);
        //xspara_set_state (paragraph);
        xspara_add_end_sentence (intvalue);
        xspara_get_state (paragraph);

void
xspara_allow_end_sentence (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        xspara_allow_end_sentence ();
  
# Optional parameters are IGNORE_COLUMNS, KEEP_END_LINES, FRENCHSPACING
# Pass them to the C function as -1 if not given or undef.
char *
xspara_set_space_protection (paragraph, space_protection_in, ...)
        HV * paragraph
        SV * space_protection_in
    PREINIT:
        int space_protection = -1;
        int ignore_columns = -1;
        int keep_end_lines = -1;
        int french_spacing = -1;
        SV *arg_in;
    CODE:
        if (SvOK(space_protection_in))
          space_protection = (int)SvIV(space_protection_in);
        /* Get optional arguments from stack. */
        items -= 2;
        if (items > 0)
          {
            items--;
            arg_in = ST(2);
            if (SvOK(arg_in))
              ignore_columns = (int)SvIV(arg_in);
          }
        if (items > 0)
          {
            items--;
            arg_in = ST(3);
            if (SvOK(arg_in))
              keep_end_lines = (int)SvIV(arg_in);
          }
        if (items > 0)
          {
            items--;
            arg_in = ST(4);
            if (SvOK(arg_in))
              french_spacing = (int)SvIV(arg_in);
          }

        //xspara_set_state (paragraph);
        RETVAL = xspara_set_space_protection
          (space_protection, ignore_columns, keep_end_lines,
           french_spacing);
        xspara_get_state (paragraph);
    OUTPUT:
        RETVAL

