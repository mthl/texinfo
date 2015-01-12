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

#include "parser.h"

// 1471
void
gather_def_item (ELEMENT *current /* , enum command_id next_command */ )
{
  enum element_type type;
  ELEMENT *def_item;
  int contents_count, i;

  // TODO: ET_inter_def_item.
  type = ET_def_item;

  if (!current->cmd)
    return;

  /* Check this isn't an "x" type command.
     "This may happen for a construct like:
     @deffnx a b @section
     but otherwise the end of line will lead to the command closing." */
  if (command_data(current->cmd).flags & CF_misc)
    return;

  def_item = new_element (type);

  /* Starting from the end, collect everything that is not a ET_def_line and
     put it into the ET_def_item. */
  contents_count = current->contents.number;
  for (i = 0; i < contents_count; i++)
    {
      ELEMENT *last_child, *item_content;
      last_child = last_contents_child (current);
      if (last_child->type == ET_def_line)
        break;
      item_content = pop_element_from_contents (current);
      insert_into_contents (def_item, item_content, 0);
    }

  if (def_item->contents.number > 0)
    add_to_element_contents (current, def_item);
  else
    destroy_element (def_item);
}

#if 0
/* *SPACES is set to... */
static void
next_bracketed_or_word (char **spaces)
{
  /* Change ET_bracketed to ET_bracketed_def_content. */
}

enum arg_type { end, category, name, arg, type, argtype, class };

typedef struct {
    enum command_id alias;
    enum command_id command;
    char *index_name;
} DEF_ALIAS;

DEF_MAP def_aliases[];
};


/* Parse the arguments on a def* command line. */
/* Note that this does more than the Perl version. */
// 2378
char **
parse_def (enum command_id command, ELEMENT_LIST contents)
{
  char *category;
  enum command_id original_command = CM_NONE;

  /* Check for "def alias" - for example defun for deffn
    'defun',         {'deffn'     => gdt('Function')},

    Overwrite command with deffn.

    Prepended content is stuck into contents, so
    defun is converted into
    deffn Function
   */
  if (command_data(command).flags & CF_def_alias)
    {
      int i;
      for (i = 0; i < sizeof (def_aliases) / sizeof (*def_aliases); i++)
        {
          if (def_aliases[i].alias == command)
            goto found;
        }
      abort ();
found:
      category = def_aliases[i].index_name;
      original_command = command;
      command = def_aliases[i].command;

      /* Perl does something with gettext here, so category is not just
         a string, but also a Texinfo tree.  Why? */
    }

    
  // @args is def_map
  // $arg_type - set if there are supposed to be arguments

  /* Read arguments as [CATEGORY] [CLASS] [TYPE] NAME [ARGUMENTS] */

  if (!category)
    {
      /* Next arg is the category. */
    }

  if (command == CM_deftypeop
      || command == CM_defcv
      || command == CM_deftypecv
      || command == CM_op)
    /* Next arg is the class. */
    {
      next_bracketed_or_word ();
    }

  if (command == CM_deftypefn
      || command == CM_deftypeop
      || command == CM_deftypevr
      || command == CM_deftypecv)
    /* Next arg is the type. */
    {
      next_bracketed_or_word ();
    }

  /* All command types get a name. */
  name = next_bracketed_or_word ();

  // ...


  /* @result is an array of pairs, left being the type of argument (e.g.  
     'class', right being the argument given. */

  /* @args_results are the arguments at the end I suppose.  Left side of 
     elements are either 'arg' or 'delimeter'. */

  /* For 'argtype', change some of the left sides to 'typearg'. */

  /* @args and @args_results are concatenated and returned. */


  // In calling code at 2788, this array is saved in the extra key.

  // 2853 an index entry is also entered
  enter_index_entry (command, original_command, name
                     /* , index_entry_normalized */ );
  
  /* Notes: See 2812 for value of 'name'. */

}
#endif
