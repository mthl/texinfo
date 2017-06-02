/* TODO:
   - Styling of node header
   - Handle internal links: #NODE-NAME.ID-NAME
   - set location.has husefully; use initial value  */

/* JavaScript mostly to set up a table-of-contents sidebar, using an
   <iframe>.  The <iframe> sidebar can be explicitly enabled if you
   use the hash "#sidebar" or "#sidebar=yes"; or explicitly disabled
   with "#sidebar=no".  The default is to enable the sidebar except
   when using a ebook-reader (as detected by the property
   navigator.epubReadingSystem), since ebook-readers generally provide
   their own table-of-contents.  */

import {
  inside_iframe_p,
  inside_index_page_p,
  absolute_url_p,
  basename
} from "./utils";
import {
  withSidebarQuery,
  scanToc,
  clearTocStyles,
  mainFilename
} from "./toc";

var mainName = "index.html";
var mainWindow = window;
var sidebarQuery = "";
const TOC_FILENAME = "ToC.xhtml";
var xhtmlNamespace = "http://www.w3.org/1999/xhtml";
var sidebarFrame = null;

/* Initialize the top level "index.html" DOM.  */
function
on_index_load (evt)
{
  mainFilename.val = basename (window.location.pathname);

  /* Move contents of <body> into a a fresh <div>.  */
  var body = document.body;
  var div = document.createElement ("div");
  window.selectedDivNode = div;
  div.setAttribute ("id", "index");
  div.setAttribute ("node", "index");
  for (let ch = body.firstChild; ch != null; ch = body.firstChild)
    div.appendChild (ch);
  body.appendChild (div);

  if (useSidebar (window.location.hash))
    {
      var iframe = document.createElement ("iframe");
      sidebarFrame = iframe;
      iframe.setAttribute ("name", "slider");
      iframe.setAttribute ("src",
                           TOC_FILENAME + "#main=" + mainFilename.val);
      body.insertBefore (iframe, body.firstChild);
      body.setAttribute ("class", "mainbar");
    }

  sidebarQuery = window.location.hash;
  fix_links (document.getElementsByTagName ("a"));
}

/* Initialize the DOM for generic pages loaded in the context of an
   iframe.  */
