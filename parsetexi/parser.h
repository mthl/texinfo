#include "tree_types.h"
#include "tree.h"
#include "context_stack.h"
#include "commands.h"
#include "handle_commands.h"
#include "def.h"

/* In commands.c */
int close_paragraph_command (enum command_id cmd_id);
int close_preformatted_command (enum command_id cmd_id);
int item_line_command (enum command_id cmd_id);

/* In close.c */
void close_command_cleanup (ELEMENT *current);
ELEMENT *close_commands (ELEMENT *current, enum command_id closed_command,
                         ELEMENT **closed_element, enum command_id);
ELEMENT *close_all_style_commands (ELEMENT *current,
                               enum command_id closed_command,
                               enum command_id interrupting_command);

/* In end_line.c */
NODE_SPEC_EXTRA *parse_node_manual (ELEMENT *node);
ELEMENT *end_line (ELEMENT *current);
ELEMENT *parse_special_misc_command (char *line, enum command_id cmd);

/* In debug.c */
void debug (char *s, ...);
void debug_nonl (char *s, ...);
extern int debug_output;

/* In separator.c */
void register_command_arg (ELEMENT *current, char *key);
ELEMENT *handle_separator (ELEMENT *current, char separator,
                           char **line_inout);
void remove_empty_content_arguments (ELEMENT *current);

/* In parser.c */
ELEMENT *parse_texi (ELEMENT *root_elt);
void push_conditional_stack (enum command_id cond);
enum command_id pop_conditional_stack (void);
extern size_t conditional_number;
void parse_texi_file (const char *filename);
int abort_empty_line (ELEMENT **current_inout, char *additional);
ELEMENT *end_paragraph (ELEMENT *current,
                        enum command_id closed_command,
                        enum command_id interrupting_command);
void isolate_last_space (ELEMENT *current, enum element_type type);
int command_with_command_as_argument (ELEMENT *current);
ELEMENT *begin_preformatted (ELEMENT *current);
ELEMENT *end_preformatted (ELEMENT *current);
char *read_command_name (char **ptr);
ELEMENT *merge_text (ELEMENT *current, char *text);
void start_empty_line_after_command (ELEMENT *current, char **line_inout,
                                     ELEMENT *command);
ELEMENT *trim_spaces_comment_from_content (ELEMENT *original);

extern const char *whitespace_chars, *whitespace_chars_except_newline;
extern const char *digit_chars;

extern ELEMENT *current_node;
extern ELEMENT *current_section;

extern GLOBAL_INFO global_info;

#include "macro.h"

/* In multitable.c */
ELEMENT *item_line_parent (ELEMENT *current);
ELEMENT *item_multitable_parent (ELEMENT *current);
void gather_previous_item (ELEMENT *current, enum command_id next_command);

#include "dump_perl.h"

/* In extra.c */
void add_extra_key_element (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_contents (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_contents_array (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_text (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_index_entry (ELEMENT *e, char *key, INDEX_ENTRY_REF *value);
void add_extra_key_misc_args (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_node_spec (ELEMENT *e, char *key, NODE_SPEC_EXTRA *value);
void add_extra_node_spec_array (ELEMENT *, char *, NODE_SPEC_EXTRA **value);
void add_extra_def_args (ELEMENT *e, char *key, DEF_ARGS_EXTRA *value);
void add_extra_string (ELEMENT *e, char *key, char *value);
KEY_PAIR *lookup_extra_key (ELEMENT *e, char *key);

/* In menus.c */
int handle_menu (ELEMENT **current_inout, char **line_inout);
ELEMENT *enter_menu_entry_node (ELEMENT *current);

#include "counter.h"
/* Defined in parser.c */
extern COUNTER count_remaining_args, count_items, count_cells;
