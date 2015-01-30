#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "mylib/xspara.h"


MODULE = XSParagraph	PACKAGE = XSParagraph     PREFIX = xspara_	

void
xspara_hello()

void
xspara_set_state (state)
     HV * state

void
xspara_get_state (state)
     HV * state

# Return a reference blessed into the XSParagraph class
# CLASS is ignored because we know it is "XSParagraph".  Optional
# CONF parameter.
# CONF is supposed to be optional.  Just make it non-optional, because
# I'm having problems getting the conf in and I may not be reading it
# properly
SV *
xspara_new (class, conf)
        SV * class
        HV * conf
    PREINIT:
        HV *hv;
        HV *pkg;
        int id;
    CODE:
        /* id is ignored at the moment.  This call simply
           resets the state of the paragraph formatter. */
        id = xspara_new (conf);

        /* Create a new blessed hash reference, which the other functions
           need as their first argument. */
        /* Note that nothing is actually put in the hash yet. */
        pkg = gv_stashpv ("XSParagraph", 0);
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
        char *add_spaces = 0;
        char *retval;
    CODE:
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



#
# Here's the code using 'char *'.
# The ... is for the underlying_text argument.
#char *
#xspara_add_text (paragraph, text, ...)
#        HV * paragraph
#        char * text
#    CODE:
#        xspara_set_state (paragraph);
#        RETVAL = xspara_add_text (text);
#        xspara_get_state (paragraph);
#    OUTPUT:
#        RETVAL
#


# The ... is for the underlying_text argument.
SV *
xspara_add_text (paragraph, text_in, ...)
        HV * paragraph
        SV * text_in
    PREINIT:
        char *text;
        char *retval;
    CODE:
        /* Always convert the input to UTF8 with sv_utf8_upgrade, so we can 
           process it properly in xspara_add_next. */
        /* "man perlguts" possibly says not to do this, but it's
           hard to tell what it's talking about. */
        if (!SvUTF8 (text_in))
          {
            //printf ("upgrading <%s>\n", SvPV_nolen (text_in));
            sv_utf8_upgrade (text_in);
            //printf ("got <%s>\n", SvPV_nolen (text_in));
          }
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
        //int utf8;
        char *retval;
        int end_sentence = -2;
    CODE:
        items -= 2;

        if (items > 0)
          {
            items--; /* space */
          }

        if (items > 0)
          {
            if (SvOK(ST(3)))
              {
                end_sentence = (int)SvIV(ST(3));
              }
            items--;
          }

        /* Always convert the input to UTF8 with sv_utf8_upgrade, so we can 
           process it properly in xspara_add_next. */
        if (!SvUTF8 (text_in))
          {
            sv_utf8_upgrade (text_in);
          }
        text = SvPV (text_in, text_len);

        //xspara_set_state (paragraph);
        retval = xspara_add_next (text, text_len, end_sentence);
        xspara_get_state (paragraph);

        RETVAL = newSVpv (retval, 0);
        SvUTF8_on (RETVAL);

    OUTPUT:
        RETVAL


void
xspara_inhibit_end_sentence (paragraph)
        HV * paragraph
    CODE:
        //xspara_set_state (paragraph);
        xspara_inhibit_end_sentence ();
        xspara_get_state (paragraph);
  
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

