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

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include <stdlib.h>
#include <stdio.h>

#include "parser.h"
#include "input.h"
#include "labels.h"
#include "indices.h"
#include "api.h"
#include "errors.h"

ELEMENT *Root;

static void
reset_floats ()
{
  floats_number = 0;
}

void
reset_parser (void)
{
  wipe_user_commands ();
  init_index_commands ();
  wipe_errors ();
  reset_context_stack ();
  reset_floats ();
  current_node = current_section = 0;
}

/* Set ROOT to root of tree obtained by parsing FILENAME. */
void
parse_file (char *filename)
{
  debug_output = 1;
  reset_parser ();
  parse_texi_file (filename);
}

ELEMENT *
get_root (void)
{
  return Root;
}

/* Set ROOT to root of tree obtained by parsing the Texinfo code in STRING.
   Used for parse_texi_line. */
void
parse_string (char *string)
{
  ELEMENT *root;
  reset_parser ();
  root = new_element (ET_root_line);
  input_push_text (strdup (string), 0);
  Root = parse_texi (root);
}

/* Used for parse_texi_text. */
void
parse_text (char *string)
{
  ELEMENT *root;
  reset_parser ();
  root = new_element (ET_text_root);
  input_push_text_with_line_nos (strdup (string), 1);
  Root = parse_texi (root);
}


char *
element_type_name (ELEMENT *e)
{
  return element_type_names[(e)->type];
}

int
num_contents_children (ELEMENT *e)
{
  return e->contents.number;
}

int
num_args_children (ELEMENT *e)
{
  return e->args.number;
}

static void element_to_perl_hash (ELEMENT *e);

/* Return reference to Perl array built from e.  If any of
   the elements in E don't have 'hv' set, set it to an empty
   hash table, or create it if route_not_in_tree. */
static SV *
build_perl_array (ELEMENT_LIST *e)
{
  SV *sv;
  AV *av;
  int i;

  dTHX;

  av = newAV ();
  sv = newRV_inc ((SV *) av);
  for (i = 0; i < e->number; i++)
    {
      if (!e->list[i]) /* For arrays only, allow elements to be undef. */
        av_push (av, newSV (0));
      if (!e->list[i]->hv)
        {
          if (e->list[i]->parent_type != route_not_in_tree)
            e->list[i]->hv = newHV ();
          else
            {
              /* WARNING: This is possibly recursive. */
              element_to_perl_hash (e->list[i]);
            }
        }
      av_push (av, newRV_inc ((SV *) e->list[i]->hv));
    }
  return sv;
}

/* Return reference to hash corresponding to VALUE. */
static SV *
build_node_spec (NODE_SPEC_EXTRA *value)
{
  HV *hv;

  dTHX;

  hv = newHV ();

  if (value->manual_content)
    {
      hv_store (hv, "manual_content", strlen ("manual_content"),
                build_perl_array (&value->manual_content->contents), 0);
    }

  if (value->node_content)
    {
      hv_store (hv, "node_content", strlen ("node_content"),
                build_perl_array (&value->node_content->contents), 0);
    }

  if (value->normalized && *value->normalized)
    {
      hv_store (hv, "normalized", strlen ("normalized"),
                newSVpv (value->normalized, 0), 0);
    }
  return newRV_inc ((SV *)hv);
}

/* Set E->hv and 'hv' on E's descendants.  e->parent->hv is assumed
   to already exist. */
