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

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#include "parser.h"
#include "text.h"
#include "input.h"
#include "tree.h"
#include "api.h"
#include "errors.h"

/* Parser state - see Parser.pm:135. */

//macro_stack;

/* Declarations of functions in this file */
ELEMENT *parse_texi (ELEMENT *root_elt);


/* Utility functions */

const char *whitespace_chars = " \t\f\r\n";
const char *digit_chars = "0123456789";

// [^\S\r\n] in Perl
const char *whitespace_chars_except_newline = " \t\f";

/* Check if the contents of S2 appear at S1). */
int
looking_at (char *s1, char *s2)
{
  return !strncmp (s1, s2, strlen (s2));
}

/* Return value to be freed by caller.  *PTR is advanced past the read name.
   Return 0 if name is invalid. */
// 4161
char *
read_command_name (char **ptr)
{
  char *p = *ptr;
  char *ret = 0;

  /* List of single character Texinfo commands. */
  if (strchr ("([\"'~@}{,.!?"
              " \f\n\r\t" /* \s in Perl */
              "*-^`=:|/\\",
          *p))
    {
      ret = malloc (2);
      ret[0] = *p++;
      ret[1] = '\0';
    }
  else
    {
      /* Look for a sequence of alphanumeric characters or hyphens, where the
         first isn't a hyphen. */
      char *q = p;
      if (!isalnum (*q))
        return 0; /* Invalid. */

      while (isalnum (*++q) || *q == '-')
        ;
      ret = strndup (p, q - p);
      p = q;
    }

  *ptr = p;
  return ret;
}


/* Current node and section. */

ELEMENT *current_node = 0;
ELEMENT *current_section = 0;


/* Conditional stack. */

enum command_id *conditional_stack;
size_t conditional_number;
size_t conditional_space;

void
push_conditional_stack (enum command_id cond)
{
  if (conditional_number == conditional_space)
    {
      conditional_stack = realloc (conditional_stack,
                                   (conditional_space += 5)
                                   * sizeof (enum command_id));
      if (!conditional_stack)
        abort ();
    }
  conditional_stack[conditional_number++] = cond;
}

enum command_id
pop_conditional_stack (void)
{
  if (conditional_number == 0)
    return CM_NONE;
  return conditional_stack[--conditional_number];
}


/* lines 1-751 - comments, variable declarations, package imports, 
   initializations, utilities */

/* lines 751 - 983 - user-visible functions, entry points */
/* parse_texi_file */
/* 835 */
void
parse_texi_file (const char *filename_in)
{
  char *p, *q;
  char *linep, *line = 0;
  ELEMENT *root = new_element (ET_text_root);
  ELEMENT *preamble = 0;
  char *filename = strdup (filename_in);

  /* Strip off a leading directory path, by looking for the last
     '/' in filename. */
  p = 0;
  q = strchr (filename, '/');
  while (q)
    {
      p = q;
      q = strchr (q + 1, '/');
    }

  if (p)
    {
      *p = '\0';
      add_include_directory (filename);
      filename = p + 1;
    }

  input_push_file (filename);

  /* Check for preamble. */
  do
    {
      ELEMENT *l;

      /* FIXME: _next_text isn't used in Perl. */
      line = next_text ();
      if (!line)
        abort (); /* Empty file? */

      linep = line; 
      linep += strspn (linep, whitespace_chars);
      if (*linep && !looking_at (linep, "\\input"))
        {
          /* This line is not part of the preamble.  Shove back
             into input stream. */
          input_push_text (line);
          break;
        }

      if (!preamble)
        preamble = new_element (ET_preamble);

      l = new_element (ET_preamble_text);
      text_append (&l->text, line);
      add_to_element_contents (preamble, l);
    }
  while (1);

  if (preamble)
    add_to_element_contents (root, preamble);

  Root = parse_texi (root);
} /* 916 */


