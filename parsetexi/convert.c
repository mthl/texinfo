/* Copyright 2010, 2011, 2012, 2013, 2014, 2015
   Free Software Foundation, Inc.

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

#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "parser.h"
#include "text.h"

/* Stub for Texinfo::Convert::Text::convert */
char *
text_convert (ELEMENT *e)
{
  int which = e->contents.number;
  which--;
  if (which > 0)
    {
      if (e->contents.list[which]->type == ET_spaces_at_end)
        which--;

      if (which > 0 && e->contents.list[which]->text.text)
        return e->contents.list[which]->text.text;
    }
  return "AAAAAAAAA";
}

/* Produce normalized node name recursively.  IN_UC is non-zero if we are 
   converting to upper case.  */
static void
convert_to_normalized_internal (ELEMENT *root, TEXT *result, int in_uc)
{
#define ADD(x) text_append (result, x)

  /* Empty if ignored type, or ignored brace command, or has a misc arg or misc 
     line arg argument. */

  if (root->text.end > 0)
    {
      char *p = root->text.text, *q;
      while (*p)
        {
          q = p;
          while (isalnum (*q))
            q++;
          text_append_n (result, p, q - p);
          p = q;
          if (isspace (*p))
            {
              text_append (result, "-");
              p += strspn (p, whitespace_chars);
            }
          else if (*p != '\0')
            {
              // FIXME: This is completely wrong as far as Unicode is concerned
              text_printf (result, "_00%02x", *p);
              p++;
            }
        }
    }

  if (root->cmd != CM_NONE) // 228 NodeNameNormalization.pm
    {
      if (command_flags(root) & CF_nobrace || root->cmd == CM_ASTERISK)
        {
          switch (root->cmd) // 353 Common.pm
            {
            case CM_ASTERISK:
              ADD("-");
              break;
            case CM_SPACE:
            case CM_TAB:
            case CM_NEWLINE:
              ADD("-");
              break;
            case CM_HYPHEN:
            case CM_VERTICAL_BAR:
            case CM_SLASH:
            case CM_COLON:
              break;
            case CM_EXCLAMATION_MARK:
            case CM_QUESTION_MARK:
            case CM_FULL_STOP:
            case CM_AT_SIGN:
            case CM_CLOSE_BRACE:
            case CM_OPEN_BRACE:
            case CM_BACKSLASH:
              text_printf (result, "_00%02x", *command_name(root->cmd));
              break;
            default:
              /* Shouldn't get here. */
              break;
            }
          return;
        }
      else /* unicode_character_brace_no_arg_commands line 538 of Unicode.pm */
        {
          int not_processed = 0;
          /* TODO: There are more commands there than are listed in
             "(texinfo)HTML Xref Command Expansion", like @guillemetleft. */

          /* All of these are non-ASCII characters. */

          /* TODO: How exactly to normalize to Unicode Normalization Form C?
             It would be better to leave it to Perl, so we don't have to find a 
             Unicode library for C.
             In that case we should add the UTF-8 character, instead of its
             _XXXX representation, and normalize, followed by the conversion to 
             the escaped form.
             Read in Perl with "$characters = decode('UTF-8', $octets,     
             Encode::FB_CROAK);" */

          switch (root->cmd)
            {
            case CM_bullet:
              ADD("_2022"); break;
            case CM_copyright:
              ADD("_00a9"); break;
            case CM_registeredsymbol:
              ADD("_00ae"); break;
            case CM_dots:
              ADD("_2026"); break;
            case CM_equiv:
              ADD("_2261"); break;
            case CM_expansion:
              ADD("_21a6"); break;
            case CM_arrow:
              ADD("_2192"); break;
            case CM_minus:
              ADD("_2212"); break;
            case CM_point:
              ADD("_2605"); break;
            case CM_print:
              ADD("_22a3"); break;
            case CM_result:
              ADD("_21d2"); break;
            case CM_aa:
              ADD("_00e5"); break;
            case CM_AA:
              ADD("_00c5"); break;
            case CM_ae:
              ADD("_00e6"); break;
            case CM_oe:
              ADD("_0153"); break;
            case CM_AE:
              ADD("_00c6"); break;
            case CM_OE:
              ADD("_0152"); break;
            case CM_o:
              ADD("_00f8"); break;
            case CM_O:
              ADD("_00d8"); break;
            case CM_ss:
              ADD("_00df"); break;
            case CM_DH:
              ADD("_00d0"); break;
            case CM_dh:
              ADD("_00f0"); break;
            case CM_TH:
              ADD("_00de"); break;
            case CM_th:
              ADD("_00fe"); break;
            case CM_l:
              ADD("_0142"); break;
            case CM_L:
              ADD("_0141"); break;
            case CM_exclamdown:
              ADD("_00a1"); break;
            case CM_questiondown:
              ADD("_00bf"); break;
            case CM_pounds:
              ADD("_00a3"); break;
            case CM_ordf:
              ADD("_00aa"); break;
            case CM_ordm:
              ADD("_00ba"); break;
            case CM_comma:
              ADD("_002c"); break;
            case CM_atchar:
              ADD("_0040"); break;
            case CM_lbracechar:
              ADD("_007b"); break;
            case CM_rbracechar:
              ADD("_007d"); break;
            case CM_backslashchar:
              ADD("_005c"); break;
            case CM_hashchar:
              ADD("_0023"); break;
            case CM_euro:
              ADD("_20ac"); break;
            case CM_geq:
              ADD("_2265"); break;
            case CM_leq:
              ADD("_2264"); break;
            case CM_textdegree:
              ADD("_00b0"); break;
            case CM_quotedblleft:
              ADD("_201c"); break;
            case CM_quotedblright:
              ADD("_201d"); break;
            case CM_quoteleft:
              ADD("_2018"); break;
            case CM_quoteright:
              ADD("_2019"); break;
            case CM_quotedblbase:
              ADD("_201e"); break;
            case CM_quotesinglbase:
              ADD("_201a"); break;
            case CM_guillemetleft:
              ADD("_00ab"); break;
            case CM_guillemetright:
              ADD("_00bb"); break;
            case CM_guillemotleft:
              ADD("_00ab"); break;
            case CM_guillemotright:
              ADD("_00bb"); break;
            case CM_guilsinglleft:
              ADD("_2039"); break;
            case CM_guilsinglright:
              ADD("_203a"); break;
            case CM_click:
              ADD("_2192"); break;
            default:
              not_processed = 1;
            }
          if (!not_processed)
            return;
        }

      /* 300 bracketed. */
      if (root->type == ET_bracketed)
        text_append_n (result, "{", 1);

      if (command_flags(root) & CF_accent) //243
        {
          /* TODO: Get the Unicode value for the accented character. */
          return;
        }
      // else // 262 ref commands - why would we have these in node names??

      /* For example, the @t command in "@t{makeinfo} Pointer Creation". */
      else if (root->args.number >= 1 // 287
               && (args_child_by_index(root, 0)->type == ET_brace_command_arg
                   || root->cmd == CM_math))
        {
          if (root->cmd == CM_sc)
            in_uc = 1;
          convert_to_normalized_internal (args_child_by_index(root, 0),
                                          result, in_uc);
        }
    } // 294

  if (root->contents.number > 0) // 295
    {
      /* Concatenate the conversion of each contents child. */
      int i;

      for (i = 0; i < root->contents.number; i++)
        {
          convert_to_normalized_internal (root->contents.list[i],
                                          result, in_uc);
        }
    }

  /* 300 bracketed. */
  if (root->type == ET_bracketed)
    text_append_n (result, "}", 1);

#undef ADD
}

/* Replacement for Texinfo::Convert::NodeNameNormalization::normalize_node. */
char *
convert_to_normalized (ELEMENT *label)
{
  TEXT result;

  if (!label)
    return "";
  text_init (&result);
  convert_to_normalized_internal (label, &result, 0);
  
  if (result.end > 0 && isdigit (result.text[0]))
    {
      /* prefix "g_t" if starts with a digit */
      char *s;
      asprintf (&s, "g_t%s", result.text);
      free (result.text);
      return s;
    }
  else
    return result.text;
}