static void
element_to_perl_hash (ELEMENT *e)
{
  SV *sv;

  dTHX;

  /* e->hv may already exist if there was an extra value elsewhere
     referring to e. */
  if (!e->hv)
    {
      e->hv = newHV ();
    }

  if (e->parent) // && e->parent_type != route_not_in_tree)
    {
      if (!e->parent->hv)
        e->parent->hv = newHV ();
      sv = newRV_inc ((SV *) e->parent->hv);
      hv_store (e->hv, "parent", strlen ("parent"), sv, 0);
    }
  /* FIXME: this assumes we don't have nested out-of-tree subtrees,
     i.e. the only out-of-tree elements are simple text elements
     (or other elements with no children) - otherwise we shall fail
     to set "parent" properly. */
  /* FIXME: Sometimes extra values have parent set - try to remove this
     in the Perl code as well. */

  if (e->type)
    {
      if (e->cmd != CM_verb)
        {
          sv = newSVpv (element_type_names[e->type], 0);
        }
      else
        {
          char c = (char) e->type;
          sv = newSVpv (&c, 1);
        }
      hv_store (e->hv, "type", strlen ("type"), sv, 0);

      /* TODO: Could precompute hash of "type", and also reuse
         the same SV for a single type? */
    }

  if (e->cmd)
    {
      sv = newSVpv (command_name(e->cmd), 0);
      hv_store (e->hv, "cmdname", strlen ("cmdname"), sv, 0);

      /* TODO: Same optimizations as for 'type'. */
    }

  /* FIXME sort out all these special cases */
  if (e->contents.number > 0
      || e->type == ET_text_root
      || e->cmd == CM_image // why image?
      || e->cmd == CM_item && e->parent && e->parent->type == ET_row
      || e->cmd == CM_tab && e->parent && e->parent->type == ET_row
      || e->cmd == CM_anchor
      || e->cmd == CM_macro
      || e->cmd == CM_multitable
      || e->type == ET_menu_entry_name
      || e->type == ET_brace_command_arg
      || e->cmd == CM_TeX
      || (command_data(e->cmd).flags & CF_brace
          && (command_data(e->cmd).data >= 0
              || command_data(e->cmd).data == BRACE_style
              || command_data(e->cmd).data == BRACE_context
              || command_data(e->cmd).data == BRACE_other
              || command_data(e->cmd).data == BRACE_accent
              ))
      || e->cmd == CM_node) // FIXME special case
    // FIXME: Makes no sense to have 'contents' created for glyph commands like
    // @arrow{} or for accent commands.
    {
      AV *av;
      int i;

      av = newAV ();
      sv = newRV_inc ((SV *) av);
      hv_store (e->hv, "contents", strlen ("contents"), sv, 0);
      for (i = 0; i < e->contents.number; i++)
        {
          element_to_perl_hash (e->contents.list[i]);
          sv = newRV_inc ((SV *) e->contents.list[i]->hv);
          av_push (av, sv);
        }
    }

  if (e->args.number > 0)
    {
      AV *av;
      int i;

      av = newAV ();
      sv = newRV_inc ((SV *) av);
      hv_store (e->hv, "args", strlen ("args"), sv, 0);
      for (i = 0; i < e->args.number; i++)
        {
          element_to_perl_hash (e->args.list[i]);
          sv = newRV_inc ((SV *) e->args.list[i]->hv);
          av_push (av, sv);
        }
    }

  if (e->text.space > 0)
    {
      sv = newSVpv (e->text.text, e->text.end);
      if (e->cmd != CM_value)
        hv_store (e->hv, "text", strlen ("text"), sv, 0);
      else
        hv_store (e->hv, "type", strlen ("type"), sv, 0);

      //SvUTF8_on (sv);
      /* We will have to do something like that, but first we need to make sure 
         the strings we have are in UTF-8 to start with.  This would lead to an 
         unnecessary round trip with "@documentencoding ISO-8859-1" for Info 
         and plain text output, when we first convert the characters in the 
         input file to UTF-8, and convert them back again for the output.
      
         The alternative is to leave the UTF-8 flag off, and hope that Perl 
         interprets 8-bit encodings like ISO-8859-1 correctly.  See
         "How does Perl store UTF-8 strings?" in "man perlguts". */
    }

  if (e->extra_number > 0)
    {
      HV *extra;
      int i;
      int all_deleted = 1;
      extra = newHV ();

      for (i = 0; i < e->extra_number; i++)
        {
#define STORE(sv) hv_store (extra, key, strlen (key), sv, 0)
          char *key = e->extra[i].key;
          ELEMENT *f = e->extra[i].value;

          if (e->extra[i].type == extra_deleted)
            continue;
          all_deleted = 0;

          switch (e->extra[i].type)
            {
            case extra_element:
              /* For references to other parts of the tree, create the hash so 
                 we can point to it.  */
              if (!f->hv)
                {
                  if (f->parent_type != route_not_in_tree)
                    {
                      /* TODO: Are there any extra values which are
                         extra_element that are route_not_in_tree?  Consider
                         eliminating use of 'parent_type' to differentiate types
                         of extra value. */
                      f->hv = newHV ();
                    }
                  else
                    element_to_perl_hash (f);
                }
              STORE(newRV_inc ((SV *)f->hv));
              break;
            case extra_element_contents:
              {
              int j;
              STORE(build_perl_array (&f->contents));
              break;
              }
            case extra_element_contents_array:
              {
              /* Like extra_element_contents, but this time output an array
                 of arrays (instead of an array). */
              int j, k;
              AV *av;
              av = newAV ();
              STORE(newRV_inc ((SV *)av));
              for (j = 0; j < f->contents.number; j++)
                {
                  SV *array;
                  ELEMENT *g;

                  g = f->contents.list[j];
                  if (g)
                    array = build_perl_array (&g->contents);
                  else
                    array = newSV (0); /* undef */
                  av_push (av, array);
                }
              break;
              }
            case extra_string:
              { /* A simple string. */
              char *value = (char *) f;
              if (strcmp (key, "level"))
                STORE(newSVpv (value, 0));
              else
                {
                  // FIXME: don't use level as a separate key
                  hv_store (e->hv, key, strlen (key),
                           newSVpv(value, 0), 0);
                }
              break;
              }
            case extra_misc_args:
              {
              int j;
              AV *av;
              av = newAV ();
              STORE(newRV_inc ((SV *)av));
              /* An array of strings. */
              for (j = 0; j < f->contents.number; j++)
                {
                  if (f->contents.list[j]->text.end > 0)
                    {
                      av_push (av,
                               newSVpv (f->contents.list[j]->text.text,
                                        f->contents.list[j]->text.end));
                    }
                  /* else an error? */
                }
              break;
              }
            case extra_node_spec:
              /* A complex structure - see "parse_node_manual" function
                 in end_line.c */
              STORE(build_node_spec ((NODE_SPEC_EXTRA *) f));
              break;
            case extra_node_spec_array:
              {
              int j;
              AV *av;
              NODE_SPEC_EXTRA **array;
              av = newAV ();
              STORE(newRV_inc ((SV *)av));
              array = (NODE_SPEC_EXTRA **) f;
              while (*array)
                {
                  av_push (av, build_node_spec (*array));
                  array++;
                }
              break;
              }
            case extra_index_entry:
            /* A "index_entry" extra key on a command defining an index
               entry.  Unlike the other keys, the value is not in the
               main parse tree, but in the indices_information.  It would
               be much nicer if we could get rid of the need for this key.
               We set this afterwards in build_index_data. */
              break;
            case extra_def_args:
              {
              /* Value is an array of two-element arrays. */
              AV *av, *av2;
              HV *def_parsed_hash;
              int j;
              DEF_ARGS_EXTRA *d = (DEF_ARGS_EXTRA *) f;

              av = newAV ();
              STORE(newRV_inc ((SV *)av));

              /* Also create a "def_parsed_hash" extra value.  The key name
                 for this is hard-coded here. */
              def_parsed_hash = newHV ();
              hv_store (extra, "def_parsed_hash",
                        strlen ("def_parsed_hash"),
                        newRV_inc ((SV *)def_parsed_hash), 0);

              for (j = 0; j < d->nelements; j++)
                {
                  ELEMENT *elt = d->elements[j];
                  char *label = d->labels[j];
                  av2 = newAV ();
                  av_push (av, newRV_inc ((SV *)av2));
                  av_push (av2, newSVpv (label, 0));
                  if (!elt->hv)
                    {
                      /* TODO: Same problem as "extra_element" cross-tree
                         references. */
                      if (elt->parent_type != route_not_in_tree)
                        abort ();
                      element_to_perl_hash (elt);
                    }
                  if (!elt->hv)
                    abort ();
                  av_push (av2, newRV_inc ((SV *)elt->hv));

                  /* Set keys of "def_parsed_hash". */
                  // 2793
                  if (strcmp (label, "spaces")
                      && strcmp (label, "arg") && strcmp (label, "typearg")
                      && strcmp (label, "delimiter"))
                    {
                      hv_store (def_parsed_hash, label, strlen (label),
                                newRV_inc ((SV *)elt->hv), 0);
                    }
                }

              break;
              }
            case extra_float_type:
              {
              EXTRA_FLOAT_TYPE *eft = (EXTRA_FLOAT_TYPE *) f;
              HV *type = newHV ();
              if (eft->content)
                hv_store (type, "content", strlen ("content"),
                          build_perl_array (&eft->content->contents), 0);
              if (eft->normalized)
                hv_store (type, "normalized", strlen ("normalized"),
                          newSVpv (eft->normalized, 0), 0);
              STORE(newRV_inc ((SV *)type));
              break;
              }
            default:
              abort ();
              break;
            }
        }
#undef STORE

      if (!all_deleted)
        hv_store (e->hv, "extra", strlen ("extra"),
                  newRV_inc((SV *)extra), 0);
    }

  if (e->line_nr.line_nr)
    {
#define STORE(key, sv) hv_store (hv, key, strlen (key), sv, 0)
      LINE_NR *line_nr = &e->line_nr;
      HV *hv = newHV ();
      hv_store (e->hv, "line_nr", strlen ("line_nr"),
                newRV_inc((SV *)hv), 0);

      if (line_nr->file_name)
        {
          STORE("file_name", newSVpv (line_nr->file_name, 0));
        }
      else
        STORE("file_name", newSVpv ("", 0));

      if (line_nr->line_nr)
        {
          STORE("line_nr", newSViv (line_nr->line_nr));
        }

      if (line_nr->macro)
        {
          STORE("macro", newSVpv (line_nr->macro, 0));
        }
      else
        STORE("macro", newSVpv ("", 0));
#undef STORE
    }
}

