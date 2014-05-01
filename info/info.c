/* info.c -- Display nodes of Info files in multiple windows.
   $Id$

   Copyright 1993, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
   2004, 2005, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014
   Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox.  */

#include "info.h"
#include "indices.h"
#include "dribble.h"
#include "getopt.h"
#include "man.h"
#include "variables.h"

char *program_name = "info";

/* Non-zero means search all indices for APROPOS_SEARCH_STRING. */
static int apropos_p = 0;

/* Variable containing the string to search for when apropos_p is non-zero. */
static char *apropos_search_string = NULL;

/* Non-zero means search all indices for INDEX_SEARCH_STRING.  Unlike
   apropos, this puts the user at the node, running info. */
static int index_search_p = 0;

/* Non-zero means look for the node which describes the invocation
   and command-line options of the program, and start the info
   session at that node.  */
static int goto_invocation_p = 0;

/* Variable containing the string to search for when index_search_p is
   non-zero. */
static char *index_search_string = NULL;

/* Non-zero means print version info only. */
static int print_version_p = 0;

/* Non-zero means print a short description of the options. */
static int print_help_p = 0;

/* Array of the names of nodes that the user specified with "--node" on the
   command line. */
static char **user_nodenames = NULL;
static size_t user_nodenames_index = 0;
static size_t user_nodenames_slots = 0;

/* String specifying the first file to load.  This string can only be set
   by the user specifying "--file" on the command line. */
static char *user_filename = NULL;

/* String specifying the name of the file to dump nodes to.  This value is
   filled if the user speficies "--output" on the command line. */
static char *user_output_filename = NULL;

/* Non-zero indicates that when "--output" is specified, all of the menu
   items of the specified nodes (and their subnodes as well) should be
   dumped in the order encountered.  This basically can print a book. */
int dump_subnodes = 0;

/* Non-zero means make default keybindings be loosely modeled on vi(1).  */
int vi_keys_p = 0;

/* Non-zero means don't remove ANSI escape sequences.  */
int raw_escapes_p = 1;

/* Print/visit all matching documents. */
static int all_matches_p = 0;

/* Non-zero means print the absolute location of the file to be loaded.  */
static int print_where_p = 0;

/* Debugging level */
unsigned debug_level;

/* Non-zero means don't try to be smart when searching for nodes.  */
int strict_node_location_p = 0;

#if defined(__MSDOS__) || defined(__MINGW32__)
/* Non-zero indicates that screen output should be made 'speech-friendly'.
   Since on MSDOS the usual behavior is to write directly to the video
   memory, speech synthesizer software cannot grab the output.  Therefore,
   we provide a user option which tells us to avoid direct screen output
   and use stdout instead (which loses the color output).  */
int speech_friendly = 0;
#endif

/* Structure describing the options that Info accepts.  We pass this structure
   to getopt_long ().  If you add or otherwise change this structure, you must
   also change the string which follows it. */
#define DRIBBLE_OPTION 2
#define RESTORE_OPTION 3
#define IDXSRCH_OPTION 4
#define INITFLE_OPTION 5

static struct option long_options[] = {
  { "all", 0, 0, 'a' },
  { "apropos", 1, 0, 'k' },
  { "debug", 1, 0, 'x' },
  { "directory", 1, 0, 'd' },
  { "dribble", 1, 0, DRIBBLE_OPTION },
  { "file", 1, 0, 'f' },
  { "help", 0, &print_help_p, 1 },
  { "index-search", 1, 0, IDXSRCH_OPTION },
  { "init-file", 1, 0, INITFLE_OPTION },
  { "location", 0, &print_where_p, 1 },
  { "node", 1, 0, 'n' },
  { "output", 1, 0, 'o' },
  { "raw-escapes", 0, &raw_escapes_p, 1 },
  { "no-raw-escapes", 0, &raw_escapes_p, 0 },
  { "show-malformed-multibytes", 0, &show_malformed_multibyte_p, 1 },
  { "no-show-malformed-multibytes", 0, &show_malformed_multibyte_p, 0 },
  { "restore", 1, 0, RESTORE_OPTION },
  { "show-options", 0, 0, 'O' },
  { "strict-node-location", 0, &strict_node_location_p, 1 },
  { "subnodes", 0, &dump_subnodes, 1 },
  { "usage", 0, 0, 'O' },
  { "variable", 1, 0, 'v' },
  { "version", 0, &print_version_p, 1 },
  { "vi-keys", 0, &vi_keys_p, 1 },
  { "where", 0, &print_where_p, 1 },
#if defined(__MSDOS__) || defined(__MINGW32__)
  { "speech-friendly", 0, &speech_friendly, 1 },
#endif
  {NULL, 0, NULL, 0}
};