int
begin_paragraph_p (ELEMENT *current)
{
  return (current->type == ET_NONE /* "True for @-commands" */
           || current->type == ET_before_item
           || current->type == ET_text_root
           || current->type == ET_document_root
           || current->type == ET_brace_command_context)
         && !in_no_paragraph_contexts (current_context ());
}

/* Line 1146 */
/* If in a context where paragraphs are to be started, start a new 
   paragraph.  */
ELEMENT *
begin_paragraph (ELEMENT *current)
{
  if (begin_paragraph_p (current))
    {
      ELEMENT *e;
      int indent = 0;

      /* Check if an @indent precedes the paragraph (to record it
         in the 'extra' key). */

      e = new_element (ET_paragraph);
      add_to_element_contents (current, e);
      current = e;

      debug ("PARAGRAPH");
    }
  return current;
}

// 1190
ELEMENT *
begin_preformatted (ELEMENT *current)
{
  if (current_context() == ct_preformatted
      || current_context() == ct_rawpreformatted)
    {
      ELEMENT *e;
      enum element_type et;

      if (current_context() == ct_preformatted)
        et = ET_preformatted;
      else
        et = ET_rawpreformatted;
      e = new_element (et);
      add_to_element_contents (current, e);
      current = e;
      debug ("PREFORMATTED %s", et == ET_preformatted ? "preformatted"
                                                      : "rawpreformatted");
    }
  return current;
}

/* 1310 */
ELEMENT *
end_paragraph (ELEMENT *current)
{
  /* close_all_style_commands (); */

  if (current->type == ET_paragraph)
    {
      current = current->parent;
      debug ("CLOSE PARA");
    }

  return current;
}

/* 1328 */
ELEMENT *
end_preformatted (ELEMENT *current)
{
  //current = close_all_style_commands (current);
  if (current->type == ET_preformatted
      || current->type == ET_rawpreformatted)
    {
      debug ("CLOSE PREFORMATTED %s",
             current->type == ET_preformatted ? "preformatted"
                                              : "rawpreformatted");
      // remove if empty
      current = current->parent;
    }
  return current;
}

/* Line 1798 */
/* Add TEXT to the contents of CURRENT, maybe starting a new paragraph. */
ELEMENT *
merge_text (ELEMENT *current, char *text)
{
  int no_merge_with_following_text = 0;
  int leading_spaces = strspn (text, whitespace_chars);
  ELEMENT *last_child = last_contents_child (current);

  /* Is there a non-whitespace character in the line? */
  if (text[leading_spaces])
    {
      char *additional = 0;

      if (last_child
          && (last_child->type == ET_empty_line_after_command
              || last_child->type == ET_empty_line_after_command
              || last_child->type == ET_empty_spaces_before_argument
              || last_child->type == ET_empty_spaces_after_close_brace))
        {
          no_merge_with_following_text = 1;
        }

      if (leading_spaces)
        {
          additional = malloc (leading_spaces + 1);
          if (!additional)
            abort ();
          memcpy (additional, text, leading_spaces);
          additional[leading_spaces] = '\0';
        }

      if (abort_empty_line (&current, additional))
        text += leading_spaces;

      free (additional);

      current = begin_paragraph (current);
    }

  if (last_contents_child (current)
      /* There is a difference between the text being defined and empty,
         and not defined at all.  The latter is true for 'brace_command_arg'
         elements.  We need to make sure that we initialize all elements with
         text_append (&e->text, "") where we want merging with following
         text. */
      && last_contents_child (current)->text.space > 0
      && !strchr (last_contents_child (current)->text.text, '\n')
      && !no_merge_with_following_text)
    {
      /* Append text to contents */
      ELEMENT *last_child = last_contents_child (current);
      text_append (&last_child->text, text);
      debug ("MERGED TEXT: %s|||", text);
    }
  else
    {
      ELEMENT *e = new_element (ET_NONE);
      text_append (&e->text, text);
      add_to_element_contents (current, e);
      debug ("NEW TEXT: %s|||", text);
    }

  return current;
}

