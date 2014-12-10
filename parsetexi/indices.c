#include "commands.h"
#include "command_ids.h"

static struct index_name {
    char *name;
    char prefix;
    // int in_code;
} index_names[] = {
    "cp", 'c',
    "fn", 'f',
    "vr", 'v',
    "ky", 'k',
    "pg", 'p',
    "tp", 't'
};

void
init_index_commands (void)
{
  struct index_name *i;
  char name[] = "?index";
  for (i = index_names;
       i < &index_names[sizeof(index_names)/sizeof(*index_names)];
       i++)
    {
      enum command_id new;
      name[0] = i->prefix;
      new = add_texinfo_command (name);
      user_defined_command_data[new & ~USER_COMMAND_BIT].flags = CF_misc;
      user_defined_command_data[new & ~USER_COMMAND_BIT].data = MISC_line;
    }
}
