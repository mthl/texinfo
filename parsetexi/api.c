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

ELEMENT *Root;

/* Set ROOT to root of tree obtained by parsing FILENAME. */
void
parse_file (char *filename)
{
  debug_output = 0;
  init_index_commands ();
  parse_texi_file (filename);
}

ELEMENT *
get_root (void)
{
  return Root;
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

  if (value->normalized)
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

  if (e->parent && e->parent_type != route_not_in_tree)
    {
      sv = newRV_inc ((SV *) e->parent->hv);
      hv_store (e->hv, "parent", strlen ("parent"), sv, 0);
    }
  /* FIXME: this assumes we don't have nested out-of-tree subtrees,
     i.e. the only out-of-tree elements are simple text elements
     (or other elements with no children) - otherwise we shall fail
     to set "parent" properly. */

  if (e->type)
    {
      sv = newSVpv (element_type_names[e->type], 0);
      hv_store (e->hv, "type", strlen ("type"), sv, 0);

      /* TODO: Could precompute hash of "type", and also reuse
         the same SV for a single type? */
    }

  if (e->cmd)
    {
      sv = newSVpv (command_data(e->cmd).cmdname, 0);
      hv_store (e->hv, "cmdname", strlen ("cmdname"), sv, 0);

      /* TODO: Same optimizations as for 'type'. */
    }

  if (e->contents.number > 0)
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
      hv_store (e->hv, "text", strlen ("text"), sv, 0);
    }

  if (e->extra_number > 0)
    {
      HV *extra;
      int i;
      extra = newHV ();
      hv_store (e->hv, "extra", strlen ("extra"),
                newRV_inc((SV *)extra), 0);

      for (i = 0; i < e->extra_number; i++)
        {
#define STORE(sv) hv_store (extra, key, strlen (key), sv, 0)
          char *key = e->extra[i].key;
          ELEMENT *f = e->extra[i].value;

          switch (e->extra[i].type)
            {
            case extra_element:
              /* For references to other parts of the tree, create the hash so 
                 we can point to it.  */
              if (!f->hv && f->parent_type != route_not_in_tree)
                {
                  /* TODO: Are there any extra values which are
                     extra_element that are route_not_in_tree?  Consider
                     eliminating use of 'parent_type' to differentiate types
                     of extra value. */
                  f->hv = newHV ();
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
                  AV *av2;
                  ELEMENT *g;

                  g = f->contents.list[j];
                  av2 = newAV ();
                  av_push (av, newRV_inc ((SV *)av2));

                  for (k = 0; k < g->contents.number; k++)
                    {
                      ELEMENT *h;
                      h = g->contents.list[k];
                      /* TODO: Check if any of the elements in the array
                         are not in the main tree - if so, we will have to
                         create them. */
                      if (!h->hv)
                        h->hv = newHV ();
                      av_push (av2, newRV_inc ((SV*)h->hv));
                    }
                }
              break;
              }
            case extra_string:
              { /* A simple string. */
              char *value = (char *) f;
              STORE(newSVpv (value, 0));
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
               be much nicer if we could get rid of the need for this key. */
            /* Could we set this afterwards in build_index_data? */
              break;
            default:
              abort ();
              break;
            }
        }
#undef STORE
    }

  /* TODO: line_nr. */
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

/* Return hash value for a single entry in $self->{'index_names'}, containing
   information about a single index. */
static HV *
build_single_index_data (INDEX *i)
{
#define STORE(key, value) hv_store (hv, key, strlen (key), value, 0)

  HV *hv;
  AV *prefix_array;
  HV *contained;
  AV *entries;
  int j;

  dTHX;

  hv = newHV ();
  STORE("name", newSVpv (i->name, 0));
  STORE("in_code", newSVpv ("0", 1));

  /* e.g. 'prefix' => ['k', 'ky'] */
  prefix_array = newAV ();
  av_push (prefix_array, newSVpv (i->name, 1));
  av_push (prefix_array, newSVpv (i->name, 0));
  STORE("prefix", newRV_inc ((SV *) prefix_array));

  contained = newHV ();
  hv_store (contained, i->name, strlen (i->name), newSViv(1), 0);
  STORE("contained_indices", newRV_inc ((SV *) contained));

  entries = newAV ();
  STORE("index_entries", newRV_inc ((SV *) entries));
#undef STORE

  for (j = 0; j < i->index_number; j++)
    {
#define STORE2(key, value) hv_store (entry, key, strlen (key), value, 0)
      HV *entry;
      INDEX_ENTRY *e;

      e = &i->index_entries[j];
      entry = newHV ();
      av_push (entries, newRV_inc ((SV *)entry));

      STORE2("index_name", newSVpv (i->name, 0));
      STORE2("index_prefix", newSVpv (i->name, 1));
      STORE2("index_at_command",
             newSVpv (command_data(e->index_at_command).cmdname, 0));
      STORE2("index_type_command",
             newSVpv (command_data(e->index_type_command).cmdname, 0));
      STORE2("command",
             newRV_inc ((SV *)e->command->hv));
      STORE2("number", newSViv (j));
      if (e->content)
        {
          SV **contents_array;
          contents_array = hv_fetch (e->content->hv,
                                    "contents", strlen ("contents"), 0);

          /* Copy the reference to the array. */
          STORE2("content", newRV_inc ((SV *)(AV *)SvRV(*contents_array)));
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

  return hv;
}

/* Return object to be used as $self->{'index_names'} in the perl code.
   build_texinfo_tree must be called before this so all the 'hv' fields
   are set on the elements in the tree. */
HV *
build_index_data (void)
{
  HV *hv;
  INDEX *i;

  dTHX;

  hv = newHV ();

  for (i = index_names; i->name; i++)
    {
      HV *hv2;
      hv2 = build_single_index_data (i);
      hv_store (hv, i->name, strlen (i->name), newRV_inc ((SV *)hv2), 0);
    }

  return hv;
}



