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
  SHOW_COMPONENT
} from "./actions";

export function
global_reducer (state, action)
{
  switch (action.type)
    {
    case CACHE_LINKS:
      {
        let nodes = Object.assign ({}, state.loaded_nodes);
        Object
          .keys (action.links)
          .forEach (key => {
            if (typeof action.links[key] === "object")
              nodes[key] = Object.assign ({}, nodes[key], action.links[key]);
            else
              nodes[key] = action.links[key];
          });

        return Object.assign ({}, state, { loaded_nodes: nodes, action });
      }
    case CACHE_INDEX_LINKS:
      {
        let res = Object.assign ({}, state, { action });
        Object.assign (res.index, action.links);
        return res;
      }
    case CURRENT_URL:
      {
        let res = Object.assign ({}, state, { action });
        let linkid = (action.pointer) ?
            state.loaded_nodes[action.pointer] : action.url;

        res.current = linkid;
        res.history = action.history;
        res.text_input = null;
        res.loaded_nodes[linkid] = res.loaded_nodes[linkid] || {};
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
            let res = Object.assign ({}, state, { action });
            res.current = linkid;
            res.history = action.history;
            res.text_input = null;
            res.loaded_nodes[action.url] = res.loaded_nodes[action.url] || {};
            return res;
          }
      }
    case SHOW_COMPONENT:
      {
        if (!["menu", "index"].includes (action.component)
            || state.text_input)
          return state;
        else
          {
            let res = Object.assign ({}, state, { action });
            res.text_input = action.component;
            return res;
          }
      }
    case HIDE_COMPONENT:
      {
        if (!state.text_input)
          return state;
        else
          {
            let res = Object.assign ({}, state, { action });
            res.text_input = null;
            return res;
          }
      }
    default:
      return state;
    }
}
