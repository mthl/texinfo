void line_error (char *message);
void line_errorf (char *format, ...);
void line_warn (char *message);
void line_warnf (char *format, ...);
void command_errorf (ELEMENT *e, char *format, ...);
void command_warnf (ELEMENT *e, char *format, ...);
void wipe_errors (void);

/* TODO: remove */
#define command_error command_errorf
#define command_warn command_warnf

char *dump_errors (void);
