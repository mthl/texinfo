/* info-utils.c -- miscellanous.
   $Id$

   Copyright 1993, 1998, 2003, 2004, 2007, 2008, 2009, 2011, 2012,
   2013, 2014 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#include "info.h"
#include "info-utils.h"
#include "tag.h"

#include <nl_types.h>
#include <langinfo.h>
#if HAVE_ICONV
# include <iconv.h>
#endif
#include <wchar.h>

#ifdef __hpux
#define va_copy(ap1,ap2) memcpy((&ap1),(&ap2),sizeof(va_list))
#endif

/* When non-zero, various display and input functions handle ISO Latin
   character sets correctly. */
int ISO_Latin_p = 1;

/* Variable which holds the most recent filename parsed as a result of
   calling info_parse_xxx (). */
char *info_parsed_filename = NULL;

/* Variable which holds the most recent nodename parsed as a result of
   calling info_parse_xxx (). */
char *info_parsed_nodename = NULL;

/* Variable which holds the most recent line number parsed as a result of
   calling info_parse_xxx (). */
int info_parsed_line_number = 0;

/* Parse the filename and nodename out of STRING.  Return length of node
   specification.  If STRING doesn't contain a filename (i.e., it is NOT
   (FILENAME)NODENAME) then set INFO_PARSED_FILENAME to NULL.  The
   second argument is one of the PARSE_NODE_* constants.  It specifies
   how to parse the node name:

   PARSE_NODE_DFLT             Node name stops at LF, `,', `.', or `TAB'
   PARSE_NODE_SKIP_NEWLINES    Node name stops at `,', `.', or `TAB'
   PARSE_NODE_VERBATIM         Don't parse nodename
*/ 
   
int
info_parse_node (char *string, int flag)
{
  register int i = 0;
  int nodename_len;
  char *terminator;
  int length = 0; /* Return value */

  switch (flag)
    {
    case PARSE_NODE_DFLT:
      terminator = "\r\n,.\t"; break;
    case PARSE_NODE_SKIP_NEWLINES:
      terminator = ",.\t"; break;
    case PARSE_NODE_VERBATIM:
      terminator = ""; break;
    }

  /* Default the answer. */
  free (info_parsed_filename);
  free (info_parsed_nodename);
  info_parsed_filename = 0;
  info_parsed_nodename = 0;

  /* Special case of nothing passed.  Return nothing. */
  if (!string || !*string)
    return 0;

  if (flag != PARSE_NODE_DFLT)
    length = skip_whitespace_and_newlines (string);
  else  
    length = skip_whitespace (string);
  string += length;

  /* Check for (FILENAME)NODENAME. */
  if (*string == '(')
    {
      int bcnt;
      int bfirst;
      
      i = 0;
      /* Advance past the opening paren. */
      string++;
      length++;

      /* Find the closing paren. Handle nested parens correctly. */
      for (bcnt = 0, bfirst = -1; string[i]; i++)
	{
	  if (string[i] == ')')
	    {
	      if (bcnt == 0)
		{
		  bfirst = -1;
		  break;
		}
	      else if (!bfirst)
		bfirst = i;
	      bcnt--;
	    } 
	  else if (string[i] == '(')
	    bcnt++;
	}

      if (bfirst >= 0)
	i = bfirst;
      
      /* Remember parsed filename. */
      info_parsed_filename = xcalloc (1, i+1);
      memcpy (info_parsed_filename, string, i);

      /* Point directly at the nodename. */
      string += i;
      length += i;

      if (*string)
        {
          string++;
          length++;
        }
    }

  /* Parse out nodename. */
  nodename_len = read_quoted_string (string, terminator,
                                     &info_parsed_nodename);

  string += nodename_len;
  length += nodename_len;

  if (nodename_len == 0)
    {
      free (info_parsed_nodename);
      info_parsed_nodename = 0;
    }
  else
    canonicalize_whitespace (info_parsed_nodename);

  if (info_parsed_nodename && !*info_parsed_nodename)
    {
      free (info_parsed_nodename);
      info_parsed_nodename = NULL;
    }

  /* Parse ``(line ...)'' part of menus, if any.  */
  {
    char *rest = string;

    /* Advance only if it's not already at end of string.  */
    if (*rest)
      rest++;

    /* Skip any whitespace first, and then a newline in case the item
       was so long to contain the ``(line ...)'' string in the same
       physical line.  */
    while (whitespace(*rest))
      rest++;
    if (*rest == '\n')
      {
        rest++;
        while (whitespace(*rest))
          rest++;
      }

    /* Are we looking at an opening parenthesis?  That can only mean
       we have a winner. :)  */
    if (strncmp (rest, "(line ", strlen ("(line ")) == 0)
      {
        rest += strlen ("(line ");
        info_parsed_line_number = strtol (rest, NULL, 0);
      }
    else
      info_parsed_line_number = 0;
  }
  return length;
}

/* Set *OUTPUT to a copy of the string starting at START and finishing at
   a character in TERMINATOR, unless START[0] == INFO_QUOTE, in which case
   copy string from START+1 until the next occurence of INFO_QUOTE.  Return
   length of string including any quoting characters.

   TODO: Decide on best method of quoting. */
long
read_quoted_string (char *start, char *terminator, char **output)
{
  long len;

  if (start[0] != '\177')
    {
      len = strcspn (start, terminator);

      *output = xmalloc (len + 1);
      strncpy (*output, start, len);
      (*output)[len] = '\0';

      return len;
    }
#ifdef QUOTE_NODENAMES
  else
    {
      len = strcspn (start + 1, "\177");

      *output = xmalloc (len + 1);
      strncpy (*output, start + 1, len);
      (*output)[len] = '\0';

      return len + 2;
    }
#else /* ! QUOTE_NODENAMES */
  *output = xstrdup ("");
  return 0;
#endif
}


/* **************************************************************** */
/*                                                                  */
/*                  Finding and Building Menus                      */
/*                                                                  */
/* **************************************************************** */

/* Get the entry associated with LABEL in the menu of NODE.  Return a
   pointer to the ENTRY if found, or null.  Return value should not
   be freed by caller. */
REFERENCE *
info_get_menu_entry_by_label (NODE *node, char *label, int sloppy) 
{
  register int i;
  REFERENCE *entry;
  REFERENCE **references = node->references;

  if (!references)
    return 0;

  /* First look for an exact match. */
  for (i = 0; entry = references[i]; i++)
    {
      if (REFERENCE_MENU_ITEM != entry->type) continue;
      if (strcmp (label, entry->label) == 0)
        return entry;
    }

  /* If the item wasn't found, search the list sloppily.  Perhaps this
     user typed "buffer" when they really meant "Buffers". */
  if (sloppy)
    {
      int i;
      int best_guess = -1;

      for (i = 0; entry = references[i]; i++)
        {
          if (REFERENCE_MENU_ITEM != entry->type) continue;
          if (mbscasecmp (label, entry->label) == 0)
            return entry; /* Exact, case-insensitive match. */
          else if (best_guess == -1
                && (mbsncasecmp (entry->label, label, strlen (label)) == 0))
              best_guess = i;
        }

      if (!entry && best_guess != -1)
        return references[best_guess];
    }

  return 0;
}

