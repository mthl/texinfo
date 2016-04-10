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


static void
shallow_destroy_element (ELEMENT *e)
{
  free (e->text.text);
  free (e);
}

// 2335
/* Used for definition line parsing.  Return next unit on the line after
   a definition command like @deffn.  The contents of E is what is remaining
   in the argument line.  *SPACES_OUT is set to an element with spaces before 
   the line. */
static ELEMENT *
next_bracketed_or_word (ELEMENT *e, ELEMENT **spaces_out)
{
  char *text;
  ELEMENT *spaces = 0;
  int space_len;
  ELEMENT *ret;

  *spaces_out = 0;
  if (e->contents.number == 0)
    return 0; /* No more arguments */

  text = e->contents.list[0]->text.text;
  if (text)
    {
      space_len = strspn (text, whitespace_chars);
      if (text[space_len] == '\0')
        {
          /* Text is completely spaces. */
          spaces = remove_from_contents (e, 0); // 2341
          spaces->type = ET_spaces;

          /* Remove a trailing newline. */
          if (spaces->text.end > 0
              && spaces->text.text[spaces->text.end - 1] == '\n')
            {
              spaces->text.text[--spaces->text.end] = '\0';
            }

          if (spaces->text.end > 0)
            {
              *spaces_out = spaces;
              (*spaces_out)->parent = 0;
            }
          else
            shallow_destroy_element (spaces);
        }
    }

  if (e->contents.number == 0)
    return 0; /* No more arguments */

  if (e->contents.list[0]->type == ET_bracketed)
    {
      ELEMENT *bracketed = remove_from_contents (e, 0);
      ELEMENT *returned = new_element (ET_bracketed_def_content);

      // isolate_last_space (bracketed, ET_empty_space_at_end_def_bracketed);

      /* TODO: Why do we need the parent ? */
      returned->parent = bracketed->parent;
      returned->contents = bracketed->contents;
      returned->parent_type = route_not_in_tree;

      return returned;
    }
  else if (e->contents.list[0]->cmd != CM_NONE) // 2363
    {
      ret = remove_from_contents (e, 0);
      //ret->parent = 0;
      return ret;
    }
  else
    {
      /* Extract span of whitespace characters followed by a span of
         non-whitespace characters. */
      ELEMENT *f = e->contents.list[0];
      ELEMENT *returned = new_element (ET_NONE);
      int arg_len;
      text = f->text.text;
      space_len = strspn (text, whitespace_chars);
      if (space_len > 0)
        {
          spaces = new_element (ET_spaces);
          spaces->parent_type = route_not_in_tree;
          text_append_n (&spaces->text, text, space_len);
          text += space_len;
          *spaces_out = spaces;
          //(*spaces_out)->parent = 0;
        }
      arg_len = strcspn (text, whitespace_chars);
      text_append_n (&returned->text, text, arg_len);

      memmove (f->text.text, f->text.text + space_len + arg_len,
               f->text.end - (space_len + arg_len) + 1);
      f->text.end -= space_len + arg_len;
      if (f->text.end == 0)
        shallow_destroy_element (remove_from_contents (e, 0));

      returned->parent_type = route_not_in_tree;
      //returned->parent = 0;
      return returned;
    }
}

typedef struct {
    enum command_id alias;
    enum command_id command;
    char *category;
} DEF_ALIAS;

DEF_ALIAS def_aliases[] = {
  CM_defun, CM_deffn, "Function",
  CM_defmac, CM_deffn, "Macro",
  CM_defspec, CM_deffn, "{Special Form}",
  CM_defvar, CM_defvr, "Variable",
  CM_defopt, CM_defvr, "{User Option}",
  CM_deftypefun, CM_deftypefn, "Function",
  CM_deftypevar, CM_deftypevr, "Variable",
  CM_defivar, CM_defcv, "{Instance Variable}",
  CM_deftypeivar, CM_deftypecv, "{Instance Variable}",
  CM_defmethod, CM_defop, "Method",
  CM_deftypemethod, CM_deftypeop, "Method",
  0, 0, 0
};

static void
add_to_def_args_extra (DEF_ARGS_EXTRA *d, char *label, ELEMENT *arg)
{
  if (d->nelements >= d->space - 1)
    {
      d->space += 5;
      d->labels = realloc (d->labels, d->space * sizeof (char *));
      d->elements = realloc (d->elements, d->space * sizeof (ELEMENT *));
    }

  if (arg && arg->hv)
    abort ();
  if (!arg)
    return; /* Probably a bug */

  d->labels[d->nelements] = label;
  d->elements[d->nelements++] = arg;
  d->labels[d->nelements] = 0;
  d->elements[d->nelements] = 0;
}

