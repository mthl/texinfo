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

/* Convert LINKID which has the form "foobar.anchor" or just "foobar",
   to an URL of the form "foobar.xhtml#anchor". */
function
linkid_to_url (linkid)
{
  if (linkid === config.INDEX_ID)
    return config.INDEX_NAME;
  else
    {
      let [pageid, hash] = linkid_split (linkid);
      return pageid + ".xhtml" + hash;
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

  add_div (pageid)
  {
    let div = document.createElement ("div");
    div.setAttribute ("id", pageid);
    div.setAttribute ("node", pageid);
    div.setAttribute ("hidden", "true");
    this.ids.push (pageid);
    this.element.appendChild (div);

    /* Load pages containing index links.  */
    if (pageid.match (/^.*-Index$/))
      load_page (pageid);
  }

  render (state)
  {
    /* Create div elements for pages corresponding to newly added
       linkids from 'state.loaded_nodes'.  */
    Object.keys (state.loaded_nodes)
          .map (id => id.replace (/\..*$/, ""))
          .filter (id => !this.ids.includes (id))
          .reduce ((acc, id) => ((acc.includes (id)) ? acc : [...acc, id]), [])
          .forEach (id => this.add_div (id));

    if (state.current !== this.prev_id)
      {
        if (this.prev_id)
          this.prev_div.setAttribute ("hidden", "true");
        let div = resolve_page (state.current);
        update_history (state.current, state.history);
        div.removeAttribute ("hidden");
        this.prev_id = state.current;
        this.prev_div = div;

        /* XXX: Ensure that focus is not on a hidden iframe which has
           the consequence of making the keyboard event not bubbling.  */
        if (state.current === config.INDEX_ID)
          document.documentElement.focus ();
        else
          {
            div.querySelector ("iframe")
               .contentDocument
               .documentElement
               .focus ();
          }
      }
  }
}

/* Load PAGEID.  */
function
load_page (pageid)
{
  let div = resolve_page (pageid);
  /* Making the iframe visible triggers the load of the iframe DOM.  */
  div.removeAttribute ("hidden");
  div.setAttribute ("hidden", "true");
}

/* Return the 'div' element that correspond to PAGEID.  */
function
resolve_page (linkid)
{
  let [pageid, hash] = linkid_split (linkid);
  let div = document.getElementById (pageid);
  if (!div)
    {
      let msg = "no iframe container correspond to identifier: " + pageid;
      throw new ReferenceError (msg);
    }

  /* Load iframe if necessary.  Index page is not inside an iframe.  */
  if (pageid !== config.INDEX_ID)
    {
      let iframe = div.querySelector ("iframe");
      if (!iframe)
        {
          iframe = document.createElement ("iframe");
          iframe.setAttribute ("class", "node");
          iframe.setAttribute ("src", linkid_to_url (pageid));
          div.appendChild (iframe);
        }
      let msg = { message_kind: "scroll-to", hash };
      iframe.contentWindow.postMessage (msg, "*");
    }

  return div;
}

/* Mutate the history of page navigation.  Store LINKID in history
   state, The actual way to store LINKID depends on HISTORY_MODE. */
function
update_history (linkid, history_mode)
{
  let visible_url = window.location.pathname + window.location.search;
  if (linkid !== config.INDEX_ID)
    visible_url += ("#" + linkid);

  let method = window.history[history_mode];
  if (method)
    method.call (window.history, linkid, null, visible_url);
}

/* Retun a dictionary whose keys are index keywords and values are
   linkids.  */
function
scan_index (content)
{
  let links = Array.from (content.links);
  return links.filter (link => link.hasAttribute ("xref"))
              .reduce ((acc, link) => {
                let linkid = href_hash (link.getAttribute ("href"));
                let key = link.innerText;
                acc[key] = linkid;
                return acc;
              }, {});
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
  let linkid = basename (window.location.pathname, /[.]x?html$/);
  links[linkid] = navigation_links (document);
  iframe_dispatch (actions.cache_links (links));

  if (linkid.match (/^.*-Index$/))
    {
      let index_links = scan_index (document);
      iframe_dispatch (actions.cache_index_links (index_links));
    }
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