/* String describing the shorthand versions of the long options found above. */
#if defined(__MSDOS__) || defined(__MINGW32__)
static char *short_options = "ak:d:n:f:ho:ORsv:wbx:";
#else
static char *short_options = "ak:d:n:f:ho:ORv:wsx:";
#endif

/* When non-zero, the Info window system has been initialized. */
int info_windows_initialized_p = 0;

/* Some "forward" declarations. */
static void info_short_help (void);
static void init_messages (void);


static char *
node_file_name (NODE *node, int dirok)
{
  if (node->parent)
    return node->parent;
  else if (node->filename
	   && (dirok ||
	       !is_dir_name (filename_non_directory (node->filename))))
    return node->filename;
  return 0;
}

/* Get the initial Info file, either by following menus from "(dir)Top",
   or what the user specifed with values in filename. */
static char *
get_initial_file (char *filename, int *argc, char ***argv, NODE **error_node)
{
  char *initial_file = 0;           /* First file loaded by Info. */

  if (!filename)
    {
      NODE *dir_node;
      REFERENCE *entry = 0;

      /* If there are any more arguments, the initial file is the
         dir entry given by the first one. */
      if ((*argv)[0])
        {
          dir_node = info_get_node (0, 0, PARSE_NODE_DFLT);

          entry = info_get_menu_entry_by_label ((*argv)[0],
                                                dir_node->references);
          if (entry)
            initial_file = info_find_fullpath (entry->filename, 0);

          if (!initial_file)
            /* Try finding a file with this name, in case
               it exists, but wasn't listed in dir. */
            initial_file = info_find_fullpath ((*argv)[0], 0);

          if (initial_file)
            {
              (*argv)++; /* Advance past first remaining argument. */
              (*argc)--;
            }
          else
            *error_node = format_message_node (_("No menu item `%s' in node `%s'."),
                (*argv)[0],
                "(dir)Top");
        }
      /* Otherwise, we want the dir node.  The only node to be displayed
         or output will be "Top". */
      else
        {
          return 0;
        }
    }
  else
    {
      initial_file = info_find_fullpath (filename, 0);

      if (!initial_file && filesys_error_number)
        {
          char *error_string;
          
          error_string = filesys_error_string
             (filename, filesys_error_number);
          *error_node = format_message_node ("%s", error_string);
          free (error_string);
        }
    }

  /* Fall back to loading man page. */
  if (!initial_file)
    {
      NODE *man_node;

      debug (3, ("falling back to manpage node"));

      if (!filename)
        filename = (*argv)[0];

      man_node = get_manpage_node (filename);

      if (man_node)
        {
          free (man_node);
          initial_file = MANPAGE_FILE_BUFFER_NAME;
          add_pointer_to_array (filename, user_nodenames_index,
                                user_nodenames, user_nodenames_slots, 10);
          return initial_file;
        }
    }

  return initial_file;
}