/* A utility function for concatenating REFERENCE **.  Returns a new
   REFERENCE ** which is the concatenation of REF1 and REF2.  */
REFERENCE **
info_concatenate_references (REFERENCE **ref1, REFERENCE **ref2)
{
  register int i, j;
  REFERENCE **result;
  int size = 0;

  /* Get the total size of the slots that we will need. */
  if (ref1)
    {
      for (i = 0; ref1[i]; i++);
      size += i;
    }

  if (ref2)
    {
      for (i = 0; ref2[i]; i++);
      size += i;
    }

  result = xmalloc ((1 + size) * sizeof (REFERENCE *));

  /* Copy the contents over. */

  j = 0;
  if (ref1)
    {
      for (i = 0; ref1[i]; i++)
        result[j++] = ref1[i];
    }

  if (ref2)
    {
      for (i = 0; ref2[i]; i++)
        result[j++] = ref2[i];
    }

  result[j] = NULL;
  return result;
}

/* Copy a reference structure.  Since we tend to free everything at
   every opportunity, we don't share any points, but copy everything into
   new memory.  */
REFERENCE *
info_copy_reference (REFERENCE *src)
{
  REFERENCE *dest = xmalloc (sizeof (REFERENCE));
  dest->label = src->label ? xstrdup (src->label) : NULL;
  dest->filename = src->filename ? xstrdup (src->filename) : NULL;
  dest->nodename = src->nodename ? xstrdup (src->nodename) : NULL;
  dest->start = src->start;
  dest->end = src->end;
  dest->line_number = src->line_number;
  dest->type = src->type;
  
  return dest;
}

/* Copy a list of references. */
/* FIXME: Use info_concatenate_references with one null argument instead. */
REFERENCE **
info_copy_references (REFERENCE **ref1)
{
  int i;
  REFERENCE **result;
  int size;

  /* Get the total size of the slots that we will need. */
  for (i = 0; ref1[i]; i++);
  size = i;

  result = xmalloc ((1 + size) * sizeof (REFERENCE *));

  /* Copy the contents over. */
  for (i = 0; ref1[i]; i++)
    result[i] = info_copy_reference (ref1[i]);
  result[i] = NULL;

  return result;
}

void
info_reference_free (REFERENCE *ref)
{
  if (ref)
    {
      free (ref->label);
      free (ref->filename);
      free (ref->nodename);
      free (ref);
    }
}

/* Free the data associated with REFERENCES. */
void
info_free_references (REFERENCE **references)
{
  register int i;
  REFERENCE *entry;

  if (references)
    {
      for (i = 0; references && (entry = references[i]); i++)
        info_reference_free (entry);

      free (references);
    }
}

/* Return new REFERENCE with filename and nodename fields set.  References
   to FILENAME and NODENAME are retained in the return value. */
REFERENCE *
info_new_reference (char *filename, char *nodename)
{
  REFERENCE *r = xmalloc (sizeof (REFERENCE));
  r->label = 0;
  r->filename = filename;
  r->nodename = nodename;
  r->start = 0;
  r->end = 0;
  r->line_number = 0;
  r->type = 0;
  return r;
}


/* Search for sequences of whitespace or newlines in STRING, replacing
   all such sequences with just a single space.  Remove whitespace from
   start and end of string. */
void
canonicalize_whitespace (char *string)
{
  register int i, j;
  int len, whitespace_found, whitespace_loc = 0;
  char *temp;

  if (!string)
    return;

  len = strlen (string);
  temp = xmalloc (1 + len);

  /* Search for sequences of whitespace or newlines.  Replace all such
     sequences in the string with just a single space. */

  whitespace_found = 0;
  for (i = 0, j = 0; string[i]; i++)
    {
      if (whitespace_or_newline (string[i]))
        {
          whitespace_found++;
          whitespace_loc = i;
          continue;
        }
      else
        {
          if (whitespace_found && whitespace_loc)
            {
              whitespace_found = 0;

              /* Suppress whitespace at start of string. */
              if (j)
                temp[j++] = ' ';
            }

          temp[j++] = string[i];
        }
    }

  /* Kill trailing whitespace. */
  if (j && whitespace (temp[j - 1]))
    j--;

  temp[j] = '\0';
  strcpy (string, temp);
  free (temp);
}

/* If ITER points to an ANSI escape sequence, process it, set PLEN to its
   length in bytes, and return 1.
   Otherwise, return 0.
 */
int
ansi_escape (mbi_iterator_t iter, size_t *plen)
{
  if (raw_escapes_p && *mbi_cur_ptr (iter) == '\033' && mbi_avail (iter))
    {
      mbi_advance (iter);
      if (*mbi_cur_ptr (iter) == '[' &&  mbi_avail (iter))
        {
          ITER_SETBYTES (iter, 1);
          mbi_advance (iter);
          if (isdigit (*mbi_cur_ptr (iter)) && mbi_avail (iter))
            {	
              ITER_SETBYTES (iter, 1);
              mbi_advance (iter);
              if (*mbi_cur_ptr (iter) == 'm')
                {
                  *plen = 4;
                  return 1;
                }
              else if (isdigit (*mbi_cur_ptr (iter)) && mbi_avail (iter))
                {
                  ITER_SETBYTES (iter, 1);
                  mbi_advance (iter);
                  if (*mbi_cur_ptr (iter) == 'm')
                    {
                      *plen = 5;
                      return 1;
                    }
                }
            }
        }
    }
                
  return 0;
}

static struct text_buffer printed_rep = {}; /* Initialize with all zeroes. */

/* Return pointer to string that is the printed representation of character
   (or other logical unit) at ITER if it were printed at screen column
   PL_CHARS.  Use ITER_SETBYTES (info-utils.h) on ITER if byte length is
   different.  If ITER points at an end-of-line character, set *DELIM to this
   character.  *PCHARS gets the number of screen columns taken up by
   outputting the return value, and *PBYTES the number of bytes in returned
   string.  Return value is not null-terminated.  Return value must not be
   freed by caller. */
