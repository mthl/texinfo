#define _GNU_SOURCE

#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>

#include <glib.h>
#include <gtk/gtk.h>
#include <webkit2/webkit-web-extension.h>

#include "common.h"

/* For communicating with the main Gtk process */
static struct sockaddr_un main_name;
static size_t main_name_size;

/* Name of the socket that we create in this process to send to the socket
   of the main process. */
static char *our_socket_file;
static int socket_id;

static void
remove_our_socket (void)
{
  if (our_socket_file)
    unlink (our_socket_file);
}

gboolean
request_callback (WebKitWebPage     *web_page,
		  WebKitURIRequest  *request,
		  WebKitURIResponse *redirected_response,
		  gpointer           user_data)
{
  const char *uri = webkit_uri_request_get_uri (request);

  g_print ("Intercepting link <%s>\n", uri);

  const char *p = strchr (uri, '?');
  if (p)
    {
      char *new_uri = strdup (uri);
      new_uri[p - uri] = 0;
      webkit_uri_request_set_uri (request, new_uri);
      g_print ("new_uri %s\n", new_uri);
      free (new_uri);

      p++;
      g_print ("request type %s\n", p);
      if (!strcmp (p, "send-index"))
        {
          g_object_set_data (G_OBJECT(web_page), "send-index",
                             GINT_TO_POINTER(1));
        }
      
    }

  /* Could block external links here */

  return false;
}

void
send_datagram (GString *s)
{
  ssize_t result;
  result = sendto (socket_id, s->str, s->len + 1, 0,
         (struct sockaddr *) &main_name, main_name_size);

  if (result == -1)
    {
      g_print ("sending datagram failed: %s\n",
               strerror(errno));
    }
}

void
send_index (WebKitDOMHTMLCollection *links, gulong num_links)
{
  g_print ("trying to send index\n");

  gulong i = 0;
  GString *s = g_string_new (NULL);

  /* Break index information up into datagrams each of size less
     than PACKET_SIZE. */

  g_string_assign (s, "index\n");

  for (; i < num_links; i++)
    {
      WebKitDOMNode *node
        = webkit_dom_html_collection_item (links, i);
      if (!node)
        {
          g_print ("No node\n");
          return;
        }

      WebKitDOMElement *element;
      if (WEBKIT_DOM_IS_ELEMENT(node))
        {
          element = WEBKIT_DOM_ELEMENT(node);
        }
      else
        {
          /* When would this happen? */
          g_print ("Not an DOM element\n");
          continue;
        }

      gchar *href = webkit_dom_element_get_attribute (element, "href");
      if (href && strstr (href, "#index-"))
        {
          int try = 0;
          gsize old_len = s->len;
          do
            {
              g_string_append (s, webkit_dom_node_get_text_content (node));
              g_string_append (s, "\n");
              g_string_append (s, href);
              g_string_append (s, "\n");

              if (s->len > PACKET_SIZE && try != 1)
                {
                  g_string_truncate (s, old_len);
                  g_print ("sending packet %u||%s||\n", s->len, s->str);
                  send_datagram (s);
                  g_string_assign (s, "index\n");
                  try++;
                  continue;
                }
            }
          while (0);
        }
    }
  send_datagram (s);

  g_string_free (s, TRUE);
}

void
document_loaded_callback (WebKitWebPage *web_page,
                          gpointer       user_data)
{
  g_print ("Page %d loaded for %s\n", 
           webkit_web_page_get_id (web_page),
           webkit_web_page_get_uri (web_page));

  WebKitDOMDocument *dom_document
    = webkit_web_page_get_dom_document (web_page);

  if (!dom_document)
    {
      g_print ("No DOM document\n");
      return;
    }

  WebKitDOMHTMLCollection *links =
    webkit_dom_document_get_links (dom_document);

  if (!links)
    {
      g_print ("No links\n");
      return;
    }

   gulong num_links = webkit_dom_html_collection_get_length (links);
   g_print ("Found %d links\n",
    webkit_dom_html_collection_get_length (links));

   gint send_index_p
     = GPOINTER_TO_INT(g_object_get_data(G_OBJECT(web_page), "send-index"));
   if (send_index_p)
     {
       send_index (links, num_links);
       return;
     }

   gulong i;
   for (i = 0; i < num_links; i++)
     {
       WebKitDOMNode *node
         = webkit_dom_html_collection_item (links, i);
       if (!node)
         {
           g_print ("No node\n");
           return;
         }

       WebKitDOMElement *element;
       if (WEBKIT_DOM_IS_ELEMENT(node))
         {
           element = WEBKIT_DOM_ELEMENT(node);
         }
       else
         {
           /* When would this happen? */
           g_print ("Not an DOM element\n");
           continue;
         }

       gchar *rel = 0, *href = 0;

       rel = webkit_dom_element_get_attribute (element, "rel");
       if (rel && *rel)
         {
           href = webkit_dom_element_get_attribute (element, "href");
         }
       if (rel && href)
         {
           if (!strcmp (rel, "next")
               || !strcmp (rel, "prev")
               || !strcmp (rel, "up"))
             {
               char *link = 0;

               const char *current_uri = webkit_web_page_get_uri (web_page);
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

                       char *message;
                       long len;
                       len = asprintf (&message, "%s\n%s\n", rel, link);

                       ssize_t result;
                       result = sendto (socket_id, message, len, 0,
                              (struct sockaddr *) &main_name, main_name_size);

                       if (result == -1)
                         {
                           g_print ("socket write failed: %s\n",
                                    strerror(errno));
                         }

                       free (message);
                     }
                 }
               free (link);
             }
         }
       g_free (rel); g_free (href);
     }
}



static void
web_page_created_callback (WebKitWebExtension *extension,
                           WebKitWebPage      *web_page,
                           gpointer            user_data)
{
    g_print ("Page %d created for %s\n", 
             webkit_web_page_get_id (web_page),
             webkit_web_page_get_uri (web_page));

    g_signal_connect (web_page, "document-loaded", 
                      G_CALLBACK (document_loaded_callback), 
                      NULL);

    g_signal_connect_object (web_page, "send-request", 
                      G_CALLBACK (request_callback), 
                      NULL, 0);
}

static void
make_named_socket (const char *filename)
{
  struct sockaddr_un name;
  size_t size;

  /* Create the socket. */
  socket_id = socket (PF_LOCAL, SOCK_DGRAM, 0);
  if (socket_id < 0)
    {
      perror ("socket (web process)");
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

  if (bind (socket_id, (struct sockaddr *) &name, size) < 0)
    {
      perror ("bind (web process)");
      exit (EXIT_FAILURE);
    }
  /* Do we really need to bind the socket if we are not receiving messages? */

  atexit (&remove_our_socket);
}

void
initialize_socket (const char *main_socket_file)
{
  if (!our_socket_file)
    {
      our_socket_file = tmpnam (0);
      make_named_socket (our_socket_file);
    }
  else
    g_print ("bug: web process initialized twice\n");

  /* Set the address of the socket in the main Gtk process. */
  main_name.sun_family = AF_LOCAL;
  strcpy (main_name.sun_path, main_socket_file);
  main_name_size = strlen (main_name.sun_path) + sizeof (main_name.sun_family);
}

G_MODULE_EXPORT void
webkit_web_extension_initialize_with_user_data (WebKitWebExtension *extension,
                                                GVariant *user_data)
{
  const char *socket_file = g_variant_get_bytestring (user_data);
  g_print ("thread id %s\n", socket_file);

  initialize_socket (socket_file);
  
  g_signal_connect (extension, "page-created", 
                    G_CALLBACK (web_page_created_callback), 
                    NULL);
}
