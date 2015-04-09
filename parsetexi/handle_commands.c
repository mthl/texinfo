/* handle_commands.c -- what to do when a command name is first read */
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
#include "input.h"
#include "text.h"
#include "errors.h"

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

/* Line 4289 */
ELEMENT *
handle_misc_command (ELEMENT *current, char **line_inout,
                     enum command_id cmd)
{
  ELEMENT *misc = 0;
  char *line = *line_inout;
  int arg_spec;

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

  /* noarg */
  if (arg_spec == MISC_noarg)
    {
      /*
      if (close_preformatted_command(cmd))
        current = begin_preformatted (current);
      */
    }
  /* All the cases using the raw line.
     I don't understand what the difference is between these. */
  else if (arg_spec == MISC_skipline /* 4347 */
           || arg_spec == MISC_lineraw
           || arg_spec == MISC_special)
    {
      ELEMENT *args = 0;
      /* 4350 TODO: If the current input is the result of a macro expansion,
         it may not be a complete line.  Check for this and acquire the rest
         of the line if necessary. */

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
              add_to_element_contents (misc, misc_arg);
            }
          /* TODO: Could we have just set misc->args directly as args? */

          if (args->contents.number > 0 && arg_spec != MISC_skipline)
            add_extra_key_misc_args (misc, "misc_args", args);
          else
            {
              for (i = 0; i < args->contents.number; i++)
                {
                  destroy_element (args->contents.list[i]);
                }
              destroy_element (args);
            }
        }

      /* if (!ignore_global_commands)
        {
        } */

      // mark_and_warn_invalid ();
      // register_global_command ();

      if (arg_spec != MISC_special /* || !has_comment */ )
        current = end_line (current);

      // 4429 TODO @bye

      if (close_preformatted_command(cmd))
        current = begin_preformatted (current);

      line += strlen (line); /* FIXME: Where does the control flow go? */
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
          ELEMENT *misc, *parent;

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
                  current = begin_preformatted (current);
                }
              else
                {
                  line_errorf ("@%s not meaningful within `@%s' block");
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
                  line_errorf ("@%s not meaningful within `@%s' block");
                  current = begin_preformatted (current);
                }
            }
          /* In a @multitable */
          else if ((parent = item_multitable_parent (current))) // 4477
            {
              if (cmd != CM_item && cmd != CM_headitem
                  && cmd != CM_tab)
                {
                  line_errorf ("@%s not meaningful inside @%s block",
                              command_name(cmd),
                              command_name(parent->cmd)); // 4521
                }
              else
                { /* 4480 */
                  /* TODO - need the max_columns value for this
                  if (counter_value (max_columns, parent) == 0)
                    {
                      line_warnf ("@%s in empty multitable",
                                  command_name(cmd));
                    }
                  else */ if (cmd == CM_tab)
                    { // 4484
                      ELEMENT *row;

                      row = last_contents_child (parent);
                      if (row->type == ET_before_item)
                        line_error ("@tab before @item");
                      /* TODO 4489
                      else if (counter_value (&count_cells, parent)
                               >= counter_value (&max_columns, parent))
                        {
                          line_error ("too many columns in multitable item"
                                      " (max %d)",
                                      counter_value (&max_columns, parent));
                        }
                      */
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
                                    counter_value (&count_cells, parent));
                          add_extra_string (current, "cell_number", s);
                        }
                    }
                  else /* 4505 @item or @headitem */
                    {
                      ELEMENT *row; char *s;

                      debug ("ROW");
                      row = new_element (ET_row);
                      add_to_element_contents (parent, row);
                      /* The Perl code sets the "row_number" extra value,
                         although it doesn't look it is used anywhere. */

                      misc = new_element (ET_NONE);
                      misc->cmd = cmd;
                      add_to_element_contents (row, misc);
                      current = misc;

                      if (counter_value (&count_cells, parent) != -1)
                        counter_pop (&count_cells);
                      counter_push (&count_cells, row, 1);
                      asprintf (&s, "%d",
                                counter_value (&count_cells, parent));
                      add_extra_string (current, "cell_number", s);
                    }
                }
            } /* In @multitable */
          else if (cmd == CM_tab) // 4526
            {
              line_error ("ignoring @tab outside of multitable");
              current = begin_preformatted (current);
            }
          else
            {
              line_errorf ("@%s outside of table or list",
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

          /* If root command, and not node or part: */
            {
              /* Store section level in 'extra' key. */
            }

          /* 4546 - def*x */
          if (command_data(cmd).flags & CF_def)
            {
              enum command_id base_command;
              char *base_name;
              int base_len;

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

              //check_no_text ();
              push_context (ct_def);
              misc->type = ET_def_line; // 4553
              if (current->cmd == base_command)
                {
                  // Does this gather an "inter_def_item" ?
                  // gather_def_item (current, cmd);
                }
              else
                {
                  // error - deffnx not after deffn
                  line_errorf ("must be after @%s to use @%s",
                               command_name(base_command),
                               command_name(cmd));
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

          /* 4584 - node */
          if (cmd == CM_node)
            {
              /* At most three comma-separated arguments to @node.  This
                 is the only (non-block) line command taking comma-separated
                 arguments.  Its arguments will be gathered the same as
                 those of some block line commands and brace commands. */
              counter_push (&count_remaining_args, current, 3);
            }
          /* 4586 - author */
          /* 4612 - dircategory */
          if (cmd == CM_dircategory && current_node)
            {
              /* warning - @dircategory after first node. */
              abort ();
            }

          /* 4617 - current to the first argument (ELEMENT *arg).  */
          current = last_args_child (current); /* arg */

          /* add 'line' to context_stack (Parser.pm:141).  This will be the
             case while we read the argument on this line. */
          if (!(command_data(cmd).flags & CF_def))
            push_context (ct_line);
        }
      start_empty_line_after_command (current, &line); //4621
    }

  /* line 4622 */
  /* mark_and_warn_invalid (); */ /* possible error message due to invalid
                                     nesting */
  //register_global_command ();

  *line_inout = line;
  return current;
}

/* line 4632 */
/* A command name has been read that starts a multiline block, which should
   end in @end <command name>.  The block will be processed until 
   "end_line_misc_line" in end_line.c processes the @end command. */
ELEMENT *
handle_block_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd, int *get_new_line)
{
  char *line = *line_inout;
  unsigned long flags = command_data(cmd).flags;

  /* New macro being defined. */
  if (cmd == CM_macro || cmd == CM_rmacro)
    {
      ELEMENT *macro;
      macro = parse_macro_command_line (cmd, &line, current);
      add_to_element_contents (current, macro);
      // mark_and_warn_invalid ();
      current = macro;

      /* 4640 FIXME */
      /* A new line should be read immediately after this.  */
      /* Alternative is to use longjmp to go where "last;" does in the Perl 
         version. */
      line = strchr (line, '\0');
      *get_new_line = 1;
      goto funexit;
    }
  else if (command_data(cmd).data == BLOCK_conditional)
    {
      // 4699 - If conditional true, push onto conditional stack.  Otherwise
      // open a new element (which we shall later remove).

      debug ("CONDITIONAL %s", command_name(cmd));
      if (cmd != CM_ifnotinfo) // TODO
        push_conditional_stack (cmd); // Not ignored
      else
        {
          // Ignored.
          ELEMENT *e;
          e = new_element (ET_NONE);
          e->cmd = cmd;
          add_to_element_contents (current, e);
          current = e;
        }
    }
  else /* line 4710 */
    {
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
          ELEMENT *block, *def_line;
          push_context (ct_def);
          block = new_element (ET_NONE);
          block->cmd = cmd;
          add_to_element_contents (current, block);
          current = block;
          def_line = new_element (ET_def_line);
          add_to_element_contents (current, def_line);
          current = def_line;
          add_extra_string (current, "def_command", command_name(cmd));
          add_extra_string (current, "original_def_cmdname", 
                            command_name(cmd));
        }
      else
        {
          /*  line 4756 */
          ELEMENT *block = new_element (ET_NONE);

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
            }

          // regionsstack

          // 4784 menu commands
          if (command_data(cmd).flags & CF_menu)
            {
              if (current_context () == ct_preformatted)
                push_context (ct_preformatted);
              else
                push_context (ct_menu);

              /* Check if we are ignoring "global commands". */

              // Record dir entry here

              if (current_node)
                {
                  if (cmd == CM_direntry)
                    {
                      // warning
                    }
                  else if (cmd == CM_menu)
                    {
                      // add to array of menus for current node
                    }
                }
              else
                {
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
            current = bla;
            if (!(command_data(cmd).flags & CF_def))
              push_context (ct_line);

            /* Note that an ET_empty_line_after_command gets reparented in the 
               contents in 'end_line'. */

          }
        } /* 4827 */
      // mark_and_warn_invalid ();
      // register_global_command ();
      start_empty_line_after_command (current, &line);
    }

funexit:
  *line_inout = line;
  return current;
}

/* 4835 */
ELEMENT *
handle_brace_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd)
{
  char *line = *line_inout;
  ELEMENT *e;

  e = new_element (ET_NONE);
  e->cmd = cmd;
  add_to_element_contents (current, e);
  current = e;

  // mark_and_warn_invalid
  // click, kbd, definfoenclose

  *line_inout = line;
  return current;
}