char *
printed_representation (mbi_iterator_t *iter, int *delim, size_t pl_chars,
                        size_t *pchars, size_t *pbytes) 
{
  int printable_limit = ISO_Latin_p ? 255 : 127;
  struct text_buffer *rep = &printed_rep;

  char *cur_ptr = (char *) mbi_cur_ptr (*iter);
  size_t cur_len = mb_len (mbi_cur (*iter));

  text_buffer_reset (&printed_rep);

  if (mb_isprint (mbi_cur (*iter)))
    {
      /* cur.wc gives a wchar_t object.  See mbiter.h in the
         gnulib/lib directory. */
      *pchars = wcwidth ((*iter).cur.wc);
      *pbytes = cur_len;
      return cur_ptr;
    }
  else if (cur_len == 1)
    {
      if (*cur_ptr == '\r' || *cur_ptr == '\n')
        {
          *pchars = 1;
          *pbytes = cur_len;
          *delim = *cur_ptr;
          text_buffer_add_char (rep, ' ');
          return cur_ptr;
        }
      else if (ansi_escape (*iter, &cur_len))
        {
          *pchars = 0; 
          *pbytes = cur_len;
          ITER_SETBYTES (*iter, cur_len);

          return cur_ptr;
        }
      else if (info_tag (*iter, &cur_len))
        {
          *pchars = 0; 
          *pbytes = cur_len;
          ITER_SETBYTES (*iter, cur_len);
          return cur_ptr;
        }
      else if (*cur_ptr == '\t')
        {
          int i = 0;

          *pchars = ((pl_chars + 8) & 0xf8) - pl_chars;
          *pbytes = *pchars;

          /* We must output spaces instead of the tab because a tab may
             not clear characters already on the screen. */
          for (i = 0; i < *pbytes; i++)
            text_buffer_add_char (rep, ' ');
          return text_buffer_base (rep);
        }
    }

  /* Show CTRL-x as "^X".  */
  if (iscntrl (*cur_ptr) && *cur_ptr < 127)
    {
      *pchars = 2;
      *pbytes = 2;
      text_buffer_add_char (rep, '^');
      text_buffer_add_char (rep, *cur_ptr | 0x40);
      return text_buffer_base (rep);
    }
  /* Show META-x as "\370".  */
  else if (*cur_ptr > printable_limit)
    {
      *pchars = 4;
      *pbytes = 4;
      text_buffer_printf (rep, "\\%0o", *cur_ptr);
      return text_buffer_base (rep);
    }
  else if (*cur_ptr == DEL)
    {
      *pchars = 2;
      *pbytes = 2;
      text_buffer_add_char (rep, '^');
      text_buffer_add_char (rep, '?');
      return text_buffer_base (rep);
    }
  else
    {
      /* Use original bytes, although not recognized as anything.  This
         shouldn't happen because of the many cases above .*/

      *pchars = cur_len;
      *pbytes = cur_len;
      text_buffer_add_string (rep, cur_ptr, cur_len);
      return text_buffer_base (rep);
    }
}


/* **************************************************************** */
/*                                                                  */
/*                  Scanning node                                   */
/*                                                                  */
/* **************************************************************** */

/* Whether to strip syntax from the text of nodes. */
int preprocess_nodes_p;

/* Whether contents of nodes should be rewritten. */
static int rewrite_p;

static char *input_start, *inptr;

/* Number of bytes in node contents. */
static size_t input_length;

struct text_buffer output_buf;

static NODE **anchor_to_adjust;
static int nodestart;

/* Difference between the number of bytes input in the file and
   bytes output.  If !rewrite_p, this should stay 0. */
static long int output_bytes_difference;

/* Whether we are converting the character encoding of the file. */
static int convert_encoding_p;

#if HAVE_ICONV

/* Whether text in file is encoded in UTF-8. */
static int file_is_in_utf8;

/* Used for conversion from file encoding to output encoding. */
static iconv_t iconv_to_output;

/* Conversion from file encoding to UTF-8. */
static iconv_t iconv_to_utf8;

#endif /* HAVE_ICONV */

void
init_conversion (FILE_BUFFER *fb)
{
  char *target_encoding;

  convert_encoding_p = 0;

  /* Node being processed does not come from an Info file. */
  if (!fb)
    return;

#if !HAVE_ICONV
  return;
#else
  file_is_in_utf8 = 0;

  /* Don't process file if encoding is unknown. */
  if (!fb->encoding)
    return;

  /* Read name of character encoding from environment locale */
  target_encoding = nl_langinfo (CODESET);

  /* Don't convert the contents if the locale
     uses the same character encoding as the file */
  if (!strcasecmp(target_encoding, fb->encoding))
    return;

  /* Check if an iconv conversion from file locale to system
     locale exists */
  iconv_to_output = iconv_open (target_encoding, fb->encoding);
  if (iconv_to_output == (iconv_t) -1)
    return; /* Return if no conversion function implemented */

  if (   !strcasecmp ("UTF8",  fb->encoding)
      || !strcasecmp ("UTF-8", fb->encoding))
    file_is_in_utf8 = 1;

  if (!file_is_in_utf8)
    {
      iconv_to_utf8 = iconv_open ("UTF-8", fb->encoding);
      if (iconv_to_utf8 == (iconv_t) -1)
        {
          /* Return if no conversion function implemented */
          iconv_close (iconv_to_output);
          return; 
        }
    }

  convert_encoding_p = 1;
  rewrite_p = 1;
#endif /* HAVE_ICONV */
}

void close_conversion (void)
{
#if HAVE_ICONV
  if (convert_encoding_p)
    {
      iconv_close (iconv_to_output);
      if (!file_is_in_utf8) iconv_close (iconv_to_utf8);
    }
#endif
}

static void
init_output_stream (FILE_BUFFER *fb)
{
  init_conversion (fb);
  output_bytes_difference = 0;

  if (rewrite_p)
    text_buffer_init (&output_buf);
}

/* Copy bytes from input to output with no encoding conversion. */
static void
copy_direct (long n)
{
  text_buffer_add_string (&output_buf, inptr, n);
  inptr += n;
}

/* Read one character at *FROM and write out a sequence
   of bytes representing that character in ASCII.  *FROM
   is advanced past the read character. */
