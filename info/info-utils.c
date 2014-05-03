/* info-utils.c -- miscellanous.
   $Id$

   Copyright 1993, 1998, 2003, 2004, 2007, 2008, 2009, 2011, 2012,
   2013 Free Software Foundation, Inc.

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
  int length = 0; /* Return value */

  /* Default the answer. */
  free (info_parsed_filename);
  free (info_parsed_nodename);
  info_parsed_filename = 0;
  info_parsed_nodename = 0;

  /* Special case of nothing passed.  Return nothing. */
  if (!string || !*string)
    return;

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
  i = skip_node_characters (string, flag);
  length += i;
  length++; /* skip_node_characters() stops on terminating character */

  info_parsed_nodename = xcalloc (1, i+1);
  memcpy (info_parsed_nodename, string, i);

  canonicalize_whitespace (info_parsed_nodename);
  if (info_parsed_nodename && !*info_parsed_nodename)
    {
      free (info_parsed_nodename);
      info_parsed_nodename = NULL;
    }

  /* Parse ``(line ...)'' part of menus, if any.  */
  {
    char *rest = string + i;

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


/* **************************************************************** */
/*                                                                  */
/*                  Finding and Building Menus                      */
/*                                                                  */
/* **************************************************************** */

/* Get the entry associated with LABEL in the menu of NODE.  Return a
   pointer to the ENTRY if found, or null. */
REFERENCE *
info_get_menu_entry_by_label (NODE *node, char *label) 
{
  register int i;
  REFERENCE *entry;
  REFERENCE **references = node->references;

  if (!references)
    return 0;

  for (i = 0; entry = references[i]; i++)
    {
      if (REFERENCE_MENU_ITEM != entry->type) continue;
      if (strcmp (label, entry->label) == 0)
        return entry;
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
  dest->line_number = 0;
  dest->type = src->type;
  
  return dest;
}

/* Copy a list of references. */
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

/* String representation of a char returned by printed_representation (). */
static char *the_rep;
static size_t the_rep_size;

/* Return a pointer to a string which is the printed representation
   of CHARACTER if it were printed at HPOS. */
char *
printed_representation (const char *character, size_t len, size_t hpos,
			/* Return: */
			size_t *plen)
{
  const unsigned char *cp = (const unsigned char *) character;
  register int i = 0;
  int printable_limit = ISO_Latin_p ? 255 : 127;
#define REPSPACE(s)                                            \
  do                                                           \
    {                                                          \
      while (the_rep_size < s) 			               \
	{						       \
	  if (the_rep_size == 0)			       \
	    the_rep_size = 8; /* Initial allocation */	       \
	  the_rep = x2realloc (the_rep, &the_rep_size);	       \
	}						       \
    }                                                          \
  while (0)
    
#define SC(c)                                                  \
  do                                                           \
    {                                                          \
      REPSPACE(i + 1);                                         \
      the_rep[i++] = c;                                        \
    }                                                          \
  while (0)
  
  for (; len > 0; cp++, len--)
    {
      if (raw_escapes_p && *cp == '\033')
	SC(*cp);
      /* Show CTRL-x as ^X.  */
      else if (iscntrl (*cp) && *cp < 127)
	{
	  switch (*cp)
	    {
	    case '\r':
	    case '\n':
	      SC(*cp);
	      break;

	    case '\t':
	      {
		int tw;

		tw = ((hpos + 8) & 0xf8) - hpos;
		while (i < tw)
		  SC(' ');
		break;
	      }
	      
	    default:
	      SC('^');
	      SC(*cp | 0x40);
	    }
	}
      /* Show META-x as 0370.  */
      else if (*cp > printable_limit)
	{
	  REPSPACE (i + 5);
	  sprintf (the_rep + i, "\\%0o", *cp);
	  i = strlen (the_rep);
	}
      else if (*cp == DEL)
	{
	  SC('^');
	  SC('?');
	}
      else
	SC(*cp);
    }
  
  SC(0);
  *plen = i - 1;
  return the_rep;
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

/* Used to correct line offsets in index entries. */
int deleted_lines = 0;

/* Difference between the number of bytes input in the file and
   bytes output. */
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

  if (rewrite_p)
    {
      text_buffer_init (&output_buf);
      deleted_lines = 0;
      output_bytes_difference = 0;
    }
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
         is stateful. */

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
    (signed long) n
    - (signed long) (text_buffer_off (&output_buf) - output_start);

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
  if (preprocess_nodes_p || !rewrite_p)
    {
      inptr += n;
      output_bytes_difference += n;
    }
  else if (rewrite_p)
    {
      /* We are expanding tags only.  Do not skip output. */
      copy_input_to_output (n);
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
  char **store_in;
  int value_length;
  int empty = 1; /* Whether node line is empty. */

  node->next = node->prev = node->up = 0;

  while (1)
    {
      store_in = 0;

      skip_input (skip_whitespace (inptr));

      /* Check what field we are looking at */
      if (!strncmp (inptr, INFO_FILE_LABEL, strlen(INFO_FILE_LABEL)))
        {
          skip_input (strlen(INFO_FILE_LABEL));
          empty = 0;
        }
      else if (!strncmp (inptr, INFO_NODE_LABEL, strlen(INFO_NODE_LABEL)))
        {
          skip_input (strlen(INFO_NODE_LABEL));
          empty = 0;
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
          /* Not recognized - code below will skip to next comma */
        }
        
      skip_input (skip_whitespace (inptr));

      /* PARSE_NODE_START separates at commas or newlines, so it
         will work for filenames including full stops. */
      value_length = skip_node_characters (inptr, PARSE_NODE_START);

      if (store_in)
        {
          empty = 0;
          (*store_in) = xmalloc (value_length + 1);
          memmove (*store_in, inptr, value_length);
          (*store_in) [value_length] = '\0';
        }
        
      skip_input (value_length);
      if (*inptr == '\n')
        {
          /* If the first line is empty, leave it in.  This is the case
             in the index-apropos window. */
          if (!empty)
            {
              skip_input (1);
              deleted_lines++;
            }
          break;
        }
      skip_input (1); /* Point after field terminator */
    }
}

REFERENCE *
scan_reference_label (int colon_offset, int start_of_reference,
                      int found_menu_entry, int capital_s)
{
  REFERENCE *entry;
  char *labelptr;
  int leading_whitespace;
  int newline_offset;

  /* We definitely have a reference by this point.  Create
     REFERENCE entity. */
  entry = xmalloc (sizeof (REFERENCE));
  entry->filename = NULL;
  entry->nodename = NULL;
  entry->label = NULL;
  entry->line_number = 0;
  if (found_menu_entry)
    entry->type = REFERENCE_MENU_ITEM;
  else
    entry->type = REFERENCE_XREF;
  
  /* Save label as it appears in input. */
  entry->label = xmalloc(colon_offset + 1);
  strncpy (entry->label, inptr, colon_offset);
  entry->label[colon_offset] = '\0';  
  skip_input (colon_offset + 1);

  /* Output reference label and set location of reference. */

  if (!found_menu_entry)
    {
      if (capital_s)
        write_extra_bytes_to_output ("See ", 4);
      else
        write_extra_bytes_to_output ("see ", 4);
    }

  /* Output any whitespace or newlines before reference label */
  leading_whitespace = skip_whitespace_and_newlines (entry->label);
  write_extra_bytes_to_output (entry->label, leading_whitespace);

  underlining_on ();

  /* Point reference to where we will put the displayed reference,
     which could be after whitespace. */
  if (rewrite_p)
    {
      /* This condition is mainly for indices so that the cursor
         is on the * when tabbing.
         FIXME: A nicer way of handling the possibilities
         (rewrite_p, preprocess_nodes_p) */
      if (preprocess_nodes_p)
        entry->start = text_buffer_off (&output_buf);
      else
        entry->start = start_of_reference - output_bytes_difference;
    }
  else
    {
      entry->start = start_of_reference;
    }

  entry->end = entry->start + strlen (entry->label)
               - leading_whitespace;

  /* Write text of label.  If there is a newline in the middle of
     a reference label, turn off underling until text starts again. */
  labelptr = entry->label + leading_whitespace;
  while (*labelptr != '\n' && *labelptr) labelptr++;
  newline_offset = labelptr - (entry->label + leading_whitespace);

  write_extra_bytes_to_output (entry->label + leading_whitespace,
          (*labelptr ? newline_offset : 
           strlen(entry->label) - leading_whitespace));

  if (*labelptr)
    {
      int space_at_start_of_line; 

      space_at_start_of_line = skip_whitespace_and_newlines (labelptr);

      /* Note we do this before the newline is output.  This way if
         the first half of the label is on the bottom line of the
         screen, underlining will not be left on. */
      underlining_off ();

      /* Output newline and any whitespace at start of line */
      write_extra_bytes_to_output (labelptr, space_at_start_of_line);
      labelptr += space_at_start_of_line;

      underlining_on ();

      /* Output rest of label */
      write_extra_bytes_to_output (labelptr,
         entry->label + strlen(entry->label) - labelptr);

      /* Text of reference ends later in node because of terminal
         control characters that were output. */
      if (preprocess_nodes_p)
        {
          entry->end += strlen (ANSI_UNDERLINING_ON);
          entry->end += strlen (ANSI_UNDERLINING_OFF);
        }
    }

  underlining_off ();

  return entry;
}

void
scan_reference_target (REFERENCE *entry, int found_menu_entry, int in_index)
{
  /* If this reference entry continues with another ':' then the
     nodename is the same as the label. */
  if (*inptr == ':')
    {
      entry->nodename = xstrdup (entry->label);

      skip_input (1);
      if (found_menu_entry)
        {
          /* Output two spaces to match the length of "::" */
          write_extra_bytes_to_output ("  ", 2);
        }
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

          length = info_parse_node (inptr, PARSE_NODE_SKIP_NEWLINES);

          /* Check if there is a newline in the target. */
          saved_char = inptr[length];
          inptr[length] = '\0';
          nl_off = strchr (inptr, '\n');
          inptr[length] = saved_char;
          
          if (info_parsed_filename)
            {
              write_extra_bytes_to_output (" (", 2);
              write_extra_bytes_to_output (info_parsed_filename,
                strlen (info_parsed_filename));
              write_extra_bytes_to_output (" manual)",
                                           strlen (" manual)"));
            }

          /* A full stop terminating a reference should be output,
             but a comma is usually? not. */
          if (inptr[length - 1] == '.')
            skip_input (length - 1);
          else
            skip_input (length);

          /* Copy any terminating punctuation before the optional newline. */
          copy_input_to_output (strspn (inptr, ".),"));

          if (nl_off)
            { 
              int i, j = skip_whitespace (nl_off + 1);
              write_extra_bytes_to_output ("\n", 1);

              /* Don't allow any spaces in the input to mess up
                 the margin. */
              skip_input (strspn (inptr, " "));
              for (i = 0; i < j; i++)
                write_extra_bytes_to_output (" ", 1);
            }
        }

      if (info_parsed_filename)
        entry->filename = xstrdup (info_parsed_filename);

      if (info_parsed_nodename)
        entry->nodename = xstrdup (info_parsed_nodename);

      if (!preprocess_nodes_p)
        entry->line_number = info_parsed_line_number;
      else
        /* Adjust line offset in file to one in displayed text */
        entry->line_number = info_parsed_line_number - deleted_lines;

      if (found_menu_entry && !in_index)
        /* Output spaces the length of the node specifier to avoid
           messing up left edge of second column of menu. */
        for (i = 0; i < length; i++)
          write_extra_bytes_to_output (" ", 1);
    }
}

/* Check if there is a colon on the next line and return its offset.
   Return -1 if there is no such colon. */
static int
colon_after_newline (char *nodeptr)
{
  int nl, colon_offset;

  /* Check if a newline intervenes */
  nl = skip_line (nodeptr);
  colon_offset = string_in_line (":", nodeptr + nl);
  if (colon_offset != -1)
    return nl + colon_offset;
  else
    return -1;
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
search_again:

  s.flags = S_FoldCase | S_SkipDest;

  while (regexp_search (search_string,
		  &s, &position, 0) == search_success)
    {
      /* Save offset of "*" starting link. When preprocess_nodes is Off,
         we position the cursor on the * when moving to a link. */
      int start_of_reference; 

      /* Cross-references can be generated by four different Texinfo
         commands.  @inforef and @xref output "*Note " in Info format,
         and "See" in HTML and print.  @ref and @pxref output "*note "
         in Info format, and either nothing at all or "see" in HTML
         and print.  Unfortunately, there is no easy way to distinguish
         between these latter two cases.  We must make do with
         displayed manuals occasionally containing "See see" and the
         like. */
      int capital_s;

      int colon_offset;
      REFERENCE *entry;
      char *copy_to;

      /* Pointer to search result (after match) */
      copy_to = s.buffer + position;

      /* Was "* Menu:" seen?  If so, search for menu entries hereafter */
      if (*(copy_to - 1) == ':')
        {
          /* This is INFO_MENU_ENTRY_LABEL "|" INFO_XREF_LABEL, but
             with '*' characters escaped. */
          search_string = "\n\\* |\\*Note";

          /* Write out up to Menu label, and skip it */
          copy_to -= 8;
          copy_input_to_output (copy_to - inptr);
          skip_input (8);

          deleted_lines++;
          s.start = inptr - s.buffer;
          continue;
        }

      /* Check what we found based on last character of match */
      if (*(copy_to - 1) == ' ')
        {
          found_menu_entry = 1;
          start_of_reference = copy_to - node->contents - 2;
        }
      else
        {
          found_menu_entry = 0;

          capital_s = copy_to[-4] == 'N';
          start_of_reference = copy_to - node->contents - 5;
          copy_to -= 5; /* Point to before link */
        }

      /* Write out up to current reference */
      copy_input_to_output (copy_to - inptr); 

      /* Skip "*Note" */
      if (!found_menu_entry)
        skip_input (5);

      /* Search forward to ":" to get label name */
      skip_input (skip_whitespace (inptr));
      colon_offset = string_in_line (":", inptr);

      /* Cross-references may have a newline in the middle. */
      if (colon_offset == -1
          && !found_menu_entry
          && (colon_offset = colon_after_newline (inptr)) != -1)
        ;
      else if (colon_offset == -1)
        {
          /* This is not a menu entry or reference. */
          skip_input (1);

          s.start = inptr - s.buffer;
          continue;
        }
      colon_offset--; /* Offset of colon, not character after it. */

      /* Read and output reference label (up until colon). */
      entry = scan_reference_label
        (colon_offset, start_of_reference, found_menu_entry, capital_s);

      /* We've output the label, so now we can canonicalize it. */
      canonicalize_whitespace (entry->label);

      /* Get target of reference and update entry. */
      scan_reference_target (entry, found_menu_entry, in_index);

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


/* **************************************************************** */
/*                                                                  */
/*                  Functions Static To This File                   */
/*                                                                  */
/* **************************************************************** */

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

