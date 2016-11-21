#include <stdio.h>

char *new_line (void);
char *next_text (void);

void input_push (char *text, char *macro, char *filename, int line_number);
void input_push_text (char *line, char *macro);
void input_push_text_with_line_nos (char *text, int starting);
void input_push_file (char *filename);
void input_reset_input_stack (void);
int expanding_macro (char *macro);

extern LINE_NR line_nr;

extern int input_number;
