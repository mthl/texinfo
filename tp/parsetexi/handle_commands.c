/* handle_commands.c -- what to do when a command name is first read */
/* Copyright 2010, 2011, 2012, 2013, 2014, 2015, 2016
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
#include "input.h"
#include "text.h"
#include "errors.h"

static int section_level (ELEMENT *section);

/* Return a containing @itemize or @enumerate if inside it. */
// 1847
ELEMENT *
item_container_parent (ELEMENT *current)
{
  if ((current->cmd == CM_item
       || current->type == ET_before_item)
      && current->parent
      && ((current->parent->cmd == CM_itemize
           || current->parent->cmd == CM_enumerate)))
    {
      return current->parent;
    }
  return 0;
}

// 1352
/* Check that there are no text holding environments (currently
   checking only paragraphs and preformatted) in contents. */
int
check_no_text (ELEMENT *current)
{
  int after_paragraph = 0;
  int i, j;
  for (i = 0; i < current->contents.number; i++)
    {
      enum element_type t;
      ELEMENT *f;
      f = current->contents.list[i];
      t = f->type;
      if (t == ET_paragraph)
        {
          after_paragraph = 1;
          break;
        }
      else if (t == ET_preformatted
               || t == ET_rawpreformatted)
        {
          for (j = 0; j < f->contents.number; j++)
            {
              ELEMENT *g = f->contents.list[j];
              if ((g->text.end > 0
                   && g->text.text[strspn (g->text.text, whitespace_chars)])
                  || (g->cmd && g->cmd != CM_c
                      && g->cmd != CM_comment
                      && g->type != ET_index_entry_command))
                {
                  after_paragraph = 1;
                  break;
                }
            }
          if (after_paragraph)
            break;
        }
    }
  return after_paragraph;
}

// 1056
/* Record the information from a command of global effect.
   TODO: Could we scrap the first argument and use CURRENT->cmd? */
int
register_global_command (enum command_id cmd, ELEMENT *current)
{
  // TODO: Why even give @author this flag in the first place?
  if (cmd != CM_author && (command_data(cmd).flags & CF_global))
    {
      if (!current->line_nr.line_nr)
        current->line_nr = line_nr;
      switch (cmd)
        {
        case CM_footnote:
          add_to_contents_as_array (&global_info.footnotes, current);
          break;
        case CM_hyphenation:
          add_to_contents_as_array (&global_info.hyphenation, current);
          break;
        case CM_insertcopying:
          add_to_contents_as_array (&global_info.insertcopying, current);
          break;
        case CM_printindex:
          add_to_contents_as_array (&global_info.printindex, current);
          break;
        case CM_subtitle:
          add_to_contents_as_array (&global_info.subtitle, current);
          break;
        case CM_titlefont:
          add_to_contents_as_array (&global_info.titlefont, current);
          break;
        case CM_listoffloats:
          add_to_contents_as_array (&global_info.listoffloats, current);
          break;
        case CM_detailmenu:
          add_to_contents_as_array (&global_info.detailmenu, current);
          break;
        case CM_part:
          add_to_contents_as_array (&global_info.part, current);
          break;
        }
      /* TODO: Check if all of these are necessary. */
      return 1;
    }
  else if ((command_data(cmd).flags & CF_global_unique))
    {
      ELEMENT **where = 0;

      if (cmd == CM_shortcontents)
        cmd == CM_summarycontents;
      if (!current->line_nr.line_nr)
        current->line_nr = line_nr;
      switch (cmd)
        {
          extern int input_number;
        case CM_setfilename:
          /* Check if we are inside an @include, and if so, do nothing. */
          if (input_number > 1)
            break;
          where = &global_info.setfilename;
          break;

#define GLOBAL_UNIQUE_CASE(cmd) \
        case CM_##cmd: \
          where = &global_info.cmd; \
          break

        GLOBAL_UNIQUE_CASE(settitle);
        GLOBAL_UNIQUE_CASE(copying);
        GLOBAL_UNIQUE_CASE(titlepage);
        GLOBAL_UNIQUE_CASE(top);
        GLOBAL_UNIQUE_CASE(documentdescription);
        GLOBAL_UNIQUE_CASE(setcontentsaftertitlepage);
        GLOBAL_UNIQUE_CASE(setshortcontentsaftertitlepage);
        GLOBAL_UNIQUE_CASE(novalidate);
        GLOBAL_UNIQUE_CASE(validatemenus);
        GLOBAL_UNIQUE_CASE(pagesizes);
        GLOBAL_UNIQUE_CASE(fonttextsize);
        GLOBAL_UNIQUE_CASE(footnotestyle);
        GLOBAL_UNIQUE_CASE(setchapternewpage);
        GLOBAL_UNIQUE_CASE(everyheading);
        GLOBAL_UNIQUE_CASE(everyfooting);
        GLOBAL_UNIQUE_CASE(evenheading);
        GLOBAL_UNIQUE_CASE(evenfooting);
        GLOBAL_UNIQUE_CASE(oddheading);
        GLOBAL_UNIQUE_CASE(oddfooting);
        GLOBAL_UNIQUE_CASE(everyheadingmarks);
        GLOBAL_UNIQUE_CASE(everyfootingmarks);
        GLOBAL_UNIQUE_CASE(evenheadingmarks);
        GLOBAL_UNIQUE_CASE(oddheadingmarks);
        GLOBAL_UNIQUE_CASE(evenfootingmarks);
        GLOBAL_UNIQUE_CASE(oddfootingmarks);
        GLOBAL_UNIQUE_CASE(shorttitlepage);
        GLOBAL_UNIQUE_CASE(title);
#undef GLOBAL_UNIQUE_CASE
        }
      if (where)
        {
          if (*where)
            line_warn ("multiple @%s", command_name(cmd));
          *where = current;
        }
      return 1;
    }

  return 0;
}