static int
degrade_utf8 (char **from, size_t *from_left)
{
  static struct encoding_replacement
  {
    char *from_string;
    char *to_string;
  } er[] = {
    {"\xE2\x80\x98","'"}, /* Opening single quote */
    {"\xE2\x80\x99","'"}, /* Closing single quote */
    {"\xE2\x80\x9C","\""},/* Opening double quote */
    {"\xE2\x80\x9D","\""},/* Closing double quote */
    {"\xC2\xA9","(C)"},   /* Copyright symbol */
    {"\xC2\xBB",">>"},    /* Closing double angle brackets */
    {"\xE2\x86\x92","->"},/* Right arrow */
    {"\xE2\x80\x90","-"},  /* Hyphen */
    {"\xE2\x80\x91","-"},  /* Non-breaking hyphen */
    {"\xE2\x80\x92","-"},  /* Figure dash */
    {"\xE2\x80\x93","-"},  /* En dash */
    {"\xE2\x80\x94","--"},  /* Em dash */
    {"\xE2\x80\xA6","..."},  /* Ellipsis */
    {"\xE2\x80\xA2","*"},  /* Bullet */

    {"\xC3\xA0","a`"},   /* Lower case letter a with grave accent */
    {"\xC3\xA2","a^"},   /* Lower case letter a with circumflex */
    {"\xC3\xA4","a\""},  /* Lower case letter a with diaeresis */
    {"\xC3\xA6","ae"},   /* Lower case letter ae ligature */
    {"\xC3\xA9","e'"},   /* Lower case letter e with acute accent */
    {"\xC3\xA8","e`"},   /* Lower case letter e with grave accent */
    {"\xC3\xAA","e^"},   /* Lower case letter e with circumflex */
    {"\xC3\xAB","e\""},  /* Lower case letter e with diaeresis */
    {"\xC3\xB6","o\""},  /* Lower case letter o with diaeresis */
    {"\xC3\xBC","u\""},  /* Lower case letter u with diaeresis */
    {"\xC3\xB1","n~"},  /* Lower case letter n with tilde */
    {"\xC3\x87","C,"},  /* Upper case letter C with cedilla */
    {"\xC3\xA7","c,"},  /* Lower case letter c with cedilla */
    {"\xC3\x9f","ss"},  /* Lower case letter sharp s */

    {0, 0}
  };

  struct encoding_replacement *erp;

  for (erp = er; erp->from_string != 0; erp++)
    {
      /* Avoid reading past end of input. */
      int width = strlen (erp->from_string);
      if (width > *from_left)
        continue;

      if (!strncmp (erp->from_string, *from, width))
        {
          text_buffer_add_string (&output_buf, erp->to_string,
                                  strlen(erp->to_string));
          *from += width;
          *from_left -= width;
          return 1;
        }
    }

  /* Failing this, just print a question mark.  Maybe we should use SUB
     (^Z) (ASCII substitute character code) instead, or pass through the
     original bytes. */
  text_buffer_add_string (&output_buf, "?", 1);

  /* Ideally we would advance one UTF-8 character.  This would
     require knowing its length in bytes. */
  (*from)++;
  (*from_left)--;

  return 0;
}

/* Convert N bytes from input to output encoding and write to
   output buffer.  Return number of bytes over N written. */
static int
copy_converting (long n)
{
#if !HAVE_ICONV
  return 0;
#else
  size_t bytes_left;
  int extra_at_end;
  size_t iconv_ret;
  long output_start;

  size_t utf8_char_free; 
  char utf8_char[4]; /* Maximum 4 bytes in a UTF-8 character */
  char *utf8_char_ptr;
  size_t i;
  
  /* Use n as an estimate of how many bytes will be required
     in target encoding. */
  text_buffer_alloc (&output_buf, (size_t) n);

  output_start = text_buffer_off (&output_buf);
  bytes_left = n;
  extra_at_end = 0;
  while (bytes_left >= 0)
    {
      iconv_ret = text_buffer_iconv (&output_buf, iconv_to_output,
                                     &inptr, &bytes_left);

      if (iconv_ret != (size_t) -1)
        /* Success: all of input converted. */
        break;

      /* There's been an error while converting. */
      switch (errno)
        {
        case E2BIG:
          /* Ran out of space in output buffer.  Allocate more
             and try again. */
          text_buffer_alloc (&output_buf, n);
          continue;
        case EILSEQ:
          /* Byte sequence in input buffer not recognized. */
          break;
        case EINVAL:
          /* Incomplete byte sequence at end of input buffer.  Try to read
             more. */

          /* input_length - 2 is offset of last-but-one byte within input.
             This checks if there is at least one more byte within node
             contents. */
          if (inptr - input_start + (bytes_left - 1) <= input_length - 2)
            {
              bytes_left++;
              extra_at_end++;
            }
          else
            {
              copy_direct (bytes_left);
              bytes_left = 0;
            }
          break;
        default: /* Unknown error - abort */
          info_error (_("Error converting file character encoding."));

          /* Skip past current input and hope we don't get an
             error next time. */
          inptr += bytes_left;
          return 0;
        }

      /* Degrade to ASCII. */
      
      if (file_is_in_utf8)
        {
          degrade_utf8 (&inptr, &bytes_left);
          continue;     
        }

      /* If file is not in UTF-8, we degrade to ASCII in two steps:
         first convert the character to UTF-8, then look up a replacement
         string.  Note that mixing iconv_to_output and iconv_to_utf8
         on the same input may not work well if the input encoding
         is stateful.  We could deal with this by always converting to
         UTF-8 first; then we could mix conversions on the UTF-8 stream. */

      /* We want to read exactly one character.  Do this by
         restricting size of output buffer. */
      utf8_char_ptr = utf8_char;
      for (i = 1; i <= 4; i++)
        {
          utf8_char_free = i;
          iconv_ret = iconv (iconv_to_utf8, &inptr, &bytes_left,
                             &utf8_char_ptr, &utf8_char_free);
          /* If we managed to write a character: */
          if (utf8_char_ptr > utf8_char) break;
        }

      /* errno == E2BIG if iconv ran out of output buffer,
         which is expected. */
      if (iconv_ret == (size_t) -1 && errno != E2BIG)
        /* Character is not recognized.  Copy a single byte. */
        copy_direct (1);
      else
        {
          utf8_char_ptr = utf8_char;
          /* i is width of UTF-8 character */
          degrade_utf8 (&utf8_char_ptr, &i);
        }
    }

  /* Must cast because the difference between unsigned size_t is always
     positive. */
  output_bytes_difference +=
    n - ((signed long) text_buffer_off (&output_buf) - output_start);

  return extra_at_end;
#endif /* HAVE_ICONV */
}

/* Functions below are named from the perspective of the preprocess_nodes_p
   flag being on. */

/* Copy text from input node contents, possibly converting the
   character encoding and adjusting anchor offsets at the same time. */