HV *
build_texinfo_tree (void)
{
  element_to_perl_hash (Root);
  return Root->hv;
}

/* Return hash object from label names to target elements.  build_texinfo_tree
   must be called first. */
HV *
build_label_list (void)
{
  HV *label_hash;
  SV *sv;
  int i;

  dTHX;

  label_hash = newHV ();

  for (i = 0; i < labels_number; i++)
    {
      sv = newRV_inc (labels_list[i].target->hv);
      hv_store (label_hash,
                labels_list[i].label, strlen (labels_list[i].label),
                sv, 0);
    }

  return label_hash;
}

/* Return hash for list of @float's that appeared in the file. */
HV *
build_float_list (void)
{
  HV *float_hash;
  SV **type_array;
  SV *sv;
  AV *av;
  int i;

  dTHX;

  float_hash = newHV ();

  for (i = 0; i < floats_number; i++)
    {
      type_array = hv_fetch (float_hash,
                             floats_list[i].type,
                             strlen (floats_list[i].type),
                             0);
      if (!type_array)
        {
          av = newAV ();
          hv_store (float_hash,
                    floats_list[i].type,
                    strlen (floats_list[i].type),
                    newRV_inc ((SV *)av),
                    0);
        }
      else
        {
          av = (AV *)SvRV (*type_array);
        }
      sv = newRV_inc ((SV *)floats_list[i].element->hv);
      av_push (av, sv);
    }

  return float_hash;
}

