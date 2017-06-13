/* index.js - global entry point */

/* Depending on the role of the document launching this script, different
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

import {
  absolute_url_p,
  inside_iframe_p,
  inside_index_page_p
} from "./utils";

import config from "./config";

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
              let url = href.replace (/.*#/, "") || config.INDEX_ID;
              if (url.includes ("."))
                url = url.replace (/[.]/, ".xhtml#");
              else
                url += ".xhtml";
              let hash = href.replace (/.*#/, "#");
              if (hash == config.INDEX_NAME)
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

/* Don't do anything if the current script is launched from a non-iframed page
   which is different from 'config.INDEX_NAME'.  */
if (inside_iframe_p () || inside_index_page_p (window.location.pathname))
{
  if (!inside_iframe_p ())
    {
      window.addEventListener ("DOMContentLoaded", main.on_load, false);
      window.addEventListener ("message", main.on_message, false);
    }
  else if (window.name == "slider")
    {
      window.addEventListener ("DOMContentLoaded", sidebar.on_load, false);
      window.addEventListener ("message", sidebar.on_message, false);
    }
  else
    {
      window.addEventListener ("DOMContentLoaded", pages.on_load, false);
      window.addEventListener ("message", pages.on_message, false);
    }

  window.addEventListener ("beforeunload", on_unload, false);
  window.addEventListener ("click", on_click, false);
  window.addEventListener ("keypress", on_keypress, false);
}
