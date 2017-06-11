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

import * as actions from "./actions";
import * as sidebar from "./sidebar";
import { Store, iframe_dispatch } from "./store";

import {
  absolute_url_p,
  basename,
  inside_iframe_p,
  inside_index_page_p
} from "./utils";

import {
  clear_toc_styles,
  fix_links,
  scan_toc
} from "./toc";

import { Main_component } from "./component";
import config from "./config";
import { global_reducer } from "./reducers";
import polyfill from "./polyfill";

/* Global state manager.  */
let store;
/* Main stateful view.   */
let components;

/* Initialize the top level 'config.INDEX_NAME' DOM.  */
function
on_index_load (_event)
{
  fix_links (document.links);
  document.body.setAttribute ("class", "mainbar");

  /* Move contents of <body> into a a fresh <div> to let the components treat
     the index page like other iframe page.  */
  let index_div = document.createElement ("div");
  for (let ch = document.body.firstChild; ch; ch = document.body.firstChild)
    index_div.appendChild (ch);

  /* Instanciate the components.  */
  components = new Main_component (document.body, index_div);

  /* Retrieve NEXT link.  */
  let links = {};
  links[config.INDEX_ID] = navigation_links (document);
  store.dispatch (actions.cache_links (links));
}

/* Initialize the DOM for generic pages loaded in the context of an
   iframe.  */
function
on_iframe_load (_event)
{
  fix_links (document.links);
  let links = {};
  let url = basename (window.location.pathname, /[.]x?html$/);
  links[url] = navigation_links (document);
  iframe_dispatch (actions.cache_links (links));
}

/* Retrieve PREV, NEXT, and UP links and Return a object containing references
   to those links.  */
var navigation_links = (function () {
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

/* Return an array compose of the filename and the anchor of NODE_NAME.
   NODE_NAME can have the form "foobaridm80837412374" or just "foobar".  */
function
split_id_anchor (node_name)
{
  let rgxp = /idm\d+$/;
  if (!rgxp.test (node_name))
    return [node_name, ""];
  else
    {
      let [id, anchor] = node_name.match (/^(.+)(idm\d+)$/).slice (1);
      return [id, "#" + anchor];
    }
}

function
load_page (url, hash)
{
  var node_name = url.replace (/[.]x?html.*/, "");
  var path =
      (window.location.pathname + window.location.search).replace (/#.*/, "")
      + hash;
  let [id] = split_id_anchor (node_name);
  let div = document.getElementById (id);
  if (!div)
    {
      let msg = `no iframe container correspond to identifier "${id}"`;
      throw new ReferenceError (msg);
    }

  var iframe = div.firstElementChild;
  if (iframe === null)
    {
      iframe = document.createElement ("iframe");
      iframe.setAttribute ("class", "node");
      iframe.setAttribute ("name", path);
      iframe.setAttribute ("src", url);
      div.appendChild (iframe);
    }
  else if (iframe.matches ("iframe"))
    {
      let msg = { message_kind: "scroll-to", url };
      iframe.contentWindow.postMessage (msg, "*");
    }

  let msg = { message_kind: "update-sidebar", selected: node_name };
  components.sidebar.get_iframe_window ().postMessage (msg, "*");
  window.history.pushState ("", document.title, path);
  store.dispatch (actions.set_current_url (node_name));
}

function
receive_message (event)
{
  let data = event.data;
  switch (data.message_kind)
    {
    case "action":            /* Handle actions sent from iframes.  */
      store.dispatch (data.action);
      break;
    case "node-list":           /* from sidebar to top frame */
      {
        let nodes = Object.keys (store.state.loaded_nodes);
        for (var i = 0; i < nodes.length; i += 1)
          {
            let name = nodes[i];
            if (name == config.INDEX_ID)
              continue;
            let div = document.createElement ("div");
            div.setAttribute ("id", name);
            div.setAttribute ("node", name);
            div.setAttribute ("hidden", "true");
            document.querySelector ("#sub-pages").appendChild (div);
          }
        if (window.location.hash)
          {
            let hash = window.location.hash;
            let url = (hash.includes (".")) ?
                hash.replace (/#(.*)[.](.*)/, "$1.xhtml#$2") :
                hash.replace (/#/, "") + ".xhtml";
            load_page (url, hash);
          }
        break;
      }
    case "load-page":           /* from click handler to top frame */
      {
        if (!data.nav)          /* not a navigation link */
          load_page (data.url, data.hash);
        else
        {
          let ids = store.state.loaded_nodes[store.state.current];
          let link_id = ids[data.nav];
          if (link_id)
            load_page (link_id + ".xhtml", "");
        }
        break;
      }
    case "scroll-to":           /* top window to node window */
      {
        let url = data.url;
        window.location.hash = (url.includes ("#")) ?
          url.replace (/.*#/, "") : "";
        break;
      }
    case "update-sidebar":
      {
        let selected = data.selected;
        clear_toc_styles (document.body);
        let filename = (selected == config.INDEX_ID) ?
            config.INDEX_NAME : (selected + ".xhtml");
        scan_toc (document.body, filename);
        break;
      }
    default:
      break;
    }
}

function
on_click (evt)
{
  for (var target = evt.target; target !== null; target = target.parentNode)
    {
      if ((target instanceof Element) && target.matches ("a"))
        {
          let href = target.getAttribute ("href");
          if (!absolute_url_p (href))
            {
              let url = href.replace (/.*#/, "") || config.INDEX_ID;
              if (url.includes ("."))
                url = url.replace (/[.]/, ".xhtml#");
              else
                url += ".xhtml";
              let hash = href.replace (/.*#/, "#");
              if (hash == config.INDEX_NAME)
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
on_unload (_event)
{
  var request = new XMLHttpRequest ();
  request.open ("GET", "(WINDOW-CLOSED)");
  request.send (null);
}

/* Handle Keyboard 'keypress' events.  */
var on_keypress = (function () {
  /* Dictionary associating an Event 'key' property to its navigation id.  */
  let dict = {
    n: "next",
    p: "prev",
    u: "up",
    "]": "forward",
    "[": "backward"
  };

  return function (evt) {
    let nav = dict[evt.key];
    if (nav)
      top.postMessage ({ message_kind: "load-page", nav }, "*");
  };
} ());

/* Don't do anything if the current script is launched from a non-iframed page
   which is different from 'config.INDEX_NAME'.  */
if (inside_iframe_p () || inside_index_page_p (window.location.pathname))
{
  polyfill.register ();

  if (!inside_iframe_p ())
    {
      window.addEventListener ("DOMContentLoaded", on_index_load, false);
      window.addEventListener ("message", receive_message, false);

      let initial_state = {
        /* Dictionary associating page ids to next, prev, up, forward,
           backward link ids.  */
        loaded_nodes: {},
        /* page id of the current page.  */
        current: config.INDEX_ID
      };

      store = new Store (global_reducer, initial_state);
      store.subscribe (() => console.log ("state: ", store.state));
      store.subscribe (() => components.render (store.state));
    }
  else if (window.name == "slider")
    {
      window.addEventListener ("DOMContentLoaded", sidebar.on_load, false);
      window.addEventListener ("message", sidebar.on_message, false);
    }
  else
    {
      window.addEventListener ("DOMContentLoaded", on_iframe_load, false);
      window.addEventListener ("message", receive_message, false);
    }

  window.addEventListener ("beforeunload", on_unload, false);
  window.addEventListener ("click", on_click, false);
  window.addEventListener ("keypress", on_keypress, false);
}