/* Expand list of nodes to be loaded. */
static void
add_initial_nodes (FILE_BUFFER *initial_file, int argc, char **argv, NODE **error_node)
{
  NODE *initial_node;
  char *node_via_menus;

  if (goto_invocation_p)
    {
      NODE *top_node;
      char *invoc_node;

      char **p = argv;
      char *program;

      /* If they say info -O info, we want to show them the invocation node
         for standalone info; there's nothing useful in info.texi.  */
      if (argv[0] && mbscasecmp (*argv, "info") == 0)
        *argv = "info-stnd";

      /* If they said "info --show-options foo bar baz",
         the last of the arguments is the program whose
         options they want to see.  */
      p = argv;
      if (*p)
        {
          while (p[1])
            p++;
          program = xstrdup (*p);
        }
      else if (initial_file->filename)
        /* If there's no command-line arguments to
           supply the program name, use the Info file
           name (sans extension and leading directories)
           instead.  */
        program = program_name_from_file_name (initial_file->filename);
      else
        program = xstrdup ("");
      
      top_node = info_get_node_of_file_buffer ("Top", initial_file);
      invoc_node = info_intuit_options_node (top_node, program);
      if (invoc_node)
        add_pointer_to_array (invoc_node, user_nodenames_index,
                              user_nodenames, user_nodenames_slots, 10);
    }

  /* If there are arguments remaining, they are the names of menu items
     in sequential info files starting from the first one loaded.  Add
     this to the list of nodes specified with --node. */
  else if (*argv)
    {
      NODE *initial_node;

      initial_node = info_get_node_of_file_buffer ("Top", initial_file);
      node_via_menus = info_follow_menus (initial_node, argv, error_node, 1);
      if (node_via_menus)
        add_pointer_to_array (node_via_menus, user_nodenames_index,
                              user_nodenames, user_nodenames_slots, 10);
    }

  /* If no nodes found, and there is exactly one argument, check for
     it as an index entry. */
  /* FIXME: This works, but doesn't go to the right position in the
     node.  Maybe we could do it along with --index-search somehow? */
  if (user_nodenames_index == 0 && argc == 1 && argv[0])
    {
      REFERENCE **index;
      REFERENCE **index_ptr;

      //debug (3. "looking in indices);
      index = info_indices_of_file_buffer (initial_file);

      for (index_ptr = index; index && *index_ptr; index_ptr++)
        {
          if (!strcmp (argv[0], (*index_ptr)->label))
            {
              /* TODO: Clear error_node */
              add_pointer_to_array ((*index_ptr)->nodename,
                user_nodenames_index, user_nodenames,
                user_nodenames_slots, 10);
              break;
            }
        }
    }

  /* If still no nodes and there are arguments remaining, follow menus
     inexactly. */
  if (user_nodenames_index == 0 && *argv)
    {
      NODE *initial_node;

      initial_node = info_get_node_of_file_buffer ("Top", initial_file);
      node_via_menus = info_follow_menus (initial_node, argv, error_node, 0);
      if (node_via_menus)
        add_pointer_to_array (node_via_menus, user_nodenames_index,
                              user_nodenames, user_nodenames_slots, 10);
    }

  /* Default in case there were no other nodes. */
  if (user_nodenames_index == 0)
    add_pointer_to_array ("Top", user_nodenames_index,
                          user_nodenames, user_nodenames_slots, 10);

}


static char *
dirname (const char *file)
{
  char *p;
  size_t len;

  p = strrchr (file, '/');
  if (!p)
    return NULL;
  len = p - file;
  p = xmalloc (len + 1);
  memcpy (p, file, len);
  p[len] = 0;
  return p;
}

REFERENCE **
info_find_matching_files (char *filename)
{
  size_t argc = 0;
  size_t argn = 0;
  REFERENCE **argv = NULL;
  int i = 0;
  char *p;
  
  while (1)
    {
      p = info_file_find_next_in_path (filename, infopath (), &i, 0);
      if (argc == argn)
	{
	  if (argn == 0)
	    argn = 2;
	  argv = x2nrealloc (argv, &argn, sizeof (argv[0]));
	}
      if (!p)
	{
	  argv[argc] = NULL;
	  break;
	}

      argv[argc] = xzalloc (sizeof (*argv[0]));
      argv[argc]->filename = p;
      ++argc;
    }

  return argv;
}