function
on_iframe_load (evt)
{
  mainFilename.val = basename (window.name, /#.*/);
  fix_links (document.getElementsByTagName ("a"));
}

function
fixLink (link, href)
{
  if (absolute_url_p (href))
    link.setAttribute ("target", "_blank");
  else
    link.setAttribute ("href", withSidebarQuery (href));
}

/* Modify LINKS to handle the iframe based navigation properly.
   relative links will be opened inside the corresponding iframe and
   absolute links will be opened in a new tab.  LINKS must be an array
   or a collection of nodes.  Return the number of nodes fixed.  */
function
fix_links (links)
{
  let count = 0;
  for (let i = 0; i < links.length; i++)
    {
      let link = links[i];
      let href = link.getAttribute ("href");
      if (href)
        {
          fixLink (link, href);
          count += 1;
        }
    }

  return count;
}

function
addSidebarHeader (sidebarDoc)
{
  var li = sidebarDoc.getElementsByTagName ("li")[0];
  if (li && li.firstElementChild && li.firstElementChild.matches ("a")
      && li.firstElementChild.getAttribute ("href") == mainName)
    li.parentNode.removeChild (li);
  var header = sidebarDoc.getElementsByTagName ("header")[0];
  var h1 = sidebarDoc.getElementsByTagName ("h1")[0];
  if (header && h1)
    {
      var a = sidebarDoc.createElement ("a");
      a.setAttribute ("href", "index.html");
      header.appendChild (a);
      var div = sidebarDoc.createElement ("div");
      a.appendChild (div);
      var img = sidebarDoc.createElement ("img");
      img.setAttribute ("src", "kawa-logo.png");
      div.appendChild (img);
      var span = sidebarDoc.createElement ("span");
      span.appendChild (h1.firstChild);
      div.appendChild (span);
      h1.parentNode.removeChild (h1);
    }
}

/* Initialize the "ToC.xhtml" DOM which must be loaded in the context of an
   iframe.  */
function
on_sidebar_load (evt)
{
  mainFilename.val = window.location.href.replace (/.*#main=/, "");
  var search = window.location.hash;
  addSidebarHeader (document);
  /* FIXME: Add base also for sub-pages.  */
  var base = document.createElement ("base");
  base.setAttribute ("href",
                     window.location.href.replace (/[/][^/]*$/, "/"));
  document.head.appendChild (base);
  document.body.setAttribute ("class", "toc-sidebar");
  var links = document.getElementsByTagName ("a");

  var tocA = document.createElementNS (xhtmlNamespace, "a");
  tocA.setAttribute ("href", TOC_FILENAME);
  tocA.appendChild (document.createTextNode ("Table of Contents"));
  var tocLi = document.createElementNS (xhtmlNamespace, "li");
  tocLi.appendChild (tocA);
  var indexLi = links[links.length-1].parentNode;
  var indexGrand = indexLi.parentNode.parentNode;
  /* XXX: hack */
  if (indexGrand.nodeName == "li")
    indexLi = indexGrand;
  indexLi.parentNode.insertBefore (tocLi, indexLi.nextSibling);

  var prevNode = null;
  var nodes = [];
  let links$ = [...Array.from (links), tocA];
  links$.forEach (link => {
    let href = link.getAttribute ("href");
    if (href)
      {
        fixLink (link, href);
        if (!absolute_url_p (href))
          {
            let nodeName = href.replace (/[.]x?html.*/, "");
            if (prevNode != nodeName)
              {
                prevNode = nodeName;
                nodes.push (nodeName);
              }
          }
      }
  });

  if (mainFilename.val != null)
    scanToc (document.body, mainFilename.val);

  nodes.message_kind = "node-list";
  top.postMessage (nodes, "*");
  var divs = Array.from (document.getElementsByTagName ("div"));
  divs.reverse ()
      .forEach (div => {
        if (div.getAttribute ("class") == "toc-title")
          div.parentNode.removeChild (div);
      });
}

function
loadPage (url, hash)
{
  var nodeName = url.replace (/[.]x?html.*/, "");
  var path =
      (window.location.pathname + window.location.search).replace (/#.*/, "")
      + hash;
  var div = document.getElementById (nodeName);
  var iframe = div.firstChild;
  if (iframe == null)
    {
      iframe = document.createElement ("iframe");
      iframe.setAttribute ("class", "node");
      iframe.setAttribute ("name", path);
      iframe.setAttribute ("src", url);
      div.appendChild (iframe);
    }
  else if (iframe.nodeName == "IFRAME")
    {
      let msg = { message_kind: "scroll-to", url: url };
      iframe.contentWindow.postMessage (msg, "*");
    }

  let msg = { message_kind: "update-sidebar", selected: nodeName };
  sidebarFrame.contentWindow.postMessage (msg, "*");
  window.history.pushState ("", document.title, path);
  if (window.selectedDivNode != div)
    {
      if (window.selectedDivNode)
        window.selectedDivNode.setAttribute ("hidden", "true");
      div.removeAttribute ("hidden");
      window.selectedDivNode = div;
    }
}

function
receiveMessage (event)
{
  var data = event.data;
  switch (data.message_kind)
    {
    case "node-list":           /* from sidebar to top frame */
      {
        for (var i = 0; i < data.length; i++)
          {
            var name = data[i];
            if (name == "index")
              continue;
            var div = document.createElement ("div");
            div.setAttribute ("id", name);
            div.setAttribute ("node", name);
            div.setAttribute ("hidden", "true");
            document.body.appendChild (div);
          }
        if (window.location.hash)
          {
            var hash = window.location.hash;
            var url = (hash.indexOf (".") >= 0)
              ? hash.replace (/#(.*)[.](.*)/, "$1.xhtml#$2")
              : hash.replace (/#/, "") + ".xhtml";
            loadPage (url, hash);
          }
        break;
      }
    case "load-page":           /* from click handler to top frame */
      loadPage (data.url, data.hash);
      break;
    case "scroll-to":           /* top window to node window */
      {
        let url = data.url;
        window.location.hash = (url.includes ("#")) ?
          url.replace (/.*#/, "") : "";
        break;
      }
    case "update-sidebar":
      {
        var selected = data.selected;
        clearTocStyles (document.body);
        scanToc (document.body,
                 (selected == "index") ? "index.html" : (selected + ".xhtml"));
        break;
      }
    default:
      break;
    }
}

function
onClick (evt)
{
  for (var target = evt.target; target != null; target = target.parentNode)
    {
      if ((target instanceof Element) && target.matches ("a"))
        {
          let href = target.getAttribute ("href");
          if (!absolute_url_p (href))
            {
              let url = href.replace (/.*#/, "") || "index";
              if (url.includes ("."))
                url = url.replace (/[.]/, ".xhtml#");
              else
                url = url + ".xhtml";
              let hash = href.replace (/.*#/, "#");
              if (hash == "index.html")
                hash = "";
              top.postMessage ({ message_kind: "load-page", url, hash }, "*");
              evt.preventDefault ();
              evt.stopPropagation ();
              return;
          }
        }
    }
}

function
onUnload (evt)
{
  var request = new XMLHttpRequest ();
  request.open ("GET","(WINDOW-CLOSED)");
  request.send (null);
}

/* Return true if the side bar containing the table of content should be
   displayed, otherwise return false.  This is guessed from HASH which must be
   a string representing a list of URL parameters.  */
function
useSidebar (hash)
{
  if (hash.indexOf ("sidebar=no") >= 0)
    return false;
  else if (hash.indexOf ("sidebar=yes") >= 0 || hash == "#sidebar")
    return true;
  else
    return !(navigator && navigator.epubReadingSystem);
}

/* Don't do anything if the current script is launched from a non-iframed page
   which is different from "index.html".  */
if (inside_iframe_p () || inside_index_page_p (window.location.pathname))
{
  if (!inside_iframe_p ())
    window.addEventListener ("load", on_index_load, false);
  else if (window.name == "slider")
    window.addEventListener ("load", on_sidebar_load, false);
  else
    window.addEventListener ("load", on_iframe_load, false);

  window.addEventListener ("beforeunload", onUnload, false);
  window.addEventListener ("click", onClick, false);
  window.addEventListener ("message", receiveMessage, false);
}
