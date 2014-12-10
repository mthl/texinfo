#include <stdlib.h>
#include "command_ids.h"
#include "element_types.h"

typedef struct TEXT {
    char *text;
    size_t space;
    size_t end;
} TEXT;

typedef struct KEY_PAIR {
    char *key;
    char *value;
} KEY_PAIR;

typedef struct ELEMENT_LIST {
    struct ELEMENT **list;
    size_t number;
    size_t space;
} ELEMENT_LIST;

typedef struct LINE_NR {
} LINE_NR;

typedef struct ELEMENT {
    enum command_id cmd;
    TEXT text;
    enum element_type type;
    ELEMENT_LIST args;
    ELEMENT_LIST contents;
    struct ELEMENT *parent; /* !! No way to serialize !! */
    LINE_NR line_nr;
    KEY_PAIR **extra;

    /* Not used in final output. */
    int remaining_args; /* Could be a stack instead. */
} ELEMENT;

typedef struct GLOBAL_INFO {
    char *input_file_name;
    char *input_encoding_name;
} GLOBAL_INFO;
