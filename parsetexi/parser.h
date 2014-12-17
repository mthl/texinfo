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

/* In end_line.c */
ELEMENT *end_line (ELEMENT *current);

/* In debug.c */
void debug (char *s, ...);
void debug_nonl (char *s, ...);
extern int debug_output;

/* In separator.c */
ELEMENT *handle_separator (ELEMENT *current, char separator,
                           char **line_inout);

/* In parser.c */
void push_conditional_stack (enum command_id cond);
enum command_id pop_conditional_stack (void);
size_t conditional_number;
ELEMENT *parse_texi_file (char *filename);
int abort_empty_line (ELEMENT **current_inout, char *additional);
ELEMENT *end_paragraph (ELEMENT *current);
void isolate_last_space (ELEMENT *current);
int command_with_command_as_argument (ELEMENT *current);
ELEMENT *begin_preformatted (ELEMENT *current);
ELEMENT *end_preformatted (ELEMENT *current);
char *read_command_name (char **ptr);
ELEMENT *merge_text (ELEMENT *current, char *text);
void start_empty_line_after_command (ELEMENT *current, char **line_inout);

extern const char *whitespace_chars, *whitespace_chars_except_newline;

extern ELEMENT *current_node;
extern ELEMENT *current_section;

/* In macro.c */
void new_macro (char *name, ELEMENT *macro);
ELEMENT *parse_macro_command_line (enum command_id, char **line_inout,
                                   ELEMENT *parent);
ELEMENT *handle_macro (ELEMENT *current, char **line_inout,
                       enum command_id cmd_id);

/* In multitable.c */
ELEMENT *item_line_parent (ELEMENT *current);
ELEMENT *item_multitable_parent (ELEMENT *current);

/* In dump_perl.c */
void dump_tree_to_perl (ELEMENT *root);

/* In extra.c */
void add_extra_key_element (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_contents (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_key_text (ELEMENT *e, char *key, ELEMENT *value);
KEY_PAIR *lookup_extra_key (ELEMENT *e, char *key);