/* 2106 */
int
abort_empty_line (ELEMENT **current_inout, char *additional_text)
{
  ELEMENT *current = *current_inout;
  int retval;

  ELEMENT *last_child = last_contents_child (current);

  if (!additional_text)
    additional_text = "";

  if (last_child
      && (last_child->type == ET_empty_line
          || last_child->type == ET_empty_line_after_command
          || last_child->type == ET_empty_spaces_before_argument
          || last_child->type == ET_empty_spaces_after_close_brace))
    {
      debug ("ABORT EMPTY additional text |%s| "
             "current |%s|",
             additional_text,
             last_child->text.text);
      text_append (&last_child->text, additional_text);

      // FIXME: How and when is this condition exactly met?
      if (last_child->text.end == 0) //2121
        {
          // 'extra' stuff

          destroy_element (pop_element_from_contents (current));
        }
      else if (last_child->type == ET_empty_line) //2132
        {
          last_child->type = begin_paragraph_p (current)
                             ? ET_empty_spaces_before_paragraph : ET_NONE;
        }
      else if (last_child->type == ET_empty_line_after_command)
        {
          last_child->type = ET_empty_spaces_after_command;
        }
      retval = 1;
    }
  else
    retval = 0;

  *current_inout = current;
  return retval;
}

/* 2149 */
/* Split any trailing whitespace on the last contents child of CURRENT into
   own element, ET_spaces_at_end by default.
  
   This is used for the argument to a line command, and for the arguments to a 
   brace command taking a given number of arguments.

   This helps with argument parsing as there will be no leading or trailing 
   spaces.

   Also, "to help expansion disregard unuseful spaces".  Could that mean
   macro expansion? */
void
isolate_last_space (ELEMENT *current, enum element_type element_type)
{
  ELEMENT *last = last_contents_child (current);

  if (!element_type)
    element_type = ET_spaces_at_end;

  if (last)
    {
      int index = -1;
      ELEMENT *indexed_elt;

      /* If a "misc" (i.e. line) command is last on line, isolate the space in 
         the element before it.  This covers the case of a "@c" at the end
         of a line. */
      if (element_contents_number (current) > 1)
        {
          if (last->cmd)
            {
              if (command_flags(last) & CF_misc)
                index = -2;
            }
        }

      indexed_elt = contents_child_by_index (current, index);
      if (indexed_elt)
        {
          char *text = element_text (indexed_elt);
          if (!text || !*text)
            return;

          if (indexed_elt->type == ET_NONE)
            {
              int text_len = strlen (text);
              /* 2170 */
              /* Does the text end in whitespace? */
              if (strchr (whitespace_chars, text[text_len - 1]))
                {
                  /* If text all whitespace */
                  if (text[strspn (text, whitespace_chars)] == '\0')
                    indexed_elt->type = element_type;
                  else
                    {
                      /* 2173 */
                      ELEMENT *new_spaces;
                      int i, trailing_spaces;

                      /* "strrcspn" */
                      trailing_spaces = 0;
                      for (i = strlen (text) - 1;
                           i > 0 && strchr (whitespace_chars, text[i]);
                           i--)
                        trailing_spaces++;
                      
                      new_spaces = new_element (element_type);
                      text_append_n (&new_spaces->text,
                                     text + text_len - trailing_spaces,
                                     trailing_spaces);
                      text[text_len - trailing_spaces] = '\0';
                      indexed_elt->text.end -= trailing_spaces;

                      if (index == -1)
                        add_to_element_contents (current, new_spaces);
                      else
                        insert_into_contents (current, new_spaces, -1);
                    }
                }
            }
        }
    }
}

// 5467, also in Common.pm 1334
// TODO: Check the behaviour here is the same
/* Return a new element whose contents are the same as those of ORIGINAL,
   but with some elements representing empty spaces removed.  Elements like 
   these are used to represent some of the "content" extra keys. */
