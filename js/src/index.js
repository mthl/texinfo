/* index.js - Global entry point
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

/** Depending on the role of the document launching this script, different
    event handlers are registered.  This script can be used in the context of:

    - the index page of the manual which manages the state of the application
    - the iframe which contains the lateral table of content
    - other iframes which contain other pages of the manual

    This is done to allow referencing the same script inside every HTML page.
    This has the benefits of reducing the number of HTTP requests required to
    fetch the Javascript code and simplifying the work of the Texinfo HTML
    converter.  */

import "./polyfill";
import * as main from "./main";
import * as pages from "./iframe";
import * as sidebar from "./sidebar";
import { absolute_url_p, href_hash } from "./utils";
import config from "./config";
import { with_sidebar_query } from "./toc";

/*-------------------------
| Common event handlers.  |
`------------------------*/

function
on_click (event)
{
  for (var target = event.target; target !== null; target = target.parentNode)
    {
      if ((target instanceof Element) && target.matches ("a"))
        {
          let href = target.getAttribute ("href");
          if (!absolute_url_p (href))
            {
              let url = href_hash (href) || config.INDEX_ID;
              if (url.includes ("."))
                url = url.replace (/[.]/, ".xhtml#");
              else
                url += ".xhtml";
              let hash = href.replace (/.*#/, "#");
              if (hash === config.INDEX_NAME)
                hash = "";
              top.postMessage ({ message_kind: "load-page", url, hash }, "*");
              event.preventDefault ();
              event.stopPropagation ();
              return;
          }
        }
    }
}

function
on_unload ()
{
  var request = new XMLHttpRequest ();
  request.open ("GET", "(WINDOW-CLOSED)");
  request.send (null);
}

/* Handle Keyboard 'keypress' events.  */
var on_keypress = (function () {
  /* Dictionary associating an Event 'key' property to its navigation id.  */
  let dict = {
    n: "next",
    p: "prev",
    u: "up",
    "]": "forward",
    "[": "backward"
  };

  return function (event) {
    let nav = dict[event.key];
    if (nav)
      top.postMessage ({ message_kind: "load-page", nav }, "*");
  };
} ());

/*--------------------
| Context dispatch.  |
`-------------------*/

let inside_iframe = top !== window;
let inside_sidebar = inside_iframe && window.name === "slider";
let inside_index_page = (window.location.pathname.endsWith (config.INDEX_NAME)
                         || window.location.pathname.endsWith ("/"));

if (inside_index_page)
  {
    window.addEventListener ("DOMContentLoaded", main.on_load, false);
    window.addEventListener ("message", main.on_message, false);
  }
else if (inside_sidebar)
  {
    window.addEventListener ("DOMContentLoaded", sidebar.on_load, false);
    window.addEventListener ("message", sidebar.on_message, false);
  }
else if (inside_iframe)
  {
    window.addEventListener ("DOMContentLoaded", pages.on_load, false);
    window.addEventListener ("message", pages.on_message, false);
  }
else
  {
    /* Jump to 'config.INDEX_NAME' and adapt the selected iframe.  */
    window.location.replace (with_sidebar_query (window.location.href));
  }

/* Register common event handlers.  */
window.addEventListener ("beforeunload", on_unload, false);
window.addEventListener ("click", on_click, false);
window.addEventListener ("keypress", on_keypress, false);
