#include <stdlib.h>
#include <string.h>

#include "parser.h"
#include "input.h"

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
                     enum command_id cmd_id)
{
  ELEMENT *misc = 0;
  char *line = *line_inout;
  int arg_spec;

  /* Root commands (like @node) and @bye 4290 */
  if (command_data(cmd_id).flags & CF_root || cmd_id == CM_bye)
    {
      ELEMENT *closed_elt; /* Not used */
      current = close_commands (current, 0, &closed_elt, cmd_id);
      if (current->type == ET_text_root)
        {
          if (cmd_id != CM_bye)
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
  arg_spec = command_data(cmd_id).data;

  /* noarg */
  if (arg_spec == MISC_noarg)
    {
      /*
      if (close_preformatted_command(cmd_id))
        current = begin_preformatted (current);
      */
    }
  // all the cases using the raw line
  else if (arg_spec == MISC_skipline /* 4347 */
           || arg_spec == MISC_lineraw
           || arg_spec == MISC_special)
    {
      misc = new_element (ET_NONE);
      misc->cmd = cmd_id;

      /* If @set or @clear */
      /* else */ /* 4402 */
        {
          add_to_element_contents (current, misc);
        }
      current = end_line (current);

      // 4429 @bye
      if (close_preformatted_command(cmd_id))
        current = begin_preformatted (current);

      line += strlen (line); /* FIXME: Where does the control flow go? */
    }
  else /* line 4435 - text, line, skipspace or a number */
    {
      int line_arg = 0;

      if (arg_spec != MISC_skipspace)
        line_arg = 1;
      /* @END IS SOMEWHERE IN HERE ('text') */

      /* 4439 */
      if (cmd_id == CM_item || cmd_id == CM_itemx
          || cmd_id == CM_headitem || cmd_id == CM_tab)
        {
          ELEMENT *parent;

          // itemize or enumerate 4443
          if ((parent = item_container_parent (current)))
            {
              if (cmd_id == CM_item)
                {
                  ELEMENT *misc;
                  debug ("ITEM CONTAINER");
                  misc = new_element (ET_NONE);
                  misc->cmd = CM_item;
                  add_to_element_contents (parent, misc);
                  current = misc;
                  current = begin_preformatted (current);
                }
              else
                {
                  // error
                  abort ();
                }
              //begin_preformatted ();
            }
          // *table
          else if ((parent = item_line_parent (current)))
            {
              if (cmd_id == CM_item || cmd_id == CM_itemx)
                {
                  ELEMENT *misc;

                  debug ("ITEM_LINE");
                  current = parent;
                  // gather_previous_item ();
                  misc = new_element (ET_NONE);
                  misc->cmd = cmd_id;
                  add_to_element_contents (current, misc);
                  line_arg = 1;
                }
            }
          // multitable
          else if ((parent = item_multitable_parent (current))) // 4477
            {
              if (cmd_id != CM_item && cmd_id != CM_headitem
                  && cmd_id != CM_tab)
                {
                  /* 4521 error - not meaningful */
                  abort ();
                }
              else
                { /* 4480 */
                  // check for empty multitable
                  /* if
                    {
                    }
                  else */ if (cmd_id == CM_tab)
                    { // 4484
                      ELEMENT *row;

                      row = last_contents_child (parent);
                      if (row->type == ET_before_item)
                        abort ();/* error */
                      /* else if too many columns */
                      else // 4493
                        {
                          ELEMENT *misc;
                          misc = new_element (ET_NONE);
                          misc->cmd = cmd_id;
                          add_to_element_contents (row, misc);
                          current = misc;
                          debug ("TAB");
                        }
                    }
                  else /* 4505 @item or @headitem */
                    {
                      ELEMENT *row, *misc;

                      debug ("ROW");
                      row = new_element (ET_row);
                      add_to_element_contents (parent, row);
                      misc = new_element (ET_NONE);
                      misc->cmd = cmd_id;
                      add_to_element_contents (row, misc);
                      current = misc;
                    }
                }
            } /* item_multitable_parent */
          else if (cmd_id == CM_tab) // 4526
            {
              // error - tab outside of multitable
              current = begin_preformatted (current);
            }
          else
            {
              /* error */
              // this is reached too much at the moment
              //abort ();
              current = begin_preformatted (current);
            }
        }
      else /* not item, itemx, headitem, nor tab 4536 */
        {
          /* Add to contents */
          misc = new_element (ET_NONE);
          misc->cmd = cmd_id;
          misc->line_nr = line_nr;
          add_to_element_contents (current, misc);

          /* If root command, and not node or part: */
            {
              /* Store section level in 'extra' key. */
            }

          /* 4546 - def*x */
          if (command_data(cmd_id).flags & CF_def)
            {
              enum command_id base_command;
              char *base_name;
              int base_len;

              /* Find the command with "x" stripped from the end, e.g.
                 deffnx -> deffn. */
              base_name = strdup (command_data(cmd_id).cmdname);
              base_len = strlen (base_name);
              if (base_name[base_len - 1] != 'x')
                abort ();
              base_name[base_len - 1] = '\0';
              base_command = lookup_command (base_name);
              if (base_command == CM_NONE)
                abort ();
              free (base_name);

              //check_no_text ();
              push_context (ct_def);
              misc->type = ET_def_line;
              if (current->cmd == base_command)
                {
                  // Does this gather an "inter_def_item" ?
                  // gather_def_item (current, cmd_id);
                }
              else
                {
                  // error - deffnx not after deffn
                  abort ();
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
          /* 4586 - author */
          /* 4612 - dircategory */
          if (cmd_id == CM_dircategory && current_node)
            {
              /* warning - @dircategory after first node. */
              abort ();
            }

          /* 4617 - current to the first argument (ELEMENT *arg).  */
          current = last_args_child (current); /* arg */

          /* add 'line' to context_stack (Parser.pm:141).  This will be the
             case while we read the argument on this line. */
          if (!(command_data(cmd_id).flags & CF_def))
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
ELEMENT *
handle_block_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd_id)
{
  char *line = *line_inout;
  unsigned long flags = command_data(cmd_id).flags;

  /* New macro being defined. */
  if (cmd_id == CM_macro || cmd_id == CM_rmacro)
    {
      ELEMENT *macro;
      macro = parse_macro_command_line (cmd_id, &line, current);
      add_to_element_contents (current, macro);
      // mark_and_warn_invalid ();
      current = macro;

      /* 4640 FIXME */
      /* The line should be advanced to the end, so a new line should be read 
         immediately after this. */
      /* Alternative is to use longjmp to go where "last;" does in the Perl 
         version. */
      goto funexit;
    }
  else if (command_data(cmd_id).data == BLOCK_conditional)
    {
      // 4699 - If conditional true, push onto conditional stack.  Otherwise
      // open a new element (which we shall later remove).

      debug ("CONDITIONAL %s", command_data(cmd_id).cmdname);
      if (cmd_id != CM_ifnotinfo) // TODO
        push_conditional_stack (cmd_id); // Not ignored
      else
        {
          // Ignored.
          ELEMENT *e;
          e = new_element (ET_NONE);
          e->cmd = cmd_id;
          add_to_element_contents (current, e);
          current = e;
        }
    }
  else /* line 4710 */
    {
      if (flags & CF_menu)
        {
        }

      // 4740
      if (flags & CF_def)
        {
          ELEMENT *block, *def_line;
          push_context (ct_def);
          block = new_element (ET_NONE);
          block->cmd = cmd_id;
          add_to_element_contents (current, block);
          current = block;
          def_line = new_element (ET_def_line);
          add_to_element_contents (current, def_line);
          current = def_line;
        }
      else
        {
          /*  line 4756 */
          ELEMENT *block = new_element (ET_NONE);

          block->cmd = cmd_id;
          add_to_element_contents (current, block);
          current = block;
        }

      /* 4763 Check if 'block args command' */
      if (command_data(cmd_id).data != BLOCK_raw)
        {
          if (command_data(cmd_id).flags & CF_preformatted)
            push_context (ct_preformatted);
          else if (command_data(cmd_id).flags & CF_format_raw)
            {
              push_context (ct_rawpreformatted);
            }

          // regionsstack

          // 4784 menu commands

          {
            ELEMENT *bla = new_element (ET_block_line_arg);
            add_to_element_args (current, bla);
            current = bla;
            if (!(command_data(cmd_id).flags & CF_def))
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
                      enum command_id cmd_id)
{
  char *line = *line_inout;
  ELEMENT *e;

  e = new_element (ET_NONE);
  e->cmd = cmd_id;
  add_to_element_contents (current, e);
  current = e;

  // mark_and_warn_invalid
  // click, kbd, definfoenclose

  *line_inout = line;
  return current;
}
