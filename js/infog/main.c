#define _GNU_SOURCE

#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <time.h>
#include <stdarg.h>
#include <signal.h>

#include <gtk/gtk.h>
#include <gio/gio.h>
#include <gio/gunixsocketaddress.h>
#include <webkit2/webkit2.h>

#include "common.h"

void
vmsg (char *fmt, va_list v)
{
  vprintf (fmt, v);
}

int debug_level = 1;

void
debug (int level, char *fmt, ...)
{
  if (level > debug_level)
    return;

  va_list v;
  va_start (v, fmt);

  printf ("%lu: ", clock ());
  vmsg (fmt, v);
  va_end (v);
}

static void destroyWindowCb(GtkWidget *widget, GtkWidget *window);
static gboolean closeWebViewCb(WebKitWebView* webView, GtkWidget* window);
static gboolean onkeypress(GtkWidget *webView,
                           GdkEvent  *event,
                           gpointer   user_data);

static char *socket_file;
int socket_id;

static void
remove_socket (void)
{
  debug (1, "removing socket %s\n", socket_file);
  if (socket_file)
    unlink (socket_file);
}

WebKitWebView *webView = 0;

static char *next_link, *prev_link, *up_link;

GtkWidget *main_window = 0;

GtkEntry *index_entry = 0;
GtkEntryCompletion *index_completion = 0;
GtkListStore *index_store = 0;

GtkTreeView *toc_pane;
GtkListStore *toc_store = 0;
GtkTreeSelection *toc_selection = 0;
GtkWidget *toc_scroll = 0;

gboolean indices_loaded = FALSE;
WebKitWebView *hiddenWebView = NULL;

char *info_dir = 0;

void
load_relative_url (const char *href)
{
  char *link = 0;

  const char *current_uri = webkit_web_view_get_uri (webView);
  if (current_uri)
    {
      const char *p = current_uri;
      const char *q;

      /* Set p to after the last '/'. */
      while ((q = strchr (p, '/')))
        {
          q++;
          p = q;
        }
      if (p != current_uri)
        {
          link = malloc ((p - current_uri)
                         + strlen (href) + 1);
          memcpy (link, current_uri, p - current_uri);
          strcpy (link + (p - current_uri), href);

          debug (1, "LOADING %s\n", link);
          webkit_web_view_load_uri (webView, link);
        }
    }
  free (link);
}

void
hide_index (void)
{
  gtk_widget_hide (GTK_WIDGET(index_entry));
  gtk_widget_grab_focus (GTK_WIDGET(webView));
}

gboolean
match_selected_cb (GtkEntryCompletion *widget,
                   GtkTreeModel       *model,
                   GtkTreeIter        *iter,
                   gpointer            user_data)
{
  GValue value = G_VALUE_INIT;

  gtk_tree_model_get_value (model,
			    iter,
			    1,
			    &value);
  load_relative_url (g_value_get_string (&value));
  hide_index ();
  return FALSE;
}

void
clear_completions (void)
{
  if (index_store)
    gtk_list_store_clear (index_store);
}

void
save_completions (char *p)
{
  GtkTreeIter iter;

  if (!index_completion)
    {
      index_store = gtk_list_store_new (2, G_TYPE_STRING, G_TYPE_STRING);
      index_completion = gtk_entry_completion_new ();
      g_signal_connect (index_completion, "match-selected",
                        G_CALLBACK(match_selected_cb), NULL);
      gtk_entry_completion_set_model (index_completion,
                                      GTK_TREE_MODEL(index_store));
      gtk_entry_completion_set_text_column (index_completion, 0);
      gtk_entry_set_completion (index_entry, index_completion);
    }

  char *q, *q2;
  while ((q = strchr (p, '\n')))
    {
      *q++ = 0;
      q2 = strchr (q, '\n');
      if (!q2)
        {
          debug (1, "incomplete packet\n");
          return;
        }
      *q2++ = 0;

      // debug (2, "add index entry %s\n", p);

      gtk_list_store_append (index_store, &iter);
      gtk_list_store_set (index_store, &iter,
                          0, p, 1, q,
                          -1);

      p = q2;
    }
}

static char *current_manual_dir;

char *index_list = 0;
char *index_list_ptr = 0;

/* Load a single index node in the list in index_list.  We only do one
   at a time to give the subprocess time to do it before we load the next one.  
   If only there were some way of getting the subthread to load pages itself
   instead of having to call webkit_web_view_load_uri here. */
