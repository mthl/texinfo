#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <gtk/gtk.h>
#include <webkit2/webkit2.h>

static void destroyWindowCb(GtkWidget* widget, GtkWidget* window);
static gboolean closeWebViewCb(WebKitWebView* webView, GtkWidget* window);
static gboolean onkeypress(GtkWidget *webView,
                           GdkEvent  *event,
                           gpointer   user_data);

#define WEB_EXTENSIONS_DIRECTORY "/home/g/src/texinfo/GIT/js/wkinfo/.libs"

static char *socket_file;
int socket_id;

static void
remove_socket (void)
{
  if (socket_file)
    unlink (socket_file);
}

static int
make_named_socket (const char *filename)
{
  struct sockaddr_un name;
  int sock;
  size_t size;

  /* Create the socket. */
  sock = socket (PF_LOCAL, SOCK_DGRAM, 0);
  if (sock < 0)
    {
      perror ("socket");
      exit (EXIT_FAILURE);
    }

  /* Bind a name to the socket. */
  name.sun_family = AF_LOCAL;
  strncpy (name.sun_path, filename, sizeof (name.sun_path));
  name.sun_path[sizeof (name.sun_path) - 1] = '\0';

  /* The size of the address is
     the offset of the start of the filename,
     plus its length (not including the terminating null byte).
     Alternatively you can just do:
     size = SUN_LEN (&name);
   */
  size = (offsetof (struct sockaddr_un, sun_path)
	  + strlen (name.sun_path));

  if (bind (sock, (struct sockaddr *) &name, size) < 0)
    {
      perror ("bind");
      exit (EXIT_FAILURE);
    }

  atexit (&remove_socket);

  return sock;
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
    {
      socket_file = tmpnam (0);
      socket_id = make_named_socket (socket_file);
    }
  else
    g_print ("bug: more than one web process started\n");

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