static void
copy_input_to_output (long n)
{
  if (rewrite_p)
    {
      size_t bytes_left;

      bytes_left = n;
      while (bytes_left > 0)
        {
          if (!convert_encoding_p)
            {
              copy_direct (bytes_left);
              bytes_left = 0;
            }
          else
            {
              size_t bytes_to_convert;
              size_t extra_written;

              if (anchor_to_adjust)
                {
                  char *first_anchor =
                     input_start + (*anchor_to_adjust)->nodestart;

                  /* If there is an anchor in the input: */
                  if (first_anchor <= inptr + bytes_left)
                    /* Convert enough to pass the first anchor in input. */
                    bytes_to_convert = first_anchor - inptr + 1;
                  else
                    bytes_to_convert = bytes_left;
                }
              else
                bytes_to_convert = bytes_left;

              /* copy_converting may read more than bytes_to_convert
                 bytes its input ends in an incomplete byte sequence. */
              extra_written = copy_converting (bytes_to_convert);

              bytes_left -= bytes_to_convert + extra_written;
            }

          /* Check if we have gone past any anchors and
             adjust with output_bytes_difference. */
          if (anchor_to_adjust)
            while ((*anchor_to_adjust)->nodestart - nodestart
                   <= inptr - input_start)
              {
                (*anchor_to_adjust)->nodestart -= output_bytes_difference;
                anchor_to_adjust++;
                if (!*anchor_to_adjust || (*anchor_to_adjust)->nodelen != 0)
                  {
                    anchor_to_adjust = 0;
                    break;
                  }
              }
        }
    }
  else
    inptr += n;
}

static void
skip_input (long n)
{
  if (preprocess_nodes_p)
    {
      inptr += n;
      output_bytes_difference += n;
    }
  else if (rewrite_p)
    {
      /* We are expanding tags only.  Do not skip input. */
      copy_input_to_output (n);
    }
  else
    {
      inptr += n;
    }
}

static void
write_extra_bytes_to_output (char *input, long n)
{
  if (preprocess_nodes_p)
    {
      text_buffer_add_string (&output_buf, input, n);
      output_bytes_difference -= n;
    }
}

/* Like write_extra_bytes_to_output, but writes bytes even when
   preprocess_nodes=Off. */
static void
write_tag_contents (char *input, long n)
{
  if (rewrite_p)
    {
      text_buffer_add_string (&output_buf, input, n);
      output_bytes_difference -= n;
    }
}

/* ANSI escape codes */
#define ANSI_UNDERLINING_OFF "\033[24m"
#define ANSI_UNDERLINING_ON  "\033[4m"

/* Turn off underlining */
static void
underlining_off (void)
{
  write_extra_bytes_to_output (ANSI_UNDERLINING_OFF,
                               strlen (ANSI_UNDERLINING_OFF));
}

/* Turn on underlining */
static void
underlining_on (void)
{
  write_extra_bytes_to_output (ANSI_UNDERLINING_ON,
                               strlen (ANSI_UNDERLINING_ON));
}

/* Read first line of node and set next, prev and up. */
static void
parse_top_node_line (NODE *node)
{
  char **store_in, *dummy = 0;
  int value_length;

  /* If the first line is empty, leave it in.  This is the case
     in the index-apropos window. */
  if (*inptr == '\n')
    {
      return;
    }

  node->next = node->prev = node->up = 0;

  while (1)
    {
      store_in = 0;

      skip_input (skip_whitespace (inptr));

      /* Check what field we are looking at */
      if (!strncmp (inptr, INFO_FILE_LABEL, strlen(INFO_FILE_LABEL)))
        {
          skip_input (strlen(INFO_FILE_LABEL));
          store_in = &dummy;
        }
      else if (!strncmp (inptr, INFO_NODE_LABEL, strlen(INFO_NODE_LABEL)))
        {
          skip_input (strlen(INFO_NODE_LABEL));
          store_in = &dummy;
        }
      else if (!strncmp (inptr, INFO_PREV_LABEL, strlen(INFO_PREV_LABEL)))
        {
          skip_input (strlen(INFO_PREV_LABEL));
          store_in = &node->prev;
        }
      else if (!strncmp (inptr, INFO_NEXT_LABEL, strlen(INFO_NEXT_LABEL)))
        {
          skip_input (strlen(INFO_NEXT_LABEL));
          store_in = &node->next;
        }
      else if (!strncmp (inptr, INFO_UP_LABEL, strlen(INFO_UP_LABEL)))
        {
          skip_input (strlen(INFO_UP_LABEL));
          store_in = &node->up;
        }
      else 
        {
          store_in = &dummy;
          /* Not recognized - code below will skip to next comma */
        }
        
      skip_input (skip_whitespace (inptr));

      /* Separate at commas or newlines, so it will work for
         filenames including full stops. */
      /* TODO: Account for "(dir)" and "(DIR)". */
      value_length = read_quoted_string (inptr, "\n\t,", store_in);

      /* Skip past value and any quoting or separating characters. */
      skip_input (value_length);

      if (*inptr == '\n')
        {
          skip_input (1);
          break;
        }

      skip_input (1); /* Point after field terminator */
      free (dummy); dummy = 0;
    }
}

/* Output reference label and create REFERENCE object.  inptr should be
   on the first non-whitespace byte of label when this function is called. */
static REFERENCE *
scan_reference_label (char *label, long label_len, long start_of_reference,
                      int found_menu_entry)
{
  REFERENCE *entry;
  char *label_ptr;
  char *nl_ptr;

  /* We definitely have a reference by this point.  Create
     REFERENCE entity. */
  entry = xmalloc (sizeof (REFERENCE));
  entry->filename = NULL;
  entry->nodename = NULL;
  entry->label = xstrdup (label);
  canonicalize_whitespace (entry->label);
  entry->line_number = 0;
  if (found_menu_entry)
    entry->type = REFERENCE_MENU_ITEM;
  else
    entry->type = REFERENCE_XREF;

  /* Output any whitespace or newlines at start of reference label. */
  label_ptr = label + skip_whitespace_and_newlines (label);
  write_extra_bytes_to_output (label, label_ptr - label);

  underlining_on ();

  /* Point reference to where we will put the displayed reference,
     which could be after whitespace. */
  if (preprocess_nodes_p)
    entry->start = text_buffer_off (&output_buf);
  else
    entry->start = start_of_reference - output_bytes_difference;

#ifdef QUOTE_NODENAMES
  if (inptr[0] == '\177')
    skip_input (1);
#endif

  /* Write text of label.  If there is a newline in the middle of
     a reference label, turn off underling until text starts again. */
  while (nl_ptr = strchr (label_ptr, '\n'))
    {
      copy_input_to_output (nl_ptr - label_ptr);

      /* Note we do this before the newline is output.  This way if
         the first half of the label is on the bottom line of the
         screen, underlining will not be left on. */
      underlining_off ();

      /* Output newline and any whitespace at start of next line. */
      label_ptr = nl_ptr + 1 + skip_whitespace (nl_ptr + 1);
      copy_input_to_output (label_ptr - nl_ptr);

      underlining_on ();
    }

  /* Output rest of label */
  copy_input_to_output (label + strlen (label) - label_ptr);
  underlining_off ();

#ifdef QUOTE_NODENAMES
  if (inptr[0] == '\177')
    skip_input (1);
#endif

  /* Colon after label. */
  skip_input (1);

  if (preprocess_nodes_p)
    entry->end = text_buffer_off (&output_buf);
  else
    entry->end = entry->start + label_len;

  return entry;
}

