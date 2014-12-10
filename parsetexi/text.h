void text_init (TEXT *t);
void text_append (TEXT *t, char *s);
void text_append_n (TEXT *t, char *s, size_t len);

#define text_base(t) ((t)->space ? (t)->text : (char *) 0)