ELEMENT *
trim_spaces_comment_from_content (ELEMENT *original)
{
  ELEMENT *trimmed;
  int i;

  trimmed = new_element (ET_NONE);
  trimmed->parent_type = route_not_in_tree;
  for (i = 0; i < original->contents.number; i++)
    {
      if (original->contents.list[i]->type != ET_empty_spaces_after_command
        && original->contents.list[i]->type != ET_spaces_at_end
        && original->contents.list[i]->type != ET_empty_spaces_before_argument)
        {
          /* FIXME: Is this safe to serialize? */
          /* For example, if there are extra keys in the elements under each 
             argument?  They may not be set in a copy.
             Hopefully there aren't many extra keys set on commands in 
             node names. */
          //add_to_element_contents (trimmed, original->contents.list[i]);
          add_to_contents_as_array (trimmed, original->contents.list[i]);
        }
    }

  return trimmed;
}


/* 3491 */
/* Add an "ET_empty_line_after_command" element containing the whitespace at 
   the beginning of the rest of the line.  This element can be later changed to 
   a "ET_empty_spaces_after_command" element in 'abort_empty_line' if more
   text follows on the line.  Used after line commmands or commands starting
   a block. */
void
start_empty_line_after_command (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;
  ELEMENT *e;
  int len;

  len = strspn (line, whitespace_chars_except_newline);
  e = new_element (ET_empty_line_after_command);
  add_to_element_contents (current, e);
  text_append_n (&e->text, line, len);
  line += len;

  *line_inout = line;
}


/* Parts of parse_texi lines 3676 - 5372 */

int
command_with_command_as_argument (ELEMENT *current)
{
  return current->type == ET_block_line_arg
    && (current->parent->cmd == CM_itemize
        || item_line_command (current->parent->cmd));
//    && (current->contents.number == 1);
  //    || current->contents.number == 2 and the first child's text is
  // all non-whitespace characters??
}

/* Used at line 3755 */
/* Check if line is "@end ..." for current command.  If so, advance LINE. */
int
is_end_current_command (ELEMENT *current, char **line,
                        enum command_id *end_cmd)
{
  char *linep;
  char *cmdname;

  linep = *line;

  linep += strspn (linep, whitespace_chars);
  if (!looking_at (linep, "@end"))
    return 0;

  linep += 4;
  if (!strchr (whitespace_chars, *linep))
    return 0;

  linep += strspn (linep, whitespace_chars);
  cmdname = read_command_name (&linep);
  *end_cmd = lookup_command (cmdname);
  free (cmdname);
  if (*end_cmd != current->cmd)
    return 0;

  *line = linep;
  return 1;
}

/* line 3725 */
/* *LINEP is a pointer into the line being processed.  It is advanced past any
   bytes processed.  Return 0 when we need to read a new line. */
