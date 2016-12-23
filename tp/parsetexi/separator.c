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
#include "errors.h"
#include "convert.h"
#include "input.h"
#include "labels.h"

// 3600
/* Add the contents of CURRENT as an element to the extra value with
   key KEY, except that some "empty space" elements are removed.  Used for
   'brace_command_contents' for the arguments to a brace command, and
   'block_command_line_contents' for the arguments to a block line command.

   For a brace command $element, $element->{'args'} has pretty much the same 
   information as $element->{'extra'}->{'brace_command_contents'}. */
void
register_command_arg (ELEMENT *current, char *key)
{
  ELEMENT *value;
  ELEMENT *new;
  KEY_PAIR *k;

  new = trim_spaces_comment_from_content (current);
  if (new->contents.number == 0)
    {
      free (new);
      new = 0;
    }

  /* FIXME: Could we add all the command args together, instead of one-by-one,
     to avoid having to look for the extra value every time? */
  k = lookup_extra_key (current->parent, key);
  if (k)
    value = k->value;
  else
    {
      value = new_element (ET_NONE);
      value->parent_type = route_not_in_tree;
      add_extra_contents_array (current->parent, key, value);
    }

  add_to_contents_as_array (value, new);
}

/* 4888 */
ELEMENT *
handle_open_brace (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;

  abort_empty_line (&current, NULL);
  /* 4890 */
  if (command_flags(current) & CF_brace)
    {
      enum command_id command;
      ELEMENT *arg;

      command = current->cmd;
      /* 4896 */
      counter_push (&count_remaining_args, current,
                    command_data(current->cmd).data);
      counter_dec (&count_remaining_args);

      arg = new_element (ET_NONE);
      add_to_element_args (current, arg);
      current = arg;

      if (command == CM_verb)
        {
          current->type = ET_brace_command_arg;
          /* Save the deliminating character in 'type'.  This is a reuse of 
             'type' for a different purpose. */
          if (!*line || *line == '\n')
            {
              line_error ("@verb without associated character");
              current->parent->type = 0;
            }
          else
            current->parent->type = (enum element_type) *line++;
        }
        /* 4903 */
      else if (command_data(command).data == BRACE_context)
        {
          if (command == CM_caption || command == CM_shortcaption)
            {
#define float floatxx
              ELEMENT *float;
              if (!current->parent->parent
                  || current->parent->parent->cmd != CM_float)
                {
                  float = current->parent;
                  while (float->parent && float->cmd != CM_float)
                    float = float->parent;
                  if (float->cmd != CM_float)
                    {
                      line_error ("@%s is not meaningful outside "
                                  "`@float' environment",
                                  command_name(command));
                      float = 0;
                    }
                  else
                    line_warn ("@%s should be right below `@float'", 
                               command_name(command));
                }
              else
                float = current->parent->parent;
              if (float)
                {
                  if (lookup_extra_key (float, command_name(command)))
                    line_warn ("ignoring multiple @%s",
                               command_name(command));
                  else
                    {
                      add_extra_element (current->parent, "float", float);
                      add_extra_element (float, command_name(command), 
                                             current->parent);
                    }
                }
#undef float
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
            add_extra_element (current->parent,
                                   "spaces_before_argument", e);
            line += n;
          }
          current->type = ET_brace_command_context;
        }

      /* 4945 */
      else /* not context brace */
        {
          current->type = ET_brace_command_arg;

          /* Commands which are said to take a positive number of arguments
             disregard leading and trailing whitespace.  In 
             'handle_close_brace', the 'brace_command_contents' array
             is set.  */
          if (command_data(command).data > 0)
            {
              ELEMENT *e;
              e = new_element (ET_empty_spaces_before_argument);
              /* See comment in parser.c:merge_text */
              text_append (&e->text, "");
              add_to_element_contents (current, e);
              add_extra_element (current->parent,
                                     "spaces_before_argument", e);

              if (command == CM_inlineraw)
                push_context (ct_inlineraw);
            }
        }
      debug ("OPENED");
    }

  /* 4967 */
  else if (current->parent && (current->parent->cmd == CM_multitable
           || current->parent->type == ET_def_line))
    {
      ELEMENT *b, *e;
      b = new_element (ET_bracketed);
      add_to_element_contents (current, b);
      current = b;

      /* We need the line number here in case @ protects the
         end of the line.  */
      if (current->parent->parent->type == ET_def_line)
        current->line_nr = line_nr;

      e = new_element (ET_empty_spaces_before_argument);
      text_append (&e->text, ""); /* See comment in parser.c:merge_text */
      add_to_element_contents (current, e);
      debug ("BRACKETED in def/multitable");
      add_extra_element (current, "spaces_before_argument", e);
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
    {
      ELEMENT *b = new_element (ET_bracketed);
      b->line_nr = line_nr;
      add_to_element_contents (current, b);
      current = b;
      debug ("BRACKETED in math");
    }
  else
    line_error ("misplaced {");

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
      else if (command_data(current->parent->cmd).data > 0) /* sic */
        {
          // 5033
          /* @inline* always have end spaces considered as normal text */
          if (!(command_flags(current->parent) & CF_inline))
            isolate_last_space (current, 0);
          register_command_arg (current, "brace_command_contents");
          remove_empty_content_arguments (current);
        }

      closed_command = current->parent->cmd;
      debug ("CLOSING(brace) %s", command_data(closed_command).cmdname);
      counter_pop (&count_remaining_args);

      // 5044
      if (current->contents.number > 0
          && command_data(closed_command).data == 0)
        line_warn ("command @%s does not accept arguments",
                   command_name(closed_command));

      if (closed_command == CM_anchor) // 5051
        {
          NODE_SPEC_EXTRA *parsed_anchor;
          current->parent->line_nr = line_nr;
          parsed_anchor = parse_node_manual (current);
          if (check_node_label (parsed_anchor, CM_anchor))
            {
              register_label (current->parent, parsed_anchor);
              if (current_region ())
                add_extra_element (current, "region", current_region ());
            }
        }
      else if (command_data(closed_command).flags & CF_ref) // 5062
        {
          ELEMENT *ref = current->parent, *args;
          KEY_PAIR *k;
          if (ref->args.number > 0)
            {
              k = lookup_extra_key (ref, "brace_command_contents");
              args = k->value;
              if ((closed_command == CM_inforef
                   && (args->contents.number <= 0
                       || !args->contents.list[0])
                   && (args->contents.number <= 2
                       || !args->contents.list[2]))
                  || (closed_command != CM_inforef
                       && (args->contents.number <= 0
                           || !args->contents.list[0])
                       && (args->contents.number <= 3
                           || !args->contents.list[3])
                       && (args->contents.number <= 4
                           || !args->contents.list[4])))
                {
                  line_warn ("command @%s missing a node or external manual "
                             "argument", command_name(closed_command));
                }
              else
                {
                  NODE_SPEC_EXTRA *nse;
                  nse = parse_node_manual (args_child_by_index (ref, 0));
                  if (nse && (nse->manual_content || nse->node_content))
                    add_extra_node_spec (ref, "node_argument", nse);
                  else
                    free (nse);
                  if (closed_command != CM_inforef
                      && (args->contents.number <= 3
                          || args->contents.number <= 4
                             && !contents_child_by_index(args, 3)
                          || (!contents_child_by_index(args, 3)
                               && !contents_child_by_index(args, 4)))
                      && !nse->manual_content)
                    {
                      remember_internal_xref (ref);
                    }
                }
              // TODO 5085 check node name not empty after normalization
            }
        }
      else if (closed_command == CM_image) // 5109
        {
          ELEMENT *image = current->parent;
          KEY_PAIR *k;
          if (image->args.number == 0)
            goto image_no_args;
          k = lookup_extra_key (image, "brace_command_contents");
          if (!k)
            goto image_no_args;
          if (!contents_child_by_index (k->value, 0))
            goto image_no_args;
          if (0)
            {
          image_no_args:
              line_error ("@image missing filename argument");
            }
        }
      else if (closed_command == CM_dotless)
        {
          if (current->contents.number > 0)
            {
              char *text = current->contents.list[0]->text.text;
              if (!text || (strcmp (text, "i") && strcmp (text, "j")))
                {
                  line_error ("@dotless expects `i' or `j' as argument, "
                              "not `%s'", text);
                }
            }
        }
      else if ((command_data(closed_command).flags & CF_inline)
               || closed_command == CM_abbr
               || closed_command == CM_acronym)
        { // 5129
          KEY_PAIR *k;
          if (current->parent->cmd == CM_inlineraw)
            {
              if (ct_inlineraw != pop_context ())
                abort ();
            }
          if (current->parent->args.number == 0
              || !(k = lookup_extra_key (current->parent, 
                                         "brace_command_contents"))
              || !k->value || k->value->contents.number == 0
              || !k->value->contents.list[0])
            {
              line_warn ("@%s missing first argument",
                         command_name(current->parent->cmd));
            }
        }
      else if (closed_command == CM_errormsg) // 5173
        {
          int i;
          /* Find arg */
          /* Should we use trim_spaces_comment_from_content instead? */
          for (i = 0; i < current->contents.number; i++)
            {
              enum element_type t = current->contents.list[i]->type;
              if (current->contents.list[i]->text.end > 0
                  && t != ET_empty_line_after_command
                  && t != ET_empty_spaces_after_command
                  && t != ET_empty_spaces_before_argument
                  && t != ET_empty_space_at_end_def_bracketed
                  && t != ET_empty_spaces_after_close_brace)
                break;
            }
          if (i == current->contents.number)
            ;
          else
            {
              char *arg = current->contents.list[i]->text.text;
              line_error (arg);
            }
        }
      else if (closed_command == CM_U)
        {
          int i;
          /* Find arg */
          /* Should we use trim_spaces_comment_from_content instead? */
          for (i = 0; i < current->contents.number; i++)
            {
              enum element_type t = current->contents.list[i]->type;
              if (current->contents.list[i]->text.end > 0
                  && t != ET_empty_line_after_command
                  && t != ET_empty_spaces_after_command
                  && t != ET_empty_spaces_before_argument
                  && t != ET_empty_space_at_end_def_bracketed
                  && t != ET_empty_spaces_after_close_brace)
                break;
            }
          if (i == current->contents.number)
            {
              line_warn ("no argument specified for @U");
            }
          else
            {
              char *arg = current->contents.list[i]->text.text;
              int n = strspn (arg, "0123456789ABCDEFabcdef");
              if (arg[n])
                {
                  line_error ("non-hex digits in argument for @U: %s", arg);
                }
              else if (n < 4)
                {
                  line_warn
                    ("fewer than four hex digits in argument for @U: %s", arg);
                }
              else
                {
                  int val;
                  int ret = sscanf (arg, "%d", &val);
                  if (ret != 1)
                    {
                      debug ("hex sscanf failed %s", arg);
                      /* unknown error.  possibly argument is too large
                         for an int. */
                    }
                  if (ret != 1 || val > 0x10FFF)
                    {
                      line_error
                       ("argument for @U exceeds Unicode maximum 0x10FFFF: %s",
                        arg);
                    }
                }

            }
        }
      else if (command_with_command_as_argument (current->parent->parent)
               && current->contents.number == 0)
        {
          debug ("FOR PARENT ... command_as_argument_braces ...");
          if (!current->parent->type)
            current->parent->type = ET_command_as_argument;
          add_extra_element (current->parent->parent->parent,
                             "command_as_argument", current->parent);
        }
      register_global_command (current->parent->cmd, current->parent);

      // 5190
      if (current->parent->cmd == CM_anchor
          || current->parent->cmd == CM_hyphenation
          || current->parent->cmd == CM_caption
          || current->parent->cmd == CM_shortcaption)
        {
          ELEMENT *e;
          e = new_element (ET_empty_spaces_after_close_brace);
          text_append (&e->text, "");
          add_to_element_contents (current->parent->parent, e);
        }

      current = current->parent->parent;
      if (close_preformatted_command(closed_command))
        current = begin_preformatted (current);
    } /* CF_brace */
  else if (current->type == ET_rawpreformatted) // 5199
    {
      /* lone right braces are accepted in a rawpreformatted */
      ELEMENT *e = new_element (ET_NONE);
      text_append_n (&e->text, "}", 1);
      add_to_element_contents (current, e);
      goto funexit;
    }
  // 5203 -- context brace command (e.g. @footnote)
  else if (current_context() == ct_footnote
           || current_context() == ct_caption
           || current_context() == ct_shortcaption
           || current_context() == ct_math)
    {
      enum context c;

      current = end_paragraph (current, 0, 0);
      if (current->parent
          && (command_flags(current->parent) & CF_brace)
          && (command_data(current->parent->cmd).data == BRACE_context))
        {
          enum command_id closed_command;
          c = pop_context ();
          debug ("CLOSING(context command)");
          closed_command = current->parent->cmd;

          register_global_command (current->parent->cmd, current->parent);
          // 5220
          current = current->parent->parent;
          if (close_preformatted_command(closed_command))
            current = begin_preformatted (current);
        }
    }
  else // 5224
    {
      line_error ("misplaced }");
      goto funexit;
    }
  
funexit:
  *line_inout = line;
  return current;
}

