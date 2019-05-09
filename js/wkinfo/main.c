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

static char *next_link, *prev_link, *up_link;

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
      g_print ("Received le data: <%s>\n", buffer);

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


int main(int argc, char* argv[])
{
    // Initialize GTK+
    gtk_init(&argc, &argv);

    msg ("started\n");


    webkit_web_context_set_process_model (
      webkit_web_context_get_default (),
      WEBKIT_PROCESS_MODEL_MULTIPLE_SECONDARY_PROCESSES); 

    WebKitWebViewGroup *group = webkit_web_view_group_new (NULL);

    /* Disable JavaScript */
    WebKitSettings *settings = webkit_web_view_group_get_settings (group);
    webkit_settings_set_enable_javascript (settings, FALSE);

    webkit_web_context_get_default ();


    /* Load "extensions".  The web browser is run in a separate process
       and we can only access the DOM in that process. */
    g_signal_connect (webkit_web_context_get_default (),
		      "initialize-web-extensions",
		      G_CALLBACK (initialize_web_extensions),
		      NULL);

    WebKitWebView *webView = WEBKIT_WEB_VIEW(
                                 webkit_web_view_new_with_group(group));

    // Create an 800x600 window that will contain the browser instance
    GtkWidget *main_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size(GTK_WINDOW(main_window), 800, 600);

    /* Create a web view to parse index files.  */
    WebKitWebView *hiddenWebView = WEBKIT_WEB_VIEW(webkit_web_view_new());

    // Put the browser area into the main window
    gtk_container_add(GTK_CONTAINER(main_window), GTK_WIDGET(webView));
    // Make sure the main window and all its contents are visible
    gtk_widget_show_all (main_window);

    // Set up callbacks so that if either the main window or the browser 
    // instance is closed, the program will exit.
    g_signal_connect(main_window, "destroy", G_CALLBACK(destroyWindowCb), NULL);
    g_signal_connect(webView, "close", G_CALLBACK(closeWebViewCb), main_window);

    g_signal_connect(webView, "key_press_event", G_CALLBACK(onkeypress), main_window);

    webkit_web_view_load_uri (hiddenWebView,
 "file:/home/g/src/texinfo/GIT/js/test/elisp/Index.html?send-index");

    // Make sure that when the browser area becomes visible, it will get mouse
    // and keyboard events
    gtk_widget_grab_focus (GTK_WIDGET(webView));


    webkit_web_view_load_uri (webView,
                 "file:/home/g/src/texinfo/GIT/js/test/hello/index.html");
                 //"file:/home/g/src/texinfo/GIT/js/wkinfo/test.html");

    // Run the main GTK+ event loop
    gtk_main ();

    return 0;
}

static gboolean onkeypress(GtkWidget *webView,
                           GdkEvent  *event,
                           gpointer   user_data)
{
  GdkEventKey *k = (GdkEventKey *) event;

  switch (k->keyval)
    {
    case GDK_KEY_q:
      gtk_main_quit();
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
    default:
      ;
    }

  return false;

}


static void
destroyWindowCb (GtkWidget *widget, GtkWidget *window)
{
  gtk_main_quit ();
}

static gboolean
closeWebViewCb(WebKitWebView *webView, GtkWidget *window)
{
  gtk_widget_destroy (window);
  return TRUE;
}
