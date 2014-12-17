#include <stdio.h>

char *new_line (void);
char *next_text (void);

void input_push_file (char *line);
void input_push_text (char *filename);

extern LINE_NR line_nr;