int
process_remaining_on_line (ELEMENT **current_inout, char **line_inout)
{
  ELEMENT *current = *current_inout;
  char *line = *line_inout;
  char *line_after_command;
  int retval = 1; /* Return value of function */
  enum command_id end_cmd;

  char *command = 0;
  enum command_id cmd_id = CM_NONE;

  /* We could be after a @macro line.  See comment in handle_block_command 
     4640. */
  if (!*line)
    {
      retval = 0;
      goto funexit;
    }

  /* If in raw block, or ignored conditional block. */
  // 3727
  if (command_flags(current) & CF_block
      && (command_data(current->cmd).data == BLOCK_raw
          || command_data(current->cmd).data == BLOCK_conditional))
    { /* 3730 */
#if 0
      /* Check if we are using a macro within a macro. */
      if (...)
        {
          ELEMENT *e = new_element ();
          /* ... */

          current = current->contents.list[number];
          break;
        }

      /* Else check for nested ifclear */
      else if (...)
        {
          /* ... */
          current = current->contents.list[number];
          break;
        }
      else
#endif
      /* 3755 Else check if line is "@end ..." for current command. */
      if (is_end_current_command (current, &line, &end_cmd))
        {
          ELEMENT *last_child;

          last_child = last_contents_child (current);
           
         if (last_child
             && last_child->type == ET_raw
             && current->cmd != CM_verbatim)
            {
              if (last_child->text.end > 0
                  && last_child->text.text[last_child->text.end - 1] == '\n')
                {
                  ELEMENT *lrn;
                  last_child->text.text[--last_child->text.end] = '\0';
                  lrn = new_element (ET_last_raw_newline);
                  text_append (&lrn->text, "\n");
                  add_to_element_contents (current, lrn);
                }
            }

          /* For macros, define a new macro (unless we are in a nested
             macro definition). */
          if ((end_cmd == CM_macro || end_cmd == CM_rmacro)
              && (!current->parent
                  || (current->parent->cmd != CM_macro
                      && current->parent->cmd != CM_rmacro)))
            {
              char *name;

              name = element_text (args_child_by_index (current, 0));
              new_macro (name, current); // 3808
            }

          current = current->parent;

          /* Check for conditionals. */
          if (command_data(end_cmd).flags & CF_block
              && command_data(end_cmd).data == BLOCK_conditional)
            {
              // 3813 Remove an ignored block.
              ELEMENT *popped;
              popped = pop_element_from_contents (current);
              if (popped->cmd != end_cmd)
                abort(); //error
              destroy_element (popped);

              // abort until end of line, calling new_line
              debug ("CLOSED conditional %s", command_data(end_cmd).cmdname);
            }
          else
            {
              debug ("CLOSED raw %s", command_data(end_cmd).cmdname);
              start_empty_line_after_command (current, &line); // 3831
            }
        }
      else /* 3833 save the line verbatim */
        {
          if (0 && last_contents_child (current)->type
              == ET_empty_line_after_command)
            {
              /* Only if the text is wholly whitespace characters. */
              text_append (&last_contents_child(current)->text, line);
            }
          else
            {
              ELEMENT *e;
              e = new_element (ET_raw);
              text_append (&e->text, line);
              add_to_element_contents (current, e);
            }

          retval = 0; /* 3844 */
          goto funexit;
        }
    } /********* BLOCK_raw or (ignored) BLOCK_conditional 3897 *************/

  /* Check if parent element is 'verb' */
  else if (current->parent && current->parent->cmd == CM_verb) /* 3847 */
    {
      char c;
      char *q;
      /* Save the deliminating character in 'type', if not already done.
         This is a reuse of 'type' for a different purpose. */
      if (!current->parent->type)
        {
          if (!*line)
            {
              line_error ("@verb without associated character");
            }
          else
            current->parent->type = (enum element_type) *line++;
        }

      c = (char) current->parent->type;
      /* Look forward for the delimiter character followed by a close
         brace. */
      q = line;
      do
        {
          q = strchr (q, c);
          if (q[1] == '}' || !q)
            break;
          q++;
        }
      while (1);

      if (q)
        {
          /* Save up to the delimiter character. */
          if (q != line)
            {
              ELEMENT *e = new_element (ET_raw);
              text_append_n (&e->text, line, q - line);
              add_to_element_contents (current, e);
              line = q + 1;
            }
          debug ("END VERB");
          /* The '}' will close the @verb command in handle_separator below. */
        }
      else
        {
          /* Save the rest of line. */
          ELEMENT *e = new_element (ET_raw);
          text_append (&e->text, line);
          add_to_element_contents (current, e);

          debug ("LINE VERB: %s", line);

          retval = 0; goto funexit;  /* Get next line. */
        }
    } /* CM_verb */

  /* Skip empty lines.  If we reach the end of input, continue in case there
     is an @include. */

  if (*line == '@')
    {
      line_after_command = line;

      line_after_command++;
      command = read_command_name (&line_after_command);
      cmd_id = lookup_command (command);
      if (cmd_id == 0)
        {
          /* Unknown command */
          //abort ();
        }
    }

  /* Handle user-defined macros before anything else because their expansion 
     may lead to changes in the line. */
  if (cmd_id && (command_data(cmd_id).flags & CF_MACRO)) // 3894
    {
      line = line_after_command;
      current = handle_macro (current, &line, cmd_id);
    }

  /* 3983 Cases that may "lead to command closing": brace commands that don't 
     need a brace: accent commands.
     @definfoenclose. */
  /* This condition is only checked immediately after the command opening, 
     otherwise the current element is in the 'args' and not right in the 
     commmand container. */
  else if (!cmd_id && command_flags(current) & CF_brace && *line != '{')
    {
      if (command_with_command_as_argument (current->parent)) // 3988
        {
          debug ("FOR PARENT");
          current->type = ET_command_as_argument;
          current = current->parent;
        }
      else if (command_flags (current) & CF_accent) // 3996 - accent commands
        {
          // do accent stuff here
          current = current->parent;
          goto funexit;
        }
      else // 4041
        {
          /* TODO: Check 'IGNORE_SPACES_AFTER_BRACED_COMMAND_NAME' config
             variable. */
          line_errorf ("@%s expected braces",
                       command_data(current->cmd).cmdname);
          current = current->parent;
        }
    }
  else if (handle_menu (&current, &line))
    {
      ; /* Nothing - everything was done in handle_menu. */
    }

  /* line 4161 */
  /* Any other @-command. */
  else if (cmd_id)
    {
      line = line_after_command;
      debug ("COMMAND %s", command);

#if 0
      /* Check if this is an alias command */

      /* @value */

      /* warn on deprecated command */
#endif

      /* warn on not appearing at line beginning 4226 */
      if (!abort_empty_line (&current, NULL))
        //  && begin_line_commands (command))
        {
          /* warning */
        }

#if 0
      /* 4233 invalid nestings */
#endif

      /* 4276 check if begins or ends a paragraph */
      if (!(command_data(cmd_id).flags & (CF_misc | CF_block)))
          {
          /*
             Unless no paragraph commands (line 311):
             All misc commands
             All block commands
             'titlefont', 'caption', 'shortcaption',
             'image', '*', 'hyphenation', 'anchor', 'errormsg'
             Index commands
           */

          ELEMENT *paragraph;
          paragraph = begin_paragraph (current);
          if (paragraph)
            current = paragraph;
        }

      // 4281
      if (cmd_id != 0)
        {
          if (close_paragraph_command (cmd_id))
            current = end_paragraph (current);
          if (close_preformatted_command (cmd_id))
            current = end_preformatted (current);
        }

      if (cmd_id == 0)
        {
          // Unknown command
          /* FIXME: Just add it as a new element for now to check it worked. */
          /* Elements corresponding to Texinfo commands don't have types.  They 
             are identified by the cmdname instead. */
          ELEMENT *e = new_element (ET_NONE);
          e->cmd = CM_NONE;
          add_to_element_contents (current, e);
          retval = 1;
          goto funexit;
        }
      /* line 4289 */
      /* the 'misc-commands' - no braces and not block commands (includes
         @end) */
      else if (command_data(cmd_id).flags & CF_misc)
        {
          current = handle_misc_command (current, &line, cmd_id);
        }

      /* line 4632 */
      else if (command_data(cmd_id).flags & CF_block)
        {
          current = handle_block_command (current, &line, cmd_id);
        }

      else if (command_data(cmd_id).flags & CF_brace) /* line 4835 */
        /* or definfoenclose */
        {
          current = handle_brace_command (current, &line, cmd_id);
        }

      /* No-brace command */
      else if (command_data(cmd_id).flags & CF_nobrace) /* 4864 */
        {
          ELEMENT *nobrace;

          nobrace = new_element (ET_NONE);
          nobrace->cmd = cmd_id;
          add_to_element_contents (current, nobrace);

          // @\
          // @NEWLINE

        }
#if 0
      else
        {
          /* error: unknown command */
        }
#endif
    }
  /* "Separator" - line 4881 */
  else if (*line != '\0' && strchr ("{}@,:\t.\f", *line))
    {
      char separator = *line++;
      debug ("SEPARATOR: %c", separator);
      if (separator == '@')
        /* error */;
      else
        current = handle_separator (current, separator, &line);
    } /* 5326 */
  /* "Misc text except end of line." */
  else if (*line && *line != '\n') /* 5326 */
    {
      size_t len;
      
      /* Output until next command, separator or newline. */
      {
        char saved; /* TODO: Have a length argument to merge_text? */
        len = strcspn (line, "{}@,:\t.\n\f");
        saved = line[len];
        line[len] = '\0';
        current = merge_text (current, line);
        line += len;
        *line = saved;
      }

      retval = 1;
      goto funexit;
    }
  else /* 5331 End of line */
    {
      if (current->type)
        debug ("END LINE (%s)", element_type_names[current->type]);
      else if (current->cmd)
        debug ("END LINE (@%s)", command_data(current->cmd).cmdname);
      else
        debug ("END LINE");
      if (current->parent)
        {
          debug_nonl (" <- ");
          if (current->parent->cmd)
            debug_nonl("@%s", command_data(current->parent->cmd).cmdname);
          if (current->parent->type)
            debug_nonl("(%s)", element_type_names[current->parent->type]);
          debug ("");
          debug ("");
        }

      if (*line == '\n')
        {
          current = merge_text (current, "\n");
          line++;
        }
      else
        ;//abort ();

      /* '@end' is processed in here. */
      current = end_line (current); /* 5344 */
      retval = 0;
    }

funexit:
  *current_inout = current;
  *line_inout = line;
  return retval;
}

