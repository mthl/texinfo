/* reducers.js - Reducers to handle actions */

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
        return Object.assign ({}, state, { loaded_nodes: clone });
      }
    case CURRENT_URL:
      return Object.assign ({}, state, { current: action.url });
    case LOAD_PAGE:
      {
        let loaded_nodes = Object.assign ({}, state.loaded_nodes);
        loaded_nodes[action.page] = { id: action.page, status: "loading" };
        return Object.assign ({}, state, { loaded_nodes });
      }
    case PAGE_READY:
      {
        let loaded_nodes = Object.assign ({}, state.loaded_nodes);
        loaded_nodes[action.page] = { id: action.page, status: "loaded" };
        return Object.assign ({}, state, { loaded_nodes });
      }
    default:
      return state;
    }
}
