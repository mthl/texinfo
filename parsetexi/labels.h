/* Information about a possible target of a cross-reference, often a node. */
typedef struct {
    /* The normalized node name for HTML output of the target, used as a key.  
       Using the normalized node name as a key is a way to avoid clashes if 
       different node names containing @-commands end up as the same. */
    char *label;

    /* Pointer to the element for the command defining this label, usually a
       node element.  FIXME: I'm not sure if we actualy need to get to the
       target - much of the use of the labels_information is to check that 
       references are to real places. */
    ELEMENT *target;
} LABEL;

extern LABEL *labels_list;
extern size_t labels_number;
void register_label (ELEMENT *current, ELEMENT *label);
