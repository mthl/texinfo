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
#include "infopath.h"

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

  printf ("SUBTHREAD: ");
  vmsg (fmt, v);
  va_end (v);
}

/* For communicating with the main Gtk process */
static struct sockaddr_un main_name;
static size_t main_name_size;

/* The socket that we create in this process to send to the socket
   of the main process. */
static int socket_id;

void
send_datagram (GString *s)
{
  ssize_t result;

  //debug (2, "send datagram %s", s->str);
  if (s->len > PACKET_SIZE)
    {
      debug (0, "datagram too big");
      return;
    }

  result = sendto (socket_id, s->str, s->len + 1, 0,
         (struct sockaddr *) &main_name, main_name_size);

  if (result == -1)
    {
      debug (0, "sending datagram failed: %s\n",
               strerror(errno));
    }
}

static char *current_manual;

int
load_manual (char *manual)
{
  current_manual = manual;

  /* Inform the main process the manual has changed so that it can
     load the TOC and indices. */
  g_print ("LOAD MANUAL %s\n", manual);
  GString *s1 = g_string_new (NULL);
  g_string_append (s1, "new-manual\n");
  g_string_append (s1, manual);

  send_datagram (s1);

  g_string_free (s1, TRUE);
  
  return 1;
}

gboolean
request_callback (WebKitWebPage     *web_page,
		  WebKitURIRequest  *request,
		  WebKitURIResponse *redirected_response,
		  gpointer           user_data)
{
  const char *uri = webkit_uri_request_get_uri (request);

  debug (1, "Intercepting link <%s> (page %d)\n", uri,
             webkit_web_page_get_id (web_page));

  /* Clear flags on WebKitWebPage object.  These flags are checked after
     the page is actually loaded.  We can't use global variables for this
     because multiple WebKitWebViews may share them. */
  g_object_set_data (G_OBJECT(web_page), "top-node",
                     GINT_TO_POINTER(0));
  g_object_set_data (G_OBJECT(web_page), "send-index",
                     GINT_TO_POINTER(0));

  const char *p = strchr (uri, '?');
  if (p)
    {
      char *new_uri = strdup (uri);
      new_uri[p - uri] = 0;
      webkit_uri_request_set_uri (request, new_uri);
      debug (1, "new_uri %s\n", new_uri);
      free (new_uri);

      p++;
      debug (1, "request type %s\n", p);
      if (!strcmp (p, "send-index"))
        {
          g_object_set_data (G_OBJECT(web_page), "send-index",
                             GINT_TO_POINTER(1));
        }
      else if (!strcmp (p, "top-node"))
        {
          g_object_set_data (G_OBJECT(web_page), "top-node",
                             GINT_TO_POINTER(1));
        }
      
      return FALSE;
    }

  /* Web links to other Texinfo manuals are rewritten to have the "private"
     URI scheme.  Any relative links like "../MANUAL/NODE.html"
     are absolute paths beginning "file:/" by the time this function
     is called. */
  if (!memcmp (uri, "private:", 8))
    {
      char *manual, *node;
      parse_external_url (uri, &manual, &node);
      if (!manual || !node)
        {
          /* Possibly a *.css file or malformed link. */
          free (manual); free (node);
          return FALSE;
        }

      debug (1, "finding manual and node %s:%s\n", manual, node);

      if (!current_manual || strcmp(manual, current_manual) != 0)
        {
          load_manual (manual);
        }

      /* Ask main process to load node for us.  */
      GString *s = g_string_new (NULL);
      g_string_append (s, "new-node\n");
      g_string_append (s, node);
      send_datagram (s);
      g_string_free (s, TRUE);

      return TRUE; /* Cancel load request */
    }
  else if (!memcmp (uri, "file:", 5))
    {
      /* Load file for real. */
      char *manual, *node;
      parse_external_url (uri, &manual, &node);
      if (!manual || !node)
        {
          /* Possibly a *.css file or malformed link. */
          free (manual); free (node);
          return FALSE;
        }

      debug (1, "finding manual and node %s:%s\n", manual, node);

      if (!current_manual || strcmp(manual, current_manual) != 0)
        {
          load_manual (manual);
        }

      /* Update sidebar */
      GString *s = g_string_new (NULL);
      g_string_append (s, "inform-new-node\n");
      g_string_append (s, node);
      send_datagram (s);
      g_string_free (s, TRUE);
    }
  
  return FALSE;
}

/* Given the main index.html Top node in the document, find the nodes 
   containing indices. */
