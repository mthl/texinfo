extern ELEMENT *Root;
extern CONF conf;

void parse_text (char *);
void parse_string(char *);
int parse_file (char *filename);
ELEMENT *get_root (void);
int num_contents_children (ELEMENT *e);
int num_args_children (ELEMENT *e);
void reset_parser (void);
void reset_parser_except_conf (void);
void set_debug (int);
void wipe_values (void);
void reset_context_stack (void);

void conf_set_show_menu (int i);
void conf_set_CPP_LINE_DIRECTIVES (int i);
void conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME (int i);
void reset_conf (void);

HV *build_texinfo_tree (void);
AV *build_label_list (void);
AV *build_internal_xref_list (void);
HV *build_float_list (void);
HV *build_index_data (void);
HV *build_global_info (void);
HV *build_global_info2 (void);


