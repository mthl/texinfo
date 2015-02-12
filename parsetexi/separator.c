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
#include <string.h>

#include "parser.h"
#include "tree.h"
#include "text.h"

/* 4888 */
ELEMENT *
handle_open_brace (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;

  abort_empty_line (&current, NULL);
  /* 4890 */
  if (command_flags(current) & CF_brace
      /* || definfoenclose */ )
    {
      enum command_id command;
      ELEMENT *arg;

      command = current->cmd;
      /* 4896 */
      current->remaining_args = command_data(current->cmd).data;
      current->remaining_args--;

      arg = new_element (ET_NONE);
      add_to_element_args (current, arg);
      current = arg;

      /* 4903 */
      if (command_data(command).data == BRACE_context)
        {
          if (command == CM_caption || command == CM_shortcaption)
            {
            }

          /* Add to context stack. */
          switch (command)
            {
            case CM_footnote:
              push_context (ct_footnote);
              break;
            case CM_caption:
              push_context (ct_caption);
              break;
            case CM_shortcaption:
              push_context (ct_shortcaption);
              break;
            case CM_math:
              push_context (ct_math);
              break;
            default:
              abort ();
            }

          {
            ELEMENT *e;
            int n;
            n = strspn (line, whitespace_chars_except_newline);
            e = new_element (ET_empty_spaces_before_argument);
            text_append_n (&e->text, line, n);
            add_to_element_contents (current, e);
            line += n;
          }
          current->type = ET_brace_command_context;
        }

      /* 4945 */
      else /* not context brace */
        {
          current->type = ET_brace_command_arg;
          /* If this command takes more than one argument (why??) */
          /* TODO: Also "simple text commands" 425 */
          if (command_data(command).data > 1)
            {
              ELEMENT *e;
              e = new_element (ET_empty_spaces_before_argument);
              add_to_element_contents (current, e);
              add_extra_key_element (current->parent,
                                     "spaces_before_argument", e);
            }
          /* 4956 - TODO inline commands */
        }

    }

  /* 4967 */
  else if (current->parent->cmd == CM_multitable
           || current->parent->type == ET_def_line)
    {
      ELEMENT *b, *e;
      b = new_element (ET_bracketed);
      add_to_element_contents (current, b);
      current = b;
      /* TODO: Record the line number if we are in a def_line in case @ 
         protects the end of the line. */
      e = new_element (ET_empty_spaces_before_argument);
      add_to_element_contents (current, e);
      debug ("BRACKETED in def/multitable");

    }
  else if (current->type == ET_rawpreformatted)
    {
      ELEMENT *e = new_element (ET_NONE);
      text_append (&e->text, "{");
      add_to_element_contents (current, e);
    }

  // 4993
  else if (current_context() == ct_math
           || current_context() == ct_rawpreformatted
           || current_context() == ct_inlineraw)
    //     || ignore_global_commands () - whatever that is
    {
      ELEMENT *b = new_element (ET_bracketed);
      add_to_element_contents (current, b);
      current = b;
      debug ("BRACKETED in math");
    }
#if 0

  else
    /*error*/;
#endif

  *line_inout = line;
  return current;
}

