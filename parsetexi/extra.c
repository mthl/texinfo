#include "parser.h"

static void
add_extra_key (ELEMENT *e, char *key, ELEMENT *value)
{
  if (e->extra_number == e->extra_space)
    {
      e->extra = realloc (e->extra,
                          (e->extra_space += 5) * sizeof (KEY_PAIR));
      if (!e->extra)
        abort ();
    }

  e->extra[e->extra_number].key = key;
  e->extra[e->extra_number++].value = value;
}

/* Add an extra key that is a reference to another element (for example, 
   'associated_section' on a node command element. */
void
add_extra_key_element (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element;
}

/* Add an extra key that is a reference to the contents array of another
   element (for example, 'node_content' on a node command element). */
void
add_extra_key_contents (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element_contents;
}

/* Add an extra key that is a reference to the text field of another
   element/ */
void
add_extra_key_text (ELEMENT *e, char *key, ELEMENT *value)
{
  add_extra_key (e, key, value);
  e->extra[e->extra_number - 1].type = extra_element_text;
}