/* Pass in and return root of a "Texinfo tree". */
/* 3676 */
ELEMENT *
parse_texi (ELEMENT *root_elt)
{
  ELEMENT *current = root_elt;
  char *allocated_line = 0, *line;

  /* Read input file line-by-line. */
  while (1)
    {
      free (allocated_line);
      line = allocated_line = next_text ();
      if (!allocated_line)
        break; /* Out of input. */

      debug_nonl ("NEW LINE %s", line);

      // 3706
      /* If not in 'raw' or 'conditional' and parent isn't a 'verb', collect
         leading whitespace and save as an "ET_empty_line" element.  This
         element type can be changed in 'abort_empty_line' when more text is
         read. */
      if (!((command_flags(current) & CF_block)
             && (command_data(current->cmd).data != BLOCK_raw
                 || command_data(current->cmd).data != BLOCK_conditional)
            || current->parent && current->parent->cmd == CM_verb))
        {
          ELEMENT *e;
          int n;
          
          debug ("BEGIN LINE");
          e = new_element (ET_empty_line);
          add_to_element_contents (current, e);

          n = strspn (line, whitespace_chars_except_newline);
          text_append_n (&e->text, line, n);
          line += n;
        }

      /* Process from start of remaining line, advancing it until we run out
         of line. */
      while (1)
        {
          if (!process_remaining_on_line (&current, &line))
            break;
        }
    }

#if 0
  /* Check for unclosed conditionals */
  while (...)
    {
    }
#endif

    {
      ELEMENT *dummy;
      current = close_commands (current, CM_NONE, &dummy, CM_NONE);

      /* Make sure we are at the very top - we could have stopped at the "top" 
         element, with "document_root" still to go.  (This happens if the file 
         didn't end with "@bye".) */
      while (current->parent)
        current = current->parent;
    }

  /* Check for "unclosed stacks". */

  return current;
} /* 5372 */



/* 5793 - end of code in Parser.pm */
