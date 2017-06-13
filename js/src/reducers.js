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
  CACHE_LINKS,
  CURRENT_URL,
  LOAD_PAGE,
  PAGE_READY
} from "./actions";

export function
global_reducer (state, action)
{
  switch (action.type)
    {
    case CACHE_LINKS:
      {
        let clone = Object.assign ({}, state.loaded_nodes);
        for (let key in action.links)
          {
            if (action.links.hasOwnProperty (key))
              clone[key] = Object.assign ({}, clone[key], action.links[key]);
          }
        return Object.assign ({}, state, { loaded_nodes: clone, action });
      }
    case CURRENT_URL:
      return Object.assign ({}, state, { current: action.url, action });
    case LOAD_PAGE:
      {
        let loaded_nodes = Object.assign ({}, state.loaded_nodes);
        loaded_nodes[action.page] = { id: action.page, status: "loading" };
        return Object.assign ({}, state, { loaded_nodes, action });
      }
    case PAGE_READY:
      {
        let loaded_nodes = Object.assign ({}, state.loaded_nodes);
        loaded_nodes[action.page] = { id: action.page, status: "loaded" };
        return Object.assign ({ action }, state, { loaded_nodes, action });
      }
    default:
      return state;
    }
}
