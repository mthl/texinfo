/* end_line.c -- what to do at the end of a whole line of input
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
#include <ctype.h>

#include "parser.h"
#include "tree.h"
#include "text.h"
#include "input.h"
#include "convert.h"
#include "labels.h"
#include "indices.h"
#include "errors.h"

static int
is_decimal_number (char *string)
{
  char *p = string;
  char *first_digits = 0;
  char *second_digits = 0;
  
  if (string[0] == '\0')
    return 0;

  if (strchr (digit_chars, *p))
    p = first_digits = string + strspn (string, digit_chars);

  if (*p == '.')
    {
      p++;
      if (strchr (digit_chars, *p))
        p = second_digits = p + strspn (p, digit_chars);
    }

  if (*p /* Bytes remaining at end of argument. */
      || (!first_digits && !second_digits)) /* Need digits either 
                                               before or after the 
                                               decimal point. */
    {
      return 0;
    }

  return 1;
}

static int
is_whole_number (char *string)
{
  if (string[strspn (string, digit_chars)] == '\0')
    return 1;
  return 0;
}

/* Process argument to special line command. */
// 5377
ELEMENT *
parse_special_misc_command (char *line, enum command_id cmd
                           /* , int *has_comment */)
{
#define ADD_ARG(string, len) do { \
  ELEMENT *E = new_element (ET_NONE); \
  text_append_n (&E->text, string, len); \
  add_to_element_contents (args, E); \
} while (0)

  ELEMENT *args = new_element (ET_NONE);
  char *p, *q, *r;
  char *value;

  switch (cmd)
    {
    case CM_set:
      {
        
        /* Check if the line matches the Perl regular expression

        /^\s+([\w\-][^\s{\\}~`\^+"<>|@]*)
        (\@(c|comment)((\@|\s+).*)?|[^\S\f]+(.*?))?[^\S\f]*$/

          */

      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto set_no_name;
      if (!isalnum (*p) && *p != '-' && *p != '_')
        goto set_invalid;
      q = strpbrk (p,
                   " \t\f\r\n"       /* whitespace */
                   "{\\}~^+\"<>|@"); /* other bytes that aren't allowed */

      ADD_ARG(p, q - p); /* name */

      /* TODO: Skip optional comment. */
      /* This is strange - how can you have a comment in the middle
         of a line?  And what does "@comment@" mean?
         I guess this is following TeX syntax in ending reading a control
         sequence name at an escape character. */

      p = q + strspn (q, whitespace_chars);
      /* Actually, whitespace characters except form feed. */

      /* Find trailing whitespace on line. */
      q = strchr (p, '\0');
      while (strchr (whitespace_chars, *q))
        q--;

      if (q >= p)
        ADD_ARG(p, q - p + 1); /* value */
      else
        ADD_ARG("", 0);

      store_value (args->contents.list[0]->text.text,
                   args->contents.list[1]->text.text);
      /* TODO - unless ignore_global_commands is on */

      break;
set_no_name:
      line_error ("@set requires a name");
      break;
set_invalid:
      line_error ("bad name for @set");
      break;
      }
    case CM_clear:
      {
      char *flag;
      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto clear_no_name;
      q = p;
      flag = read_command_name (&q);
      if (!flag)
        goto clear_invalid;
      r = q + strspn (q, whitespace_chars);
      if (*r)
        goto clear_invalid; /* Trailing argument. */

      ADD_ARG (p, q - p);
      clear_value (p, q - p);
      
      break;
clear_no_name:
      line_error ("@clear requires a name");
      break;
clear_invalid:
      line_error ("bad name for @clear");
      break;
      }
    case CM_unmacro:
      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto unmacro_noname;
      q = p;
      value = read_command_name (&q);
      if (!value)
        goto unmacro_badname;
      /* TODO: Check comment syntax is right */
      delete_macro (value);
      ADD_ARG(value, q - p);
      debug ("UNMACRO %s", value);
      free (value);
      break;
unmacro_noname:
      line_error ("@unmacro requires a name");
      break;
unmacro_badname:
      line_error ("bad name for @unmacro");
      break;
    case CM_clickstyle:
      p = line;
      p += strspn (p, whitespace_chars);
      if (*p++ != '@')
        goto clickstyle_invalid;
      q = p;
      value = read_command_name (&q);
      if (!value)
        goto clickstyle_invalid;
      ADD_ARG (p - 1, q - p + 1);
      global_clickstyle = malloc (q - p + 1);
      {
        enum command_id c;
        c = lookup_command (value);
        if (!c)
          ; // TODO
        global_clickstyle = command_name(c);
      }
      /* TODO: Check if it is a real command */
      if (memcmp (q, "{}", 2))
        q += 2;
      free (value);
      /* TODO: check comment */
      break;
clickstyle_invalid:
      line_error ("@clickstyle should only accept an @-command as argument, "
                   "not `%s'", line);
      break;
    default:
      abort ();
    }

  return args;
#undef ADD_ARG
}

/* Parse the arguments to a line command.  Return an element whose contents
   is an array of the arguments.  For some commands, there is further 
   processing of the arguments (for example, for an @alias, remember the
   alias.) */
