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
  INIT,
  NAVIGATE,
  SIDEBAR_LOADED
} from "./actions";

export function
global_reducer (state, action)
{
  switch (action.type)
    {
    case INIT:
      return Object.assign ({}, state, { action });
    case SIDEBAR_LOADED:
      return Object.assign ({}, state, { sidebar_loaded: true, action });
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
      {
        let res = Object.assign ({}, state, { current: action.url, action });
        if (!res.loaded_nodes[action.url])
          res.loaded_nodes[action.url] = {};
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
            if (!Object.keys (res.loaded_nodes).includes (action.url))
              res.loaded_nodes[action.url] = {};
            return res;
          }
      }
    default:
      return state;
    }
}
