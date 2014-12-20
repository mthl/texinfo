#include "parser.h"
#include "convert.h"
#include "labels.h"

/* Array of recorded labels. */
/* If looking through this array turns out to be slow, we might have to replace
   it with some kind of hash table implementation. */
LABEL *labels_list = 0;
size_t labels_number = 0;
size_t labels_space = 0;

void register_label (ELEMENT *current, ELEMENT *label)
{
  if (labels_number == labels_space)
    {
      labels_space += 1;
      labels_space *= 1.5;
      labels_list = realloc (labels_list, labels_space * sizeof (LABEL));
      if (!labels_list)
        abort ();
    }

  labels_list[labels_number].label = convert_to_normalized (label);
  labels_list[labels_number++].target = current;
}
