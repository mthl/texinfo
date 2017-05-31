/* toc.js - Generate and manage table of content */

const MAIN_NAME = "index.html";

/** Object storing the value of the */
export var mainFilename = { val: null };

/** Return ...  */
export function
withSidebarQuery (href)
{
  var nodeName = href.replace (/[.]x?html.*/, "");
  if (href == mainFilename.val || href == MAIN_NAME || nodeName == "start")
    return mainFilename.val;
  var h = href.indexOf ('#');
  var hash = h < 0 ? "" : href.replace (/.*#/, ".");
  return mainFilename.val + "#" + nodeName + hash;
}

/* Keep children but remove grandchildren (Exception: don't remove
   anything on the current page; however, that's not a problem in the
   Kawa manual).  */
function
hideGrandChildNodes (ul)
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
scanToc (node, filename)
{
  var current = withSidebarQuery (filename);
  var ul = node.getElementsByTagName ("ul")[0];
  if (filename == "index.html")
    hideGrandChildNodes (ul);
  else
    scanToc1 (ul, current);
}

/* Scan ToC entries to see which should be hidden.  Return 2 if node
   matches current; 1 if node is ancestor of current; else 0.  */
function
scanToc1 (node, current)
{
  if (node.matches ("a"))
    {
      if (current == node.getAttribute ("href"))
        {
          node.setAttribute ("toc-current", "yes");
          var ul = node.nextElementSibling;
          if (ul && ul.matches ("ul"))
            hideGrandChildNodes (ul);
          return 2;
        }
    }
  var ancestor = null;
  for (var child = node.firstElementChild; child;
       child = child.nextElementSibling)
    {
      if (scanToc1 (child, current) > 0)
        {
          ancestor = child;
          break;
        }
    }
  if (ancestor && ancestor.parentNode && ancestor.parentNode.parentNode)
    {
      var pparent = ancestor.parentNode.parentNode;
      for (var sib = pparent.firstElementChild; sib; sib = sib.nextElementSibling)
        {
          if (sib != ancestor.parentNode
              && sib.firstElementChild
              && sib.firstElementChild.nextElementSibling)
            sib.firstElementChild.nextElementSibling.setAttribute ("toc-detail", "yes");
        }
    }

  return ancestor ? 1 : 0;
}

/** Reset what is done by 'scanToc' and 'hideGrandChildNodes'.  */
export function
clearTocStyles (node)
{
  if (node.matches ("ul"))
    node.removeAttribute ("toc-detail");
  else if (node.matches ("a"))
    node.removeAttribute ("toc-current");

  for (var child = node.firstElementChild; child;
       child = child.nextElementSibling)
    clearTocStyles (child);
}
