/* float.c -- float environment functions.
   $Id: float.c,v 1.6 2003-11-28 03:29:53 dirt Exp $

   Copyright (C) 2003 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   Written by Alper Ersoy <dirt@gtk.org>.  */

#include "system.h"
#include "makeinfo.h"
#include "cmds.h"
#include "float.h"
#include "sectioning.h"
#include "xml.h"

static FLOAT_ELT *float_stack = NULL;

void
add_new_float (id, title, type)
    char *id;
    char *title;
    char *type;
{
  FLOAT_ELT *new = xmalloc (sizeof (FLOAT_ELT));

  new->id = id;
  new->type = type;
  new->title = title;

  new->number = current_chapter_number ();
  /* Append dot if not @unnumbered.  */
  if (strlen (new->number) > 0)
    strcat (new->number, ".");

  { /* Append the current float number.  */
    char s[100];

    snprintf (s, 100, "%s%d", new->number,
        count_floats_of_type_in_chapter (text_expansion (type), new->number) + 1);
    free (new->number);
    new->number = xstrdup (s);
  }

  /* Plain text output needs sectioning number and its title,
     when listing floats.  */
  if (!html && !xml && no_headers)
    {
      new->section = current_sectioning_number ();
      if (strlen (new->section) == 0)
        new->section_name = current_sectioning_name ();
      else
        new->section_name = "";
    }

  new->next = float_stack;
  float_stack = new;
}

int
count_floats_of_type_in_chapter (type, chapter)
    char *type;
    char *chapter;
{
  int i = 0;
  int l = strlen (chapter);
  FLOAT_ELT *temp = float_stack;

  while (temp && strncmp (temp->number, chapter, l) == 0)
    {
      if (strlen (temp->id) > 0 && STREQ (text_expansion (temp->type), type))
        i++;
      temp = temp->next;
    }

  return i;
}

char *
current_float_title ()
{
  return float_stack->title;
}

char *
current_float_type ()
{
  return float_stack->type;
}

char *
current_float_number ()
{
  return float_stack->number;
}

char *
current_float_id ()
{
  return float_stack->id;
}

char *
get_float_ref (id)
    char *id;
{
  FLOAT_ELT *temp = float_stack;

  while (temp)
    {
      if (STREQ (id, temp->id))
        {
          char *s = xmalloc (strlen (temp->type) + strlen (temp->number) + 2);
          sprintf (s, "%s %s", temp->type, temp->number);
          return s;
        }
      temp = temp->next;
    }

  return NULL;
}

void
cm_listoffloats ()
{
  char *float_type;

  get_rest_of_line (1, &float_type);

  if (xml && !docbook)
    {
      xml_insert_element_with_attribute (LISTOFFLOATS, START,
          "type=\"%s\"", text_expansion (float_type));
      xml_insert_element (LISTOFFLOATS, END);
    }
  else if (!xml)
    {
      FLOAT_ELT *temp = (FLOAT_ELT *) reverse_list (float_stack);
      FLOAT_ELT *new_start = temp;

      if (html)
        add_word ("<div class=\"listoffloats\">\n");
      else if (!no_headers)
        insert_string ("* Menu:\n\n");

      while (temp)
        {
          if (strlen (temp->id) > 0 && STREQ (float_type, temp->type))
            {
              if (html)
                {
                  /* A bit of space for HTML reabality.  */
                  insert_string ("  ");
                  execute_string ("@ref{%s, %s %s}", temp->id, temp->number,
                      temp->title);
                  add_word ("<br>\n");
                }
              else
                {
                  char *entry;
                  char *title = expansion (temp->title, 0);

                  int len = strlen (temp->number) + strlen (title);
                  int aux_chars_len;
                  int column_width;
                  int i = 0;

                  if (no_headers)
                    {
                      column_width = 48;
                      /* Add the width of " :\0" */
                      aux_chars_len = 3;
                    }
                  else
                    {
                      column_width = 37;
                      /* Add the width of "*  :\0" */
                      aux_chars_len = 5;
                    }

                  if (len + aux_chars_len > column_width)
                    { /* Shorten long titles by looking for a space before the
                         45.  char.  */
                      aux_chars_len += 4;
                      len = column_width - strlen (temp->number) - aux_chars_len;
                      while (title[len] != ' ')
                        len--;
                      len += strlen (temp->number);
                      entry = xmalloc (len + aux_chars_len);

                      if (no_headers)
                        snprintf (entry, len + 2, "%s %s", temp->number, title);
                      else
                        snprintf (entry, len + 4, "* %s %s", temp->number, title);

                      strcat (entry, " ...:");
                    }
                  else
                    {
                      entry = xmalloc (len + aux_chars_len);

                      if (no_headers)
                        snprintf (entry, len + aux_chars_len, "%s %s:",
                            temp->number, title);
                      else
                        snprintf (entry, len + aux_chars_len, "* %s %s:",
                            temp->number, title);
                    }

                  insert_string (entry);

                  i = strlen (entry);
                  while (i < column_width + 4)
                    {
                      insert (' ');
                      i++;
                    }

                  if (no_headers)
                    {
                      if (strlen (temp->section) > 0)
                        { /* We got your number.  */
                          insert_string (_("See "));
                          insert_string (temp->section);
                        }
                      else
                        { /* Sigh, @float in an @unnumbered. :-\  */
                          insert_string ("\n          ");
                          insert_string (_("See "));
                          insert_string ("``");
                          insert_string (expansion (temp->section_name, 0));
                          insert_string ("''");
                        }
                    }
                  else
                    insert_string (temp->id);

                  insert_string (".\n");

                  free (entry);
                  free (title);
                }
            }
          temp = temp->next;
        }

      if (html)
        {
          inhibit_paragraph_indentation = 1;
          add_word ("</div>\n\n");
        }
      else
        insert ('\n');

      /* Retain the original order of float stack.  */
      temp = new_start;
      float_stack = (FLOAT_ELT *) reverse_list (temp);
    } /* !xml */

  free (float_type);
}