/* Line 4289 */
/* STATUS is set to 1 if we should get a new line after this,
   2 if we should stop processing completely. */
ELEMENT *
handle_misc_command (ELEMENT *current, char **line_inout,
                     enum command_id cmd, int *status,
                     enum command_id invalid_parent)
{
  ELEMENT *misc = 0;
  char *line = *line_inout;
  int arg_spec;

  *status = 0;
  /* Root commands (like @node) and @bye 4290 */
  if (command_data(cmd).flags & CF_root || cmd == CM_bye)
    {
      ELEMENT *closed_elt; /* Not used */
      current = close_commands (current, 0, &closed_elt, cmd);
      if (current->type == ET_text_root)
        {
          if (cmd != CM_bye)
            {
              /* Something to do with document_root and text_root. */
              ELEMENT *new_root = new_element (ET_document_root);
              add_to_element_contents (new_root, current);
              current = new_root;
            }
        }
      else
        {
          current = current->parent;
          if (!current)
            abort ();
        }
    }

  /* Look up information about this command ( noarg skipline skipspace text 
     line lineraw /^\d$/). */
  arg_spec = command_data(cmd).data;

  /* noarg 4312 */
  if (arg_spec == MISC_noarg)
    {
      int ignored = 0;
      int only_in_headings = 0;
      if (cmd == CM_insertcopying)
        {
          ELEMENT *p = current;
          while (p)
            {
              if (p->cmd == CM_copying)
                {
                  line_error ("@%s not allowed inside `@copying' block",
                              command_name(cmd));
                  ignored = 1;
                  break;
                }
              p = p->parent;
            }
        }
      else if (command_data(cmd).flags & CF_in_heading)
        {
          line_error ("@%s should only appear in heading or footing",
                      command_name(cmd));
          only_in_headings = 1;
        }

      if (!ignored)
        {
          misc = new_element (ET_NONE);
          misc->cmd = cmd;
          add_to_element_contents (current, misc);
          if (only_in_headings)
            add_extra_string (misc, "invalid_nesting", "1");
          register_global_command (cmd, misc);
        }
      mark_and_warn_invalid (cmd, invalid_parent, misc);
      if (close_preformatted_command(cmd))
        current = begin_preformatted (current);
    }
  /* All the cases using the raw line.
     I don't understand what the difference is between these. */
  else if (arg_spec == MISC_skipline /* 4347 */
           || arg_spec == MISC_lineraw
           || arg_spec == MISC_special)
    {
      ELEMENT *args = 0;
      /* 4350 If the current input is the result of a macro expansion,
         it may not be a complete line.  Check for this and acquire the rest
         of the line if necessary. */
      if (!strchr (line, '\n'))
        {
          char *line2;
          input_push_text (strdup (line), 0);
          line2 = new_line ();
          if (line2)
            line = line2;
        }

      misc = new_element (ET_NONE);
      misc->cmd = cmd;

      if (arg_spec == MISC_skipline || arg_spec == MISC_lineraw)
        {
          ELEMENT *arg;
          args = new_element (ET_NONE);
          arg = new_element (ET_NONE);
          add_to_element_contents (args, arg);
          text_append (&arg->text, line);
        }
      else /* arg_spec == MISC_special */
        {
          args = parse_special_misc_command (line, cmd); //4362
          add_extra_string (misc, "arg_line", strdup (line));
        }

      if ((cmd == CM_set || cmd == CM_clear)
          && 0 )
        {
          /* TODO: Handle @set txicodequoteundirected as an
             obsolete alternative to @codequoteundirected. */
        }
      else // 4402
        {
          int i;
          add_to_element_contents (current, misc);

          for (i = 0; i < args->contents.number; i++)
            {
              ELEMENT *misc_arg = new_element (ET_misc_arg);
              text_append_n (&misc_arg->text, 
                             args->contents.list[i]->text.text,
                             args->contents.list[i]->text.end);
              add_to_element_args (misc, misc_arg);
            }
          /* TODO: Could we have just set misc->args directly as args? */

          if (args->contents.number > 0 && arg_spec != MISC_skipline)
            add_extra_misc_args (misc, "misc_args", args);
          else
            {
              for (i = 0; i < args->contents.number; i++)
                {
                  destroy_element (args->contents.list[i]);
                }
              destroy_element (args);
            }
        }

      if (0 || cmd == CM_raisesections)
        {
        }
      else if (0 || cmd == CM_raisesections)
        {
        }
      else if (cmd == CM_novalidate)
        {
        }

      mark_and_warn_invalid (cmd, invalid_parent, misc);
      register_global_command (cmd, misc); // 4423

      if (arg_spec != MISC_special /* || !has_comment */ )
        current = end_line (current);

      // 4429
      if (cmd == CM_bye)
        {
          *status = 2; /* Finish processing completely. */
          goto funexit;
        }

      if (close_preformatted_command(cmd))
        current = begin_preformatted (current);

      *status = 1; /* Get a new line */
      goto funexit;
    }
  else
    {
      /* line 4435 - text, line, skipspace or a number.
         (This includes handling of "@end", which is MISC_text.) */

      int line_arg = 0;

      if (arg_spec != MISC_skipspace)
        line_arg = 1;

      /* 4439 */
      /*************************************************************/
      /* Special handling of @item because it can appear
         in several contents: in an @itemize, a @table, or
         a @multitable. */
      if (cmd == CM_item || cmd == CM_itemx
          || cmd == CM_headitem || cmd == CM_tab)
        {
          ELEMENT *parent;

          /* @itemize or @enumerate */ // 4443
          if ((parent = item_container_parent (current)))
            {
              if (cmd == CM_item)
                {
                  char *s;
                  debug ("ITEM CONTAINER");
                  counter_inc (&count_items);
                  misc = new_element (ET_NONE);
                  misc->cmd = CM_item;

                  asprintf (&s, "%d", counter_value (&count_items, parent));
                  add_extra_string (misc, "item_number", s);

                  add_to_element_contents (parent, misc);
                  current = misc;
                }
              else
                {
                  line_error ("@%s not meaningful inside `@%s' block",
                              command_name(cmd),
                              command_name(parent->cmd));
                }
              current = begin_preformatted (current);
            }
          /* @table, @vtable, @ftable */
          else if ((parent = item_line_parent (current)))
            {
              if (cmd == CM_item || cmd == CM_itemx)
                {
                  debug ("ITEM_LINE");
                  current = parent;
                  gather_previous_item (current, cmd);
                  misc = new_element (ET_NONE);
                  misc->cmd = cmd;
                  add_to_element_contents (current, misc);
                  line_arg = 1;
                }
              else
                {
                  line_error ("@%s not meaningful inside `@%s' block",
                              command_name(cmd),
                              command_name(parent->cmd));
                  current = begin_preformatted (current);
                }
            }
          /* In a @multitable */
          else if ((parent = item_multitable_parent (current))) // 4477
            {
              if (cmd != CM_item && cmd != CM_headitem
                  && cmd != CM_tab)
                {
                  line_error ("@%s not meaningful inside @%s block",
                              command_name(cmd),
                              command_name(parent->cmd)); // 4521
                }
              else
                { /* 4480 */
                  int max_columns = 0;
                  KEY_PAIR *prototypes;

                  prototypes = lookup_extra_key  (parent, "prototypes");
                  if (prototypes)
                    max_columns = prototypes->value->contents.number;
                  else
                    {
                      prototypes = lookup_extra_key(parent, "columnfractions");
                      if (prototypes)
                        max_columns = prototypes->value->contents.number;
                    }

                  if (max_columns == 0)
                    {
                      line_warn ("@%s in empty multitable",
                                 command_name(cmd));
                    }
                  else if (cmd == CM_tab)
                    { // 4484
                      ELEMENT *row;
                      row = last_contents_child (parent);
                      if (row->type == ET_before_item)
                        line_error ("@tab before @item");
                      // 4489
                      else if (counter_value (&count_cells, row)
                               >= max_columns)
                        {
                          line_error ("too many columns in multitable item"
                                      " (max %d)", max_columns);
                        }
                      else // 4493
                        {
                          char *s;
                          counter_inc (&count_cells);
                          misc = new_element (ET_NONE);
                          misc->cmd = cmd;
                          add_to_element_contents (row, misc);
                          current = misc;
                          debug ("TAB");

                          asprintf (&s, "%d",
                                    counter_value (&count_cells, row));
                          add_extra_string (current, "cell_number", s);
                        }
                    }
                  else /* 4505 @item or @headitem */
                    {
                      ELEMENT *row; char *s;

                      debug ("ROW");
                      row = new_element (ET_row);
                      add_to_element_contents (parent, row);

                      /* FIXME:The "row_number" extra value,
                         isn't actually used anywhere. */
                      asprintf (&s, "%d", parent->contents.number-1);
                      add_extra_string (row, "row_number", s);

                      misc = new_element (ET_NONE);
                      misc->cmd = cmd;
                      add_to_element_contents (row, misc);
                      current = misc;

                      if (counter_value (&count_cells, parent) != -1)
                        counter_pop (&count_cells);
                      counter_push (&count_cells, row, 1);
                      asprintf (&s, "%d",
                                counter_value (&count_cells, row));
                      add_extra_string (current, "cell_number", s);
                    }
                }
              current = begin_preformatted (current);
            } /* In @multitable */
          else if (cmd == CM_tab) // 4526
            {
              line_error ("ignoring @tab outside of multitable");
              current = begin_preformatted (current);
            }
          else
            {
              line_error ("@%s outside of table or list",
                          command_name(cmd));
              current = begin_preformatted (current);
            }
          if (misc)
            misc->line_nr = line_nr; // 4535
        }
      /*************************************************************/
      else /* Not @item, @itemx, @headitem, nor @tab 4536 */
        {
          /* Add to contents */
          misc = new_element (ET_NONE);
          misc->cmd = cmd;
          misc->line_nr = line_nr;
          add_to_element_contents (current, misc);

          if (command_data(cmd).flags & CF_sectioning)
            {
              /* Store section level in 'extra' key. */
              /* TODO: @part? */
              /*add_extra_string (last_contents_child (current), 
                "sections_level", "1"); */
              add_extra_string (misc, "level",
                          &("0\0" "0\0" "1\0" "2\0" "3\0" "4\0"
                                  "5\0" "6\0" "7\0" "8\0" "9\0" + 2)
                                  [section_level (misc) * 2]);
            }

          /* 4546 - def*x */
          if (command_data(cmd).flags & CF_def)
            {
              enum command_id base_command;
              char *base_name;
              int base_len;
              int after_paragraph;

              /* Find the command with "x" stripped from the end, e.g.
                 deffnx -> deffn. */
              base_name = command_name(cmd);
              add_extra_string (misc, "original_def_cmdname", base_name);

              base_name = strdup (base_name);
              base_len = strlen (base_name);
              if (base_name[base_len - 1] != 'x')
                abort ();
              base_name[base_len - 1] = '\0';
              base_command = lookup_command (base_name);
              if (base_command == CM_NONE)
                abort ();
              add_extra_string (misc, "def_command", base_name);

              after_paragraph = check_no_text (current);
              push_context (ct_def);
              misc->type = ET_def_line; // 4553
              if (current->cmd == base_command)
                {
                  ELEMENT *e = pop_element_from_contents (current);
                  /* e should be the same as misc */
                  /* Gather an "inter_def_item" element. */
                  gather_def_item (current, cmd);
                  add_to_element_contents (current, e);
                }
              if (current->cmd != base_command || after_paragraph)
                {
                  // error - deffnx not after deffn
                  line_error ("must be after `@%s' to use `@%s'",
                               command_name(base_command),
                               command_name(cmd));
                  add_extra_string (misc, "not_after_command", "1");
                }
            }
        } /* 4571 */

      // Rest of the line is the argument - true unless is MISC_skipspace. */
      if (line_arg)
        {
          ELEMENT *arg;
          /* 4576 - change 'current' to its last child.  This is ELEMENT *misc 
             above.  */
          current = last_contents_child (current);
          arg = new_element (ET_misc_line_arg);
          add_to_element_args (current, arg);

          if (cmd == CM_node) // 4584
            {
              /* At most three comma-separated arguments to @node.  This
                 is the only (non-block) line command taking comma-separated
                 arguments.  Its arguments will be gathered the same as
                 those of some block line commands and brace commands. */
              counter_push (&count_remaining_args, current, 3);
            }
          else if (cmd == CM_author)
            {
              ELEMENT *parent = current;
              int found = 0;
              while (parent->parent)
                {
                  parent = parent->parent;
                  if (parent->type == ET_brace_command_context)
                    break;
                  if (parent->cmd == CM_titlepage)
                    {
                      // TODO 4595 global author
                      add_extra_element (current, "titlepage", parent);
                      found = 1; break;
                    }
                  else if (parent->cmd == CM_quotation
                           || parent->cmd == CM_smallquotation)
                    {
                      KEY_PAIR *k; ELEMENT *e;
                      k = lookup_extra_key (parent, "authors");
                      if (k)
                        e = k->value;
                      else
                        {
                          e = new_element (ET_NONE);
                          add_extra_contents (parent, "authors", e);
                        }
                      add_to_contents_as_array (e, current);
                      add_extra_element (current, "quotation", parent);
                      found = 1; break;
                    }
                }
              if (!found)
                line_warn ("@author not meaningful outside "
                           "`@titlepage' and `@quotation' environments");
            }
          else if (cmd == CM_dircategory && current_node)
            line_warn ("@dircategory after first node");

          current = last_args_child (current); /* arg */

          /* add 'line' to context_stack (Parser.pm:141).  This will be the
             case while we read the argument on this line. */
          if (!(command_data(cmd).flags & CF_def))
            push_context (ct_line);
        }
      start_empty_line_after_command (current, &line, misc); //4621

      if (cmd == CM_indent || cmd == CM_noindent)
        {
          /* Start a new paragraph if not in one already. */
          int spaces;
          enum element_type t;
          ELEMENT *paragraph;

          /* Check if if we should change an ET_empty_line_after_command
             element to ET_empty_spaces_after_command by looking ahead
             to see what comes next. */
          if (!strchr (line, '\n'))
            {
              char *line2;
              input_push_text (strdup (line), 0);
              line2 = new_line ();
              if (line2)
                line = line2;
            }
          spaces = strspn (line, whitespace_chars);
          if (spaces > 0)
            {
              char saved = line[spaces];
              current = merge_text (current, line);
              line[spaces] = saved;
              line += spaces;
            }
          if (*line
              && last_contents_child(current)->type
                == ET_empty_line_after_command)
            {
              last_contents_child(current)->type
                                              = ET_empty_spaces_after_command;
            }
          paragraph = begin_paragraph (current);
          if (paragraph)
            current = paragraph;
          if (!*line)
            {
              *status = 1; /* Get a new line. */
              goto funexit;
            }
        }
    }

