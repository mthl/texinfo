/* actions.js - Actions to dispatch */

export const LOAD_PAGE = "load-page";

export function
load_page (page)
{
  return { type: LOAD_PAGE, page };
}

export const PAGE_READY = "page-ready";

export function
page_ready (page)
{
  return { type: PAGE_READY, page };
}

export const CURRENT_URL = "current-url";

export function
set_current_url (url)
{
  return { type: CURRENT_URL, url };
}
