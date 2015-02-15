/* In api.c */
extern ELEMENT *Root;

void parse_file (char *filename);
ELEMENT *get_root (void);
char *element_type_name (ELEMENT *element);
int num_contents_children (ELEMENT *e);
int num_args_children (ELEMENT *e);

/* Defined in dump_perl.c */
char *dump_tree_to_string_1 (void);
char *dump_tree_to_string_2 (void);
char *dump_tree_to_string_3 (void);
char *dump_root_element_1 (void);
char *dump_root_element_2 (void);

/* In input.c */
void add_include_directory (char *filename);