  // 4622
  mark_and_warn_invalid (cmd, invalid_parent, misc);

  if (misc)
    register_global_command (cmd, misc);

funexit:
  *line_inout = line;
  return current;
}

/* Return numbered level of an element */
static int
section_level (ELEMENT *section)
{
  int level;
int min_level = 0, max_level = 5;

  switch (section->cmd)
    {
    case CM_top: level = 0; break;
    case CM_chapter: level = 1; break;
    case CM_unnumbered: level = 1; break;
    case CM_chapheading: level = 1; break;
    case CM_appendix: level = 1; break;
    case CM_section: level = 2; break;
    case CM_unnumberedsec: level = 2; break;
    case CM_heading: level = 2; break;
    case CM_appendixsec: level = 2; break;
    case CM_subsection: level = 3; break;
    case CM_unnumberedsubsec: level = 3; break;
    case CM_subheading: level = 3; break;
    case CM_appendixsubsec: level = 3; break;
    case CM_subsubsection: level = 4; break;
    case CM_unnumberedsubsubsec: level = 4; break;
    case CM_subsubheading: level = 4; break;
    case CM_appendixsubsubsec: level = 4; break;
    case CM_part: level = 0; break;
    case CM_appendixsection: level = 2; break;
    case CM_majorheading: level = 1; break;
    case CM_centerchap: level = 1; break;
    default: level = -1; break;
    }
  return level;
  /* then adjust according to raise-/lowersections. */
}

          /* TODO: Allow user to change which formats are true. */
