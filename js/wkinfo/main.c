#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <gtk/gtk.h>
#include <gio/gio.h>
#include <gio/gunixsocketaddress.h>
#include <webkit2/webkit2.h>

static void destroyWindowCb(GtkWidget* widget, GtkWidget* window);
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

gboolean
socket_cb (GSocket *socket,
           GIOCondition condition,
           gpointer user_data)
{
  static char buffer[256];
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

      g_print ("Received le data: <%s>\n", buffer);

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
  /* Web Extensions get a different ID for each Web Process */
  static guint32 unique_id = 0;

  /* Make a Unix domain socket for communication with the browser process.
     Some example code and documentation for WebKitGTK uses dbus instead. */

  if (!socket_file)
    socket_file = tmpnam (0);
  else
    g_print ("bug: more than one web process started\n");

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

  webkit_web_context_set_web_extensions_directory (
     context, WEB_EXTENSIONS_DIRECTORY);
  webkit_web_context_set_web_extensions_initialization_user_data (
     context, g_variant_new_bytestring (socket_file));
}


int main(int argc, char* argv[])
{
    // Initialize GTK+
    gtk_init(&argc, &argv);

    // Create an 800x600 window that will contain the browser instance
    GtkWidget *main_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size(GTK_WINDOW(main_window), 800, 600);

    /* Load "extensions".  The web browser is run in a separate process
       and we can only access the DOM in that process. */
    g_signal_connect (webkit_web_context_get_default (),
		      "initialize-web-extensions",
		      G_CALLBACK (initialize_web_extensions),
		      NULL);

    // Create a browser instance
    WebKitWebView *webView = WEBKIT_WEB_VIEW(webkit_web_view_new());

    /* Disable JavaScript */
    WebKitSettings *settings = webkit_web_view_group_get_settings (webkit_web_view_get_group (webView));
    webkit_settings_set_enable_javascript (settings, FALSE);


    // Put the browser area into the main window
    gtk_container_add(GTK_CONTAINER(main_window), GTK_WIDGET(webView));

    // Set up callbacks so that if either the main window or the browser 
    // instance is closed, the program will exit.
    g_signal_connect(main_window, "destroy", G_CALLBACK(destroyWindowCb), NULL);
    g_signal_connect(webView, "close", G_CALLBACK(closeWebViewCb), main_window);

    g_signal_connect(webView, "key_press_event", G_CALLBACK(onkeypress), main_window);

    // Load a web page into the browser instance
    //webkit_web_view_load_uri(webView, "http://www.webkitgtk.org/");
    webkit_web_view_load_uri(webView, "file:/home/g/src/texinfo/GIT/js/test/hello/index.html");

    // Make sure that when the browser area becomes visible, it will get mouse
    // and keyboard events
    gtk_widget_grab_focus(GTK_WIDGET(webView));

    // Make sure the main window and all its contents are visible
    gtk_widget_show_all(main_window);

    // Run the main GTK+ event loop
    gtk_main();

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
      webkit_web_view_load_uri(WEBKIT_WEB_VIEW(webView), "internal:next");
      break;
    default:
      ;
    }

  return false;

}


static void destroyWindowCb(GtkWidget* widget, GtkWidget* window)
{
    gtk_main_quit();
}

static gboolean closeWebViewCb(WebKitWebView* webView, GtkWidget* window)
{
    gtk_widget_destroy(window);
    return TRUE;
}