static int
all_files (char *filename, int argc, char **argv)
{
  REFERENCE **fref;
  char *fname;
  int i, j;
  int dirok;
  struct info_namelist_entry *nlist = NULL;
  int dump_flags = dump_subnodes;
  
  if (user_filename)
    {
      fname = user_filename;
      dirok = 0;
    }
  else
    {
      fname = "dir";
      dirok = 1;
    }
  
  fref = info_find_matching_files (fname);
  
  for (i = 0; fref[i]; )
    {
      NODE *node;
      
      if (!user_filename)
	{
	  char *p = dirname (fref[i]->filename);
	  infopath_add (p, INFOPATH_INIT);
	  free (p);
	}
      node = info_get_node (fref[i]->filename,
			    user_nodenames ? user_nodenames[0] : 0,
			    PARSE_NODE_DFLT);
      
      if (node)
	{
	  char *subnode_name = info_follow_menus (node, argv, NULL, 1);
          NODE *subnode = info_get_node (node->filename, subnode_name,
                                         PARSE_NODE_DFLT);
	  if (!subnode)
	    {
	      forget_info_file (fref[i]->filename);
	      node = NULL;
	    }
	  else
	    node = subnode;
	}
      
      if (node)
	{
	  const char *name = node_file_name (node, dirok);
	  if (!name)
	    node = NULL;
	  else
	    {
	      free (fref[i]->filename);
	      fref[i]->filename = xstrdup (name);
	    }
	}
      
      if (!node)
	{
	  info_reference_free (fref[i]);
	  for (j = i; (fref[j] = fref[j + 1]); j++);
	}
      else
	{
	  if (info_namelist_add (&nlist, fref[i]->filename) == 0)
	    {
	      if (print_where_p)
		printf ("%s\n", fref[i]->filename);
	      else if (user_output_filename)
		{
		  dump_node_to_file (node, user_output_filename, dump_flags);
		  dump_flags |= DUMP_APPEND;
		}
	      else
		fref[i]->nodename = xstrdup (node->nodename);
	      forget_info_file (fref[i]->filename);
	      ++i;
	    }
	  else
	    {
	      forget_info_file (fref[i]->filename);
	      info_reference_free (fref[i]);
	      for (j = i; (fref[j] = fref[j + 1]); j++);
	    }
	}
    }
  
  info_namelist_free (nlist);

  if (print_where_p || user_output_filename)
    return EXIT_SUCCESS;

#if 0
  if (i <= 1)
    {
      if (!single_file (user_filename, argc, argv))
        return EXIT_FAILURE;
      info_session ();
    }
#endif
  
  initialize_info_session (1);
  info_set_node_of_window (0, active_window, allfiles_create_node (argc ? argv[0] : fname, fref));;
  display_startup_message ();
  info_session ();
  return EXIT_SUCCESS;
}

static void
set_debug_level (const char *arg)
{
  char *p;
  long n = strtol (arg, &p, 10);
  if (*p)
    {
      fprintf (stderr, _("invalid number: %s\n"), arg);
      exit (EXIT_FAILURE);
    }
  if (n < 0 || n > UINT_MAX)
    debug_level = UINT_MAX;
  else
    debug_level = n;
}
      

/* **************************************************************** */
/*                                                                  */
/*                Main Entry Point to the Info Program              */
/*                                                                  */
/* **************************************************************** */

