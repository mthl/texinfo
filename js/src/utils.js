/* utils.js - General purpose utilitary functions
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

/** Check if 'URL' is an absolute URL.  Return true if this is the case
    otherwise return false.  'URL' must be a USVString representing a valid
    URL.  */
export function
absolute_url_p (url)
{
  if (typeof url !== "string")
    throw new TypeError (`'${url}' is not a string`);

  return url.includes (":");
}

/** Return PATHNAME with any leading directory components removed.  If
    specified, also remove a trailing SUFFIX.  */
export function
basename (pathname, suffix)
{
  let res = pathname.replace (/.*[/]/, "");
  if (!suffix)
    return res;
  else if (suffix instanceof RegExp)
    return res.replace (suffix, "");
  else                          /* typeof SUFFIX === "string" */
    return res.replace (new RegExp ("[.]" + suffix), "");
}

/** Apply FUNC to each nodes in the NODE subtree.  The walk follows a depth
    first algorithm.  Only consider the nodes of type NODE_TYPE.  */
export function
depth_first_walk (node, func, node_type)
{
  if (!node_type || (node.nodeType === node_type))
    func (node);

  for (let child = node.firstChild; child; child = child.nextSibling)
    depth_first_walk (child, func, node_type);
}

/** Return the hash part of HREF without the '#' prefix.  HREF must be
    a string.  If there is no hash part in HREF then return the empty
    string.  */
export function
href_hash (href)
{
  if (typeof href !== "string")
    throw new TypeError (href + " is not a string");

  if (href.includes ("#"))
    return href.replace (/.*#/, "");
  else
    return "";
}

/** Retrieve PREV, NEXT, and UP links, and local menu from CONTENT and return
    an object containing references to those links.  CONTENT must be an object
    implementing the ParentNode interface (Element, Document...).  */
export function
navigation_links (content)
{
  let links = content.querySelectorAll ("footer a");
  let res = { menu: {} };
  /* links have the form MAIN_FILE.html#FRAME-ID.  For convenience
     only store FRAME-ID.  */
  for (let i = 0; i < links.length; i += 1)
    {
      let link = links[i];
      let nav_id = navigation_links.dict[link.getAttribute ("accesskey")];
      if (nav_id)
        res[nav_id] = href_hash (link.getAttribute ("href"));
      else                  /* this link is part of local table of content. */
        res.menu[link.text] = href_hash (link.getAttribute ("href"));
    }

  return res;
}

/* Dictionary associating an 'accesskey' property to its navigation id.  */
navigation_links.dict = { n: "next", p: "prev", u: "up" };

