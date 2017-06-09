/* toc.js - Generate and manage table of content */

import { absolute_url_p, basename } from "./utils";
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
  for (var li = ul.firstElementChild; li; li = li.nextElementSibling)
    {
      var achild = li.firstElementChild;
      if (achild && li.matches ("li") && achild.matches ("a"))
        {
          var lichild = achild.nextElementSibling;
          if (lichild
              && lichild.matches ("ul")
              /* Never remove Overall-Index.  */
              && achild.getAttribute ("href") != "Overall-Index.xhtml")
            lichild.setAttribute ("toc-detail", "yes");
        }
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
  if (node.matches ("ul"))
    node.removeAttribute ("toc-detail");
  else if (node.matches ("a"))
    node.removeAttribute ("toc-current");

  for (var child = node.firstElementChild; child;
       child = child.nextElementSibling)
    clear_toc_styles (child);
}

/** Build the global dictionary containing navigation links from NAV.  NAV
    must be an 'ul' DOM element containing the table of content of the
    manual.  */
export function
create_link_dict (nav)
{
  let filter = {
    acceptNode (node)
    {
      return (node.matches ("a")) ?
        window.NodeFilter.FILTER_ACCEPT : window.NodeFilter.FILTER_SKIP;
    }
  };

  /* Depth first walk through the links in NAV to define the 'backward' and
     'forward' attributes in DICT.  */
  let tw =
    document.createTreeWalker (nav, window.NodeFilter.SHOW_ELEMENT, filter);
  let links = {};
  let old = tw.currentNode;
  let current = tw.nextNode ();
  let href = link => (link.getAttribute ("href") || "index");
  while (current)
    {
      let id_old = href (old).replace (/.*#/, "");
      let id_cur = href (current).replace (/.*#/, "");
      links[id_old] = Object.assign ({}, links[id_old], { forward: id_cur });
      links[id_cur] = Object.assign ({}, links[id_cur], { backward: id_old });
      old = current;
      current = tw.nextNode ();
    }

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