int
main (int argc, char *argv[])
{
  int getopt_long_index;       /* Index returned by getopt_long (). */
  char *init_file = 0;         /* Name of init file specified. */
  char *initial_file = 0;      /* File to start session with. */
  FILE_BUFFER *initial_fb = 0; /* File to start session with. */
  NODE *error_node = 0;        /* Error message to display in mini-buffer. */

#ifdef HAVE_SETLOCALE
  /* Set locale via LC_ALL.  */
  setlocale (LC_ALL, "");
#endif /* HAVE_SETLOCALE */

#ifdef ENABLE_NLS
  /* Set the text message domain.  */
  bindtextdomain (PACKAGE, LOCALEDIR);
  textdomain (PACKAGE);
#endif

  init_messages ();
  while (1)
    {
      int option_character;

      option_character = getopt_long (argc, argv, short_options, long_options,
				      &getopt_long_index);

      /* getopt_long returns EOF when there are no more long options. */
      if (option_character == EOF)
        break;

      /* If this is a long option, then get the short version of it. */
      if (option_character == 0 && long_options[getopt_long_index].flag == 0)
        option_character = long_options[getopt_long_index].val;

      /* Case on the option that we have received. */
      switch (option_character)
        {
        case 0:
          break;

	case 'a':
	  all_matches_p = 1;
	  break;
	  
          /* User wants to add a directory. */
        case 'd':
          infopath_add (optarg, INFOPATH_APPEND);
          break;

          /* User is specifying a particular node. */
        case 'n':
          add_pointer_to_array (optarg, user_nodenames_index, user_nodenames,
                                user_nodenames_slots, 10);
          break;

          /* User is specifying a particular Info file. */
        case 'f':
          if (user_filename)
            free (user_filename);

          user_filename = xstrdup (optarg);
          break;

          /* Treat -h like --help. */
        case 'h':
          print_help_p = 1;
          break;

          /* User is specifying the name of a file to output to. */
        case 'o':
          if (user_output_filename)
            free (user_output_filename);
          user_output_filename = xstrdup (optarg);
          break;

         /* User has specified that she wants to find the "Options"
             or "Invocation" node for the program.  */
        case 'O':
          goto_invocation_p = 1;
          break;

	  /* User has specified that she wants the escape sequences
	     in man pages to be passed thru unaltered.  */
        case 'R':
          raw_escapes_p = 1;
          break;

          /* User is specifying that she wishes to dump the subnodes of
             the node that she is dumping. */
        case 's':
          dump_subnodes = 1;
          break;

          /* For compatibility with man, -w is --where.  */
        case 'w':
          print_where_p = 1;
          break;

#if defined(__MSDOS__) || defined(__MINGW32__)
	  /* User wants speech-friendly output.  */
	case 'b':
	  speech_friendly = 1;
	  break;
#endif /* __MSDOS__ || __MINGW32__ */

          /* User has specified a string to search all indices for. */
        case 'k':
          apropos_p = 1;
          free (apropos_search_string);
          apropos_search_string = xstrdup (optarg);
          break;

          /* User has specified a dribble file to receive keystrokes. */
        case DRIBBLE_OPTION:
          close_dribble_file ();
          open_dribble_file (optarg);
          break;

          /* User has specified an alternate input stream. */
        case RESTORE_OPTION:
          info_set_input_from_file (optarg);
          break;

          /* User has specified a string to search all indices for. */
        case IDXSRCH_OPTION:
          index_search_p = 1;
          free (index_search_string);
          index_search_string = xstrdup (optarg);
          break;

          /* User has specified a file to use as the init file. */
        case INITFLE_OPTION:
          init_file = optarg;
          break;

	case 'v':
	  {
            VARIABLE_ALIST *var;
	    char *p;
	    p = strchr (optarg, '=');
	    if (!p)
	      {
		info_error (_("malformed variable assignment: %s"), optarg);
		exit (EXIT_FAILURE);
	      }
	    *p++ = 0;

            if (!(var = variable_by_name (optarg)))
              {
                info_error (_("%s: no such variable"), optarg);
                exit (EXIT_FAILURE);
              }

	    if (!set_variable_to_value (var, p, SET_ON_COMMAND_LINE))
	      {
                info_error (_("value %s is not valid for variable %s"),
                            p, optarg);
		exit (EXIT_FAILURE);
	      }	
	  }
	  break;
	  
	case 'x':
	  set_debug_level (optarg);
	  break;
	  
        default:
          fprintf (stderr, _("Try --help for more information.\n"));
          exit (EXIT_FAILURE);
        }
    }

  /* If the output device is not a terminal, and no output filename has been
     specified, make user_output_filename be "-", so that the info is written
     to stdout, and turn on the dumping of subnodes. */
  if ((!isatty (fileno (stdout))) && (user_output_filename == NULL))
    {
      user_output_filename = xstrdup ("-");
      dump_subnodes = 1;
    }

  if (dump_subnodes)
    dump_subnodes = DUMP_SUBNODES;
  
  /* If the user specified --version, then show the version and exit. */
  if (print_version_p)
    {
      printf ("info (GNU %s) %s\n", PACKAGE, VERSION);
      puts ("");
      printf (_("Copyright (C) %s Free Software Foundation, Inc.\n\
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\n\
This is free software: you are free to change and redistribute it.\n\
There is NO WARRANTY, to the extent permitted by law.\n"),
	      "2014");
      exit (EXIT_SUCCESS);
    }

  /* If the `--help' option was present, show the help and exit. */
  if (print_help_p)
    {
      info_short_help ();
      exit (EXIT_SUCCESS);
    }

  /* If the user specified a particular filename, add the path of that
     file to the contents of INFOPATH. */
  if (user_filename)
    add_file_directory_to_path (user_filename);

  /* If the user wants to search every known index for a given string,
     do that now, and report the results. */
  if (apropos_p)
    {
      info_apropos (apropos_search_string);
      exit (EXIT_SUCCESS);
    }

  argc -= optind;
  argv += optind;
  
  /* Load custom key mappings and variable settings */
  initialize_terminal_and_keymaps (init_file);

  /* Add extra search directories to any already specified with
     --directory. */
  infopath_init ();

  if (all_matches_p)
    return all_files (user_filename, argc, argv);

  initial_file = get_initial_file (user_filename, &argc, &argv, &error_node);

  /* --where */
  if (print_where_p)
    {
      if (initial_file)
        { 
          printf ("%s\n", initial_file);
          return 0;
        }
      else
        return 1;
    }

  /* If the user specified `--index-search=STRING', 
     start the info session in the node corresponding
     to what they want. */
  if (index_search_p && initial_file && !user_output_filename)
    {
      NODE *initial_node;
      
      initial_fb = info_load_file (initial_file, 1);
      if (initial_fb && index_entry_exists (initial_fb, index_search_string))
        {
          initialize_info_session (1);
          initial_node = info_get_node (initial_file, "Top", PARSE_NODE_DFLT);
          info_set_node_of_window (0, active_window, initial_node);
          do_info_index_search (windows, 0, index_search_string);
        }
      else
        {
          fprintf (stderr, _("no index entries found for `%s'\n"),
                   index_search_string);
          close_dribble_file ();
          return 1;
        }
      
      info_session ();
      return 0;
    }

  /* Add nodes to start with (unless we fell back to the man page). */
  else if (initial_file && strcmp (MANPAGE_FILE_BUFFER_NAME, initial_file))
    {
      initial_fb = info_load_file (initial_file, 1);
      add_initial_nodes (initial_fb, argc, argv, &error_node);
    }

  if (!user_output_filename
      && !(user_filename && error_node))
    initialize_info_session (1);

  if (error_node)
    show_error_node (error_node);
  else if (!user_output_filename)
    display_startup_message ();

  /* --output */
  if (user_output_filename)
    {
      if (!initial_fb) return 0;
      /* FIXME: Was two separate functions, dump_node_to_file as well.
         Check behaviour is the same. */
      dump_nodes_to_file (initial_fb, user_nodenames,
                          user_output_filename, dump_subnodes);
      return 0;
    }

  /* Initialize the Info session. */

  if (!(user_filename && error_node))
    begin_multiple_window_info_session (initial_file, user_nodenames);
  else
    return 1;

  info_session ();
  return 0;
}