static void
scan_reference_target (REFERENCE *entry, int found_menu_entry,
                       int in_index, int in_parentheses)
{
  /* If this reference entry continues with another ':' then the reference is
     within the same file, and the nodename is the same as the label. */
  if (*inptr == ':')
    {
      skip_input (1);

      if (found_menu_entry)
        {
          /* Output two spaces to match the length of "::" */
          write_extra_bytes_to_output ("  ", 2);
        }

      entry->filename = 0;
      entry->nodename = xstrdup (entry->label);
    }
  else
    {
      /* This entry continues with a specific nodename.  Parse the
         nodename from the specification. */

      int length; /* Length of specification */
      int i;

      if (found_menu_entry)
        {
          length = info_parse_node (inptr, PARSE_NODE_DFLT);
          if (inptr[length] == '.') /* Include a '.' terminating the entry. */
            length++;

          if (in_index)
            /* For index nodes, output the destination as well,
               which will be the name of the node the index entry
               refers to. */
            copy_input_to_output (length);
          else
            skip_input (length);
        }
      else
        {
          char saved_char;
          char *nl_off;
          int space_at_start_of_line = 0;

          /* Skip any following spaces after the ":". */
          skip_input (skip_whitespace (inptr));

          length = info_parse_node (inptr, PARSE_NODE_SKIP_NEWLINES);

          /* Check if there is a newline in the target. */
          saved_char = inptr[length];
          inptr[length] = '\0';
          nl_off = strchr (inptr, '\n');
          inptr[length] = saved_char;

          if (nl_off)
            space_at_start_of_line = skip_whitespace (nl_off + 1);
          
          if (info_parsed_filename)
            {
              /* Rough heuristic of whether it's worth outputing a newline
                 now or later. */
              if (nl_off
                  && nl_off < inptr + (length - space_at_start_of_line) / 2)
                {
                  int i;
                  write_extra_bytes_to_output ("\n", 1);

                  for (i = 0; i < space_at_start_of_line; i++)
                    write_extra_bytes_to_output (" ", 1);
                  skip_input (strspn (inptr, " "));
                  nl_off = 0;
                }
              else if (inptr[-1] != '\n')
                write_extra_bytes_to_output (" ", 1);
              write_extra_bytes_to_output ("(", 1);
              write_extra_bytes_to_output (info_parsed_filename,
                strlen (info_parsed_filename));
              write_extra_bytes_to_output (" manual)",
                                           strlen (" manual)"));
            }

          /* Output terminating punctuation, unless we are in a reference
             like "(*note Label:(file)node.)". */
          if (!in_parentheses)
            skip_input (length);
          else
            skip_input (length + 1);

          /* Copy any terminating punctuation before the optional newline. */
          copy_input_to_output (strspn (inptr, ".),"));

          /* Output a newline if one is needed.  Don't do it at the end
             a paragraph. */
          if (nl_off && *inptr != '\n')
            { 
              int i;

              write_extra_bytes_to_output ("\n", 1);
              for (i = 0; i < space_at_start_of_line; i++)
                write_extra_bytes_to_output (" ", 1);
              skip_input (strspn (inptr, " "));
            }
        }

      if (found_menu_entry && !in_index)
        /* Output spaces the length of the node specifier to avoid
           messing up left edge of second column of menu. */
        for (i = 0; i < length; i++)
          write_extra_bytes_to_output (" ", 1);

      if (info_parsed_filename)
        entry->filename = xstrdup (info_parsed_filename);

      if (info_parsed_nodename)
        entry->nodename = xstrdup (info_parsed_nodename);

      if (!preprocess_nodes_p)
        entry->line_number = info_parsed_line_number;
      else
        /* Adjust line offset in file to one in displayed text.  This
           does not work perfectly because we can't know exactly what
           text will be inserted/removed: for example, due to expansion
           of an image tag.  This subtracts 1 for a removed node information
           line. */
        entry->line_number = info_parsed_line_number - 1;
    }
}

/* BASE is earlier in a block of allocated memory than PTR, and the block
   extends until at least BASE + LEN - 1.  Return PTR[INDEX], unless this
   could be outside the allocated block, in which case return 0. */
static char
safe_string_index (char *ptr, long index, char *base, long len)
{
  long offset = ptr - base;

  if (   offset + index < 0
      || offset + index >= len)
    return 0;

  return ptr[index];
}

/* Check if preceding word is a word like "see". BASE points before PTR in
   a block of allocated memory. */
static int
avoid_see_see (char *ptr, char *base)
{
  /* TODO: Only do this for English-language files. */
  static char *words_like_see[] = {
    "see", "See", "In", "in", "of", "also"
  };
  int i;
  int word_len = 0;

  if (ptr == base)
    return 0;

  /* Skip past whitespace, and then go to beginning of preceding word. */
  ptr--;
  while (ptr > base && (*ptr == ' ' || *ptr == '\n' || *ptr == '\t'))
    ptr--;

  while (ptr > base && !(*ptr == ' ' || *ptr == '\n' || *ptr == '\t'))
    {
      ptr--;
      word_len++;
    }

  ptr++;

  /* Check if it is in our list. */
  for (i = 0; i < sizeof (words_like_see) / sizeof (char *); i++)
    {
      if (!strncmp (words_like_see[i], ptr, word_len))
        return 1;
    }
  return 0;
}

/* Scan (*NODE_PTR)->contents and record location and contents of
   cross-references and menu items.  Convert character encoding of
   node contents to that of the user if the two are known to be
   different.  If preprocess_nodes_p == 1, remove Info syntax in contents.
   If the node is from the file described by FB, then NODE_PTR is an offset
   into FB->tags. If the node has not come from a file, FB is a null
   pointer. */
