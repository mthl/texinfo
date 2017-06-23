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
import { basename, navigation_links } from "./utils";
import config from "./config";
import { fix_links } from "./toc";
import { iframe_dispatch } from "./store";

/* Return an array composed of the filename and the anchor of LINKID.
   LINKID can have the form "foobar.anchor" or just "foobar".  */
function
linkid_split (linkid)
{
  if (!linkid.includes ("."))
    return [linkid, ""];
  else
    {
      let [id, anchor] = linkid.match (/^(.+)\.(.*)$/).slice (1);
      return [id, "#" + anchor];
    }
}

export class
Pages
{
  constructor (index_div)
  {
    index_div.setAttribute ("id", config.INDEX_ID);
    index_div.setAttribute ("node", config.INDEX_ID);
    index_div.setAttribute ("hidden", "true");
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sub-pages");
    this.element.appendChild (index_div);
    /* Currently created divs.  */
    this.ids = [];
  }

  add_divs (linkids)
  {
    for (let i = 0; i < linkids.length; i += 1)
      {
        let linkid = linkids[i];
        this.ids.push (linkid);
        /* Don't create a div if there is an anchor part in LINKID.  */
        if (!linkid.includes ("."))
          {
            let div = document.createElement ("div");
            div.setAttribute ("id", linkid);
            div.setAttribute ("node", linkid);
            div.setAttribute ("hidden", "true");
            this.element.appendChild (div);
          }
      }
  }

  render (state)
  {
    let new_linkids = Object.keys (state.loaded_nodes)
                            .filter (id => !this.ids.includes (id));
    this.add_divs (new_linkids);

    if (state.current !== this.prev_id)
      {
        if (this.prev_id)
          this.prev_div.setAttribute ("hidden", "true");

        let [pageid] = linkid_split (state.current);
        let div = document.getElementById (pageid);
        if (!div)
          throw new Error ("no div with id: " + pageid);
        load_page (state.current);
        update_history (state.current, state.history);
        div.removeAttribute ("hidden");
        this.prev_id = state.current;
        this.prev_div = div;
      }
  }
}

function
load_page (linkid)
{
  let path = window.location.pathname + window.location.search;

  if (linkid === config.INDEX_ID)
    return;

  let [pageid, hash] = linkid_split (linkid);
  let div = document.getElementById (pageid);
  if (!div)
    {
      let msg = "no iframe container correspond to identifier: " + pageid;
      throw new ReferenceError (msg);
    }

  path = path.replace (/#.*/, "") + "#" + linkid;
  let url = pageid + ".xhtml" + hash;

  /* Select contained iframe or create it if necessary.  */
  let iframe = div.querySelector ("iframe");
  if (iframe)
    {
      let msg = { message_kind: "scroll-to", hash };
      iframe.contentWindow.postMessage (msg, "*");
    }
  else
    {
      iframe = document.createElement ("iframe");
      iframe.setAttribute ("class", "node");
      iframe.setAttribute ("name", path);
      iframe.setAttribute ("src", url);
      div.appendChild (iframe);
    }
}

/* Mutate the history of page navigation.  Store LINKID in history
   state, The actual way to store LINKID depends on HISTORY_MODE. */
function
update_history (linkid, history_mode)
{
  let visible_url = window.location.pathname + window.location.search;
  if (linkid !== config.INDEX_ID)
    visible_url += ("#" + linkid);

  switch (history_mode)
  {
  case config.HISTORY_REPLACE:
    window.history.replaceState ({ linkid }, linkid, visible_url);
    break;
  case config.HISTORY_PUSH:
    window.history.pushState ({ linkid }, linkid, visible_url);
    break;
  case config.HISTORY_POP:
  default:
    break;
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
  if (data.message_kind === "scroll-to")
    {
      /* Scroll to the anchor corresponding to HASH without saving
         current page in session history.  */
      let url = window.location.pathname + window.location.search;
      window.location.replace ((data.hash) ? (url + data.hash) : url);
    }
}