void
add_file_directory_to_path (char *filename)
{
  char *directory_name = xstrdup (filename);
  char *temp = filename_non_directory (directory_name);

  if (temp != directory_name)
    {
      if (HAVE_DRIVE (directory_name) && temp == directory_name + 2)
	{
	  /* The directory of "d:foo" is stored as "d:.", to avoid
	     mixing it with "d:/" when a slash is appended.  */
	  *temp = '.';
	  temp += 2;
	}
      temp[-1] = 0;
      infopath_add (directory_name, INFOPATH_PREPEND);
    }

  free (directory_name);
}


/* Error handling.  */

/* Non-zero if an error has been signalled. */
int info_error_was_printed = 0;

/* Non-zero means ring terminal bell on errors. */
int info_error_rings_bell_p = 1;

static FILE *debug_file;

static void
close_debugfile (void)
{
  fclose (debug_file);
}

#define INFODEBUG_FILE "infodebug"

void
vinfo_debug (const char *format, va_list ap)
{
  FILE *fp;

  if (!debug_file)
    {
      if (!info_windows_initialized_p || display_inhibited)
	fp = stderr;
      else
	{
	  debug_file = fopen (INFODEBUG_FILE, "w");
	  if (!debug_file)
	    {
	      info_error (_("can't open %s: %s"), INFODEBUG_FILE,
			  strerror (errno));
	      exit (EXIT_FAILURE);
	    }
	  atexit (close_debugfile);
	  fp = debug_file;
	  info_error (_("debugging output diverted to \"%s\""),
		      INFODEBUG_FILE);
	}
    }
  else
    fp = debug_file;
  
  fprintf (fp, "%s: ", program_name);
  vfprintf (fp, format, ap);
  fprintf (fp, "\n");
  fflush (stderr);
}