void
find_indices (WebKitDOMHTMLCollection *links, gulong num_links)
{
  debug (1, "looking for indices\n");

  gulong i = 0;
  GString *s = g_string_new (NULL);

  g_string_assign (s, "index-nodes\n");

  for (; i < num_links; i++)
    {
      WebKitDOMNode *node
        = webkit_dom_html_collection_item (links, i);
      if (!node)
        {
          debug (1, "No node\n");
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
          debug (1, "Not an DOM element\n");
          continue;
        }

      gchar *href = webkit_dom_element_get_attribute (element, "href");


      char *rel = webkit_dom_element_get_attribute (element, "rel");
      char *id = webkit_dom_element_get_attribute (element, "id");

      /* Look for links to index nodes in top node by checking the "rel" 
         attribute.  Only use links in the table of contents to avoid
         loading the same index more than once. */
      if (href
          && id && !strncmp (id, "toc-", 4)
          && rel && !strcmp(rel, "index"))
        {
          debug (1, "index node at |%s|\n", href);
          g_string_append (s, href);
          g_string_append (s, "\n");
        }
      free (rel); free (id);
    }

  send_datagram (s);
  g_string_free (s, TRUE);
}

/* Split up msg into packets of size no more than PACKET_SIZE so it can
   be sent over the socket. */
void
packetize (char *msg_type, GString *msg)
{
  GString *s;
  char *p, *q;
  int try = 0; /* To check if a single record is too long for a packet. */

  p = msg->str;
  s = g_string_new (NULL);

next_packet:
  g_string_truncate (s, 0);
  g_string_append (s, msg_type);
  g_string_append (s, "\n");

  /* Get next two lines and try to fit them in the buffer. */
  while ((q = strchr (p, '\n')) && (q = strchr (q + 1, '\n')))
    {
      gsize old_len = s->len;
      g_string_append_len (s, p, q - p + 1);
      if (s->len > PACKET_SIZE)
        {
          if (try == 1)
            break;
          g_string_truncate (s, old_len);
          send_datagram (s);
          try = 1;
          goto next_packet;
        }

      try = 0;
      p = q + 1;
    }
  send_datagram (s);
  g_string_free (s, TRUE);
}

void
send_index (WebKitDOMHTMLCollection *links, gulong num_links)
{
  debug (1, "trying to send index\n");

  gulong i = 0;
  GString *s = g_string_new (NULL);

  for (; i < num_links; i++)
    {
      WebKitDOMNode *node
        = webkit_dom_html_collection_item (links, i);
      if (!node)
        {
          debug (1, "No node\n");
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
          debug (1, "Not an DOM element\n");
          continue;
        }

      gchar *href = webkit_dom_element_get_attribute (element, "href");
      if (href && strstr (href, "#index-"))
        {
          g_string_append (s, webkit_dom_node_get_text_content (node));
          g_string_append (s, "\n");
          g_string_append (s, href);
          g_string_append (s, "\n");
        }
    }

  /* Mark end of index. */
  g_string_append (s, "\n");
  g_string_append (s, "\n");

  packetize ("index", s);

  g_string_free (s, TRUE);

  debug (1, "index sent\n");
}

void
build_toc_string (GString *toc, WebKitDOMElement *elt)
{
  char *s, *s2, *s3;
  WebKitDOMElement *e, *e1;
  int first = 1;

  e = webkit_dom_element_get_first_element_child (elt);
  while (e)
    {
      s = webkit_dom_element_get_tag_name (e);
      if (!strcmp (s, "LI") || !strcmp (s, "li"))
        {
          e1 = webkit_dom_element_get_first_element_child (e);
          e = webkit_dom_element_get_next_element_sibling (e);

          s2 = webkit_dom_element_get_tag_name (e1);
          if (!strcmp (s2, "a") || !strcmp (s2, "A"))
            {
              s3 = webkit_dom_element_get_inner_html (e1);
              g_string_append (toc, s3);
              g_string_append (toc, "\n");

              s3 = webkit_dom_element_get_attribute (e1, "href");
              if (first)
                {
                  first = 0;
                  g_string_append (toc, "+");
                }
              if (!e)
                {
                  g_string_append (toc, "-");
                }
              g_string_append (toc, s3);
              g_string_append (toc, "\n");
            }

          e1 = webkit_dom_element_get_next_element_sibling (e1);
          if (e1)
            {
              s2 = webkit_dom_element_get_tag_name (e1);
              if (!strcmp (s2, "UL") || !strcmp (s2, "ul"))
                {
                  build_toc_string (toc, e1);
                }
            }
        }
      else
        break;
    }
}

void
send_toc (WebKitDOMDocument *dom_document)
{
  GString *toc;

  WebKitDOMElement *toc_elt = webkit_dom_document_query_selector
                            (dom_document, "div.contents ul", NULL);
  if (!toc_elt)
    return;

  toc = g_string_new (NULL);

  build_toc_string (toc, toc_elt);

  packetize ("toc", toc);
  g_string_free (toc, TRUE);

  GString *s1 = g_string_new (NULL);
  g_string_append (s1, "toc-finished\n");
  send_datagram (s1);
  g_string_free (s1, TRUE);
}