/* Ensure that I->hv is a hash value for a single entry in 
   $self->{'index_names'}, containing information about a single index. */
static void
build_single_index_data (INDEX *i)
{
#define STORE(key, value) hv_store (hv, key, strlen (key), value, 0)

  HV *hv;
  AV *entries;
  int j;

  dTHX;

  if (!i->hv)
    {
      hv = newHV ();
      i->hv = (void *) hv;
    }
  else
    {
      hv = (HV *) i->hv;
    }

  STORE("name", newSVpv (i->name, 0));
  STORE("in_code", i->in_code ? newSViv(1) : newSViv(0));

  if (i->merged_in)
    {
      /* This index is merged in another one. */
      INDEX *ultimate = ultimate_index (i);

      if (!ultimate->hv)
        {
          ultimate->hv = (void *) newHV ();
          ultimate->contained_hv = (void *) newHV ();
          hv_store (ultimate->hv,
                    "contained_indices",
                    strlen ("contained_indices"),
                    newRV_inc ((SV *)(HV *) ultimate->contained_hv),
                    0);
        }

      hv_store (ultimate->contained_hv, i->name, strlen (i->name),
                newSViv (1), 0);

      STORE("merged_in", newSVpv (ultimate->name, 0));

      /* See also code in end_line.c (parse_line_command_args) <CM_synindex>.
         FIXME: Do we need to keep the original values of contained_indices?
         I don't think so. */
    }

  if (!i->contained_hv)
    {
      i->contained_hv = newHV ();
      STORE("contained_indices", newRV_inc ((SV *)(HV *) i->contained_hv));
    }
  /* Record that this index "contains itself". */
  hv_store (i->contained_hv, i->name, strlen (i->name), newSViv(1), 0);

  if (i->index_number > 0)
    {
      entries = newAV ();
      STORE("index_entries", newRV_inc ((SV *) entries));
    }
#undef STORE

  if (i->index_number > 0)
  for (j = 0; j < i->index_number; j++)
    {
#define STORE2(key, value) hv_store (entry, key, strlen (key), value, 0)
      HV *entry;
      INDEX_ENTRY *e;

      e = &i->index_entries[j];
      entry = newHV ();
      av_push (entries, newRV_inc ((SV *)entry));

      STORE2("index_name", newSVpv (i->name, 0));
      STORE2("index_at_command",
             newSVpv (command_name(e->index_at_command), 0));
      STORE2("index_type_command",
             newSVpv (command_name(e->index_type_command), 0));
      STORE2("command",
             newRV_inc ((SV *)e->command->hv));
      STORE2("number", newSViv (j + 1));
      if (e->content)
        {
          SV **contents_array;
          if (!e->content->hv)
            {
              if (e->content->parent_type != route_not_in_tree)
                abort ();
              element_to_perl_hash (e->content);
            }
          contents_array = hv_fetch (e->content->hv,
                                    "contents", strlen ("contents"), 0);

          if (!contents_array)
            {
              element_to_perl_hash (e->content);
              contents_array = hv_fetch (e->content->hv,
                                         "contents", strlen ("contents"), 0);
            }

          if (contents_array)
            {
              /* Copy the reference to the array. */
              STORE2("content", newRV_inc ((SV *)(AV *)SvRV(*contents_array)));

              /* FIXME: Allow to be different. */
              STORE2("content_normalized",
                     newRV_inc ((SV *)(AV *)SvRV(*contents_array)));
            }
        }
      if (e->node)
        STORE2("node", newRV_inc ((SV *)e->node->hv));

      /* We set this now because the index data structures don't
         exist at the time that the main tree is built. */
      {
      SV **extra_hash;
      extra_hash = hv_fetch (e->command->hv, "extra", strlen ("extra"), 0);
      if (!extra_hash)
        {
          /* There's no guarantee that the "extra" value was set on
             the element. */
          extra_hash = hv_store (e->command->hv, "extra", strlen ("extra"),
                                 newRV_inc ((SV *)newHV ()), 0);
        }

      hv_store ((HV *)SvRV(*extra_hash), "index_entry", strlen ("index_entry"),
                newRV_inc ((SV *)entry), 0);
      }
#undef STORE2
    }
}

