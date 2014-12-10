enum context {
    ct_NONE,
    ct_line,
    ct_def,
    ct_preformatted,
    ct_rawpreformatted,
    ct_menu,
    ct_math,
    ct_footnote,
    ct_caption,
    ct_shortcaption,
    ct_inlineraw
};

/* Contexts where an empty line doesn't start a new paragraph. */
/* line 492 */
#define in_no_paragraph_contexts(c) \
  ((c) == ct_math \
   || (c) == ct_menu \
   || (c) == ct_def \
   || (c) == ct_preformatted \
   || (c) == ct_rawpreformatted \
   || (c) == ct_inlineraw)

void push_context (enum context c);
enum context pop_context ();
enum context current_context (void);

