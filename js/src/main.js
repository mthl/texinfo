/* main.js - Handle the index page
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
import { Pages } from "./iframe";
import { Sidebar } from "./sidebar";
import { Store } from "./store";
import config from "./config";
import { fix_links } from "./toc";
import { global_reducer } from "./reducers";
import { navigation_links } from "./utils";

/* Global state manager.  */
let store;
/* Main stateful view.   */
let components;

export class
Selected_div
{
  constructor (id)
  {
    this.id = id;
    this.element = null;
  }

  render (id)
  {
    if (id === this.id)
      return;

    if (this.element)
      this.element.setAttribute ("hidden", "true");
    let div = document.getElementById (id);
    div.removeAttribute ("hidden");

    this.id = id;
    this.element = div;
  }
}

export class
Main_component
{
  constructor (root, index_div)
  {
    let sidebar = new Sidebar ();
    root.appendChild (sidebar.element);
    let pages = new Pages (index_div);
    root.appendChild (pages.element);

    /* Root DOM element.  */
    this.root = root;
    /* Instance of a Sidebar object.  */
    this.sidebar = sidebar;
    /* Currently visible page.  */
    this.selected_div = new Selected_div ();
  }

  render (state)
  {
    this.sidebar.render ({ current: config.INDEX_ID, visible: true });
    this.selected_div.render (state.current);
  }
}

/*------------------------------------------------
| Auxilary functions for the top-level context.  |
`-----------------------------------------------*/

/* Return an array compose of the filename and the anchor of NODE_NAME.
   NODE_NAME can have the form "foobaridm80837412374" or just "foobar".  */
function
split_id_anchor (node_name)
{
  let rgxp = /idm\d+$/;
  if (!rgxp.test (node_name))
    return [node_name, ""];
  else
    {
      let [id, anchor] = node_name.match (/^(.+)(idm\d+)$/).slice (1);
      return [id, "#" + anchor];
    }
}

/* Load URL in its corresponding iframe and make this iframe visible.  Display
   HASH in the url bar.  */
function
load_page (url, hash)
{
  var node_name = url.replace (/[.]x?html.*/, "");
  var path =
      (window.location.pathname + window.location.search).replace (/#.*/, "")
      + hash;
  let [id] = split_id_anchor (node_name);
  let div = document.getElementById (id);
  if (!div)
    {
      let msg = `no iframe container correspond to identifier "${id}"`;
      throw new ReferenceError (msg);
    }

  /* Select contained iframe or create it if necessary.  */
  let iframe = div.querySelector ("iframe");
  if (iframe === null)
    {
      iframe = document.createElement ("iframe");
      iframe.setAttribute ("class", "node");
      iframe.setAttribute ("name", path);
      iframe.setAttribute ("src", url);
      div.appendChild (iframe);
    }
  else
    {
      let msg = { message_kind: "scroll-to", url };
      iframe.contentWindow.postMessage (msg, "*");
    }

  components.sidebar.selected_node = node_name;
  window.history.pushState ("", document.title, path);
  store.dispatch (actions.set_current_url (node_name));
}

/*--------------------------------------------
| Event handlers for the top-level context.  |
`-------------------------------------------*/

/* Initialize the top level 'config.INDEX_NAME' DOM.  */
export function
on_load ()
{
  /* Move contents of <body> into a a fresh <div> to let the components
     treat the index page like other iframe page.  */
  let index_div = document.createElement ("div");
  for (let ch = document.body.firstChild; ch; ch = document.body.firstChild)
    index_div.appendChild (ch);

  /* Instanciate the components.  */
  components = new Main_component (document.body, index_div);

  let initial_state = {
    /* Dictionary associating page ids to next, prev, up, forward,
       backward link ids.  */
    loaded_nodes: {},
    /* page id of the current page.  */
    current: config.INDEX_ID
  };

  store = new Store (global_reducer, initial_state);
  store.subscribe (() => components.render (store.state));

  /* eslint-disable no-console */
  store.subscribe (() => console.log ("state: ", store.state));
  /* eslint-enable no-console */

  fix_links (document.links);
  document.body.setAttribute ("class", "mainbar");

  /* Retrieve NEXT link.  */
  let links = {};
  links[config.INDEX_ID] = navigation_links (document);
  store.dispatch (actions.cache_links (links));
}

export function
on_message (event)
{
  let data = event.data;
  switch (data.message_kind)
    {
    case "action":            /* Handle actions sent from iframes.  */
      store.dispatch (data.action);
      break;
    case "node-list":
      {
        let nodes = Object.keys (store.state.loaded_nodes);
        for (var i = 0; i < nodes.length; i += 1)
          {
            let name = nodes[i];
            if (name === config.INDEX_ID)
              continue;
            let div = document.createElement ("div");
            div.setAttribute ("id", name);
            div.setAttribute ("node", name);
            div.setAttribute ("hidden", "true");
            document.querySelector ("#sub-pages").appendChild (div);
          }
        if (window.location.hash)
          {
            let hash = window.location.hash;
            let url = (hash.includes (".")) ?
                hash.replace (/#(.*)[.](.*)/, "$1.xhtml#$2") :
                hash.replace (/#/, "") + ".xhtml";
            load_page (url, hash);
          }
        break;
      }
    case "load-page":
      {
        if (!data.nav)          /* not a navigation link */
          load_page (data.url, data.hash);
        else
        {
          let ids = store.state.loaded_nodes[store.state.current];
          let link_id = ids[data.nav];
          if (link_id)
            load_page (link_id + ".xhtml", "#" + link_id);
        }
        break;
      }
    default:
      break;
    }
}
