/* toc.js - Generate and manage table of content */

import { absolute_url_p, basename, depth_first_walk } from "./utils";
import config from "./config";

/** Object storing the value of the */
export var main_filename = { val: null };

/* Adapt HREF to refer to an anchor in index file.  HREF must be a string
   representing an absolute or relative URL.

   For example if 'main_filename.val' value is "index.html", "foo/bar.html"
   will be replaced by "index.html#bar".  */
var with_sidebar_query = (function () {
  /* DOM element used to access the HTMLAnchorElement interface.  */
  let node = document.createElement ("a");

  return function (href) {
    node.href = href;
    var node_name = basename (node.pathname, /[.]x?html/);
    if (href == main_filename.val
        || href == config.INDEX_NAME
        || node_name == "start")
      return main_filename.val;
    else
      return main_filename.val + "#" + node_name + node.hash.slice (1);
  };
} ());

/* Keep children but remove grandchildren (Exception: don't remove
   anything on the current page; however, that's not a problem in the
   Kawa manual).  */
function
hide_grand_child_nodes (ul)
{
  for (let li = ul.firstElementChild; li; li = li.nextElementSibling)
    {
      let a = li.firstElementChild;
      let li$ = a && a.nextElementSibling;
      /* Never remove Overall-Index.  */
      if (li$ && a.getAttribute ("href") != "Overall-Index.xhtml")
        li$.setAttribute ("toc-detail", "yes");
    }
}

/** Scan ToC entries to see which should be hidden.  */
export function
scan_toc (node, filename)
{
  var current = with_sidebar_query (filename);
  var ul = node.querySelector ("ul");
  if (filename == "index.html")
    hide_grand_child_nodes (ul);
  else
    scan_toc1 (ul, current);
}

/* Scan ToC entries to see which should be hidden.  Return "current" if node
   matches current, "ancestor" if node is ancestor of current, else 'null'.  */
function
scan_toc1 (node, current)
{
  if (node.matches ("a"))
    {
      if (current == node.getAttribute ("href"))
        {
          node.setAttribute ("toc-current", "yes");
          var ul = node.nextElementSibling;
          if (ul && ul.matches ("ul"))
            hide_grand_child_nodes (ul);
          return "current";
        }
    }
  var ancestor = null;
  for (var child = node.firstElementChild; child;
       child = child.nextElementSibling)
    {
      if (scan_toc1 (child, current) !== null)
        {
          ancestor = child;
          break;
        }
    }
  if (ancestor && ancestor.parentNode && ancestor.parentNode.parentNode)
    {
      var pparent = ancestor.parentNode.parentNode;
      for (var sib = pparent.firstElementChild; sib;
           sib = sib.nextElementSibling)
        {
          if (sib != ancestor.parentNode
              && sib.firstElementChild
              && sib.firstElementChild.nextElementSibling)
            {
              sib.firstElementChild
                .nextElementSibling
                .setAttribute ("toc-detail", "yes");
            }
        }
    }

  return ancestor ? "ancestor" : null;
}

/** Reset what is done by 'scan_toc' and 'hide_grand_child_nodes'.  */
export function
clear_toc_styles (node)
{
  function
  do_clear (node$)
  {
    if (node$.matches ("ul"))
      node$.removeAttribute ("toc-detail");
    else if (node$.matches ("a"))
      node$.removeAttribute ("toc-current");
  }

  depth_first_walk (node, do_clear, Node.ELEMENT_NODE);
}

/** Build the global dictionary containing navigation links from NAV.  NAV
    must be an 'ul' DOM element containing the table of content of the
    manual.  */
export function
create_link_dict (nav)
{
  let prev_id = config.INDEX_ID;
  let links = {};

  function
  add_link (elem)
  {
    if (elem.matches ("a"))
    {
      let id = elem.getAttribute ("href").replace (/.*#/, "");
      links[prev_id] = Object.assign ({}, links[prev_id], { forward: id });
      links[id] = Object.assign ({}, links[id], { backward: prev_id });
      prev_id = id;
    }
  }

  depth_first_walk (nav, add_link, Node.ELEMENT_NODE);
  return links;
}

/** If LINK is absolute ensure it is opened in a new tab.  Otherwise modify
    the 'href' attribute to adapt to the iframe based navigation.  */
export function
fix_link (link, href)
{
  if (absolute_url_p (href))
    link.setAttribute ("target", "_blank");
  else
    link.setAttribute ("href", with_sidebar_query (href));
}
