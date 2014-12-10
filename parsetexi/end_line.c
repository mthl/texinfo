#include <stdlib.h>
#include <string.h>

#include "parser.h"
#include "tree.h"
#include "text.h"
#include "input.h"

/* In convert.c */
char *text_convert (ELEMENT *e);

/* 2610 */
/* Actions to be taken when a whole line of input has been processed */
ELEMENT *
end_line (ELEMENT *current)
{
  char *end_command = 0;
  enum command_id end_id;

  /* If empty line, start a new paragraph. */
  if (last_contents_child (current)
      && last_contents_child (current)->type == ET_empty_line)
    {
      debug ("END EMPTY LINE");
      if (current->type == ET_paragraph) /* 2625 */
        {
          ELEMENT *e;
          /* Remove empty_line element. */
          e = pop_element_from_contents (current);

          current = end_paragraph (current);

          /* Add empty_line to higher-level element. */
          add_to_element_contents (current, e);
        }
      //else if () // in menu_entry_description
      else if (!in_no_paragraph_contexts (current_context ()))
        {
          current = end_paragraph (current);
        }
    }

  /* Is it a line of a menu? */ /* line 2667 */

  /* Is it a def line 2778 */
  else if (current->parent && current->parent->type == ET_def_line)
    {
      enum element_type def_command;

      if (pop_context () != ct_def)
        {
          abort ();
        }

#if 0
      /* current->parent is a ET_def_line, and current->parent->parent
         the def command. */
      def_command = current->parent->parent->cmd;
      // strip a trailing x
      parse_def (def_command, current->contents);
#endif

      current = current->parent->parent;
      current = begin_preformatted (current);

    }

  /* block line arg command 2872 */
  else if (current->type == ET_block_line_arg)
    {
      enum context c;
      // pop and check context_stack
      c = pop_context ();
      if (c != ct_line)
        {
          // bug
          abort ();
        }

      // 2881
      if (current->parent->cmd == CM_multitable)
        {
          /* Parse prototype row */
          // But not @columnfractions, I assume?
        }

      if (current->parent->cmd == CM_float) // 2943
        {
        }
      current = current->parent; //2965

      /* Don't consider empty argument of block @-command as argument,
         reparent them as contents. */
      if (current->args.list[0]->contents.number > 0
          && current->args.list[0]->contents.list[0]->type
             == ET_empty_line_after_command)
        {
          ELEMENT *e;
          e = current->args.list[0]->contents.list[0];
          insert_into_contents (current, e, 0);
          // TODO: Free lists?
          current->args.number = 0;
        }

      if (command_flags(current) & CF_blockitem) // 2981
        {
          if (current->cmd == CM_enumerate)
            {
            }
          else if (item_line_command (current->cmd)) // 3002
            {
              // check command_as_argument registered in 'extra', and
              // that it accepts arguments in braces
            }

          if (current->cmd == CM_itemize) // 3019
            {
              // check that command_as_argument is alone on the line
            }

          // check if command_as_argument isn't an accent command

          /* 3052 - if no command_as_argument given, default to @bullet for
             @itemize, and @asis for @table. */

          {
            ELEMENT *bi = new_element (ET_before_item);
            add_to_element_contents (current, bi);
            current = bi;
          }
        } /* CF_blockitem */
    }

  /* after an "@end verbatim" 3090 */
  else if (current->contents.number
           && last_contents_child(current)->type == ET_empty_line_after_command
    /* The Perl version gets the command with the 'command' key in 'extra'. */
           && contents_child_by_index(current, -2)
           && contents_child_by_index(current, -2)->cmd == CM_verbatim)
    {
      // I don't know what this means.  raw command is @html etc.?
      /*
     if we are after a @end verbatim, we must restart a preformatted if needed,
     since there is no @end command explicitly associated to raw commands
     it won't be done elsewhere.
      */

      current = begin_preformatted (current);
    }


  /* if it's a misc line arg 3100 */
  else if (current->type == ET_misc_line_arg)
    {
      int cmd_id, arg_type;
      enum context c;

      isolate_last_space (current);

      current = current->parent;
      cmd_id = current->cmd;
      if (!cmd_id)
        abort ();

      arg_type = command_data(cmd_id).data;
       
      /* Check 'line' is top of the context stack */
      c = pop_context ();
      if (c != ct_line)
        {
          /* error */
          abort ();
        }

      // 3114
      debug ("MISC END %s", command_data(cmd_id).cmdname);

      if (arg_type > 0)
        {
          /* arg_type is number of args */
          // parse_line_command_args
          // save in 'misc_args' extra key
        }
      else if (arg_type == MISC_text) /* 3118 */
        {
          char *text;
         
          /* argument string has to be parsed as Texinfo. This calls convert in 
             Common/Text.pm on the first element of current->args. */
          /* however, this makes it impossible to decouple the parser and 
             output stages...  Any use of Texinfo::Convert is problematic. */

          if (current->args.number > 0)
            text = text_convert (current->args.list[0]);
          else
            text = "foo";

          if (!strcmp (text, ""))
            {
              /* 3123 warning - missing argument */
              abort ();
            }
          else
            {
              if (current->cmd == CM_end) /* 3128 */
                {
                  char *line = text;

                  /* Set end_command - used below. */
                  end_command = read_command_name (&line);

                  /* Check argument meets format of a Texinfo command
                     (alphanumberic character followed by alphanumeric 
                     characters or hyphens. */

                  /* Check if argument is a block Texinfo command. */
                  end_id = lookup_command (end_command);
                  if (end_id == -1 || !(command_data(end_id).flags & CF_block))
                    {
                      /* error - unknown @end */
                    }
                  else
                    {
                      debug ("END BLOCK %s", end_command);
                      /* 3140 Handle conditional block commands (e.g.  
                         @ifinfo) */

                      /* If we are in a non-ignored conditional, there is not
                         an element for the block in the tree; it is recorded 
                         in the conditional stack.  Pop it and check it is the 
                         same as the one given in the @end line. */

                      if (command_data(end_id).data == BLOCK_conditional)
                        {
                          if (conditional_number > 0)
                            {
                              enum command_id popped;
                              popped = pop_conditional_stack ();
                              if (popped != end_id)
                                abort ();
                            }
                        }
                    }

                }
              else if (current->cmd == CM_include) /* 3166 */
                {
                  debug ("Include %s", text);
                  input_push_file (text);
                }
              else if (current->cmd == CM_documentencoding)
                /* 3190 */
                {
                }
              else if (current->cmd == CM_documentlanguage)
                /* 3223 */
                {
                }
            }
        }
      else if (current->cmd == CM_node) /* 3235 */
        {
        }
      else if (current->cmd == CM_listoffloats) /* 3248 */
        {
        }
      else
        {
          /* All the other "line" commands" */
        }

      current = current->parent; /* 3285 */
      if (end_command) /* Set above */
        {
          /* more processing of @end */
          ELEMENT *end_elt;

          debug ("END COMMAND %s", end_command);

          /* Reparent the "@end" element to be a child of the block element. */
          end_elt = pop_element_from_contents (current);

          /* 3289 If not a conditional */
          if (command_data(end_id).data != BLOCK_conditional)
            {
              ELEMENT *closed_command;
              /* This closes tree elements (e.g. paragraphs) until we reach
                 end_command.  It can print an error if another block command
                 is found first. */
              current = close_commands (current, end_id,
                              &closed_command, 0); /* 3292 */
              if (!closed_command)
                abort (); // 3335

              close_command_cleanup (closed_command);
              // 3301 INLINE_INSERTCOPYING
              add_to_element_contents (closed_command, end_elt); // 3321
              // 3324 ET_menu_comment
              if (close_preformatted_command (end_id))
                current = begin_preformatted (current);
            }
        } /* 3340 */
      else
        {
          if (close_preformatted_command (cmd_id))
            current = begin_preformatted (current);
        }

      /* 3346 included file */
      // setfilename
      /* 3355 columnfractions */
      if (cmd_id == CM_columnfractions)
        {
          ELEMENT *before_item;
          // check if in multitable

          // pop and check context stack

          current = current->parent;
          before_item = new_element (ET_before_item);
          add_to_element_contents (current, before_item);
          current = before_item;
        }
      else if (command_data(cmd_id).flags & CF_root) /* 3380 */
        {
          current = last_contents_child (current);
          
          /* 3383 Destroy all contents (why do we do this?) */
          while (last_contents_child (current))
            destroy_element (pop_element_from_contents (current));

          /* do stuff with associated_section extra key. */
        } /* 3416 */
    }


  // something to do with an empty line /* 3419 */

  //if () /* 'line' or 'def' at top of "context stack" */
    {
      /* Recurse. */
    }
  return current;
} /* end_line 3487 */