// 5475
ELEMENT *
parse_line_command_args (ELEMENT *line_command)
{
#define ADD_ARG(string) do { \
    ELEMENT *E = new_element (ET_NONE); \
    text_append (&E->text, string); \
    add_to_element_contents (line_args, E); \
} while (0)

  ELEMENT *line_args;
  ELEMENT *arg = line_command->args.list[0];
  ELEMENT *argarg = 0;
  enum command_id cmd;
  char *line;
  int i;

  line_args = new_element (ET_NONE);

  cmd = line_command->cmd;

  /* Find the argument, and check there is only one. */
  i = 0;
  while (i < arg->contents.number)
    {
      /* Ignore all the elements checked
         in trim_spaces_comment_from_content.  */
      enum element_type t;
      t = contents_child_by_index(arg, i)->type;

      if (t == ET_empty_spaces_after_command
          || t == ET_empty_spaces_before_argument
          || t == ET_empty_space_at_end_def_bracketed
          || t == ET_empty_spaces_after_close_brace
          || t == ET_spaces_at_end
          || t == ET_space_at_end_block_command
          || t == ET_empty_line_after_command
          || contents_child_by_index(arg, i)->cmd == CM_c
          || contents_child_by_index(arg, i)->cmd == CM_comment)
        {
          i++;
          continue;
        }
      if (!argarg)
        {
          argarg = contents_child_by_index(arg, i);
          i++;
          continue;
        }
      else
        {
          /* Error - too many arguments. */
          line_error ("superfluous argument to @%s",
                       command_name (cmd));
          break;
        }
    }

  if (!argarg)
    {
      command_error (line_command, "@%s missing argument", command_name(cmd));
      add_extra_string (line_command, "missing_argument", "1");
      return 0;
    }
  if (argarg->text.end == 0)
    {
      line_error ("superfluous argument to @%s",
                   command_name (cmd));
      return 0;
    }

  line = argarg->text.text;

  switch (cmd)
    {
    case CM_alias:
      {
        /* @alias NEW = EXISTING */
        char *new = 0, *existing = 0;
        enum command_id new_cmd, existing_cmd;

        new = read_command_name (&line);
        if (!new)
          goto alias_invalid;

        line += strspn (line, whitespace_chars);
        if (*line != '=')
          goto alias_invalid;
        line++;
        line += strspn (line, whitespace_chars);

        if (!isalnum (*line))
          goto alias_invalid;
        existing = read_command_name (&line);
        if (!existing)
          goto alias_invalid;

        if (*line)
          goto alias_invalid; /* Trailing argument. */

        ADD_ARG(new);
        ADD_ARG(existing);

        existing_cmd = lookup_command (existing);
        if (!existing_cmd)
          break; /* TODO: Error message */
        else
          {
            if (command_data(existing_cmd).flags & CF_block)
              line_warn ("environment command %s as argument to @alias",
                         command_name(existing_cmd));
          }

        /* Remember the alias. */
        new_cmd = add_texinfo_command (new);
        new_cmd &= ~USER_COMMAND_BIT;
        user_defined_command_data[new_cmd].flags |= CF_ALIAS;

        user_defined_command_data[new_cmd].data = existing_cmd;
        /* Note the data field is an int, existing_cmd is
           enum command_id, so would have problems if enum command_id
           were wider than an int. */

        free (new); free (existing);

        break;
      alias_invalid:
        line_error ("bad argument to @alias");
        free (new); free (existing);
        break;
      }
    case CM_definfoenclose:
      {
        /* @definfoenclose phoo,//,\\ */
        char *new_command = 0, *start = 0, *end = 0;
        enum command_id new_cmd;
        int len;

        new_command = read_command_name (&line);
        if (!new_command)
          goto definfoenclose_invalid;

        line += strspn (line, whitespace_chars);
        if (*line != ',')
          goto definfoenclose_invalid;
        line++;
        line += strspn (line, whitespace_chars);

        /* TODO: Can we have spaces in the delimiters? */
        len = strcspn (line, ",");
        start = strndup (line, len);
        line += len;

        if (!*line)
          goto definfoenclose_invalid; /* Not enough args. */
        line++; /* Past ','. */
        line += strspn (line, whitespace_chars);
        len = strcspn (line, ",");
        end = strndup (line, len);

        if (*line == ',')
          goto definfoenclose_invalid; /* Too many args. */

        /* Remember it. */
        new_cmd = add_texinfo_command (new_command);
        add_infoenclose (new_cmd, start, end);
        new_cmd &= ~USER_COMMAND_BIT;

        user_defined_command_data[new_cmd].flags
          |= (CF_INFOENCLOSE | CF_brace);
        user_defined_command_data[new_cmd].data = BRACE_style;

        ADD_ARG(new_command); free (new_command);
        ADD_ARG(start); free (start);
        ADD_ARG(end); free (end);

        break;
      definfoenclose_invalid:
        line_error ("bad argument to @definfoenclose");
        free (new_command); free (start); free (end);
        break;
      }
    case CM_columnfractions:
      {
        /*  @multitable @columnfractions .33 .33 .33 */
        ELEMENT *new;
        char *p, *q;

        if (!*line)
          {
            line_error ("empty @columnfractions");
            break;
          }
        p = line;
        while (1)
          {
            char *arg;

            p += strspn (p, whitespace_chars);
            if (!*p)
              break;
            q = strpbrk (p, whitespace_chars);
            if (!q)
              q = p + strlen (p);
            
            arg = strndup (p, q - p);

            /* Check argument is valid. */
            if (!is_decimal_number (arg))
              {
                line_error ("column fraction not a number: %s", arg);

                /* FIXME: Possible bug in the Perl version - it accepts
                   2x.2, 2.23x */
              }
            else
              {
                new = new_element (ET_NONE);
                text_append_n (&new->text, p, q - p);
                add_to_element_contents (line_args, new);
              }
            free (arg);
            p = q;
          }
        break;
      }
    case CM_sp:
      {
        /* Argument is at least one digit. */
        if (strchr (digit_chars, *line)
            && !*(line + 1 + strspn (line + 1, digit_chars)))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@sp arg must be numeric, not `%s'", line);
        break;
      }
    case CM_defindex:
    case CM_defcodeindex:
      {
        char *name = 0;
        char *p = line;

        name = read_command_name (&p);
        if (*p)
          goto defindex_invalid; /* Trailing characters. */

        /* Disallow index names NAME where it is likely that for
           a source file BASE.texi, there will be other files called
           BASE.NAME in the same directory.  This is to prevent such
           files being overwritten by the files read by texindex. */
        {
          /* TODO: Also forbid existing index names. */
          static char *forbidden_index_names[] = {
            "info", "ps", "pdf", "htm", "html",
            "log", "aux", "dvi", "texi", "txi",
            "texinfo", "tex", "bib", 0
          };
          char **ptr;
          for (ptr = forbidden_index_names; *ptr; ptr++)
            if (!strcmp (name, *ptr))
              goto defindex_reserved;
        }

        add_index (name, cmd == CM_defcodeindex ? 1 : 0);
        ADD_ARG(name);

        break;
      defindex_invalid:
        line_error ("bad argument to @%s: %s",
                     command_name(cmd), line);
        break;
      defindex_reserved:
        line_error ("reserved index name %s", name);
        break;
      }
    case CM_synindex:
    case CM_syncodeindex: // 5595
      {
        /* synindex FROM TO */
        char *from = 0, *to = 0;
        INDEX *from_index, *to_index;
        char *p = line;

        if (!isalnum (*p))
          goto synindex_invalid;
        from = read_command_name (&p);
        if (!from)
          goto synindex_invalid;

        p += strspn (p, whitespace_chars);

        if (!isalnum (*p))
          goto synindex_invalid;
        to = read_command_name (&p);
        if (!to)
          goto synindex_invalid;
        if (*p)
          goto synindex_invalid; /* More at end of line. */

        from_index = index_by_name (from);
        to_index = index_by_name (to);
        if (!from_index)
          line_error ("unknown source index in @%s: %s", command_name(cmd),
                       from);
        if (!to_index)
          line_error ("unknown source index in @%s: %s", command_name(cmd),
                       to);

        if (from_index && to_index) // 5606
          {
            INDEX *current_to = to_index;
            /* Find ultimate index this merges to. */
            current_to = ultimate_index (current_to);

            if (current_to != from_index)
              {
                /* TODO: unless "ignore_global_commands" */
                from_index->merged_in = current_to;
                ADD_ARG(from);
                ADD_ARG(to);
              }
            else
              line_warn ("@%s leads to a merging of %s in itself, ignoring",
                          command_name(cmd), from);
          }

        free (from);
        free (to);

        break;
      synindex_invalid: // 5638
        line_error ("bad argument to @%s: %s",
                     command_name(cmd), line);
        free (from); free (to);
        break;
      }
    case CM_printindex: // 5641
      {
        char *arg;
        char *p = line;
        arg = read_command_name (&p);
        if (!arg || *p)
          line_error ("bad argument to @printindex: %s", line);
        else
          {
            INDEX *idx = index_by_name (arg);
            if (!idx)
              line_error ("unknown index `%s' in @printindex", arg);
            else
              {
                // 5650
                if (idx->merged_in)
                  line_warn
                    ("printing an index `%s' merged in another one, `%s'",
                     arg, idx->merged_in->name);
                if (!current_node && !current_section)
                  // TODO && nothing on regions stack?
                  {
                    line_warn ("printindex before document beginning: "
                                "@printindex %s", arg);
                  }
                ADD_ARG (arg);
              }
          }
        free (arg);
        break;
      }
    case CM_everyheadingmarks:
    case CM_everyfootingmarks:
    case CM_evenheadingmarks:
    case CM_oddheadingmarks:
    case CM_evenfootingmarks:
    case CM_oddfootingmarks:
      {
        if (!strcmp (line, "top") || !strcmp (line, "bottom"))
          {
            ADD_ARG (line);
          }
        else
          line_error ("@%s arg must be `top' or `bottom', not `%s'",
                       command_name(cmd), line);

        break;
      }
    case CM_fonttextsize:
      {
        if (!strcmp (line, "10") || !strcmp (line, "11"))
          {
            ADD_ARG (line);
          }
        else
          line_error ("Only @fonttextsize 10 or 11 is supported, not "
                       "`%s'", line);
        break;
      }
    case CM_footnotestyle:
      {
        if (!strcmp (line, "separate") || !strcmp (line, "end"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@footnotestyle arg must be "
                       "`separate' or `end', not `%s'", line);
        break;
      }
    case CM_setchapternewpage:
      {
        if (!strcmp (line, "on") || !strcmp (line, "off")
            || !strcmp (line, "odd"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@setchapternewpage arg must be "
                       "`on', `off' or `odd', not `%s'", line);
        break;
      }
    case CM_need:
      {
        /* valid: 2, 2., .2, 2.2 */

        if (is_decimal_number (line))
          ADD_ARG(line);
        else
          line_error ("bad argument to @need: %s", line);

        break;
      }
    case CM_paragraphindent:
      {
        if (!strcmp (line, "none") || !strcmp (line, "asis")
            || is_whole_number (line))
          ADD_ARG(line);
        else
          line_error ("@paragraphindent arg must be "
                       "numeric/`none'/`asis', not `%s'", line);
        break;
      }
    case CM_firstparagraphindent:
      {
        if (!strcmp (line, "none") || !strcmp (line, "insert"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@firstparagraph arg must be "
                       "`none' or `insert', not `%s'", line);

        break;
      }
    case CM_exampleindent:
      {
        if (!strcmp (line, "asis") || is_whole_number (line))
          ADD_ARG(line);
        else
          line_error ("@exampleindent arg must be "
                       "numeric/`asis', not `%s'", line);
        break;
      }
    case CM_frenchspacing:
    case CM_xrefautomaticsectiontitle:
    case CM_codequoteundirected:
    case CM_codequotebacktick:
    case CM_deftypefnnewline:
      {
        if (!strcmp (line, "on") || !strcmp (line, "off"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("expected @%s on or off, not `%s'",
                      command_name(cmd), line);

        break;
      }
    case CM_kbdinputstyle:
      {
        if (!strcmp (line, "code") || !strcmp (line, "example")
            || !strcmp (line, "distinct"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@kbdinputstyle arg must be "
                       "`code'/`example'/`distinct', not `%s'", line);
        break;
      }
    case CM_allowcodebreaks:
      {
        if (!strcmp (line, "true") || !strcmp (line, "false"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@allowcodebreaks arg must be "
                       "`true' or `false', not `%s'", line);
        break;
      }
    case CM_urefbreakstyle:
      {
        if (!strcmp (line, "after") || !strcmp (line, "before")
            || !strcmp (line, "none"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@urefbreakstyle arg must be "
                       "`after'/`before'/`none', not `%s'", line);
        break;
      }
    case CM_headings:
      {
        if (!strcmp (line, "off") || !strcmp (line, "on")
            || !strcmp (line, "double") || !strcmp (line, "singleafter")
            || !strcmp (line, "doubleafter"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("bad argument to @headings: %s", line);
        break;
      }
    default:
      ;
    }
  if (line_args->contents.number == 0)
    {
      destroy_element (line_args);
      return 0;
    }
  else
    return line_args;

#undef ADD_ARG
}

// 2257
/* NODE->contents is the Texinfo for the specification of a node.  This
   function sets three fields on the returned object:

     manual_content - Texinfo tree for a manual name extracted from the
                      node specification.
     node_content - Texinfo tree for the node name on its own
     normalized - a string with the node name after HTML node name
                  normalization is applied

   Objects returned from this function are used as an 'extra' key in a
   few places: the elements of a 'nodes_manuals' array (itself an extra key),
   the 'menu_entry_node' key on a 'menu_entry' element (not to be confused
   with an ET_menu_entry_node element, which occurs in the args of a 
   'menu_entry' element), and in the 'node_argument' key of a cross-reference 
   command (like @xref). */
NODE_SPEC_EXTRA *
parse_node_manual (ELEMENT *node)
{
  NODE_SPEC_EXTRA *result;
  ELEMENT *trimmed;
  ELEMENT *manual;

  result = malloc (sizeof (NODE_SPEC_EXTRA));
  result->manual_content = 0;
  trimmed = trim_spaces_comment_from_content (node);

  /* If the content starts with a '(', try to get a manual name. */
  if (trimmed->contents.number > 0 && trimmed->contents.list[0]->text.end > 0
      && trimmed->contents.list[0]->text.text[0] == '(')
    {
      /* The Perl code here accounts for matching parentheses in the manual 
         name.  The Info reader also handles this, for whatever reason. */

      ELEMENT *e;
      char *closing_bracket;

      manual = new_element (ET_NONE);

      /* If the first contents element is "(" alone, discard it, otherwise
         remove the leading "(". */
      if (trimmed->contents.list[0]->text.end > 1)
        {
          /* Replace the first element with another element with the leading
             "(" removed. */
          /* TODO: Would it be simpler to split the text element
             in node->contents as well, to avoid having out-of-tree
             elements? */
          ELEMENT *first;
          first = malloc (sizeof (ELEMENT));
          memcpy (first, trimmed->contents.list[0], sizeof (ELEMENT));
          first->parent_type = route_not_in_tree;
          first->text.text = malloc (first->text.space);
          memcpy (first->text.text,
                  trimmed->contents.list[0]->text.text + 1,
                  trimmed->contents.list[0]->text.end);
          first->text.end--;
          trimmed->contents.list[0] = first;
        }
      else
        {
          (void) remove_from_contents (trimmed, 0);
          /* Note the removed element still is present in the original
             node->contents in the main tree. */
        }

      while (trimmed->contents.number > 0)
        {
          ELEMENT *e = remove_from_contents (trimmed, 0);

          if (e->text.end == 0
              || !(closing_bracket = strchr (e->text.text, ')')))
            {
              /* Put this element in the manual contents. */
              add_to_contents_as_array (manual, e);
            }
          else /* ')' in text - possible end of filename component */
            {
              /* Split the element in two, putting the part before the ")"
                 in the manual name, leaving the part afterwards for the
                 node name. */
              /* TODO: Same as above re route_not_in_tree. */
              ELEMENT *before, *after;

              if (closing_bracket > e->text.text)
                {
                  before = new_element (ET_NONE);
                  before->parent_type = route_not_in_tree;
                  before->parent = node; // FIXME - try not to set this
                  text_append_n (&before->text, e->text.text,
                                 closing_bracket - e->text.text);
                  add_to_contents_as_array (manual, before);
                }

              /* Skip ')' and any following whitespace.
                 Note that we don't manage to skip any multibyte
                 UTF-8 space characters here. */
              closing_bracket++;
              closing_bracket += strspn (closing_bracket, whitespace_chars);
              if (*closing_bracket)
                {
                  after = new_element (ET_NONE);
                  text_append_n (&after->text, closing_bracket,
                                 e->text.text + e->text.end - closing_bracket);

                  insert_into_contents (trimmed, after, 0);
                  after->parent_type = route_not_in_tree;
                  after->parent = node;
                }
              if (e->parent_type == route_not_in_tree)
                destroy_element (e);
              break;
            }
        }

      result->manual_content = manual;
    }

  /* If anything left, it is the node name. */
  if (trimmed->contents.number > 0)
    {
      trimmed->parent_type = route_not_in_tree;
      trimmed->parent = node;
      result->node_content = trimmed;
      result->normalized = convert_to_normalized (trimmed);
    }
  else
    {
      result->node_content = 0;
      result->normalized = "";
      destroy_element (trimmed);
    }
  return result;
}

/* Array of recorded @float's. */
FLOAT_RECORD *floats_list = 0;
size_t floats_number = 0;
size_t floats_space = 0;

int
parse_float_type (ELEMENT *current)
{
  ELEMENT *type_contents;
  EXTRA_FLOAT_TYPE *eft;
  eft = malloc (sizeof (EXTRA_FLOAT_TYPE));
  eft->content = 0;
  eft->normalized = 0;

  if (current->args.number > 0)
    {
      type_contents = trim_spaces_comment_from_content 
        (args_child_by_index(current, 0));
      if (type_contents->contents.number > 0)
        {
          char *normalized;
          normalized = convert_to_normalized (type_contents);
          eft->content = type_contents;
          if (normalized[strspn (normalized, "-")] != '\0')
            eft->normalized = normalized;
          /* TODO: why do we check there's a character that isn't '-'? */

          add_extra_float_type (current, "type", eft);
          return 1;
        }
      else
        {
          destroy_element (type_contents);
        }
    }
  eft->normalized = "";
  add_extra_float_type (current, "type", eft);
  return 0;
}

/* Actions to be taken at the end of a line that started a block that
   has to be ended with "@end". */
ELEMENT *
end_line_starting_block (ELEMENT *current)
{
  enum context c;
  c = pop_context ();
  if (c != ct_line)
    abort ();

  // 2881
  if (current->parent->cmd == CM_multitable)
    {
      /* Parse prototype row for a @multitable.  Handling
         of @columnfractions is done elsewhere. */

      int i;
      ELEMENT *prototypes = new_element (ET_NONE);
      prototypes->parent_type = route_not_in_tree;

      for (i = 0; i < current->contents.number; i++)
        {
          ELEMENT *e = contents_child_by_index(current, i);

          if (e->type == ET_bracketed)
            {
              /* Copy and change the type of the element. */

              ELEMENT *new;
              new = malloc (sizeof (ELEMENT));
              memcpy (new, e, sizeof (ELEMENT));
              new->type = ET_bracketed_multitable_prototype;
              new->parent = 0;
              new->extra_number = 0;
              new->parent_type = route_not_in_tree;
              add_to_contents_as_array (prototypes, new);
            }
          else if (e->text.end > 0) // 2893
            {
              /* Split the text up by whitespace. */
              char *p, *p2;
              p = e->text.text;
              while (1)
                {
                  ELEMENT *new;
                  p2 = p + strspn (p, whitespace_chars);
                  if (!*p2)
                    break;
                  p = p2 + strcspn (p2, whitespace_chars);
                  new = new_element (ET_row_prototype);
                  new->parent_type = route_not_in_tree;
                  text_append_n (&new->text, p2, p - p2);
                  add_to_contents_as_array (prototypes, new);
                }
            }
          else // 2913
            {
              // Perl code was sceptical whether we could get here,
              // but we got here from t/21multitable.t on 2015.11.30.
              if (!e->cmd)
                {
                  command_warn (current, "unexpected argument on @%s line:",
                                command_name(current->cmd));
                  // TODO: Convert argument to Texinfo
                }
              else if (e->cmd != CM_c && e->cmd != CM_comment)
                {
                  add_to_contents_as_array (prototypes, e);
                }
            }
        }

      {
      char *s; /* FIXME: could just use prototypes instead */
      int max_columns = prototypes->contents.number;
      asprintf (&s, "%d", max_columns);
      add_extra_string (current->parent, "max_columns", s);
      if (max_columns == 0)
        command_warn (current->parent, "empty multitable");
      }
      add_extra_contents (current->parent, "prototypes", prototypes);
    }
  else
    {
      isolate_last_space (current, ET_space_at_end_block_command); // 2939
      register_command_arg (current, "block_command_line_contents");
    }

  if (current->parent->cmd == CM_float) // 2943
    {
      ELEMENT *f = current->parent;
      char *type = "";
      current->parent->line_nr = line_nr;
      if (current->parent->args.number > 0)
        {
          KEY_PAIR *k;
          EXTRA_FLOAT_TYPE *eft;
          if (current->parent->args.number > 1)
            {
              // 2950
              NODE_SPEC_EXTRA *float_label;
              float_label = parse_node_manual (args_child_by_index (f, 1));
              // TODO check_internal_node

              if (float_label
                  && float_label->node_content
                  && *(float_label->normalized
                       + strspn (float_label->normalized, "-")) != '\0')
                {
                  /* TODO: Why check if there is a character that isn't '-'? */
                  register_label (f, float_label);
                }
            }
          parse_float_type (f);
          k = lookup_extra_key (f, "type");
          if (k)
            {
              eft = (EXTRA_FLOAT_TYPE *) k->value;
              type = eft->normalized;
            }
        }
      // add to global 'floats' array
      if (floats_number == floats_space)
        {
          floats_list = realloc (floats_list,
                                 (floats_space += 5) * sizeof (FLOAT_RECORD));
        }
      floats_list[floats_number].type = type;
      floats_list[floats_number++].element = f;
      if (current_section)
        add_extra_element (f, "float_section", current_section);
    }
  current = current->parent; //2965
  //counter_pop (&count_remaining_args);

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
  remove_empty_content_arguments (current);

  if (command_flags(current) & CF_blockitem) // 2981
    {
      if (current->cmd == CM_enumerate)
        {
          char *spec = "1";
          KEY_PAIR *k;

          k = lookup_extra_key (current, "block_command_line_contents");
          if (k)
            {
              ELEMENT *e = k->value;
              if (e->contents.number >= 1)
                {
                  ELEMENT *f, *g;
                  f = contents_child_by_index (e, 0);
                  if (f->contents.number > 1)
                    command_error (current, "superfluous argument to @%s",
                                   command_name(current->cmd));
                  g = contents_child_by_index (f, 0);
                  if (g->text.end == 1
                      && isalnum (g->text.text[0]))
                    {
                      spec = strdup (g->text.text);
                    }
                  else
                    command_error (current, "bad argument to @%s",
                                   command_name(current->cmd));
                }
            }
          add_extra_string (current, "enumerate_specification", spec);
        }
      else if (item_line_command (current->cmd)) // 3002
        {
          KEY_PAIR *k;
          k = lookup_extra_key (current, "command_as_argument");
          if (!k)
            command_error (current,
                           "%s requires an argument: the formatter for @item",
                           command_name(current->cmd));
          else
            {
              ELEMENT *e = k->value;
              if (!(command_flags(e) & CF_brace)
                  || (command_data(e->cmd).data == 0))
                {
                  command_error (current,
                                 "command @%s not accepting argument in brace "
                                 "should not be on @%s line",
                                 command_name(e->cmd),
                                 command_name(current->cmd));
                  k->key = "";
                  k->type = extra_deleted;
                  /* FIXME: Error message for accent commands is done
                     elsewhere (3040). */
                }
            }
        }

      /* check that command_as_argument of the @itemize is alone on the line,
         otherwise it is not a command_as_argument */
      if (current->cmd == CM_itemize) // 3019
        {
          KEY_PAIR *k;
          k = lookup_extra_key (current, "command_as_argument");
          if (k)
            {
              int i;
              ELEMENT *e = args_child_by_index (current, 0);

              for (i = 0; i < e->contents.number; i++)
                {
                  if (contents_child_by_index (e, i) == k->value)
                    {
                      i++;
                      break;
                    }
                }
              for (; i < e->contents.number; i++)
                {
                  ELEMENT *f = contents_child_by_index (e, i);
                  if (f->cmd != CM_c
                      && f->cmd != CM_comment
                      && !(f->text.end > 0
                           && !*(f->text.text
                                 + strspn (f->text.text, whitespace_chars))))
                    {
                      k->value->type = ET_NONE;
                      k->key = "";
                      k->type = extra_deleted;
                      break;
                    }
                }
            }
        }

      // 3040 Check if command_as_argument isn't an accent command
      if (current->cmd == CM_itemize || item_line_command(current->cmd))
        {
          KEY_PAIR *k = lookup_extra_key (current, "command_as_argument");
          if (k && k->value)
            {
              enum command_id cmd = k->value->cmd;
              if (cmd && (command_data(cmd).flags & CF_accent))
                {
                  command_warn (current, "accent command `@%s' "
                                "not allowed as @%s argument",
                                command_name(cmd),
                                command_name(current->cmd));
                  k->key = "";
                  k->value = 0;
                  k->type = extra_deleted;
                  k = lookup_extra_key (current,
                                        "block_command_line_contents");
                  if (k)
                    {
                      k->key = ""; k->type = extra_deleted;
                    }
                }
            }
        }

      /* 3052 - if no command_as_argument given, default to @bullet for
         @itemize, and @asis for @table. */
      if (current->cmd == CM_itemize
        && !lookup_extra_key (current, "block_command_line_contents"))
        {
          ELEMENT *e, *contents, *contents2;

          e = new_element (ET_command_as_argument);
          e->cmd = CM_bullet;
          e->parent_type = route_not_in_tree;
          e->parent = current;
          add_extra_element (current, "command_as_argument", e);

          contents = new_element (ET_NONE);
          contents2 = new_element (ET_NONE);
          contents2->parent_type = route_not_in_tree;
          add_to_contents_as_array (contents2, e);
          add_to_element_contents (contents, contents2);
          add_extra_contents_array (current, "block_command_line_contents",
                                        contents);
        }
      else if (item_line_command (current->cmd)
          && !lookup_extra_key (current, "command_as_argument"))
        { // 3064
          ELEMENT *e, *contents, *contents2;

          e = new_element (ET_command_as_argument);
          e->cmd = CM_asis;
          e->parent_type = route_not_in_tree;
          e->parent = current;
          add_extra_element (current, "command_as_argument", e);

          contents = new_element (ET_NONE);
          contents2 = new_element (ET_NONE);
          contents2->parent_type = route_not_in_tree;
          add_to_contents_as_array (contents2, e);
          add_to_element_contents (contents, contents2);
          add_extra_contents_array (current, "block_command_line_contents",
                                        contents);
          // FIXME: code duplication
        }

      {
        ELEMENT *bi = new_element (ET_before_item);
        add_to_element_contents (current, bi);
        current = bi;
      }
    } /* CF_blockitem */

  // 3077
  if (command_flags(current) & CF_menu)
    {
      /* Start reading a menu.  Processing will continue in
         handle_menu in menus.c. */

      ELEMENT *menu_comment = new_element (ET_menu_comment);
      add_to_element_contents (current, menu_comment);
      current = menu_comment;
      debug ("MENU_COMMENT OPEN");
      push_context (ct_preformatted);
    }
  current = begin_preformatted (current);

  return current;
}

// 3100
/* Actions to be taken at the end of an argument to a line command
   not starting a block.  @end is processed in here. */
static ELEMENT *
end_line_misc_line (ELEMENT *current)
{
  enum command_id cmd;
  int arg_type;
  enum context c;
  ELEMENT *misc_cmd;
  char *end_command = 0;
  enum command_id end_id;

  isolate_last_space (current, 0);

  current = current->parent;
  misc_cmd = current;
  cmd = current->cmd;
  if (!cmd)
    abort ();

  arg_type = command_data(cmd).data;
   
  /* Check 'line' is top of the context stack */
  c = pop_context ();
  if (c != ct_line)
    {
      /* error */
      abort ();
    }

  // 3114
  debug ("MISC END %s", command_name(cmd));

  if (arg_type > 0)
    {
      ELEMENT *args = parse_line_command_args (current);
      if (args)
        add_extra_misc_args (current, "misc_args", args);
    }
  else if (arg_type == MISC_text) /* 3118 */
    {
      char *text = 0;
      int superfluous_arg = 0;
      int i;
      ELEMENT *trimmed = 0;

      if (current->args.number > 0)
        {
          trimmed = trim_spaces_comment_from_content
            (args_child_by_index(current, 0));

          if (trimmed->contents.number > 1
              || (trimmed->contents.number == 1
                  && !trimmed->contents.list[0]->text.text))
            superfluous_arg = 1;

          if (trimmed->contents.number > 0)
            text = trimmed->contents.list[0]->text.text;
        }

      if (!text)
        text = "";
      destroy_element (trimmed);

      if (!text || !strcmp (text, ""))
        {
          if (!superfluous_arg)
            line_warn ("@%s missing argument", command_name(cmd)); // 3123
          add_extra_string (current, "missing_argument", "1");
        }
      else
        {
          add_extra_string (current, "text_arg", text);
          if (current->cmd == CM_end) /* 3128 */
            {
              char *line = text;

              /* Set end_command - used below. */
              end_command = read_command_name (&line);
              if (end_command)
                {
                  /* Check if argument is a block Texinfo command. */
                  end_id = lookup_command (end_command);
                  if (end_id == 0 || !(command_data(end_id).flags & CF_block))
                    {
                      command_warn (current, "unknown @end %s", end_command);
                      free (end_command); end_command = 0;
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
                          enum command_id popped;
                          if (conditional_number == 0)
                            goto conditional_stack_fail;
                          popped = pop_conditional_stack ();
                          if (popped != end_id)
                            {
                              push_conditional_stack (popped);
                              goto conditional_stack_fail;
                            }
                          if (0)
                            {
                          conditional_stack_fail:
                              command_error (current, "unmatched `@end'");
                              end_command = 0;
                            }
                        }
                      if (end_command)
                        {
                          add_extra_string (current, "command_argument",
                                            strdup (end_command));
                        }
                      if (end_command
                          && (superfluous_arg
                             || line[strspn (line, whitespace_chars)] != '\0'))
                        {
                          char *line, *line2;
                          line = convert_to_texinfo (current->args.list[0]);

                          line2 = line;
                          line2 += strspn (line2, whitespace_chars);
                          free (read_command_name (&line2));
                          command_error (current,
                                         "superfluous argument to @end %s: "
                                         "%s", end_command, line2);
                          superfluous_arg = 0; /* Don't issue another error
                                                 message below. */
                          free (line);
                        }
                    }
                }
              else
                {
                  command_error (current, "bad argument to @end: %s", line);
                }
            }
          else if (superfluous_arg)
            {
              /* An error message is issued below. */
            }
          else if (current->cmd == CM_include) // 3166
            {
              debug ("Include %s", text);
              input_push_file (text);
            }
          else if (current->cmd == CM_documentencoding) // 3190
            {
              int i; char *p;
              // TODO: ignore_global_commands
              /* See tp/Texinfo/Encoding.pm (whole file) */

              text = strdup (text);
              for (p = text; *p; p++)
                *p = tolower (*p);
              add_extra_string (current, "input_encoding_name", text); // 3199

              {
              static char *canonical_encodings[] = {
                "us-ascii", "utf-8", "iso-8859-1",
                "iso-8859-15","iso-8859-2","koi8-r", "koi8-u",
                0
              };

              for (i = 0; (canonical_encodings[i]); i++)
                {
                  if (!strcasecmp (text, canonical_encodings[i]))
                    break;
                }
              if (!(canonical_encodings[i]))
                {
                  command_warn (current, "encoding `%s' is not a "
                                "canonical texinfo encoding");
                }
              }

              {
              struct encoding_map {
                  char *from; char *to;
              };
              static struct encoding_map map[] = {
                  "utf-8", "utf-8-strict"
              };
              char *perl_encoding = text;
              for (i = 0; i < sizeof map / sizeof *map; i++)
                {
                  if (!strcasecmp (text, map[i].from))
                    {
                      perl_encoding = map[i].to;
                      break;
                    }
                }
              add_extra_string (current, "input_perl_encoding",
                                perl_encoding);
              }


              global_info.input_encoding_name = text; // 3210

              // TODO: Need to convert input in input.c from this encoding.
              // (INPUT_PERL_ENCODING in Perl version)
            }
          else if (current->cmd == CM_documentlanguage) // 3223
            {
            }
        }
      if (superfluous_arg)
        {
          command_error (current, "bad argument to @%s", 
                         command_name(current->cmd));
          // TODO say what the bad argument is
        }
    }
  else if (current->cmd == CM_node) /* 3235 */
    {
      int i;
      ELEMENT *arg;

      NODE_SPEC_EXTRA **nodes_manuals;

      /* Construct 'nodes_manuals' array.  Maximum of four elements
         (node name, up, prev, next). */
      nodes_manuals = malloc (sizeof (NODE_SPEC_EXTRA *) * 5);

      for (i = 0; i < current->args.number && i < 4; i++)
        {
          arg = current->args.list[i];
          nodes_manuals[i] = parse_node_manual (arg);
        }
      nodes_manuals[i] = 0;

      add_extra_node_spec_array (current, "nodes_manuals", nodes_manuals);

      /* Also set 'normalized' here.  The normalized labels are actually 
         the keys of "labels_information($parser)". */
      //nodes_manuals[0]->normalized
       // = convert_to_normalized (nodes_manuals[0]->node_content);

      /*Check that the node name doesn't have a filename element for 
        referring to an external manual (_check_internal_node), and that it 
        is not empty (_check_empty_node).  */
      //check_node_label ();

      if (nodes_manuals[0])
        {
          add_extra_contents (current, "node_content",
                              nodes_manuals[0]->node_content);

          /* This sets 'node_content' and 'normalized' on the node, among
             other things (which were already set in parse_node_manual).
             Are we normalizing the name twice? */
          register_label (current, nodes_manuals[0]);
        }

      current_node = current;
    }
  else if (current->cmd == CM_listoffloats) /* 3248 */
    {
      parse_float_type (current);
    }
  else
    {
      ELEMENT *misc_content;

      misc_content = trim_spaces_comment_from_content 
        (last_args_child(current));

      if (current->cmd != CM_top && misc_content->contents.number == 0)
        {
          command_warn (current, "@%s missing argument", 
                        command_name(current->cmd));
          add_extra_string (current, "missing_argument", "1");
        }
      else
        {
          // 3266
          add_extra_contents (current, "misc_content", misc_content);
          if ((current->parent->cmd == CM_ftable
               || current->parent->cmd == CM_vtable)
              && (current->cmd == CM_item || current->cmd == CM_itemx))
            {
              enter_index_entry (current->parent->cmd,
                                 current->cmd,
                                 current, misc_content);
            }
          else
            {
              // 3273 possibly check for @def... command
            }

        }

      /* All the other "line" commands" */
      // 3273 - warning about missing argument

      /* Index commands */
      if (command_flags(current) & CF_index_entry_command)
        {
          ELEMENT *contents;
          contents = last_args_child(current);

          // 3274
          enter_index_entry (current->cmd, current->cmd, current,
                             misc_content);
          current->type = ET_index_entry_command;
        }
    }

  current = current->parent; /* 3285 */
  if (end_command) /* Set above */
    {
      /* More processing of @end */
      ELEMENT *end_elt;

      debug ("END COMMAND %s", end_command);
      free (end_command);

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
            {
              /* shouldn't get here, but got here
                 on 2015.11.30 for t/16raw.t */
              //abort (); // 3335
            }
          else
            { // 3295
              // FIXME: end_elt correct?
              add_extra_element (end_elt, "command", closed_command);
              add_extra_element (closed_command, "end_command", end_elt);
              close_command_cleanup (closed_command);

              // 3301 INLINE_INSERTCOPYING

              add_to_element_contents (closed_command, end_elt); // 3321

              // 3324 ET_menu_comment
              if (command_flags(closed_command) & CF_menu
                  && current_context () == ct_menu)
                {
                  ELEMENT *e;
                  debug ("CLOSE menu but still in menu context");
                  e = new_element (ET_menu_comment);
                  add_to_element_contents (current, e);
                  current = e;
                  push_context (ct_preformatted);
                }
            }
          if (close_preformatted_command (end_id))
            current = begin_preformatted (current);
        }
      else
        {
          /* The "@end" line does not appear in the final tree for a
             conditional block. */
          destroy_element_and_children (end_elt);
        }
    } /* 3340 */
  else
    {
      if (close_preformatted_command (cmd))
        current = begin_preformatted (current);
    }

  /* 3346 included file */

  /* 3350 */
  if (cmd == CM_setfilename && (current_node || current_section))
    {
      command_warn (misc_cmd, "@setfilename after the first element");
    }
  /* 3355 columnfractions */
  else if (cmd == CM_columnfractions)
    {
      ELEMENT *before_item;
      KEY_PAIR *misc_args;

      /* Check if in multitable. */
      if (!current->parent || current->parent->cmd != CM_multitable)
        {
          command_error (current,
            "@columnfractions only meaningful on a @multitable line");
        }
      else
        {
          // pop and check context stack
          pop_context (); /* ct_line */;

          current = current->parent;

          if ((misc_args = lookup_extra_key (misc_cmd, "misc_args")))
            {
              char *s;
              add_extra_misc_args (current, "columnfractions", 
                                       misc_args->value);
              asprintf (&s, "%d", misc_args->value->contents.number);
              add_extra_string (current, "max_columns", s);
            }
          else
              add_extra_string (current, "max_columns", "0");

          before_item = new_element (ET_before_item);
          add_to_element_contents (current, before_item);
          current = before_item;
        }
    }
  else if (command_data(cmd).flags & CF_root) /* 3380 */
    {
      current = last_contents_child (current);
      if (cmd == CM_node)
        counter_pop (&count_remaining_args);
      
      /* 3383 Destroy all contents (why do we do this?) */
      while (last_contents_child (current))
        destroy_element (pop_element_from_contents (current));

      /* Set 'associated_section' extra key for a node. */
      if (cmd != CM_node && cmd != CM_part)
        {
          if (current_node)
            {
              if (!lookup_extra_key (current_node, "associated_section"))
                {
                  add_extra_element
                    (current_node, "associated_section", current);
                  add_extra_element
                    (current, "associated_node", current_node);
                }
            }

          // "current parts" - 3394

          current_section = current;
        }
    } /* 3416 */

  return current;
}

/* 2610 */
/* Actions to be taken when a whole line of input has been processed */
ELEMENT *
end_line (ELEMENT *current)
{
  ELEMENT *current_old = current; /* Used at very end of function */

  // 2621
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

          current = end_paragraph (current, 0, 0);

          /* Add empty_line to higher-level element. */
          add_to_element_contents (current, e);
        }
      else if (current->type == ET_preformatted
               && current->parent->type == ET_menu_entry_description)
        {
          ELEMENT *empty_line, *e;
          empty_line = pop_element_from_contents (current);
          if (current->contents.number == 0)
            {
              current = current->parent;
              pop_element_from_contents (current);
            }
          else
            current = current->parent;

          pop_context (); //ct_preformatted

          current = current->parent->parent;
          e = new_element (ET_menu_comment);
          add_to_element_contents (current, e);

          current = e;
          e = new_element (ET_preformatted);
          add_to_element_contents (current, e);

          current = e;
          e = new_element (ET_after_description_line);
          text_append (&e->text, empty_line->text.text);
          destroy_element (empty_line);
          add_to_element_contents (current, e);

          push_context (ct_preformatted);
          debug ("MENU: END DESCRIPTION, OPEN COMMENT");
        }
      else if (in_paragraph_context (current_context ()))
        {
          current = end_paragraph (current, 0, 0);
        }
    }

  // 2667
  /* The end of the line of a menu. */
  else if (current->type == ET_menu_entry_name
           || current->type == ET_menu_entry_node)
    {
      ELEMENT *end_comment = 0;
      int empty_menu_entry_node = 0;

      if (current->type == ET_menu_entry_node)
        {
          ELEMENT *last = last_contents_child (current);

          if (current->contents.number > 0
              && (last->cmd == CM_c || last->cmd == CM_comment))
            {
              end_comment = pop_element_from_contents (current);
            }

          /* If contents empty or is all whitespace. */
          if (current->contents.number == 0
              || (current->contents.number == 1
                  && last->text.end > 0
                  && !last->text.text[strspn (last->text.text, 
                                              whitespace_chars)]))
            {
              empty_menu_entry_node = 1;
              if (end_comment)
                add_to_element_contents (current, end_comment);
            }
        }

      // 2689
      /* Abort the menu entry if there is no destination node given. */
      if (empty_menu_entry_node || current->type == ET_menu_entry_name)
        {
          ELEMENT *menu, *menu_entry, *description_or_menu_comment = 0;
          debug ("FINALLY NOT MENU ENTRY");
          menu = current->parent->parent;
          menu_entry = pop_element_from_contents (menu);
          if (menu->contents.number > 0
              && last_contents_child(menu)->type == ET_menu_entry)
            { // 2697
              ELEMENT *entry, *description = 0;
              int j;

              entry = last_contents_child(menu);
              for (j = entry->args.number - 1; j >= 0; j--)
                {
                  ELEMENT *e = args_child_by_index (entry, j);
                  if (e->type == ET_menu_entry_description)
                    {
                      description = e;
                      break;
                    }
                }
              if (description)
                description_or_menu_comment = description;
              else
                { // 2707
                  /* Normally this cannot happen. */
                  abort ();
                }
            }
          else if (menu->contents.number > 0
                   && last_contents_child(menu)->type == ET_menu_comment)
            { // 2716
              description_or_menu_comment = last_contents_child(menu);
            }
          if (description_or_menu_comment)
            {
              current = description_or_menu_comment;
              if (current->contents.number > 0
                  && last_contents_child(current)->type == ET_preformatted)
                current = last_contents_child(current);
              else // 2725
                {
                  /* This should not happen */
                  //abort ();
                  ELEMENT *e;
                  e = new_element (ET_preformatted);
                  add_to_element_contents (current, e);
                  current = e;
                }
              push_context (ct_preformatted);
            }
          else // 2735
            {
              ELEMENT *e;
              e = new_element (ET_menu_comment);
              add_to_element_contents (menu, e);
              current = e;
              e = new_element (ET_preformatted);
              add_to_element_contents (current, e);
              current = e;
              push_context (ct_preformatted);
              debug ("THEN MENU_COMMENT OPEN");
            }
          {
          int i, j;
          for (i = 0; i < menu_entry->args.number; i++)
            {
              ELEMENT *arg = args_child_by_index(menu_entry, i);
              if (arg->text.end > 0)
                current = merge_text (current, arg->text.text);
              else
                {
                  ELEMENT *e;
                  for (j = 0; j < arg->contents.number; j++)
                    {
                      e = contents_child_by_index (arg, j);
                      if (e->text.end > 0)
                        {
                          current = merge_text (current, e->text.text);
                          destroy_element (e);
                        }
                      else
                        {
                          add_to_element_contents (current, e);
                        }
                    }
                }
              destroy_element (arg);
            }
          destroy_element (menu_entry);
          }
        }
      else // 2768
        {
          debug ("MENU ENTRY END LINE");
          current = current->parent;
          current = enter_menu_entry_node (current);
          if (end_comment)
            add_to_element_contents (current, end_comment);
        }
    }

  /* End of a definition line, like @deffn */ // 2778
  else if (current->parent && current->parent->type == ET_def_line)
    {
      enum command_id def_command, original_def_command;
      DEF_ARGS_EXTRA *arguments = 0;
      KEY_PAIR *k;

      if (pop_context () != ct_def)
        abort ();

      k = lookup_extra_key (current->parent, "original_def_cmdname");
      if (k)
        original_def_command = lookup_command ((char *) k->value);
      else
        original_def_command = current->parent->parent->cmd;
      // TODO: What if k is not defined?

      def_command = original_def_command;
      /* Strip an trailing x from the command, e.g. @deffnx -> @deffn */
      if (command_data(def_command).flags & CF_misc)
        {
          char *stripped = strdup (command_name(def_command));
          stripped[strlen (stripped) - 1] = '\0';
          def_command = lookup_command (stripped);
          free (stripped);
        }

      arguments = parse_def (def_command, current->contents);

      /* Now record the index entry. */
      if (arguments)
        {
          ELEMENT *name = 0, *class = 0; /* From arguments. */
          ELEMENT *index_entry = 0; /* Index entry text. */
          char *label;
          int i;

          add_extra_def_args (current->parent, "def_args", arguments);

          /* We use the keys "name" and "class" from the arguments. */
          for (i = 0; i < arguments->nelements; i++)
            {
              label = arguments->labels[i];
              if (!strcmp (label, "name"))
                name = arguments->elements[i];
              else if (!strcmp (label, "class"))
                class = arguments->elements[i];
            }

          if (name) // 2811
            {
              /* Set index_entry unless an empty ET_bracketed_def_content. */
              if (name->type != ET_bracketed_def_content
                  || name->contents.number >= 2)
                index_entry = name;
              else if (name->contents.number == 1)
                {
                  char *t = name->contents.list[0]->text.text;
                  if (t && t[strspn (t, whitespace_chars)] != '\0')
                    index_entry = name;
                }
            }

          if (index_entry) // 2822
            {
              ELEMENT *index_contents = new_element (ET_NONE);
              index_contents->parent_type = route_not_in_tree;
              add_to_contents_as_array (index_contents, index_entry);
              enter_index_entry (def_command,
                                 original_def_command,
                                 current->parent,
                                 index_contents); // 2853
            }
          else
            {
              command_warn (current->parent, "missing name for @%s",
                            command_name (original_def_command));
            }
        }
      else
        {
          command_warn (current->parent, "missing category for @%s",
                        command_name (original_def_command));
        }

      current = current->parent->parent; // 2868
      current = begin_preformatted (current);
    }

  // 2872
  /* End of a line starting a block. */
  else if (current->type == ET_block_line_arg)
    {
      current = end_line_starting_block (current);
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
      current = end_line_misc_line (current);
    }
  /* 3419 */
  else if (current->contents.number == 1
           && current->contents.list[0]->type == ET_empty_line_after_command
           || current->contents.number == 2
           && current->contents.list[0]->type == ET_empty_line_after_command
           && (current->contents.list[1]->cmd == CM_c
               || current->contents.list[1]->cmd == CM_comment))
    {
      if (current->type == ET_preformatted
          || current->type == ET_rawpreformatted)
        {
          /* Empty line after a @menu, or before a preformatted.  Reparent
             to the menu or other format. */
          ELEMENT *parent, *to_reparent;

          parent = current->parent;
          if (parent->type == ET_menu_comment
              && parent->contents.number == 1)
            {
              parent = parent->parent;
            }
          to_reparent = pop_element_from_contents (parent);
          debug ("LINE AFTER COMMAND IN PREFORMATTED");
          while (current->contents.number > 0)
            {
              ELEMENT *e;
              e = remove_from_contents (current, 0);
              add_to_element_contents (parent, e);
            }
          add_to_element_contents (parent, to_reparent);
        }
    }

  /* 'line' or 'def' at top of "context stack" - this happens when
     line commands are nested (always incorrectly?) */
  if (current_context () == ct_line || current_context () == ct_def)
    {
      debug ("Still opened line command");
      if (current_context () == ct_def)
        {
          while (current->parent
                 && current->parent->type != ET_def_line)
            {
              current = close_current (current, 0, 0);
            }
        }
      else
        {
          while (current->parent
                 && current->type != ET_block_line_arg
                 && current->type != ET_misc_line_arg)
            {
              current = close_current (current, 0, 0);
            }
        }

      /* 3470 Check for infinite loop bugs */
      if (current == current_old)
        abort ();

      current = end_line (current);
    }
  return current;
} /* end_line 3487 */

