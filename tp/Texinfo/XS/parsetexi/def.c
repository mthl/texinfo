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

#include "parser.h"
#include "text.h"

// 1471
void
gather_def_item (ELEMENT *current, enum command_id next_command)
{
  enum element_type type;
  ELEMENT *def_item;
  int contents_count, i;

  if (next_command)
    type = ET_inter_def_item; /* Between @def*x and @def*. */
  else
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


/* Starting at I in the contents, return the next non-whitespace element,
   incrementing I.  Return null if no more elements. */
ELEMENT *
next_bracketed_or_word (ELEMENT *current, int *i)
{
  while (1)
    {
      if (*i == current->contents.number)
        return 0;
      if (current->contents.list[*i]->type != ET_spaces
          && current->contents.list[*i]->type != ET_spaces_inserted
          && current->contents.list[*i]->type != ET_empty_spaces_after_command)
        break;
      (*i)++;
    }
  return current->contents.list[(*i)++];
}

typedef struct {
    enum command_id alias;
    enum command_id command;
    char *category;
} DEF_ALIAS;

DEF_ALIAS def_aliases[] = {
  CM_defun, CM_deffn, "Function",
  CM_defmac, CM_deffn, "Macro",
  CM_defspec, CM_deffn, "Special Form",
  CM_defvar, CM_defvr, "Variable",
  CM_defopt, CM_defvr, "User Option",
  CM_deftypefun, CM_deftypefn, "Function",
  CM_deftypevar, CM_deftypevr, "Variable",
  CM_defivar, CM_defcv, "Instance Variable",
  CM_deftypeivar, CM_deftypecv, "Instance Variable",
  CM_defmethod, CM_defop, "Method",
  CM_deftypemethod, CM_deftypeop, "Method",
  0, 0, 0
};

/* Divide any text elements into separate elements, separating whitespace
   and non-whitespace. */
static void
split_def_args (ELEMENT *current)
{
  int i;
  for (i = 0; i < current->contents.number; i++)
    {
      ELEMENT *e = current->contents.list[i];
      int j;
      char *p;
      ELEMENT *new;
      int len;
      if (e->text.end == 0)
        continue;
      if (e->type == ET_empty_spaces_after_command)
        continue;
      p = e->text.text;

      len = strspn (p, whitespace_chars);
      if (len)
        {
          new = new_element (ET_spaces);
          text_append_n (&new->text, p, len);
          insert_into_contents (current, new, i++);
          add_extra_string_dup (new, "def_role", "spaces");
          p += len;
        }

      while (1)
        {
          len = strcspn (p, whitespace_chars);
          new = new_element (ET_NONE);
          text_append_n (&new->text, p, len);
          insert_into_contents (current, new, i++);
          if (!*(p += len))
            break;

          len = strspn (p, whitespace_chars);
          new = new_element (ET_spaces);
          text_append_n (&new->text, p, len);
          insert_into_contents (current, new, i++);
          add_extra_string_dup (new, "def_role", "spaces");
          if (!*(p += len))
            {
              new->type = ET_spaces_at_end;
              break;
            }
        }
      destroy_element (remove_from_contents (current, i--));
    }
}

DEF_INFO *
parse_def (enum command_id command, ELEMENT *current)
{
  DEF_INFO *ret;
  int contents_idx;
  ELEMENT *arg;
  ELEMENT *e, *e1;
  enum command_id original_command = CM_NONE;

  ret = malloc (sizeof (DEF_INFO));
  memset (ret, 0, sizeof (DEF_INFO));

  split_def_args (current);

  /* Check for "def alias" - for example @defun for @deffn. */
  if (command_data(command).flags & CF_def_alias) // 2387
    {
      char *category;
      int i;
      for (i = 0; i < sizeof (def_aliases) / sizeof (*def_aliases); i++)
        {
          if (def_aliases[i].alias == command)
            goto found;
        }
      abort (); /* Has CF_def_alias but no alias defined. */
found:
      /* Prepended content is stuck into contents, so
         @defun is converted into
         @deffn Function */

      category = def_aliases[i].category;
      original_command = command;
      command = def_aliases[i].command;

      /* Used when category text has a space in it. */
      e = new_element (ET_bracketed_inserted);
      insert_into_contents (current, e, 0);
      e1 = new_element (ET_NONE);
      text_append_n (&e1->text, category, strlen (category));
      add_to_element_contents (e, e1);
      if (global_documentlanguage && *global_documentlanguage)
        {
          e1->type = ET_untranslated;
          add_extra_string_dup (e1, "documentlanguage",
                                global_documentlanguage);
        }

      e = new_element (ET_spaces_inserted);
      text_append_n (&e->text, " ", 1);
      insert_into_contents (current, e, 1);
    }


  /* Read arguments as CATEGORY [CLASS] [TYPE] NAME [ARGUMENTS].
  
     Meaning of these:
     CATEGORY - type of entity, e.g. "Function"
     CLASS - class for object-oriented programming
     TYPE - data type of a variable or function return value
     NAME - name of entity being documented
     ARGUMENTS - arguments to a function or macro                  */

  contents_idx = 0;
  /* CATEGORY */
  ret->category = next_bracketed_or_word (current, &contents_idx);

  /* CLASS */
  if (command == CM_deftypeop
      || command == CM_defcv
      || command == CM_deftypecv
      || command == CM_defop)
    {
      ret->class = next_bracketed_or_word (current, &contents_idx);
    }

  /* TYPE */
  if (command == CM_deftypefn
      || command == CM_deftypeop
      || command == CM_deftypevr
      || command == CM_deftypecv)
    {
      ret->type = next_bracketed_or_word (current, &contents_idx);
    }

  /* NAME */
  ret->name = next_bracketed_or_word (current, &contents_idx);

  if (ret->category)
    {
      add_extra_string_dup (ret->category, "def_role", "category");
    }
  if (ret->class)
    {
      add_extra_string_dup (ret->class, "def_role", "class");
    }
  if (ret->type)
    {
      add_extra_string_dup (ret->type, "def_role", "type");
    }
  if (ret->name)
    {
      add_extra_string_dup (ret->name, "def_role", "name");
    }
  /* TODO: process args */

  return ret;

}

#if 0
  /* ARGUMENTS */

  args_start = def_args->nelements;
  // 2441
  while (arg_line->contents.number > 0)
    {
      arg = next_bracketed_or_word (arg_line, &spaces, 0);
      if (spaces)
        add_to_def_args_extra (def_args, "spaces", spaces);
      if (!arg)
        goto finished;
      if (arg->text.end > 0) // 2445
        {
          ELEMENT *e;
          char *p = arg->text.text;
          int len;
          /* Split this argument into multiple arguments, separated by
             separator characters. */
          while (1)
            {
              /* Square and round brackets used for optional arguments
                 and grouping.  Commas allowed as well? */
              len = strcspn (p, "[](),");
              if (len > 0)
                {
                  e = new_element (ET_NONE);
                  e->parent_type = route_not_in_tree;
                  text_append_n (&e->text, p, len);
                  add_to_def_args_extra (def_args, "arg", e);
                  p += len;
                }
              if (!*p)
                break;
              while (*p && strchr ("[](),", *p))
                {
                  e = new_element (ET_delimiter);
                  e->parent_type = route_not_in_tree;
                  text_append_n (&e->text, p++, 1);
                  add_to_def_args_extra (def_args, "delimiter", e);
                }
              if (!*p)
                break;
            }
          destroy_element (arg);
        }
      else
        {
          add_to_def_args_extra (def_args, "arg", arg);
        }
    }

finished:

  // 2460 - argtype
  /* Change some of the left sides to 'typearg'.  This matters for
     the DocBook output. */
  if (args_start > 0
      && (command == CM_deftypefn || command == CM_deftypeop
          || command == CM_deftp))
    {
      int i, next_is_type = 1;
      for (i = args_start; i < def_args->nelements; i++)
        {
          if (!strcmp ("spaces", def_args->labels[i]))
            {
            }
          else if (!strcmp ("delimiter", def_args->labels[i]))
            {
              next_is_type = 1;
            }
          else if (def_args->elements[i]->cmd
                   && def_args->elements[i]->cmd != CM_code)
            {
              next_is_type = 1;
            }
          else if (next_is_type)
            {
              def_args->labels[i] = "typearg";
              next_is_type = 0;
            }
          else
            next_is_type = 1;
        }
    }

  destroy_element (arg_line);
  return def_args;
}

#endif
