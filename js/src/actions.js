/* actions.js - Actions to dispatch
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

export const CACHE_LINKS = "cache-links";

export function
cache_links (links)
{
  return { type: CACHE_LINKS, links };
}