// 2577
/* Remove 'brace_command_contents' or 'block_command_line_contents'
   extra value if empty.
   TODO: If not empty, remove empty elements thereof. */
void
remove_empty_content_arguments (ELEMENT *current)
{
  KEY_PAIR *k;

  k = lookup_extra_key (current, "block_command_line_contents");
  if (!k)
    k = lookup_extra_key (current, "brace_command_contents");
  if (!k)
    return;

  while (k->value->contents.number > 0
         && !last_contents_child(k->value)) // ->contents.number == 0)
    pop_element_from_contents (k->value);

  if (k->value->contents.number == 0)
    {
      k->key = "";
      k->type = extra_deleted;
    }
}


/* Handle a comma separating arguments to a Texinfo command. */
/* 5228 */
ELEMENT *
handle_comma (ELEMENT *current, char **line_inout)
{
  char *line = *line_inout;
  enum element_type type;
  ELEMENT *new_arg, *e;

  abort_empty_line (&current, NULL);

  /* Register brace_command_contents or block_command_line_contents in extra 
     key. */
  if (command_flags(current->parent) & CF_brace
      && command_data(current->parent->cmd).data > 0)
    {
      // 5033
      isolate_last_space (current, 0);
      register_command_arg (current, "brace_command_contents");
      remove_empty_content_arguments (current);
    }
  else
    {
      isolate_last_space (current, 0);
      if (command_flags(current->parent) & CF_block)
        {
          register_command_arg (current, "block_command_line_contents");
        }
    }

  type = current->type;
  current = current->parent;

  // 5244
  if (command_flags(current) & CF_inline)
    {
      KEY_PAIR *k;
      int expandp = 0;
      debug ("THE INLINE PART");
      k = lookup_extra_key (current, "format");
      if (!k)
        {
          KEY_PAIR *k;
          char *inline_type = 0;
          k = lookup_extra_key (current, "brace_command_contents");
          if (k)
            {
              ELEMENT *args = 0, *arg = 0;
              int i;
              args = (ELEMENT *) k->value;
              if (!args)
                goto inline_no_arg;
              if (args->contents.number == 0)
                goto inline_no_arg;
              arg = args->contents.list[0];
              if (!arg)
                goto inline_no_arg; /* Possible if registered as 'undef'. */
              /* Find text argument.
                 TODO: Should we use trim_spaces_comment_from_content instead?
                 Or use a function for this? */
              for (i = 0; i < arg->contents.number; i++)
                {
                  enum element_type t = arg->contents.list[i]->type;
                  if (arg->contents.list[i]->text.end > 0
                      && t != ET_empty_line_after_command
                      && t != ET_empty_spaces_after_command
                      && t != ET_empty_spaces_before_argument
                      && t != ET_empty_space_at_end_def_bracketed
                      && t != ET_empty_spaces_after_close_brace)
                    break;
                }
              if (i != arg->contents.number)
                {
                  inline_type = arg->contents.list[i]->text.text;
                }
            }


          debug ("INLINE <%s>", inline_type);
          if (!inline_type)
            {
inline_no_arg:
              /* Condition is missing */
              debug ("INLINE COND MISSING");
            }
          else if (current->cmd == CM_inlineraw
              || current->cmd == CM_inlinefmt
              || current->cmd == CM_inlinefmtifelse)
            {
              if (format_expanded_p (inline_type))
                {
                  expandp = 1;
                  add_extra_string (current, "expand_index", "1");
                }
              else
                expandp = 0;
            }
          else if (current->cmd == CM_inlineifset
                   || current->cmd == CM_inlineifclear)
            {
              expandp = 0;
              if (fetch_value (inline_type, strlen (inline_type)))
                expandp = 1;
              if (current->cmd == CM_inlineifclear)
                expandp = !expandp;
              if (expandp)
                add_extra_string (current, "expand_index", "1");
            }
          else
            expandp = 0;

          add_extra_string (current, "format", inline_type);

          /* Skip first argument for a false @inlinefmtifelse */
          if (!expandp && current->cmd == CM_inlinefmtifelse)
            {
              ELEMENT *e;
              int brace_count = 1;

              add_extra_string (current, "expand_index", "2");

              /* Add a dummy argument for the first argument. */
              e = new_element (ET_elided);
              add_to_element_args (current, e);
              register_command_arg (e, "brace_command_contents");

              /* Scan forward to get the next argument. */
              while (brace_count > 0)
                {
                  line += strcspn (line, "{},");
                  switch (*line)
                    {
                    case ',':
                      if (brace_count == 1)
                        {
                          line++;
                          goto inlinefmtifelse_done;
                        }
                      break;
                    case '{':
                      brace_count++;
                      break;
                    case '}':
                      brace_count--;
                      break;
                    default:
                      line = next_text ();
                      if (!line)
                        {
                          /* ERROR - unbalanced brace */
                        }
                      continue;
                    }
                  line++;
                }
inlinefmtifelse_done:
              /* Check if the second argument is missing. */
              if (brace_count == 0)
                {
                  line--; /* on '}' */
                }

              counter_dec (&count_remaining_args);
              expandp = 1;
            }
        }
      else if (current->cmd == CM_inlinefmtifelse)
        {
          /* Second art of @inlinefmtifelse when condition is true.  Discard
             second argument. */
          expandp = 0;
        }

      /* If this command is not being expanded, add a dummy argument, and
         scan forward to the closing brace. */
      if (!expandp)
        {
          ELEMENT *e;
          int brace_count = 1;
          e = new_element (ET_elided);
          add_to_element_args (current, e);
          while (brace_count > 0)
            {
              line += strcspn (line, "{}");
              switch (*line)
                {
                case '{':
                  brace_count++;
                  break;
                case '}':
                  brace_count--;
                  break;
                default:
                  line = next_text ();
                  if (!line)
                    {
                      /* ERROR - unbalanced brace */
                    }
                  continue;
                }
              line++;
            }
          current = last_args_child (current);
          line--;  /* on '}' */
          goto funexit;
        }
    }

  counter_dec (&count_remaining_args);
  new_arg = new_element (type);
  add_to_element_args (current, new_arg);
  current = new_arg;
  e = new_element (ET_empty_spaces_before_argument);
  text_append (&e->text, ""); /* See comment in parser.c:merge_text */
  add_to_element_contents (current, e);
  
funexit:
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
  else if (separator == ',' // 5228
           && counter_value (&count_remaining_args, current->parent) > 0)
    {
      current = handle_comma (current, &line);
    }
  else if (separator == ',' && current->type == ET_misc_line_arg
           && current->parent->cmd == CM_node) // 5297
    {
      line_warn ("superfluous arguments for node");
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
      ELEMENT *e;

      /* A form feed stops and restarts a paragraph. */
      current = end_paragraph (current, 0, 0);
      e = new_element (ET_empty_line);
      text_append_n (&e->text, "\f", 1);
      add_to_element_contents (current, e);
      e = new_element (ET_empty_line);
      add_to_element_contents (current, e);
    }
  else // 5322
    {
      /* Default - merge the character as usual. */
      char t[2];
      t[0] = separator;
      t[1] = '\0';
      current = merge_text (current, t);
    }

  *line_inout = line;
  return current;
}
