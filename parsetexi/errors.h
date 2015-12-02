void line_error (char *message);
void line_errorf (char *format, ...);
void line_warn (char *message);
void line_warnf (char *format, ...);
void wipe_errors (void);

/* TODO: Proper implementations */
#define command_error line_error
#define command_errorf line_errorf
#define command_warn line_warn
#define command_warnf line_warnf

char *dump_errors (void);