struct expanded_format {
    char *format;
    int expandedp;
};
static struct expanded_format expanded_formats[] = {
    "html", 0,
    "docbook", 0,
    "plaintext", 1,
    "tex", 0,
    "xml", 0,
    "info", 1,
};

void
clear_expanded_formats (void)
{
  int i;
  for (i = 0; i < sizeof (expanded_formats)/sizeof (*expanded_formats);
       i++)
    {
      expanded_formats[i].expandedp = 0;
    }
}

void
add_expanded_format (char *format)
{
  int i;
  for (i = 0; i < sizeof (expanded_formats)/sizeof (*expanded_formats);
       i++)
    {
      if (!strcmp (format, expanded_formats[i].format))
        {
          expanded_formats[i].expandedp = 1;
          break;
        }
    }
  if (!strcmp (format, "plaintext"))
    add_expanded_format ("info");
}

int
format_expanded_p (char *format)
{
  int i;
  for (i = 0; i < sizeof (expanded_formats)/sizeof (*expanded_formats);
       i++)
    {
      if (!strcmp (format, expanded_formats[i].format))
        return expanded_formats[i].expandedp;
    }
  return 0;
}

/* line 4632 */
/* A command name has been read that starts a multiline block, which should
   end in @end <command name>.  The block will be processed until 
   "end_line_misc_line" in end_line.c processes the @end command. */