/* 5007 */
ELEMENT *
handle_close_brace (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;

  abort_empty_line (&current, NULL);

  if (current->type == ET_bracketed)
    {
      /* Used in @math */
      current = current->parent;
      goto funexit;
    }
  else if (command_flags(current->parent) & CF_brace)
    {
      enum command_id closed_command;
      // 5019
      if (command_data(current->parent->cmd).data == BRACE_context)
        {
          enum context c;
          c = pop_context ();
          /* The Perl code here checks that the popped context and the
             parent command match as strings. */
        }
      closed_command = current->parent->cmd;
      debug ("CLOSING(brace) %s", command_data(closed_command).cmdname);

      // 5044 check for brace command that doesn't take arguments has in
      // fact been given arguments.

      if (closed_command == CM_anchor) // 5051
        {
        }
      else if (command_data(closed_command).flags & CF_ref) // 5062
        {
        }
      else if (closed_command == CM_image)
        {
          // check for filename argument
        }
      else if (closed_command == CM_dotless)
        {
        }
      else if (command_data(closed_command).flags & (CF_explained | CF_inline))
        { // 5129
        }
      else if (closed_command == CM_errormsg)
        {
          // XXXXX !!!!!!
          // Texinfo::Convert::Text::convert (...)
          // XXXXX !!!!!!
          abort ();
        }
      else if (command_with_command_as_argument (current->parent->parent)
               && current->contents.number == 0)
        {
          debug ("FOR PARENT ... command_as_argument_braces ...");
          if (!current->parent->type)
            current->parent->type = ET_command_as_argument;
        }
      //register_global_command ();
      // ET_empty_spaces_after_close_brace
      current = current->parent->parent;
      if (close_preformatted_command(closed_command))
        current = begin_preformatted (current);
      // if close_preformatted begin_preformatted
    } /* CF_brace */
  else if (current->type == ET_rawpreformatted) // 5199
    {
      goto funexit;
    }
  // 5203 -- context brace command (e.g. @footnote)
  else if (current_context() == ct_footnote
           || current_context() == ct_caption
           || current_context() == ct_shortcaption
           || current_context() == ct_math)
    {
      enum context c;

      current = end_paragraph (current);
      if (1)
        {
          enum command_id closed_command;
          c = pop_context ();
          debug ("CLOSING(context command)");
          closed_command = current->parent->cmd;

          // 5211
          current = current->parent->parent;
          if (close_preformatted_command(closed_command))
            current = begin_preformatted (current);
        }
      else // 5224
        {
          /* error - misplaced } */
          goto funexit;
        }
    }
  
funexit:
  *line_inout = line;
  return current;
}

/* Handle a comma separating arguments to a Texinfo command. */
/* 5228 */
ELEMENT *
handle_comma (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;
  enum element_type type;
  ELEMENT *new_arg;

  abort_empty_line (&current, NULL);

  /* Register brace_command_contents or block_command_line_contents in extra 
     key.  Hopefully we won't have to do this. */

  type = current->type;
  current = current->parent;
#if 0
  if (current is an inline command (like inlineraw) all brace commands))
    {
    }
#endif

  current->remaining_args--;
  new_arg = new_element (type);
  add_to_element_args (current, new_arg);
  current = new_arg;
  add_to_element_contents (current,
      new_element (ET_empty_spaces_before_argument));
  
  *line_inout = line;
  return current;
}

/* Actions to be taken when a special character appears in the input. */
ELEMENT *
handle_separator (ELEMENT *current, char separator, char **line_inout)
{
  char *line = *line_inout;

  if (separator == '{') // 4888
    {
      current = handle_open_brace (current, &line);
    }
  else if (separator == '}') // 5007
    {
      current = handle_close_brace (current, &line);
    }
  /* If a comma is seen after all the arguments for the command have been
     read, it is included in the last argument. */
  else if (separator == ',' && current->parent->remaining_args > 0) // 5228
    {
      current = handle_comma (current, &line);
    }
  else if (separator == ',' && current->type == ET_misc_line_arg
           && current->parent->cmd == CM_node) // 5297
    {
      // Warning - superfluous arguments for node
    }
  /* 5303 After a separator in a menu. */
  else if ((separator == ','
            || separator == '\t'
            || separator == '.')
           && current->type == ET_menu_entry_node
           || separator == ':' && current->type == ET_menu_entry_name)
    {
      ELEMENT *e;
      
      current = current->parent;
      e = new_element (ET_menu_entry_separator);
      text_append_n (&e->text, &separator, 1);
      add_to_element_args (current, e);

      /* Note in 'handle_menu' in menus.c, if a '.' is not followed by
         whitespace, we revert was was done here. */
    }
  else if (separator == '\f' && current->type == ET_paragraph)
    {
      /* A form feed stops and restarts a paragraph. */
    }
  else // 5322
    {
      /* Default - merge the character as usual. */
      char t[2];
      t[0] = separator;
      t[1] = '\0';
      merge_text (current, t);
    }

  *line_inout = line;
  return current;
}
