AUTOMAKE_OPTIONS=foreign

bin_PROGRAMS=parsetexi

lib_LIBRARIES=libparsetexi.a

libparsetexi_a_SOURCES=api.c api.h \
		  parser.c parser.h tree_types.h \
		  element_types.c element_types.h \
		  commands.c commands.h \
		  command_ids.h \
		  input.c input.h \
		  tree.c tree.h close.c \
		  text.c text.h \
		  context_stack.c context_stack.h \
		  debug.c \
		  convert.c \
		  end_line.c \
		  separator.c \
		  multitable.c \
		  indices.c \
		  macro.c \
		  handle_commands.c handle_commands.h \
		  def.c def.h \
		  dump_perl.c

parsetexi_SOURCES=$(libparsetexi_a_SOURCES) main.c


BUILT_SOURCES=element_types.c element_types.h \
              command_data.c command_ids.h

# Need to be distributed
EXTRA_DIST=element_types.txt element_types.awk \
	   command_data.txt command_data.awk

# For reference
EXTRA_DIST+=Common.pm Parser-5556.pm

EXTRA_DIST+=complete_tree.pl

# Notes
EXTRA_DIST+=debug_perl.txt makeinfo-debug.txt

element_types.c element_types.h: element_types.txt element_types.awk
	awk -f element_types.awk element_types.txt >element_types.h

command_data.c command_ids.h: command_data.txt command_data.awk
	awk -f command_data.awk command_data.txt >command_ids.h