void
info_debug (const char *format, ...)
{
  va_list ap;
  va_start (ap, format);
  vinfo_debug (format, ap);
  va_end (ap);
}

/* Print AP according to FORMAT.  If the window system was initialized,
   then the message is printed in the echo area.  Otherwise, a message is
   output to stderr. */
void
vinfo_error (const char *format, va_list ap)
{
  info_error_was_printed = 1;

  if (!info_windows_initialized_p || display_inhibited)
    {
      fprintf (stderr, "%s: ", program_name);
      vfprintf (stderr, format, ap);
      fprintf (stderr, "\n");
      fflush (stderr);
    }
  else
    {
      if (!echo_area_is_active)
        {
          if (info_error_rings_bell_p)
            terminal_ring_bell ();
          vwindow_message_in_echo_area (format, ap);
        }
      else
        {
          NODE *temp = build_message_node (format, ap);
          if (info_error_rings_bell_p)
            terminal_ring_bell ();
          inform_in_echo_area (temp->contents);
          free (temp->contents);
          free (temp);
        }
    }
}

void
info_error (const char *format, ...)
{
  va_list ap;
  va_start (ap, format);
  vinfo_error (format, ap);
  va_end (ap);
}

void
show_error_node (NODE *node)
{
  if (info_error_rings_bell_p)
    terminal_ring_bell ();
  if (!info_windows_initialized_p)
    {
      if (node->contents[node->nodelen - 1] == '\n')
        node->contents[node->nodelen - 1] = 0;
      info_error ("%s", node->contents);
    }
  else if (!echo_area_is_active)
    {
      free_echo_area ();
      window_set_node_of_window (the_echo_area, node);
      display_update_one_window (the_echo_area);
    }
  else
    inform_in_echo_area (node->contents);
}