ELEMENT *
handle_block_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd, int *get_new_line,
                      enum command_id invalid_parent)
{
  char *line = *line_inout;
  unsigned long flags = command_data(cmd).flags;

  /* New macro being defined. */
  if (cmd == CM_macro || cmd == CM_rmacro)
    {
      ELEMENT *macro;
      macro = parse_macro_command_line (cmd, &line, current);
      add_to_element_contents (current, macro);
      mark_and_warn_invalid (cmd, invalid_parent,
                             last_contents_child(current));
      current = macro;

      /* 4640 */
      /* A new line should be read immediately after this.  */
      line = strchr (line, '\0');
      *get_new_line = 1;
      goto funexit;
    }
  else if (command_data(cmd).data == BLOCK_conditional) //4641
    {
      int iftrue = 0; /* Whether the conditional is true. */
      if (cmd == CM_ifclear || cmd == CM_ifset
          || cmd == CM_ifcommanddefined || cmd == CM_ifcommandnotdefined)
        {
          char *flag;
          char *p = line;
          p = line + strspn (line, whitespace_chars);
          if (!*p)
            line_error ("@%s requires a name", command_name(cmd));
          else
            {
              flag = read_command_name (&p);
              if (!flag)
                goto bad_value;
              else
                {
                  p += strspn (p, whitespace_chars);
                  /* Check for a comment at the end of the line. */
                  if (memcmp (p, "@c", 2) == 0)
                    {
                      p += 2;
                      if (memcmp (p, "omment", 6) == 0)
                        p += 7;
                      if (*p && *p != '@' && !strchr (whitespace_chars, *p))
                        goto bad_value; /* @c or @comment not terminated. */
                    }
                  else if (*p)
                    goto bad_value; /* Trailing characters on line. */
                }
              if (1)
                {
                  // 4652
                  if (cmd == CM_ifclear || cmd == CM_ifset)
                    {
                      char *val = fetch_value (flag, strlen (flag));
                      if (val)
                        iftrue = 1;
                      if (cmd == CM_ifclear)
                        iftrue = !iftrue;
                    }
                  else /* cmd == CM_ifcommanddefined
                          || cmd == CM_ifcommandnotdefined */
                    {
                      enum command_id c = lookup_command (flag);
                      if (c)
                        iftrue = 1;
                      if (cmd == CM_ifcommandnotdefined)
                        iftrue = !iftrue;
                    }
                }
              else if (0)
                {
              bad_value:
                  line_error ("bad name for @%s", command_name(cmd));
                }

            }
        }
      else if (!memcmp (command_name(cmd), "if", 2)) //4687
        {
          int i; char *p;
          /* Handle @if* and @ifnot* */
          /* FIXME: Check @if and @ifnot* a nicer way, without memcmp. */

          p = command_name(cmd) + 2; /* After "if". */
          if (!memcmp (p, "not", 3))
            p += 3; /* After "not". */
          for (i = 0; i < sizeof (expanded_formats)/sizeof (*expanded_formats);
               i++)
            {
              if (!strcmp (p, expanded_formats[i].format))
                {
                  iftrue = expanded_formats[i].expandedp;
                  break;
                }
            }
          if (!memcmp (command_name(cmd), "ifnot", 5))
            iftrue = !iftrue;
        }
      else
        abort (); // BUG


      // 4699 - If conditional true, push onto conditional stack.  Otherwise
      // open a new element (which we shall later remove, in
      // process_remaining_on_line ("CLOSED conditional").

      debug ("CONDITIONAL %s %d", command_name(cmd), iftrue);
      if (iftrue)
        push_conditional_stack (cmd);
      else
        {
          // Ignored.
          ELEMENT *e;
          e = new_element (ET_NONE);
          e->cmd = cmd;
          add_to_element_contents (current, e);
          current = e;
        }
      // 4709 ("last;")
      line = strchr (line, '\0');
      *get_new_line = 1;
      goto funexit;
    }
  else /* line 4710 */
    {
      ELEMENT *block = 0;
      // 4715
      if (flags & CF_menu
          && (current->type == ET_menu_comment
              || current->type == ET_menu_entry_description))
        {
#if 0
          /* This is for @detailmenu within @menu */
          ELEMENT *menu = current->parent;
          //abort ();
          if (current->contents.number == 0)
            {
              destroy_element (pop_element_from_contents (menu));
              if (pop_context () != ct_preformatted)
                abort ();
            }
          if (menu->type == ET_menu_entry)
            menu = menu->parent;
          current = last_contents_child (menu);
#endif
        }

      // 4740
      if (flags & CF_def)
        {
          ELEMENT *def_line;
          push_context (ct_def);
          block = new_element (ET_NONE);
          block->cmd = cmd;
          block->line_nr = line_nr;
          add_to_element_contents (current, block);
          current = block;
          def_line = new_element (ET_def_line);
          def_line->line_nr = line_nr;
          add_to_element_contents (current, def_line);
          current = def_line;
          add_extra_string (current, "def_command", command_name(cmd));
          add_extra_string (current, "original_def_cmdname", 
                            command_name(cmd));
        }
      else
        {
          /*  line 4756 */
          block = new_element (ET_NONE);

          block->cmd = cmd;
          add_to_element_contents (current, block);
          current = block;
        }

      /* 4763 Check if 'block args command' */
      if (command_data(cmd).data != BLOCK_raw)
        {
          if (command_data(cmd).flags & CF_preformatted)
            push_context (ct_preformatted);
          else if (command_data(cmd).flags & CF_format_raw)
            {
              push_context (ct_rawpreformatted);
              if (!format_expanded_p (command_name(cmd)))
                {
                  ELEMENT *e;
                  enum command_id dummy;
                  char *line_dummy;

                  e = new_element (ET_elided_block);
                  add_to_element_contents (current, e);
                  line_dummy = line;
                  while (!is_end_current_command (current,
                                                  &line_dummy, &dummy))
                    {
                      line = new_line ();
                      if (!line)
                        abort (); // TODO
                      line_dummy = line;
                    }
                  e = new_element (ET_empty_line_after_command);
                  text_append_n (&e->text, "\n", 1);
                  add_to_element_contents (current, e);

                  e = new_element (ET_empty_line);
                  add_to_element_contents (current, e);
                  goto funexit;
                }
            }

          // 4775
          if (command_data(cmd).flags & CF_region)
            {
              if (current_region_cmd ())
                {
                  line_error ("region %s inside region %s is not allowed",
                              command_name(cmd),
                              command_name(current_region_cmd ()));
                }
              push_region (block);
            }

          // 4784 menu commands
          if (command_data(cmd).flags & CF_menu)
            {
              if (current_context () == ct_preformatted)
                push_context (ct_preformatted);
              else
                push_context (ct_menu);

              /* Check if we are ignoring "global commands". */

              // Record dir entry here

              if (current_node) // 4793
                {
                  if (cmd == CM_direntry)
                    {
                      line_warn ("@direntry after first node");
                    }
                  else if (cmd == CM_menu)
                    {
                      // add to array of menus for current node
                    }
                }
              else if (cmd != CM_direntry)
                {
                  line_error ("@%s seen before first @node",
                              command_name(cmd));
                  line_error ("perhaps your @top node should be "
                              "wrapped in @ifnottex rather than @ifinfo?");
                  // 4810 unassociated menus
                }
            }

          if (cmd == CM_itemize || cmd == CM_enumerate)
            counter_push (&count_items, current, 0);
          /* Note that no equivalent thing is done in the Perl code, because
             'item_count' is assumed to start at 0. */

          // 4816
          {
            ELEMENT *bla = new_element (ET_block_line_arg);
            add_to_element_args (current, bla);

            if (command_data (current->cmd).data > 1)
              {
                counter_push (&count_remaining_args,
                              current,
                              command_data (current->cmd).data - 1);
              }

            current = bla;
            if (!(command_data(cmd).flags & CF_def))
              push_context (ct_line);

            /* Note that an ET_empty_line_after_command gets reparented in the 
               contents in 'end_line'. */

          }
        } /* 4827 */
      block->line_nr = line_nr;
      mark_and_warn_invalid (cmd, invalid_parent, block);
      register_global_command (cmd, block);
      start_empty_line_after_command (current, &line, block);
    }

funexit:
  *line_inout = line;
  return current;
}