void
scan_node_contents (FILE_BUFFER *fb, NODE **node_ptr)
{
  SEARCH_BINDING s;
  char *search_string;

  int found_menu_entry, in_index = 0;
  int in_menu = 0;
  NODE *node = *node_ptr;

  REFERENCE **refs = NULL;
  size_t refs_index = 0, refs_slots = 0;

  long position;

  /* Check that contents haven't already been processed. This shouldn't
     happen. */
  if (node->flags & N_WasRewritten)
    return;

  if (preprocess_nodes_p)
    rewrite_p = 1;
  else
    rewrite_p = 0;

  init_output_stream (fb);

  if (fb)
    {
      /* Set anchor_to_adjust to first anchor in node, if any. */
      anchor_to_adjust = node_ptr + 1;
      if (!*anchor_to_adjust)
        anchor_to_adjust = 0;
      else if (*anchor_to_adjust && (*anchor_to_adjust)->nodelen != 0)
        anchor_to_adjust = 0;
    }
  else
    anchor_to_adjust = 0;

  /* Initialize refs to point to array of one null pointer in case
     there are no results.  This way we know if refs has been initialized
     even if it is empty. */
  /* FIXME: Null might not be zero. */
  refs = calloc (1, sizeof *refs);

  refs_slots = 1;

  /* This should be the only time we assign to inptr in this function -
     all other assignment should be done with the helper functions above. */
  inptr = node->contents;
  input_start = node->contents;
  input_length = node->nodelen;
  nodestart = node->nodestart;

  parse_top_node_line (node);

  /* Search for menu items or cross references in buffer.
     This is INFO_MENU_LABEL "|" INFO_XREF_LABEL, but
     with '*' characters escaped. */
  search_string = "\n\\* Menu:|\\*Note";

  s.buffer = node->contents;
  s.start = inptr - node->contents;
  s.end = node->nodelen;
  s.flags = S_FoldCase;

search_again:
  while (regexp_search (search_string,
		  &s, &position, 0) == search_success)
    {
      long label_len;
      char *label = 0;
      int in_parentheses = 0;

      /* Save offset of "*" starting link. When preprocess_nodes is Off,
         we position the cursor on the * when moving between references. */
      int start_of_reference; 

      REFERENCE *entry;
      char *match;

      /* Pointer to search result */
      match = s.buffer + position;

      /* Write out up to match */
      copy_input_to_output (match - inptr); 

      /* Was "* Menu:" seen?  If so, search for menu entries hereafter. */
      if (!in_menu && match[0] == '\n')
        {
          in_menu = 1;
          skip_input (strlen ("\n* Menu:\n"));

          /* This is INFO_MENU_ENTRY_LABEL "|" INFO_XREF_LABEL, but
             with '*' characters escaped. */
          search_string = "\n\\* |\\*Note";
          s.start = inptr - s.buffer;
          continue;
        }

      /* Check what we found based on first character of match */
      if (match[0] == '\n')
        {
          found_menu_entry = 1;
          start_of_reference = position + 1;

          copy_input_to_output (strlen ("\n* "));
        }
      else
        {
          int previous_word_is_like_see = 0;

          found_menu_entry = 0;
          start_of_reference = position;

          /* Cross-references can be generated by four different Texinfo
             commands.  @inforef and @xref output "*Note " in Info format,
             and "See" in HTML and print.  @ref and @pxref output "*note "
             in Info format, and either nothing at all or "see" in HTML
             and print.  Unfortunately, there is no easy way to distinguish
             between these latter two cases.  We must make do with
             displayed manuals occasionally containing "See see" and the
             like. */
          /* TODO: Internationalize these strings, but only if we know the
             language of the document. */
          if (match[1] == 'N')
            write_extra_bytes_to_output ("See", 3);
          else
            {
              previous_word_is_like_see = avoid_see_see (inptr, s.buffer);

              if (!previous_word_is_like_see)
                write_extra_bytes_to_output ("see", 3);
              if (safe_string_index (inptr, -1, s.buffer, s.end) == '(')
                in_parentheses = 1;
            }

          skip_input (strlen ("*Note"));
          if (previous_word_is_like_see)
            skip_input (skip_whitespace (inptr));
        }

      /* Copy any white space before label. */
      copy_input_to_output (skip_whitespace_and_newlines (inptr));

      /* Search forward to ":" to get label name. */
      /* Cross-references may have a newline in the middle. */
      if (!found_menu_entry)
        label_len = read_quoted_string (inptr, ":", &label);
      else
        label_len = read_quoted_string (inptr, "\n:", &label);
          
      if (inptr[label_len] != ':')
        {
          /* This is not a menu entry or reference. */
          skip_input (1);
          s.start = inptr - s.buffer;
          continue;
        }

      /* Read and output reference label (up until colon). */
      entry = scan_reference_label
        (label, label_len,
        (s.buffer + start_of_reference) - node->contents,
        found_menu_entry);
      free (label);

      /* Get target of reference and update entry. */
      scan_reference_target (entry, found_menu_entry, in_index, in_parentheses);

      add_pointer_to_array (entry, refs_index, refs, refs_slots, 50);

      s.start = inptr - s.buffer;
      if (s.start >= s.end) break;
    }

  /* Search may have stopped too early because of null byte
     in index marker ("^@^H[index^@^H]") or in image marker
     ("^@^H[image ...^@^H]").  Process these and try again. */
  {
    char *p, *p1;

    p = strchr (inptr, '\0');
    p1 = p;

    /* If null byte is in text of node: */
    if (p < node->contents + node->nodelen)
      {
        struct text_buffer *expansion = xmalloc (sizeof (struct text_buffer));
        text_buffer_init (expansion);

        /* FIXME: bounds checking in tag_expand? */
        if (tag_expand (&p1, expansion, &in_index))
          {
            if (!rewrite_p)
              {
                rewrite_p = 1;
                init_output_stream (fb);

                /* Put inptr back to start so that
                   copy_input_to_output below gets all
                   preceding contents. */
                inptr = node->contents;
              }

            /* Write out up to null byte. */
            copy_input_to_output (p - inptr);

            write_tag_contents (text_buffer_base (expansion),
                                text_buffer_off (expansion));
            /* Skip past body of tag. */
            skip_input (p1 - inptr);

            if (in_index)
              node->flags |= N_IsIndex;
          }
        else
          {
            /* We encountered a null byte before the end of the node
               contents, but it did not introduce a valid tag (image,
               index, or otherwise).  Write up to and including null
               and continue searching. */
            copy_input_to_output (p - inptr + 1);
          }

        text_buffer_free (expansion);

        /* Update search. */
        s.buffer = inptr;
        s.start = 0;
        s.end = node->nodelen - (inptr - node->contents);

        goto search_again;
      }
  }

  /* If we haven't accidentally gone past the end of the node, write
     out the rest of it. */
  if (inptr < node->contents + node->nodelen)
    copy_input_to_output ((node->contents + node->nodelen) - inptr); 

  /* Null to terminate buffer. */
  if (rewrite_p)
    text_buffer_add_string (&output_buf, "\0", 1);

  /* Free resources used in character encoding conversion. */
  close_conversion ();

  node->references = refs;

  if (rewrite_p)
    {
      node->contents = text_buffer_base (&output_buf);
      node->flags |= N_WasRewritten;
 
      /* output_buf.off is the offset of the next character to be
         written.  Subtracting 1 gives the offset of our terminating
         null, that is, the length. */
      node->nodelen = text_buffer_off (&output_buf) - 1;

      /* Node header was deleted. */
      if (preprocess_nodes_p)
        node->body_start = 0;
    }
}