void
continue_to_load_index_nodes (void)
{
  GString *s;
  char *q;

  if (!index_list_ptr || !(q = strchr (index_list_ptr, '\n')))
    {
      free (index_list);
      index_list_ptr = index_list = 0;
      return;
    }

  s = g_string_new (NULL);

  *q = '\0';
  g_string_assign (s, "file:");
  g_string_append (s, current_manual_dir);
  g_string_append (s, "/");
  g_string_append (s, index_list_ptr);
  g_string_append (s, "?send-index");

  debug (1, "load index node %s\n", s->str);
  webkit_web_view_load_uri (hiddenWebView, s->str);

  g_string_free (s, TRUE);

  index_list_ptr = q + 1;
}

void
load_index_nodes (char *p)
{
  index_list_ptr = index_list = strdup (p);
  continue_to_load_index_nodes ();
}

GtkCellRenderer *toc_renderer = 0;
GtkTreeViewColumn *toc_column = 0;

void
load_toc (char *p)
{
  GtkTreeIter iter;

  if (!toc_store)
    {
      toc_store = gtk_list_store_new (2, G_TYPE_STRING, G_TYPE_STRING);
      gtk_tree_view_set_model (toc_pane, GTK_TREE_MODEL(toc_store));

      toc_renderer = gtk_cell_renderer_text_new ();
      toc_column = gtk_tree_view_column_new_with_attributes (NULL,
                                                   toc_renderer,
                                                   "text", 0,
                                                   NULL);
      gtk_tree_view_append_column (GTK_TREE_VIEW (toc_pane), toc_column);
    }

  char *q, *q2;
  while ((q = strchr (p, '\n')))
    {
      *q++ = 0;
      q2 = strchr (q, '\n');
      if (!q2)
        break;
      *q2++ = 0;
      debug (1, "add toc entry %s:%s\n", p, q);

      gtk_list_store_append (toc_store, &iter);
      gtk_list_store_set (toc_store, &iter,
                          0, p, 1, q, -1);

      p = q2;
    }
}

void
toc_selected_cb (GtkTreeSelection *selection, gpointer user_data)
{
  bool success;
  GtkTreeIter iter;
  GtkTreeModel *model;
  char *url;

  success = gtk_tree_selection_get_selected (selection, &model, &iter);
  if (!success)
    return;

  gtk_tree_model_get (model, &iter, 1, &url, -1);

  load_relative_url (url);
  g_free (url);
}

gboolean
socket_cb (GSocket *socket,
           GIOCondition condition,
           gpointer user_data)
{
  static char buffer[PACKET_SIZE+1];
  GError *err = 0;
  gssize result;

  switch (condition)
    {
    case G_IO_IN:
      result = g_socket_receive (socket, buffer, sizeof buffer, NULL, &err);
      if (result <= 0)
        {
          debug (1, "socket receive error: %s\n", err->message);
          gtk_main_quit ();
        }

      buffer[PACKET_SIZE] = '\0';
      // debug (2, "Received le data: <%s>\n", buffer);

      char *p, *q;
      p = strchr (buffer, '\n'); 
      if (!p)
        break;
      *p = 0;

      char **save_where = 0;
      if (!strcmp (buffer, "next"))
        save_where = &next_link;
      else if (!strcmp (buffer, "prev"))
        save_where = &prev_link;
      else if (!strcmp (buffer, "up"))
        save_where = &up_link;
      if (save_where)
        {
          p++;
          q = strchr (p, '\n');
          if (!q)
            break;
          *q = 0;
          free (*save_where);
          *save_where = strdup (p);
        }
      else if (!strcmp (buffer, "index"))
        {
          p++; /* Set p to the first byte after index line. */

          save_completions (p);
          continue_to_load_index_nodes ();
        }
      else if (!strcmp (buffer, "new-manual"))
        {
          debug (1, "NEW MANUAL %s\n", p + 1);
          clear_completions ();
          gtk_list_store_clear (toc_store);

          char *q = strchr (p + 1, '\n');
          if (!q)
            break;
          *q = 0;

          GString *s = g_string_new (NULL);
          g_string_append (s, "file:");
          g_string_append (s, p + 1);
          free (current_manual_dir);
          current_manual_dir = strdup (p + 1);
          g_string_append (s, "/index.html?top-node");
          webkit_web_view_load_uri (hiddenWebView, s->str);
          g_string_free (s, TRUE);
        }
      else if (!strcmp (buffer, "toc"))
        {
          p++;
          load_toc (p);
        }
      else if (!strcmp (buffer, "index-nodes"))
        {
          /* Receive URL of files containing an index. */
          p++;
          load_index_nodes (p);
        }
      else
        {
          g_print ("Unknown message type '%s'\n", buffer);
        }

      break;
    case G_IO_ERR:
    case G_IO_HUP:
      g_print ("socket error\n");
      gtk_main_quit ();
      break;
    default:
      g_print ("unhandled socket connection\n");
      gtk_main_quit ();
      break;
    }
  return true;
}

char *extensions_directory;

