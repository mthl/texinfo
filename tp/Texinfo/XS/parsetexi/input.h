#include <stdio.h>

char *new_line (ELEMENT *current);
char *next_text (ELEMENT *current);

void input_push (char *text, char *macro, char *filename, int line_number);
void input_push_text (char *line, char *macro);
void input_push_text_with_line_nos (char *text, int starting);
int input_push_file (char *filename);
void input_reset_input_stack (void);
int expanding_macro (char *macro);
int top_file_index (void);
char *locate_include_file (char *filename);

char *save_string (char *string);
void free_small_strings (void);

extern LINE_NR line_nr;

extern int input_number;
