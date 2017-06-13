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

/** Check wether the current script is loaded inside an Iframe.
    Return true if this is the case otherwise return false.  */
export function
inside_iframe_p ()
{
  return top != window;
}

/** Check if FILE_NAME corresponds to the entry file of the
    manual.  */
export function
inside_index_page_p (file_name)
{
  return file_name.endsWith ("/index.html") || file_name.endsWith ("/");
}

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
  else                          /* typeof SUFFIX == "string" */
    return res.replace (new RegExp ("[.]" + suffix), "");
}

/** Apply FUNC to each nodes in the NODE subtree.  The walk follows a depth
    first algorithm.  Only consider the nodes of type NODE_TYPE.  */
export function
depth_first_walk (node, func, node_type)
{
  if (!node_type || (node.nodeType === Node.ELEMENT_NODE))
    func (node);

  for (let child = node.firstChild; child; child = child.nextSibling)
    depth_first_walk (child, func, node_type);
}

/** Retrieve PREV, NEXT, and UP links and Return a object containing
    references to those links.  */
export var navigation_links = (function () {
  /* Dictionary associating an 'accesskey' property to its navigation id.  */
  let dict = { n: "next", p: "prev", u: "up" };

  return function (content) {
    let links = Array.from (content.querySelectorAll ("footer a"));

    /* links have the form MAIN_FILE.html#FRAME-ID.  For convenience
       we only store FRAME-ID.  */
    return links.reduce ((acc, link) => {
      let nav_id = dict[link.getAttribute ("accesskey")];
      if (nav_id)
        acc[nav_id] = link.getAttribute ("href").replace (/.*#/, "");
      return acc;
    }, {});
  };
} ());