static void
initialize_web_extensions (WebKitWebContext *context,
                           gpointer          user_data)
{
  /* Make a Unix domain socket for communication with the browser process.
     Some example code and documentation for WebKitGTK uses dbus instead. */
  if (!socket_file)
    {
      socket_file = tmpnam (0);

      GError *err = 0;

      err = 0;
      GSocket *gsocket = g_socket_new (G_SOCKET_FAMILY_UNIX,
                                       G_SOCKET_TYPE_DATAGRAM,
                                       0,
                                       &err);
      if (!gsocket)
        {
          g_print ("no socket: %s\n", err->message);
          gtk_main_quit ();
        }

      err = 0;
      GSocketAddress *address = g_unix_socket_address_new (socket_file);
      if (!g_socket_bind (gsocket, address, FALSE, &err))
        {
          g_print ("bind socket: %s\n", err->message);
          gtk_main_quit ();
        }
      err = 0;

      GSource *gsource = g_socket_create_source (gsocket, G_IO_IN, NULL);
      g_source_set_callback (gsource, (GSourceFunc)(socket_cb), NULL, NULL);
      g_source_attach (gsource, NULL);
      g_object_unref (address);

      atexit (&remove_socket);
    }

  char *d;
  asprintf (&d, "%s/%s", extensions_directory, ".libs");
  webkit_web_context_set_web_extensions_directory (context, d);
  free (d);

  webkit_web_context_set_web_extensions_initialization_user_data (
     context, g_variant_new_bytestring (socket_file));
}

void
show_index (void)
{
  gtk_widget_show (GTK_WIDGET(index_entry));
  gtk_widget_grab_focus (GTK_WIDGET(index_entry));
}


gboolean
hide_index_cb (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)
{
  hide_index ();
  return TRUE;
}


gboolean
decide_policy_cb (WebKitWebView           *web_view,
                  WebKitPolicyDecision    *decision,
                  WebKitPolicyDecisionType type,
                  gpointer                 user_data)
{
  switch (type)
    {
    case WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION: {
      WebKitNavigationPolicyDecision *navigation_decision
        = WEBKIT_NAVIGATION_POLICY_DECISION (decision);

      WebKitURIRequest *request
        = webkit_navigation_policy_decision_get_request (navigation_decision);

      const char *uri = webkit_uri_request_get_uri (request);

      /* Check for an external URL. */
      if (!memcmp (uri, "http:", 5) || !memcmp(uri, "https:", 6))
        {
          debug (1, "link blocked");
          webkit_policy_decision_ignore (decision);
        }
      else
        webkit_policy_decision_use (decision);

      break;
    }
    case WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION: {
       WebKitNavigationPolicyDecision *navigation_decision
	 = WEBKIT_NAVIGATION_POLICY_DECISION (decision);
       /* Make a policy decision here. */
       break;
    }
    case WEBKIT_POLICY_DECISION_TYPE_RESPONSE: {
       WebKitResponsePolicyDecision *response
	 = WEBKIT_RESPONSE_POLICY_DECISION (decision);
       /* Make a policy decision here. */
       break;
    }
    default:
       /* Making no decision results in webkit_policy_decision_use(). */
       return FALSE;
    }
   return TRUE;
}


void
find_extensions_directory (int argc, char *argv[])
{
  char *p;
  if (argc == 0 || !argv[0])
    {
      g_print ("cannot get program name; quitting\n");
      exit (1);
    }

  if (!(p = strchr (argv[0], '/')))
    {
      g_print ("running installed program not yet supported\n");
      exit (1);
    }

  extensions_directory = strdup (argv[0]);
  extensions_directory[p - argv[0]] = '\0';
}

static GMainLoop *main_loop;

