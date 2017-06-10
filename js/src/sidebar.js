/* sidebar.js - module for the lateral table of content component */

import * as actions from "./actions";

import {
  clear_toc_styles,
  create_link_dict,
  fix_link,
  main_filename,
  scan_toc
} from "./toc";

import { absolute_url_p } from "./utils";

import config from "./config";

/** Sidebar component encapsulating the iframe and its state.  */
export class
Sidebar
{
  constructor ()
  {
    /* Actual state of the sidebar.  */
    this.state = null;
    /* Reference to the DOM element.  */
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sidebar");
  }

  /* Render 'sidebar' according to STATE which is a new state. */
  render (state)
  {
    if (this.state && this.state !== state)
      this.update (state);
    else                        /* Initial render */
      {
        let iframe = document.createElement ("iframe");
        iframe.setAttribute ("name", "slider");
        iframe.setAttribute ("src", (config.TOC_FILENAME
                                     + "#main=" + main_filename.val));
        this.element.appendChild (iframe);
      }

    this.state = state;
  }

  /* Updating render.  */
  update (state)
  {
    if (state.current != this.state.current)
      {
        let msg = { message_kind: "update-sidebar", selected: state.current };
        this.element.contentWindow.postMessage (msg, "*");
      }
  }

  get_iframe_window ()
  {
    return this.element.firstChild.contentWindow;
  }
}

/** Return true if the side bar containing the table of content should be
    displayed, otherwise return false.  This is guessed from HASH which must
    be a string representing a list of URL parameters.  */
export function
use_sidebar (hash)
{
  if (hash.includes ("sidebar=no"))
    return false;
  else if (hash.includes ("sidebar=yes") || hash == "#sidebar")
    return true;
  else
    return !(navigator && navigator.epubReadingSystem);
}

/*---------------------------------------------
| Auxilary functions for the iframe context.  |
`--------------------------------------------*/

/* Add a link from TOC_FILENAME to the main index file.  */
function
add_header ()
{
  let li = document.querySelector ("li");
  if (li && li.firstElementChild && li.firstElementChild.matches ("a")
      && li.firstElementChild.getAttribute ("href") == config.INDEX_NAME)
    li.parentNode.removeChild (li);

  let header = document.querySelector ("header");
  let h1 = document.querySelector ("h1");
  if (header && h1)
    {
      let a = document.createElement ("a");
      a.setAttribute ("href", "index.html");
      header.appendChild (a);
      let div = document.createElement ("div");
      a.appendChild (div);
      let img = document.createElement ("img");
      img.setAttribute ("src", config.PACKAGE_LOGO);
      div.appendChild (img);
      let span = document.createElement ("span");
      span.appendChild (h1.firstChild);
      div.appendChild (span);
      h1.parentNode.removeChild (h1);
    }
}

/* Return an Array with all the relative links of the table of content.
   Exclude the hash part and the file extension from the links.  */
function
relative_links (links)
{
  let nodes = [];
  let prev_node = null;
  links.forEach (link => {
    let href = link.getAttribute ("href");
    if (href)
      {
        fix_link (link, href);
        if (!absolute_url_p (href))
          {
            let node_name = href.replace (/[.]x?html.*/, "");
            if (prev_node != node_name)
              {
                prev_node = node_name;
                nodes.push (node_name);
              }
          }
      }
  });

  return nodes;
}

/*-----------------------------------------
| Event handlers for the iframe context.  |
`----------------------------------------*/

/** Initialize TOC_FILENAME which must be loaded in the context of an
    iframe.  */
export function
on_load (_event)
{
  /* Retrieve 'INDEX_NAME' from current window URL. */
  main_filename.val = window.location.href.replace (/.*#main=/, "");
  add_header ();
  document.body.setAttribute ("class", "toc-sidebar");

  /* Specify the base URL to use for all relative URLs.  */
  /* FIXME: Add base also for sub-pages.  */
  let base = document.createElement ("base");
  base.setAttribute ("href",
                     window.location.href.replace (/[/][^/]*$/, "/"));
  document.head.appendChild (base);

  let links = Array.from (document.links);

  /* Create a link referencing the Table of content.  */
  let toc_a = document.createElementNS (config.XHTML_NAMESPACE, "a");
  toc_a.setAttribute ("href", config.TOC_FILENAME);
  toc_a.appendChild (document.createTextNode ("Table of Contents"));
  let toc_li = document.createElementNS (config.XHTML_NAMESPACE, "li");
  toc_li.appendChild (toc_a);
  let index_li = links[links.length - 1].parentNode;
  let index_grand = index_li.parentNode.parentNode;
  /* XXX: hack */
  if (index_grand.matches ("li"))
    index_li = index_grand;
  index_li.parentNode.insertBefore (toc_li, index_li.nextSibling);

  if (main_filename.val !== null)
    scan_toc (document.body, main_filename.val);

  let nodes = relative_links ([...links, toc_a]);
  nodes.message_kind = "node-list";
  top.postMessage (nodes, "*");

  let divs = Array.from (document.querySelectorAll ("div"));
  divs.reverse ()
      .forEach (div => {
        if (div.getAttribute ("class") == "toc-title")
          div.parentNode.removeChild (div);
      });

  /* Get 'backward' and 'forward' link attributes.  */
  let dict = create_link_dict (document.querySelector ("ul"));
  let action = actions.cache_links (dict);
  top.postMessage ({ message_kind: "action", action }, "*");
}

/** Handle messages received via the Message API.  */
export function
on_message (event)
{
  let data = event.data;
  switch (data.message_kind)
    {
    case "update-sidebar":
      {
        let selected = data.selected;
        clear_toc_styles (document.body);
        let filename = (selected == "index") ?
            "index.html" : (selected + ".xhtml");
        scan_toc (document.body, filename);
        break;
      }
    default:
      break;
    }
}
