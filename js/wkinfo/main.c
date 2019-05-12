#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <time.h>
#include <stdarg.h>

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

void
msg (char *fmt, ...)
{
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

#define WEB_EXTENSIONS_DIRECTORY "/home/g/src/texinfo/GIT/js/wkinfo/.libs"

static char *socket_file;
int socket_id;

/* FIXME - not removed if program killed with C-c. */
static void
remove_socket (void)
{
  if (socket_file)
    unlink (socket_file);
}

WebKitWebView *webView = 0;

static char *next_link, *prev_link, *up_link;

GtkEntry *index_entry = 0;
GtkEntryCompletion *index_completion = 0;
GtkListStore *index_store = 0;

void
load_relative_url (const char *href)
{
  char *link = 0;

  const char *current_uri = webkit_web_view_get_uri (webView);
  if (current_uri)
    {
      const char *p = current_uri;
      const char *q;

      g_print ("current uri is |%s|\n", current_uri);
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

          g_print ("LOADING %s\n", link);
          webkit_web_view_load_uri (webView, link);
        }
    }
  free (link);
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
  gtk_widget_hide (GTK_WIDGET(index_entry));
  return FALSE;
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
          g_print ("incomplete packet\n");
          return;
        }
      *q2++ = 0;

      g_print ("add index entry %s\n", p);

      gtk_list_store_append (index_store, &iter);
      gtk_list_store_set (index_store, &iter,
                          0, p, 1, q,
                          -1);

      p = q2;
    }
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
          g_print ("socket receive error: %s\n", err->message);
          gtk_main_quit ();
        }

      buffer[PACKET_SIZE] = '\0';
      // g_print ("Received le data: <%s>\n", buffer);

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
      g_socket_bind (gsocket, address, FALSE, &err);
      if (!gsocket)
        {
          g_print ("bind socket: %s\n", err->message);
          gtk_main_quit ();
        }
      err = 0;

      GSource *gsource = g_socket_create_source (gsocket, G_IO_IN, NULL);
      g_source_set_callback (gsource, (GSourceFunc)(socket_cb), NULL, NULL);
      g_source_attach (gsource, NULL);

      atexit (&remove_socket);
    }

  webkit_web_context_set_web_extensions_directory (
     context, WEB_EXTENSIONS_DIRECTORY);
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
  gtk_widget_hide (GTK_WIDGET(index_entry));
  return TRUE;
}


static GMainLoop *main_loop;

int
main(int argc, char* argv[])
{
    gtk_init(&argc, &argv);

    msg ("started\n");


    webkit_web_context_set_process_model (
      webkit_web_context_get_default (),
      WEBKIT_PROCESS_MODEL_MULTIPLE_SECONDARY_PROCESSES); 

    WebKitWebViewGroup *group = webkit_web_view_group_new (NULL);

    /* Disable JavaScript */
    WebKitSettings *settings = webkit_web_view_group_get_settings (group);
    webkit_settings_set_enable_javascript (settings, FALSE);

    /* Load "extensions".  The web browser is run in a separate process
       and we can only access the DOM in that process. */
    g_signal_connect (webkit_web_context_get_default (),
		      "initialize-web-extensions",
		      G_CALLBACK (initialize_web_extensions),
		      NULL);

    webView = WEBKIT_WEB_VIEW(
                                 webkit_web_view_new_with_group(group));

    // Create an 800x600 window that will contain the browser instance
    GtkWidget *main_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size(GTK_WINDOW(main_window), 800, 600);

    GtkBox *box = GTK_BOX(gtk_box_new (GTK_ORIENTATION_VERTICAL, 0));

    index_entry = GTK_ENTRY(gtk_entry_new ());

    gtk_box_pack_start (box, GTK_WIDGET(webView), TRUE, TRUE, 0);
    gtk_box_pack_start (box, GTK_WIDGET(index_entry), FALSE, FALSE, 0);

    gtk_container_add(GTK_CONTAINER(main_window), GTK_WIDGET(box));

    gtk_widget_add_events (GTK_WIDGET(webView), GDK_FOCUS_CHANGE_MASK);

    /* Hide the index search box when it loses focus. */
    g_signal_connect (webView, "focus-in-event",
                      G_CALLBACK(hide_index_cb), NULL);

    gtk_widget_hide (GTK_WIDGET(index_entry));

    /* Create a web view to parse index files.  */
    WebKitWebView *hiddenWebView = WEBKIT_WEB_VIEW(webkit_web_view_new());

    // Set up callbacks so that if either the main window or the browser 
    // instance is closed, the program will exit.
    g_signal_connect(main_window, "destroy", G_CALLBACK(destroyWindowCb), NULL);
    g_signal_connect(webView, "close", G_CALLBACK(closeWebViewCb), main_window);

    g_signal_connect(webView, "key-press-event", G_CALLBACK(onkeypress), main_window);

    gtk_widget_show_all (main_window);

    webkit_web_view_load_uri (hiddenWebView,
 "file:/home/g/src/texinfo/GIT/js/test/elisp/Index.html?send-index");

    /* Make sure that when the browser area becomes visible, it will get mouse
       and keyboard events. */
    gtk_widget_grab_focus (GTK_WIDGET(webView));

    webkit_web_view_load_uri (webView,
                 "file:/home/g/src/texinfo/GIT/js/test/elisp/index.html");

    main_loop = g_main_loop_new (NULL, FALSE);
    g_main_loop_run (main_loop);

    return 0;
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
