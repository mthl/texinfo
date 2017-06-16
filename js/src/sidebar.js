/* sidebar.js - Handle the table of content iframed page
   Copyright © 2017 Free Software Foundation, Inc.

   This file is part of GNU Texinfo.

   GNU Texinfo is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   GNU Texinfo is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with GNU Texinfo.  If not, see <http://www.gnu.org/licenses/>.  */

import * as actions from "./actions";

import {
  clear_toc_styles,
  create_link_dict,
  fix_links,
  scan_toc
} from "./toc";

import config from "./config";
import { iframe_dispatch } from "./store";

/** Sidebar component encapsulating the iframe and its state.  */
export class
Sidebar
{
  constructor ()
  {
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sidebar");

    /* Create iframe. */
    let iframe = document.createElement ("iframe");
    iframe.setAttribute ("name", "slider");
    iframe.setAttribute ("src", (config.TOC_FILENAME
                                 + "#main=" + config.INDEX_NAME));
    this.element.appendChild (iframe);
    this.iframe = iframe;
  }

  /* Render 'sidebar' according to STATE which is a new state. */
  render (state)
  {
    /* Update sidebar to highlight the title corresponding to
       'state.current'.  */
    let msg = { message_kind: "update-sidebar", selected: state.current };
    this.iframe.contentWindow.postMessage (msg, "*");
    this.prev = state.current;
  }
}

/*----------------------------------------------
| Auxilary functions for the sidebar context.  |
`---------------------------------------------*/

/* Add a link from TOC_FILENAME to the main index file.  */
function
add_header ()
{
  let li = document.querySelector ("li");
  if (li && li.firstElementChild && li.firstElementChild.matches ("a")
      && li.firstElementChild.getAttribute ("href") === config.INDEX_NAME)
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

/*------------------------------------------
| Event handlers for the sidebar context.  |
`-----------------------------------------*/

/** Initialize TOC_FILENAME which must be loaded in the context of an
    iframe.  */
export function
on_load ()
{
  iframe_dispatch ({ type: actions.SIDEBAR_LOADED });

  add_header ();
  document.body.setAttribute ("class", "toc-sidebar");

  /* Specify the base URL to use for all relative URLs.  */
  /* FIXME: Add base also for sub-pages.  */
  let base = document.createElement ("base");
  base.setAttribute ("href",
                     window.location.href.replace (/[/][^/]*$/, "/"));
  document.head.appendChild (base);

  let links = Array.from (document.links);
  fix_links (links);

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

  scan_toc (document.body, config.INDEX_NAME);

  let divs = Array.from (document.querySelectorAll ("div"));
  divs.reverse ()
      .forEach (div => {
        if (div.getAttribute ("class") === "toc-title")
          div.parentNode.removeChild (div);
      });

  /* Get 'backward' and 'forward' link attributes.  */
  let dict = create_link_dict (document.querySelector ("ul"));
  iframe_dispatch (actions.cache_links (dict));
}

/** Handle messages received via the Message API.  */
export function
on_message (event)
{
  let data = event.data;
  if (data.message_kind === "update-sidebar")
    {
      /* Highlight the current LINKID in the table of content.  */
      let selected = data.selected;
      clear_toc_styles (document.body);
      let filename = (selected === config.INDEX_ID) ?
          config.INDEX_NAME : (selected + ".xhtml");
      scan_toc (document.body, filename);
    }
}