/* Return a pointer to the part of PATHNAME that simply defines the file. */
char *
filename_non_directory (char *pathname)
{
  register char *filename = pathname + strlen (pathname);

  if (HAVE_DRIVE (pathname))
    pathname += 2;

  while (filename > pathname && !IS_SLASH (filename[-1]))
    filename--;

  return filename;
}

/* Return non-zero if NODE is one especially created by Info. */
int
internal_info_node_p (NODE *node)
{
  return (node != NULL) && (node->flags & N_IsInternal);
}

/* Make NODE appear to be one especially created by Info. */
void
name_internal_node (NODE *node, char *name)
{
  if (!node)
    return;

  node->filename = "";
  node->parent = NULL;
  node->nodename = name;
  node->flags |= N_IsInternal;
}

/* Return the window displaying NAME, the name of an internally created
   Info window. */
WINDOW *
get_internal_info_window (char *name)
{
  WINDOW *win;

  for (win = windows; win; win = win->next)
    if (internal_info_node_p (win->node) &&
        (strcmp (win->node->nodename, name) == 0))
      break;

  return win;
}

/* Return a window displaying the node NODE. */
WINDOW *
get_window_of_node (NODE *node)
{
  WINDOW *win = NULL;

  for (win = windows; win; win = win->next)
    if (win->node == node)
      break;

  return win;
}

/* Flexible Text Buffer */

void
text_buffer_init (struct text_buffer *buf)
{
  memset (buf, 0, sizeof *buf);
}

void
text_buffer_free (struct text_buffer *buf)
{
  free (buf->base);
}

size_t
text_buffer_vprintf (struct text_buffer *buf, const char *format, va_list ap)
{
  ssize_t n;
  va_list ap_copy;

  if (!buf->base)
    {
      if (buf->size == 0)
	buf->size = MIN_TEXT_BUF_ALLOC; /* Initial allocation */
      
      buf->base = xmalloc (buf->size);
    }
  
  for (;;)
    {
      va_copy (ap_copy, ap);
      n = vsnprintf (buf->base + buf->off, buf->size - buf->off,
		     format, ap_copy);
      va_end (ap_copy);
      if (n < 0 || buf->off + n >= buf->size ||
	  !memchr (buf->base + buf->off, '\0', buf->size - buf->off + 1))
	{
	  size_t newlen = buf->size * 2;
	  if (newlen < buf->size)
	    xalloc_die ();
	  buf->size = newlen;
	  buf->base = xrealloc (buf->base, buf->size);
	}
      else
	{
	  buf->off += n;
	  break;
	}
    }
  return n;
}

/* Make sure there are LEN free bytes at end of BUF. */
void
text_buffer_alloc (struct text_buffer *buf, size_t len)
{
  if (buf->off + len > buf->size)
    {
      buf->size = buf->off + len;
      if (buf->size < MIN_TEXT_BUF_ALLOC)
	buf->size = MIN_TEXT_BUF_ALLOC;
      buf->base = xrealloc (buf->base, buf->size);
    }
}

/* Return number of bytes that can be written to text buffer without
   reallocating the text buffer. */
size_t
text_buffer_space_left (struct text_buffer *buf)
{
  /* buf->size is the offset of the first byte after the allocated space.
     buf->off is the offset of the first byte to be written to. */
  return buf->size - buf->off;
}

#if HAVE_ICONV

/* Run iconv using text buffer as output buffer. */
size_t
text_buffer_iconv (struct text_buffer *buf, iconv_t iconv_state,
                   char **inbuf, size_t *inbytesleft)
{
  size_t out_bytes_left;
  char *outptr;
  size_t iconv_ret;

  outptr = text_buffer_base (buf) + text_buffer_off (buf);
  out_bytes_left = text_buffer_space_left (buf);
  iconv_ret = iconv (iconv_to_output, inbuf, inbytesleft,
                     &outptr, &out_bytes_left);

  text_buffer_off (buf) = outptr - text_buffer_base (buf);    

  return iconv_ret;
}

#endif /* HAVE_ICONV */

size_t
text_buffer_add_string (struct text_buffer *buf, const char *str, size_t len)
{
  text_buffer_alloc (buf, len);
  memcpy (buf->base + buf->off, str, len);
  buf->off += len;
  return len;
}

size_t
text_buffer_fill (struct text_buffer *buf, int c, size_t len)
{
  char *p;
  int i;
  
  text_buffer_alloc (buf, len);
  
  for (i = 0, p = buf->base + buf->off; i < len; i++)
    *p++ = c;
  buf->off += len;
  
  return len;
}

void
text_buffer_add_char (struct text_buffer *buf, int c)
{
  char ch = c;
  text_buffer_add_string (buf, &ch, 1);
}

size_t
text_buffer_printf (struct text_buffer *buf, const char *format, ...)
{
  va_list ap;
  size_t n;
  
  va_start (ap, format);
  n = text_buffer_vprintf (buf, format, ap);
  va_end (ap);
  return n;
}

#if defined(__MSDOS__) || defined(__MINGW32__)
/* Cannot use FILENAME_CMP here, since that does not consider forward-
   and back-slash characters equal.  */
static int
fncmp (const char *fn1, const char *fn2)
{
  const char *s1 = fn1, *s2 = fn2;

  while (tolower (*s1) == tolower (*s2)
	 || (IS_SLASH (*s1) && IS_SLASH (*s2)))
    {
      if (*s1 == 0)
	return 0;
      s1++;
      s2++;
    }

  return tolower (*s1) - tolower (*s2);
}
#else
# define fncmp(s,t) strcmp(s,t)
#endif

struct info_namelist_entry
{
  struct info_namelist_entry *next;
  char name[1];
};

int
info_namelist_add (struct info_namelist_entry **ptop, const char *name)
{
  struct info_namelist_entry *p;

  for (p = *ptop; p; p = p->next)
    if (fncmp (p->name, name) == 0)
      return 1;

  p = xmalloc (sizeof (*p) + strlen (name));
  strcpy (p->name, name);
  p->next = *ptop;
  *ptop = p;
  return 0;
}

void
info_namelist_free (struct info_namelist_entry *top)
{
  while (top)
    {
      struct info_namelist_entry *next = top->next;
      free (top);
      top = next;
    }
}

