/* Copyright 2010, 2011, 2012, 2013, 2014, 2015, 2016 Free Software
   Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

#ifdef HAVE_CONFIG_H
  #include <config.h>
#endif
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <locale.h>
#ifndef _WIN32
#include <langinfo.h>
#endif
#include <wchar.h>
#include <wctype.h>

/* See "How do I use all this in extensions" in 'man perlguts'. */
#define PERL_NO_GET_CONTEXT

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "miscxs.h"

const char *whitespace_chars = " \t\f\v\r\n";

HV *
xs_merge_text (HV *self, HV *current, SV *text_in)
{
  AV *contents_array;

  int no_merge_with_following_text = 0;
  char *text;
  int leading_spaces;
  SV *leading_spaces_sv = 0;
  int call_ret;
  SV *returned_sv;

  SV *contents_ref;
  int contents_num;
  HV *last_elt;
  SV *existing_text_sv;
  char *existing_text;
  SV **svp;

  dTHX;

  dSP;

  if (!SvUTF8 (text_in))
    sv_utf8_upgrade (text_in);

  text = SvPV_nolen (text_in);

  leading_spaces = strspn (text, whitespace_chars);
  if (text[leading_spaces])
    {
      int contents_num;

      if (leading_spaces > 0)
        {
          leading_spaces_sv = newSVpv (text, leading_spaces);
        }

      svp = hv_fetch (current,
                      "contents", strlen ("contents"), 0);
      contents_array = (AV *)SvRV(*svp);
      
      contents_num = av_top_index(contents_array) + 1;
      if (contents_num > 0)
        {
          HV *last_elt;
          char *type = 0;

          last_elt = (HV *)
            SvRV (*av_fetch (contents_array, contents_num - 1, 0));

          svp = hv_fetch (last_elt, "type", strlen ("type"), 0);
          if (svp)
            type = SvPV_nolen (*svp);
          if (type
              && (!strcmp (type, "empty_line_after_command")
                  || !strcmp (type, "empty_spaces_after_command")
                  || !strcmp (type, "empty_spaces_before_argument")
                  || !strcmp (type, "empty_spaces_after_close_brace")))
            {
              no_merge_with_following_text = 1;
            }
        }

      /* See 'perlcall' man page. */
      ENTER;
      SAVETMPS;

      /**********************/
      PUSHMARK(SP);
      XPUSHs(sv_2mortal(newRV_inc((SV *)self)));
      XPUSHs(sv_2mortal(newRV_inc((SV *)current)));
      XPUSHs(leading_spaces_sv);
      PUTBACK;

      call_ret = call_pv ("Texinfo::Parser::_abort_empty_line", G_SCALAR);

      SPAGAIN;

      returned_sv = POPs;
      if (returned_sv && SvRV(returned_sv))
        {
          text += leading_spaces;
        }

      /************************/

      PUSHMARK(SP);
      XPUSHs(sv_2mortal(newRV_inc((SV *)self)));
      XPUSHs(sv_2mortal(newRV_inc((SV *)current)));
      PUTBACK;

      call_ret = call_pv ("Texinfo::Parser::_begin_paragraph", G_SCALAR);

      SPAGAIN;

      returned_sv = POPs;

      /************************/

      if (returned_sv && SvRV(returned_sv))
        {
          current = (HV *)SvRV(returned_sv);
        }

      FREETMPS;
      LEAVE;
    }

  svp = hv_fetch (current, "contents", strlen ("contents"), 0);
  if (!svp)
    {
      contents_array = newAV ();
      contents_ref = newRV_inc ((SV *) contents_array);
      hv_store (current, "contents", strlen ("contents"),
                contents_ref, 0);
      fprintf (stderr, "NEW CONTENTS %p\n", contents_array);
      goto NEW_TEXT;
    }
  else
    {
      contents_ref = *svp;
      contents_array = (AV *)SvRV(contents_ref);
    }

  if (no_merge_with_following_text)
    goto NEW_TEXT;

  contents_num = av_top_index(contents_array) + 1;
  if (contents_num == 0)
    goto NEW_TEXT;

  last_elt = (HV *)
    SvRV (*av_fetch (contents_array, contents_num - 1, 0));
  svp = hv_fetch (last_elt, "text", strlen ("text"), 0);
  if (!svp)
    goto NEW_TEXT;
  existing_text_sv = *svp;
  existing_text = SvPV_nolen (existing_text_sv);
  if (strchr (existing_text, '\n'))
    goto NEW_TEXT;

MERGED_TEXT:
  sv_catpv (existing_text_sv, text);
  //fprintf (stderr, "MERGED TEXT: %s|||\n", text);

  if (0)
    {
      HV *hv;
      SV *sv;
NEW_TEXT:
      hv = newHV ();
      sv = newSVpv (text, 0);
      hv_store (hv, "text", strlen ("text"), sv, 0);
      SvUTF8_on (sv);
      hv_store (hv, "parent", strlen ("parent"),
                newRV_inc ((SV *)current), 0);
      av_push (contents_array, newRV_inc ((SV *)hv));
      //fprintf (stderr, "NEW TEXT: %s|||\n", text);
    }

  return current;
}

char *
xs_unicode_text (char *text, int in_code)
{
  char *p, *q;
  char *new;
  int new_space, new_len;

  if (in_code)
    return text;

  p = text;
  new_space = strlen (text);
  new = malloc (new_space + 1);
  new_len = 0;
#define ADD3(s) \
  if (new_len + 2 >= new_space - 1)               \
    {                                             \
      new_space += 2;                             \
      new = realloc (new, new_space *= 2);        \
    }                                             \
  new[new_len++] = s[0];                          \
  new[new_len++] = s[1];                          \
  new[new_len++] = s[2];

#define ADD1(s) \
  if (new_len >= new_space - 1)                   \
    new = realloc (new, (new_space *= 2) + 1);    \
  new[new_len++] = s;

#define ADDN(s, n) \
  if (new_len + n - 1 >= new_space - 1)           \
    {                                             \
      new_space += n;                             \
      new = realloc (new, (new_space *= 2) + 1);  \
    }                                             \
  memcpy(new + new_len, s, n);                    \
  new_len += n;

  while (1)
    {
      q = p + strcspn (p, "-`'");
      ADDN(p, q - p);
      if (!*q)
        break;
      switch (*q)
        {
        case '-':
          if (!memcmp (q, "---", 3))
            {
              p = q + 3;
              /* Unicode em dash U+2014 (0xE2 0x80 0x94) */
              ADD3("\xE2\x80\x94");
            }
          else if (!memcmp (q, "--", 2))
            {
              p = q + 2;
              /* Unicode em dash U+2013 (0xE2 0x80 0x93) */
              ADD3("\xE2\x80\x93");
            }
          else
            {
              p = q + 1;
              ADD1(*q);
            }
          break;
        case '`':
          if (!memcmp (q, "``", 2))
            {
              p = q + 2;
              /* U+201C E2 80 9C */
              ADD3("\xE2\x80\x9C");
            }
          else
            {
              p = q + 1;
              /* U+2018 E2 80 98 */
              ADD3("\xE2\x80\x98");
            }
          break;
        case '\'':
          if (!memcmp (q, "''", 2))
            {
              p = q + 2;
              /* U+201D E2 80 9D */
              ADD3("\xE2\x80\x9D");
            }
          else
            {
              p = q + 1;
              /* U+2019 E2 80 99 */
              ADD3("\xE2\x80\x99");
            }
          break;
        }
    }

  new[new_len] = '\0';
  return new;
}