/* 4835 */
ELEMENT *
handle_brace_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd,
                      enum command_id invalid_parent)
{
  char *line = *line_inout;
  ELEMENT *e;

  e = new_element (ET_NONE);
  e->cmd = cmd;

  // 4841
  // 258 keep_line_nr_brace_commands
  // also 4989 sets line_nr.
  /* The line number information is only ever used for brace commands
     if the command is given with braces, but it's easier just to always
     store the information. */
  e->line_nr = line_nr;

  add_to_element_contents (current, e);
  current = e;

  mark_and_warn_invalid (cmd, invalid_parent, e);
  if (cmd == CM_click)
    {
      add_extra_string (e, "clickstyle", global_clickstyle);
    }
  else if (cmd == CM_kbd)
    {
      if (current_context () == ct_preformatted
          && global_kbdinputstyle != kbd_distinct
          || global_kbdinputstyle == kbd_code)
        {
          add_extra_string (e, "code", "1");
        }
      else if (global_kbdinputstyle == kbd_example)
        {
          // _in_code line 1277
          // TODO: Understand what is going on here.

          ELEMENT *tmp = current->parent;
          while (tmp->parent
                 && (command_flags(tmp->parent) & CF_brace)
                 && command_data(tmp->parent->cmd).data != BRACE_context)
            {
              if (command_flags(tmp->parent) & CF_code_style)
                goto yes_kbd_code;
              tmp = tmp->parent->parent;
            }
          if (0)
            {
yes_kbd_code:
              add_extra_string (e, "code", "1");
            }
        }
    }
  else if (command_data(cmd).flags & CF_INFOENCLOSE)
    {
      INFO_ENCLOSE *ie = lookup_infoenclose (cmd);
      if (ie)
        {
          add_extra_string (e, "begin", ie->begin);
          add_extra_string (e, "end", ie->end);
        }
      e->type = ET_definfoenclose_command;
    }

  *line_inout = line;
  return current;
}
