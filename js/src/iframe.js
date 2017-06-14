/* iframe.js - Handle iframed pages
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
import { basename, href_hash, navigation_links } from "./utils";
import config from "./config";
import { fix_links } from "./toc";
import { iframe_dispatch } from "./store";

export class
Pages
{
  constructor (index_div)
  {
    index_div.setAttribute ("id", config.INDEX_ID);
    index_div.setAttribute ("node", config.INDEX_ID);
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sub-pages");
    this.element.appendChild (index_div);
  }

  render (state)
  {
    if (state === this.state)
      return;

    this.state = state;
  }
}

/*-----------------------------------------
| Event handlers for the iframe context.  |
`----------------------------------------*/

/** Initialize the DOM for generic pages loaded in the context of an
    iframe.  */
export function
on_load ()
{
  fix_links (document.links);
  let links = {};
  let url = basename (window.location.pathname, /[.]x?html$/);
  links[url] = navigation_links (document);
  iframe_dispatch (actions.cache_links (links));
}

/** Handle messages received via the Message API.  */
export function
on_message (event)
{
  let data = event.data;
  switch (data.message_kind)
    {
    case "scroll-to":
      window.location.hash = href_hash (data.url);
      break;
    default:
      break;
    }
}
