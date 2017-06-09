/* reducers.js - Reducers to handle actions */

import { LOAD_PAGE, PAGE_READY } from "./actions";

export function
global_reducer (state, action)
{
  switch (action.type)
    {
    case LOAD_PAGE:
      {
        let loaded_pages = Object.assign ({}, state.loaded_pages);
        loaded_pages[action.page] = { id: action.page, status: "loading" };
        return Object.assign ({}, state, { loaded_pages });
      }
    case PAGE_READY:
      {
        let loaded_pages = Object.assign ({}, state.loaded_pages);
        loaded_pages[action.page] = { id: action.page, status: "loaded" };
        return Object.assign ({}, state, { loaded_pages });
      }
    default:
      return state;
    }
}
