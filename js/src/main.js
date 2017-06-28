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
import { Minibuffer } from "./text_input";
import { Pages } from "./iframe";
import { Sidebar } from "./sidebar";
import { Store } from "./store";
import config from "./config";
import { fix_links } from "./toc";
import { global_reducer } from "./reducers";
import { navigation_links } from "./utils";

/* Global state manager.  */
let store;

/* Aggregation of all the components.   */
let components = {
  element: null,
  components: [],

  add (component)
  {
    if (this.element === null)
      throw new Error ("element property must be set first");

    this.components.push (component);
    this.element.appendChild (component.element);
  },

  render (state)
  {
    this.components.forEach (cmpt => cmpt.render (state));
  }
};

/*--------------------------------------------
| Event handlers for the top-level context.  |
`-------------------------------------------*/

/* eslint-disable no-console */

/* Initialize the top level 'config.INDEX_NAME' DOM.  */
export function
on_load ()
{
  fix_links (document.links);
  document.body.setAttribute ("class", "mainbar");

  /* Move contents of <body> into a a fresh <div> to let the components
     treat the index page like other iframe page.  */
  let index_div = document.createElement ("div");
  for (let ch = document.body.firstChild; ch; ch = document.body.firstChild)
    index_div.appendChild (ch);

  /* Instantiate the components.  */
  components.element = document.body;
  components.add (new Sidebar ());
  components.add (new Pages (index_div));
  components.add (new Minibuffer ());

  let initial_state = {
    /* Dictionary associating page ids to next, prev, up, forward,
       backward link ids.  */
    loaded_nodes: {},
    /* Dictionary associating keyword to linkids.  */
    index: {},
    /* page id of the current page.  */
    current: config.INDEX_ID,
    /* Current mode for handling history.  */
    history: config.HISTORY_REPLACE,
    /* Define if the sidebar iframe is loaded.  */
    text_input_visible: false
  };

  store = new Store (global_reducer, initial_state);
  store.subscribe (() => console.log ("state: ", store.state));
  store.subscribe (() => components.render (store.state));

  if (window.location.hash)
    {
      let linkid = window.location.hash.slice (1);
      let action = actions.set_current_url (linkid, config.HISTORY_REPLACE);
      store.dispatch (action);
    }

  /* Retrieve NEXT link and local menu.  */
  let links = {};
  links[config.INDEX_ID] = navigation_links (document);
  store.dispatch (actions.cache_links (links));
}

/** Handle messages received via the Message API.  */
export function
on_message (event)
{
  let data = event.data;
  if (data.message_kind === "action")
    {
      /* Follow up actions to the store.  */
      store.dispatch (data.action);
    }
}

/** Event handler for 'popstate' events.  */
export function
on_popstate (event)
{
  let linkid = event.state.linkid;
  store.dispatch (actions.set_current_url (linkid, config.HISTORY_POP));
}