/* Parse the arguments on a def* command line. */
// 2378
DEF_ARGS_EXTRA *
parse_def (enum command_id command, ELEMENT_LIST contents)
{
  /* The return value - suitable for "def_args" extra value. */
  DEF_ARGS_EXTRA *def_args;
  int i;

  ELEMENT *arg_line; /* Copy of argument line. */
  ELEMENT *arg, *spaces; /* Arguments and spaces extracted from line. */
  ELEMENT *e, *e1;

  enum command_id original_command = CM_NONE;

  def_args = malloc (sizeof (DEF_ARGS_EXTRA));
  memset (def_args, 0, sizeof (DEF_ARGS_EXTRA));

  /* Copy contents of argument line. */
  arg_line = new_element (ET_NONE);
  for (i = contents.list[0]->type != ET_empty_spaces_after_command ? 0 : 1;
       i < contents.number; i++)
    {
      if (contents.list[i]->text.space > 0)
        {
          /* Copy text to avoid changing the original. */
          ELEMENT *copy = new_element (ET_NONE);
          copy->parent_type = route_not_in_tree;
          copy->parent = 0;
          text_init (&copy->text);
          text_append_n (&copy->text,
                         contents.list[i]->text.text,
                         contents.list[i]->text.end);
          add_to_contents_as_array (arg_line, copy);

          /* Note that these copied elements should be destroyed with
             shallow_destroy_element, not destroy_element, because their
             contents and args are shared with in-tree elements. */
        }
      else
        {
          add_to_contents_as_array (arg_line, contents.list[i]);
        }
    }

  if (arg_line->contents.number > 0 // 2385
      && arg_line->contents.list[0]->type == ET_empty_spaces_after_command)
    {
      remove_from_contents (arg_line, 0);
    }

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

      /* TODO: Get the gettext translation of "Function" etc.  The result of
         this is actually a general Texinfo tree, instead of just a string. */
      /* tree = gdt (category); */

      if (*category != '{')
        {
          e = new_element (ET_NONE);
          text_append (&e->text, category);
          insert_into_contents (arg_line, e, 0);
          e->parent_type = route_not_in_tree;
        }
      else
        {
          /* Used when category text has a space in it. */
          e = new_element (ET_bracketed);
          insert_into_contents (arg_line, e, 0);
          e->parent_type = route_not_in_tree;
          e1 = new_element (ET_NONE);
          text_append_n (&e1->text, category + 1, strlen (category) - 2);
          add_to_element_contents (e, e1);
          e1->parent_type = route_not_in_tree;
        }

      e = new_element (ET_NONE);
      text_append_n (&e->text, " ", 1);
      insert_into_contents (arg_line, e, 1);
      e->parent_type = route_not_in_tree;
    }

  /* Read arguments as CATEGORY [CLASS] [TYPE] NAME [ARGUMENTS].
  
     Meaning of these:
     CATEGORY - type of entity, e.g. "Function"
     CLASS - class for object-oriented programming
     TYPE - data type of a variable or function return value
     NAME - name of entity being documented
     ARGUMENTS - arguments to a function or macro                  */

  /* CATEGORY */
  arg = next_bracketed_or_word (arg_line, &spaces);

  if (spaces)
    add_to_def_args_extra (def_args, "spaces", spaces);
  add_to_def_args_extra (def_args, "category", arg);

  /* CLASS */
  if (command == CM_deftypeop
      || command == CM_defcv
      || command == CM_deftypecv
      || command == CM_defop)
    {
      arg = next_bracketed_or_word (arg_line, &spaces);
      if (spaces)
        add_to_def_args_extra (def_args, "spaces", spaces);
      add_to_def_args_extra (def_args, "class", arg);
    }

  /* TYPE */
  if (command == CM_deftypefn
      || command == CM_deftypeop
      || command == CM_deftypevr
      || command == CM_deftypecv)
    {
      arg = next_bracketed_or_word (arg_line, &spaces);
      if (spaces)
        add_to_def_args_extra (def_args, "spaces", spaces);
      add_to_def_args_extra (def_args, "type", arg);
    }

  /* NAME */
  /* All command types get a name. */
  arg = next_bracketed_or_word (arg_line, &spaces);
  if (spaces)
    add_to_def_args_extra (def_args, "spaces", spaces);
  add_to_def_args_extra (def_args, "name", arg);

  /* ARGUMENTS */
  // 2441
  while (arg_line->contents.number > 0)
    {
      arg = next_bracketed_or_word (arg_line, &spaces);
      if (spaces)
        add_to_def_args_extra (def_args, "spaces", spaces);
      if (!arg)
        break;
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
              len = strspn (p, "[](),");
              if (len == 0)
                break;

              e = new_element (ET_NONE);
              e->parent_type = route_not_in_tree;
              // e = new_element (ET_delimiter); //TODO : No such type
              text_append_n (&e->text, p, len);
              add_to_def_args_extra (def_args, "delimiter", e);
              p += len;
            }
          destroy_element (arg);
        }
      else
        {
          add_to_def_args_extra (def_args, "arg", arg);
        }
    }


  // 2460 - argtype
  /* TODO: Change some of the left sides to 'typearg'.
     What's the difference between this and type? */
  if (command == CM_deftypefn || command == CM_deftypeop
      || command == CM_deftp)
    {
    }

  destroy_element (arg_line);
  add_to_def_args_extra (def_args, 0, 0);
  return def_args;

#if 0
  // In calling code at 2788, this array is saved in the extra key.

  // 2853 an index entry is also entered
  enter_index_entry (command, original_command, name
                     /* , index_entry_normalized */ );
  
  /* Notes: See 2812 for value of 'name'. */
#endif

}
