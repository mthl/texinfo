/* reducers.js - Actions handlers that return a new state
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

import {
  CACHE_INDEX_LINKS,
  CACHE_LINKS,
  CURRENT_URL,
  HIDE_COMPONENT,
  NAVIGATE,
  SHOW_COMPONENT,
  SIDEBAR_LOADED
} from "./actions";

export function
global_reducer (state, action)
{
  switch (action.type)
    {
    case SIDEBAR_LOADED:
      return Object.assign ({}, state, { sidebar_loaded: true, action });
    case CACHE_LINKS:
      {
        let clone = Object.assign ({}, state.loaded_nodes);
        Object
          .keys (action.links)
          .forEach (key => {
            if (typeof action.links[key] === "object")
              clone[key] = Object.assign ({}, clone[key], action.links[key]);
            else
              clone[key] = action.links[key];
          });

        return Object.assign ({}, state, { loaded_nodes: clone, action });
      }
    case CACHE_INDEX_LINKS:
      {
        let clone = Object.assign ({}, state, { action });
        clone.index = clone.index || {};
        Object.assign (clone.index, action.links);
        return clone;
      }
    case CURRENT_URL:
      {
        let res = Object.assign ({}, state, { action });
        let url = (action.pointer) ?
            state.loaded_nodes[action.pointer] : action.url;

        res.current = url;
        res.history = action.history;
        res.loaded_nodes[url] = res.loaded_nodes[url] || {};
        res.text_input_visible = false;
        return res;
      }
    case NAVIGATE:
      {
        let ids = state.loaded_nodes[state.current];
        let linkid = ids[action.direction];
        if (!linkid)
          return state;
        else
          {
            let res = Object.assign ({}, state, { current: linkid, action });
            res.history = action.history;
            res.text_input_visible = false;
            if (!Object.keys (res.loaded_nodes).includes (action.url))
              res.loaded_nodes[action.url] = {};
            return res;
          }
      }
    case SHOW_COMPONENT:
      {
        if (!["menu", "index"].includes (action.component)
            || state.text_input_visible)
          return state;
        else
          {
            let clone = Object.assign ({ action }, state);
            clone.text_input_visible = true;
            clone.text_input_type = action.component;
            return clone;
          }
      }
    case HIDE_COMPONENT:
      {
        if (!["menu", "index"].includes (action.component)
            || !state.text_input_visible)
          return state;
        else
          {
            let clone = Object.assign ({ action }, state);
            clone.text_input_visible = false;
            clone.text_input_type = action.component;
            return clone;
          }
      }
    default:
      return state;
    }
}
