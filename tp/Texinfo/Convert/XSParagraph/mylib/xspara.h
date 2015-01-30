int xspara_new (HV *conf);
void xspara_set_state (HV *state);
void xspara_get_state (HV *state);
void xspara_hello (void);
char *xspara_add_next (char *, int, int end_sentence);
char *xspara_add_text (char *);
char *xspara_set_space_protection (int space_protection, int ignore_columns,
                             int keep_end_lines, int french_spacing);
void xspara__end_line (void);
char *xspara_end_line (void);
char *xspara_get_pending (void);
char *xspara_end (void);
char *xspara_add_pending_word (char *add_spaces);
