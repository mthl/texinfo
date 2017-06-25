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
import * as actions from "./actions";
import * as main from "./main";
import * as pages from "./iframe";
import * as sidebar from "./sidebar";
import { absolute_url_p, href_hash } from "./utils";
import config from "./config";
import { iframe_dispatch } from "./store";
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
              let linkid = href_hash (href) || config.INDEX_ID;
              iframe_dispatch (actions.set_current_url (linkid));
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
function
on_keypress (event)
{
  let value = on_keypress.dict[event.key];
  if (value)
    {
      let [func, arg] = value;
      let action = func (arg);
      if (action)
        iframe_dispatch (action);
    }
}

/* Dictionary associating an Event 'key' property to its navigation id.  */
on_keypress.dict = {
  l: [top.history.back.bind (top.history)],
  m: [actions.show_component, "menu"],
  n: [actions.navigate, "next"],
  p: [actions.navigate, "prev"],
  r: [top.history.forward.bind (top.history)],
  u: [actions.navigate, "up"],
  "]": [actions.navigate, "forward"],
  "[": [actions.navigate, "backward"],
  "<": [actions.set_current_url_pointer, "*TOP*"],
  ">": [actions.set_current_url_pointer, "*END*"]
};

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
    window.onpopstate = main.on_popstate;
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