void
send_pointer (WebKitDOMElement *link_elt,
              const char *rel, const char *current_uri)
{
  char *link = 0;
  char *href = webkit_dom_element_get_attribute (link_elt, "href");

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

          char *message;
          long len;
          len = asprintf (&message, "%s\n%s\n", rel, link);

          ssize_t result;
          result = sendto (socket_id, message, len, 0,
                 (struct sockaddr *) &main_name, main_name_size);

          if (result == -1)
            {
              debug (1, "socket write failed: %s\n",
                       strerror(errno));
            }

          free (message);
        }
    }
  g_free (href);
  free (link);
}

/* Script to run in newly loaded files.  End each line with a backslash.
   Avoid // or /* comments outside of strings. */
#define INJECTED_JAVASCRIPTZ                                  \
  var x = document.getElementsByClassName("texi-manual");     \
  for (var i = 0; i < x.length; i++) {                        \
      if (x[i].href) {                                        \
        var re = new RegExp('^http://|^https://');            \
        x[i].href = x[i].href.replace(re, 'private:');        \
      }                                                       \
  };                                                          \
  ;


/* Use variadic macro to allow for commas in argument */
#define stringize(...) #__VA_ARGS__
#define dostringize(a) stringize(a)
#define INJECTED_JAVASCRIPT dostringize(INJECTED_JAVASCRIPTZ)


void
document_loaded_callback (WebKitWebPage *web_page,
                          gpointer       user_data)
{
  debug (1, "Page %d loaded for %s\n", webkit_web_page_get_id (web_page),
           webkit_web_page_get_uri (web_page));

  WebKitDOMDocument *dom_document
    = webkit_web_page_get_dom_document (web_page);

  if (!dom_document)
    {
      debug (1, "No DOM document\n");
      return;
    }

  gint send_index_p
    = GPOINTER_TO_INT(g_object_get_data(G_OBJECT(web_page), "send-index"));
  gint top_node_p
    = GPOINTER_TO_INT(g_object_get_data(G_OBJECT(web_page), "top-node"));

  WebKitDOMHTMLCollection *links =
    webkit_dom_document_get_links (dom_document);
  gulong num_links = webkit_dom_html_collection_get_length (links);

  if (send_index_p)
    {
      send_index (links, num_links);
      return;
    }

  if (top_node_p)
    {
      send_toc (dom_document);
      find_indices (links, num_links);
      return;
    }

#if 1
  WebKitFrame *frame = webkit_web_page_get_main_frame (web_page);
  if (!frame)
    return;
  JSCContext *jsc = webkit_frame_get_js_context (frame);
  if (!jsc)
    return;
  (void) jsc_context_evaluate (jsc, INJECTED_JAVASCRIPT, -1);
  debug (1, "INJECT |%s|\n", INJECTED_JAVASCRIPT);
#endif

  WebKitDOMElement *link_elt;

  const char *current_uri = webkit_web_page_get_uri (web_page);

  link_elt = webkit_dom_document_query_selector
    (dom_document, "a[rel=\"up\"]", NULL);
  if (link_elt)
    send_pointer (link_elt, "up", current_uri);
  
  link_elt = webkit_dom_document_query_selector
    (dom_document, "a[rel=\"next\"]", NULL);
  if (link_elt)
    send_pointer (link_elt, "next", current_uri);

  link_elt = webkit_dom_document_query_selector
    (dom_document, "a[rel=\"prev\"]", NULL);
  if (link_elt)
    send_pointer (link_elt, "prev", current_uri);
}


static void
web_page_created_callback (WebKitWebExtension *extension,
                           WebKitWebPage      *web_page,
                           gpointer            user_data)
{
    debug (1, "Page %d created for %s\n",
             webkit_web_page_get_id (web_page),
             webkit_web_page_get_uri (web_page));

    g_signal_connect (web_page, "document-loaded", 
                      G_CALLBACK (document_loaded_callback), 
                      NULL);

    g_signal_connect_object (web_page, "send-request", 
                      G_CALLBACK (request_callback), 
                      NULL, 0);
}

void
initialize_socket (const char *main_socket_file)
{
  /* Create the socket. */
  socket_id = socket (PF_LOCAL, SOCK_DGRAM, 0);
  if (socket_id < 0)
    {
      perror ("socket (web process)");
      exit (EXIT_FAILURE);
    }

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
  debug (1, "thread id %s\n", socket_file);

  initialize_socket (socket_file);
  
  g_signal_connect (extension, "page-created", 
                    G_CALLBACK (web_page_created_callback), 
                    NULL);
}
