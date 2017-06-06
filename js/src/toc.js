/* toc.js - Generate and manage table of content */

import { basename } from "./utils";

const INDEX_NAME = "index.html";

/** Object storing the value of the */
export var main_filename = { val: null };

/** Adapt HREF to refer to an anchor in index file.  HREF must be a string
    representing an absolute or relative URL.

    For example if 'main_filename.val' value is "index.html", "foo/bar.html"
    will be replaced by "index.html#bar".  */
export var with_sidebar_query = (function () {

  /* DOM element used to access the HTMLAnchorElement interface.  */
  let node = document.createElement ("a");

  return function (href) {
    node.href = href;
    var node_name = basename (node.pathname, /[.]x?html/);
    if (href == main_filename.val || href == INDEX_NAME || node_name == "start")
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
  var ul = node.getElementsByTagName ("ul")[0];
  if (filename == "index.html")
    hide_grand_child_nodes (ul);
  else
    scan_toc1 (ul, current);
}

/* Scan ToC entries to see which should be hidden.  Return 2 if node
   matches current; 1 if node is ancestor of current; else 0.  */
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
          return 2;
        }
    }
  var ancestor = null;
  for (var child = node.firstElementChild; child;
       child = child.nextElementSibling)
    {
      if (scan_toc1 (child, current) > 0)
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

  return ancestor ? 1 : 0;
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
