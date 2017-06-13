/* iframe.js - Module for iframe containing sub pages */

import * as actions from "./actions";
import { basename, navigation_links } from "./utils";
import config from "./config";
import { fix_links } from "./toc";
import { iframe_dispatch } from "./store";

export class
Pages
{
  constructor (index_div)
  {
    index_div.setAttribute ("id", config.INDEX_ID);
    index_div.setAttribute ("node", config.INDEX_ID);
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sub-pages");
    this.element.appendChild (index_div);
  }

  render (state)
  {
    if (state == this.state)
      return;

    this.state = state;
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
  switch (data.message_kind)
    {
    case "scroll-to":
      {
        let url = data.url;
        window.location.hash = (url.includes ("#")) ?
          url.replace (/.*#/, "") : "";
        break;
      }
    default:
      break;
    }
}
