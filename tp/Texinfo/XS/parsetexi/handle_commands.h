
ELEMENT *handle_misc_command (ELEMENT *current, char **line_inout,
                     enum command_id cmd_id, int *status,
                     enum command_id invalid_parent);
ELEMENT *handle_block_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd_id, int *new_line,
                      enum command_id invalid_parent);
ELEMENT *handle_brace_command (ELEMENT *current, char **line_inout,
                               enum command_id cmd_id,
                               enum command_id invalid_parent);
int check_no_text (ELEMENT *current);
int register_global_command (enum command_id cmd, ELEMENT *current);

void clear_expanded_formats (void);
void add_expanded_format (char *format);
