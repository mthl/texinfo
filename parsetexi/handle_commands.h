
ELEMENT *handle_misc_command (ELEMENT *current, char **line_inout,
                     enum command_id cmd_id);
ELEMENT *handle_block_command (ELEMENT *current, char **line_inout,
                      enum command_id cmd_id, int *new_line);
ELEMENT *handle_brace_command (ELEMENT *current, char **line_inout,
                               enum command_id cmd_id);