/* Return object to be used as $self->{'index_names'} in the perl code.
   build_texinfo_tree must be called before this so all the 'hv' fields
   are set on the elements in the tree. */
HV *
build_index_data (void)
{
  HV *hv;
  INDEX **i, *idx;

  dTHX;

  hv = newHV ();

  for (i = index_names; (idx = *i); i++)
    {
      HV *hv2;
      build_single_index_data (idx);
      hv2 = idx->hv;
      hv_store (hv, idx->name, strlen (idx->name), newRV_inc ((SV *)hv2), 0);
    }

  return hv;
}


/* Return object to be used as $self->{'info'} in the Perl code, retrievable
   with the 'global_informations' function. */
HV *
build_global_info (void)
{
  HV *hv;

  dTHX;

  hv = newHV ();
  if (global_info.input_encoding_name)
    hv_store (hv, "input_encoding_name", strlen ("input_encoding_name"),
              newSVpv (global_info.input_encoding_name, 0), 0);
  return hv;
}

/* Return object to be used as $self->{'extra'} in the Perl code, which
   are mostly references to tree elements. */
HV *
build_global_info2 (void)
{
  HV *hv;
  AV *av;
  int i;
  ELEMENT *e;

  dTHX;

  hv = newHV ();

  /* These should be unique elements. */

  if (global_info.settitle && global_info.settitle->hv)
    {
      hv_store (hv, "settitle", strlen ("settitle"),
                newRV_inc ((SV *) global_info.settitle->hv), 0);
    }
  if (global_info.copying && global_info.copying->hv)
    {
      hv_store (hv, "copying", strlen ("copying"),
                newRV_inc ((SV *) global_info.copying->hv), 0);
    }
  if (global_info.shorttitlepage && global_info.shorttitlepage->hv)
    {
      hv_store (hv, "shorttitlepage", strlen ("shorttitlepage"),
                newRV_inc ((SV *) global_info.shorttitlepage->hv), 0);
    }
  if (global_info.title && global_info.title->hv)
    {
      hv_store (hv, "title", strlen ("title"),
                newRV_inc ((SV *) global_info.title->hv), 0);
    }
  if (global_info.titlepage && global_info.titlepage->hv)
    {
      hv_store (hv, "titlepage", strlen ("titlepage"),
                newRV_inc ((SV *) global_info.titlepage->hv), 0);
    }
  if (global_info.top && global_info.top->hv)
    {
      hv_store (hv, "top", strlen ("top"),
                newRV_inc ((SV *) global_info.top->hv), 0);
    }

  /* The following are arrays of elements. */

  if (global_info.footnotes.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "footnote", strlen ("footnote"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.footnotes.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.footnotes, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.hyphenation.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "hyphenation", strlen ("hyphenation"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.hyphenation.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.hyphenation, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.insertcopying.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "insertcopying", strlen ("insertcopying"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.insertcopying.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.insertcopying, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.printindex.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "printindex", strlen ("printindex"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.printindex.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.printindex, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.subtitle.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "subtitle", strlen ("subtitle"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.subtitle.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.subtitle, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.titlefont.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "titlefont", strlen ("titlefont"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.titlefont.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.titlefont, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.listoffloats.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "listoffloats", strlen ("listoffloats"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.listoffloats.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.listoffloats, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.detailmenu.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "detailmenu", strlen ("detailmenu"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.detailmenu.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.detailmenu, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  if (global_info.part.contents.number > 0)
    {
      av = newAV ();
      hv_store (hv, "part", strlen ("part"),
                newRV_inc ((SV *) av), 0);
      for (i = 0; i < global_info.part.contents.number; i++)
        {
          e = contents_child_by_index (&global_info.part, i);
          if (e->hv)
            av_push (av, newRV_inc ((SV *) e->hv));
        }
    }
  return hv;
}
