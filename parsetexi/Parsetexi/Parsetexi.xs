#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "../tree_types.h"
#include "../tree.h"
#include "../api.h"

#include "const-c.inc"

MODULE = Parsetexi		PACKAGE = Parsetexi		

INCLUDE: const-xs.inc

TYPEMAP: <<END
ELEMENT *   T_UV
END

void
parse_file(filename)
        char * filename

ELEMENT *
get_root()

char *
element_type_namex (e)
        ELEMENT *e