void
build_gui (void)
{
  /* Disable JavaScript */
  WebKitSettings *settings = webkit_settings_new ();
  webkit_settings_set_enable_javascript (settings, FALSE);

  main_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_default_size(GTK_WINDOW(main_window), 800, 600);

  GtkBox *box = GTK_BOX(gtk_box_new (GTK_ORIENTATION_VERTICAL, 0));

  GtkPaned *paned = GTK_PANED(gtk_paned_new (GTK_ORIENTATION_HORIZONTAL));
  gtk_box_pack_start (box, GTK_WIDGET(paned), TRUE, TRUE, 0);

  toc_scroll = gtk_scrolled_window_new (NULL, NULL);
  toc_pane = GTK_TREE_VIEW(gtk_tree_view_new ());
  gtk_tree_view_set_headers_visible (toc_pane, FALSE);
  toc_selection = gtk_tree_view_get_selection (toc_pane);
  g_signal_connect (toc_selection, "changed",
                    G_CALLBACK(toc_selected_cb), NULL);

  gtk_container_add (GTK_CONTAINER (toc_scroll), GTK_WIDGET(toc_pane));
  gtk_paned_pack1 (paned, GTK_WIDGET(toc_scroll), FALSE, TRUE);

  webView = WEBKIT_WEB_VIEW(webkit_web_view_new_with_settings(settings));
  gtk_paned_pack2 (paned, GTK_WIDGET(webView), TRUE, TRUE);

  index_entry = GTK_ENTRY(gtk_entry_new ());
  gtk_box_pack_start (box, GTK_WIDGET(index_entry), FALSE, FALSE, 0);

  gtk_container_add(GTK_CONTAINER(main_window), GTK_WIDGET(box));

  gtk_widget_add_events (GTK_WIDGET(webView), GDK_FOCUS_CHANGE_MASK);

  /* Hide the index search box when it loses focus. */
  g_signal_connect (webView, "focus-in-event",
                    G_CALLBACK(hide_index_cb), NULL);
  gtk_widget_hide (GTK_WIDGET(index_entry));

  g_signal_connect (webView, "decide-policy",
                    G_CALLBACK(decide_policy_cb), NULL);

  // Set up callbacks so that if either the main window or the browser 
  // instance is closed, the program will exit.
  g_signal_connect(main_window, "destroy", G_CALLBACK(destroyWindowCb), NULL);
  g_signal_connect(webView, "close", G_CALLBACK(closeWebViewCb), main_window);

  g_signal_connect(webView, "key-press-event", G_CALLBACK(onkeypress), main_window);

  gtk_widget_show_all (main_window);

  /* Make sure that when the browser area becomes visible, it will get mouse
     and keyboard events. */
  gtk_widget_grab_focus (GTK_WIDGET(webView));
}

/* Used to make sure atexit functions run. */
void
termination_handler (int signum)
{
  exit (0);
}

int
main (int argc, char *argv[])
{
    gtk_init (&argc, &argv);
    find_extensions_directory (argc, argv);

    info_dir = getenv ("INFO_HTML_DIR");
    if (!info_dir)
      {
        g_print ("Please set INFO_HTML_DIR\n");
        return 0;
      }

    if (signal (SIGINT, termination_handler) == SIG_IGN)
      signal (SIGINT, SIG_IGN);
    if (signal (SIGHUP, termination_handler) == SIG_IGN)
      signal (SIGHUP, SIG_IGN);
    if (signal (SIGTERM, termination_handler) == SIG_IGN)
      signal (SIGTERM, SIG_IGN);


    /* This is used to use a separate process for the web browser
       that looks up the index files.  This stops the program from freezing 
       while the index files are processed.  */
    if (0)
      {
        webkit_web_context_set_process_model (
          webkit_web_context_get_default (),
          WEBKIT_PROCESS_MODEL_MULTIPLE_SECONDARY_PROCESSES); 
      }

    /* Load "extensions".  The web browser is run in a separate process
       and we can only access the DOM in that process. */
    g_signal_connect (webkit_web_context_get_default (),
		      "initialize-web-extensions",
		      G_CALLBACK (initialize_web_extensions),
		      NULL);

    build_gui ();

#define MANUAL "hello"

    GString *s = g_string_new (NULL);
    g_string_append (s, "file:");
    g_string_append (s, info_dir);
    g_string_append (s, "/");
    g_string_append (s, MANUAL);
    g_string_append (s, "/index.html");
    webkit_web_view_load_uri (webView, s->str);
    g_string_free (s, TRUE);

    /* Create a web view to parse index files.  */
    hiddenWebView = WEBKIT_WEB_VIEW(webkit_web_view_new());

    main_loop = g_main_loop_new (NULL, FALSE);
    g_main_loop_run (main_loop);

    exit (0);
}

static gboolean
onkeypress (GtkWidget *webView,
            GdkEvent  *event,
            gpointer   user_data)
{
  GdkEventKey *k = (GdkEventKey *) event;

  if (k->type != GDK_KEY_PRESS)
    return TRUE;

  switch (k->keyval)
    {
    case GDK_KEY_q:
      g_main_loop_quit (main_loop);
      break;
    case GDK_KEY_n:
      webkit_web_view_load_uri (WEBKIT_WEB_VIEW(webView),
                                next_link);
      break;
    case GDK_KEY_p:
      webkit_web_view_load_uri (WEBKIT_WEB_VIEW(webView),
                                prev_link);
      break;
    case GDK_KEY_u:
      webkit_web_view_load_uri (WEBKIT_WEB_VIEW(webView),
                                up_link);
      break;
    case GDK_KEY_i:
      show_index ();
      break;
    default:
      return FALSE;
    }

  return TRUE;

}


static void
destroyWindowCb (GtkWidget *widget, GtkWidget *window)
{
  g_main_loop_quit (main_loop);
}

static gboolean
closeWebViewCb(WebKitWebView *webView, GtkWidget *window)
{
  gtk_widget_destroy (window);
  return TRUE;
}