/* Produce a scaled down description of the available options to Info. */
static void
info_short_help (void)
{
  printf (_("\
Usage: %s [OPTION]... [MENU-ITEM...]\n\
\n\
Read documentation in Info format.\n"), program_name);
  puts ("");

  puts (_("\
Options:\n\
  -a, --all                    use all matching manuals.\n\
  -k, --apropos=STRING         look up STRING in all indices of all manuals.\n\
  -d, --directory=DIR          add DIR to INFOPATH.\n\
      --dribble=FILE           remember user keystrokes in FILENAME.\n\
  -f, --file=MANUAL            specify Info manual to visit."));

  puts (_("\
  -h, --help                   display this help and exit.\n\
      --index-search=STRING    go to node pointed by index entry STRING.\n\
  -n, --node=NODENAME          specify nodes in first visited Info file.\n\
  -o, --output=FILE            output selected nodes to FILE."));

  puts (_("\
  -R, --raw-escapes            output \"raw\" ANSI escapes (default).\n\
      --no-raw-escapes         output escapes as literal text.\n\
      --restore=FILE           read initial keystrokes from FILE.\n\
  -O, --show-options, --usage  go to command-line options node."));

#if defined(__MSDOS__) || defined(__MINGW32__)
  puts (_("\
  -b, --speech-friendly        be friendly to speech synthesizers."));
#endif

  puts (_("\
      --strict-node-location   (for debugging) use Info file pointers as-is.\n\
      --subnodes               recursively output menu items.\n\
  -v, --variable VAR=VALUE     assign VALUE to Info variable VAR.\n\
      --vi-keys                use vi-like and less-like key bindings.\n\
      --version                display version information and exit.\n\
  -w, --where, --location      print physical location of Info file.\n\
  -x, --debug=NUMBER           set debugging level (-1 for all).\n"));

  puts (_("\n\
The first non-option argument, if present, is the menu entry to start from;\n\
it is searched for in all `dir' files along INFOPATH.\n\
If it is not present, info merges all `dir' files and shows the result.\n\
Any remaining arguments are treated as the names of menu\n\
items relative to the initial node visited."));

  puts (_("\n\
For a summary of key bindings, type h within Info."));

  puts (_("\n\
Examples:\n\
  info                       show top-level dir menu\n\
  info info                  show the general manual for Info readers\n\
  info info-stnd             show the manual specific to this Info program\n\
  info emacs                 start at emacs node from top-level dir\n\
  info emacs buffers         start at buffers node within emacs manual\n\
  info --show-options emacs  start at node with emacs' command line options\n\
  info --subnodes -o out.txt emacs  dump entire manual to out.txt\n\
  info -f ./foo.info         show file ./foo.info, not searching dir"));

  puts (_("\n\
Email bug reports to bug-texinfo@gnu.org,\n\
general questions and discussion to help-texinfo@gnu.org.\n\
Texinfo home page: http://www.gnu.org/software/texinfo/"));

  exit (EXIT_SUCCESS);
}


/* Initialize strings for gettext.  Because gettext doesn't handle N_ or
   _ within macro definitions, we put shared messages into variables and
   use them that way.  This also has the advantage that there's only one
   copy of the strings.  */

const char *msg_cant_find_node;
const char *msg_cant_file_node;
const char *msg_cant_find_window;
const char *msg_cant_find_point;
const char *msg_cant_kill_last;
const char *msg_no_menu_node;
const char *msg_no_foot_node;
const char *msg_no_xref_node;
const char *msg_no_pointer;
const char *msg_unknown_command;
const char *msg_term_too_dumb;
const char *msg_at_node_bottom;
const char *msg_at_node_top;
const char *msg_one_window;
const char *msg_win_too_small;
const char *msg_cant_make_help;

static void
init_messages (void)
{
  msg_cant_find_node   = _("Cannot find node `%s'.");
  msg_cant_file_node   = _("Cannot find node `(%s)%s'.");
  msg_cant_find_window = _("Cannot find a window!");
  msg_cant_find_point  = _("Point doesn't appear within this window's node!");
  msg_cant_kill_last   = _("Cannot delete the last window.");
  msg_no_menu_node     = _("No menu in this node.");
  msg_no_foot_node     = _("No footnotes in this node.");
  msg_no_xref_node     = _("No cross references in this node.");
  msg_no_pointer       = _("No `%s' pointer for this node.");
  msg_unknown_command  = _("Unknown Info command `%c'; try `?' for help.");
  msg_term_too_dumb    = _("Terminal type `%s' is not smart enough to run Info.");
  msg_at_node_bottom   = _("You are already at the last page of this node.");
  msg_at_node_top      = _("You are already at the first page of this node.");
  msg_one_window       = _("Only one window.");
  msg_win_too_small    = _("Resulting window would be too small.");
  msg_cant_make_help   = _("Not enough room for a help window, please delete a window.");
}
