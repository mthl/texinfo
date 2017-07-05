/* info.js - Javascript UI for Texinfo manuals
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

(function () {
  "use strict";

  /* Check if OBJ is equal to 'undefined' or 'null'.  */
  function
  undef_or_null (obj)
  {
    return (obj === null || typeof obj === "undefined");
  }

  /*------------.
  | Polyfills.  |
  `------------*/

  /* eslint-disable no-extend-native */
  if (!String.prototype.includes)
    {
      String.prototype.includes = function includes (search, start) {
        start = start || 0;
        return ((start + search.length) <= this.length)
          && (this.indexOf (search, start) !== -1);
      };
    }

  if (!String.prototype.endsWith)
    {
      String.prototype.endsWith = function endsWith (search, position) {
        var subject_string = this.toString ();
        if (typeof position !== "number"
            || !isFinite (position)
            || Math.floor (position) !== position
            || position > subject_string.length)
          position = subject_string.length;

        position -= search.length;
        var last_index = subject_string.lastIndexOf (search, position);
        return last_index !== -1 && last_index === position;
      };
    }

  if (!Element.prototype.matches)
    {
      Element.prototype.matches = Element.prototype.matchesSelector
        || Element.prototype.mozMatchesSelector
        || Element.prototype.msMatchesSelector
        || Element.prototype.oMatchesSelector
        || Element.prototype.webkitMatchesSelector
        || function element_matches (str) {
          var document = (this.document || this.ownerDocument);
          var matches = document.querySelectorAll (str);
          var i = matches.length;
          while ((i -= 1) >= 0 && matches.item (i) !== this);
          return i > -1;
        };
    }

  if (typeof Object.assign != "function")
    {
      Object.assign = function assign (target) {
        if (undef_or_null (target))
          throw new TypeError ("Cannot convert undefined or null to object");

        var to = Object (target);
        for (var index = 1; index < arguments.length; index += 1)
          {
            var next_source = arguments[index];
            if (undef_or_null (next_source))
              {
                for (var key in next_source)
                  {
                    /* Avoid bugs when hasOwnProperty is shadowed.  */
                    if (Object.prototype.hasOwnProperty.call (next_source, key))
                      to[key] = next_source[key];
                  }
              }
          }
        return to;
      };
    }
  /* eslint-enable no-extend-native */

  /*-------------------.
  | Define constants.  |
  `-------------------*/

  var config = {
    TOC_FILENAME: "ToC.xhtml",

    XHTML_NAMESPACE: "http://www.w3.org/1999/xhtml",

    INDEX_NAME: "index.html",

    OVERALL_INDEX_NAME: "Overall-Index.xhtml",

    INDEX_ID: "index",

    PACKAGE_LOGO: "kawa-logo.png",

    WARNING_TIMEOUT: 3000,

    /* History methods. */
    HISTORY_REPLACE: "replaceState",
    HISTORY_PUSH: "pushState"
  };

  /* Actions types to dispatch.  */
  var CURRENT_URL = "current-url";
  var NAVIGATE = "navigate";
  var CACHE_LINKS = "cache-links";
  var CACHE_INDEX_LINKS = "cache-index-links";
  var TEXT_INPUT = "text-input";
  var WARNING = "warning";
  var SEARCH = "search";

  function
  set_current_url (url, history)
  {
    history = history || config.HISTORY_PUSH;
    return { type: CURRENT_URL, url: url, history: history };
  }

  /** Set current URL to the node corresponding to POINTER which is an
      id refering to a linkid (such as "*TOP*" or "*END*"). */
  function
  set_current_url_pointer (pointer)
  {
    var history = config.HISTORY_PUSH;
    return { type: CURRENT_URL, pointer: pointer, history: history };
  }

  function
  navigate (direction)
  {
    var history = config.HISTORY_PUSH;
    return { type: NAVIGATE, direction: direction, history: history };
  }

  function
  cache_links (links)
  {
    return { type: CACHE_LINKS, links: links };
  }

  function
  cache_index_links (links)
  {
    return { type: CACHE_INDEX_LINKS, links: links };
  }

  /** Make the text input INPUT visible.  If INPUT is a falsy value then
      hide current text input.  */
  function
  show_text_input (input)
  {
    return { type: TEXT_INPUT, input: input };
  }

  /** Hide the current current text input.  */
  function
  hide_text_input ()
  {
    return { type: TEXT_INPUT, input: null };
  }

  function
  warn (msg)
  {
    return { type: WARNING, msg: msg };
  }

  /** Search EXP in the whole manual.  EXP can be either a regular
      expression or a string.  */
  function
  search (exp)
  {
    var rgxp = (typeof exp === "object") ? exp : new RegExp (exp);
    return { type: SEARCH, regexp: rgxp.toString () };
  }

  /* State manager using an unidirectional dataflow architecture.  */

  function
  Store (reducer, state)
  {
    this.state = state || {};
    this.reducer = reducer;
    this.listeners = [];
  }

  Store.prototype.dispatch = function dispatch (action) {
    /* Handle asynchonous actions which are functions.*/
    if (typeof action === "function")
      action (this.dispatch.bind (this));
    else
      {
        var new_state = this.reducer (this.state, action);
        if (new_state !== this.state)
          {
            this.state = new_state;
            this.listeners.forEach (function (lstnr) {
              return lstnr ();
            });
          }
      }
  };

  Store.prototype.subscribe = function subscribe (listener) {
    this.listeners.push (listener);

    /* Return a function to unsubscribe.*/
    return (function () {
      var idx = this.listeners.indexOf (listener);
      this.listeners.splice (idx, 1);
    }).bind (this);
  };

  /** Dispatch ACTION to the top-level browsing context.  This function must be
      used in conjunction with an event listener on "message" events in the
      top-level browsing context which must forwards ACTION to an actual
      store.  */
  function
  iframe_dispatch (action)
  {
    top.postMessage ({ message_kind: "action", action: action }, "*");
  }

  /* Component for menu navigation */

  function
  Search_input (id)
  {
    this.id = id;

    /* Create input div element.*/
    var div = document.createElement ("div");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode (id + ": "));
    this.element = div;

    /* Create input element.*/
    var input = document.createElement ("input");
    input.setAttribute ("type", "search");
    this.input = input;
    this.element.appendChild (input);

    /* Define a special key handler when 'this.input' is focused and
       visible.*/
    this.input.addEventListener ("keyup", (function (event) {
      if (event.key === "Escape")
        iframe_dispatch (hide_text_input ());
      else if (event.key === "Enter")
        iframe_dispatch (search (this.input.value));

      /* Do not send key events to global "key navigation" handler.*/
      event.stopPropagation ();
    }).bind (this));
  }

  Search_input.prototype.show = function show () {
    this.element.removeAttribute ("hidden");
    this.input.focus ();
  };

  Search_input.prototype.hide = function hide () {
    this.element.setAttribute ("hidden", "true");
    this.input.value = "";
  };

  function
  Text_input (id)
  {
    this.id = id;

    /* Create input div element.*/
    var div = document.createElement ("div");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode (id + ": "));
    this.element = div;

    /* Create input element.*/
    var input = document.createElement ("input");
    input.setAttribute ("type", "search");
    input.setAttribute ("list", id + "-data");
    this.input = input;
    this.element.appendChild (input);

    /* Define a special key handler when 'this.input' is focused and
       visible.*/
    var that = this;
    this.input.addEventListener ("keyup", function (event) {
      if (event.key === "Escape")
        iframe_dispatch (hide_text_input ());
      else if (event.key === "Enter")
        {
          var linkid = that.data[that.input.value];
          if (linkid)
            iframe_dispatch (set_current_url (linkid));
        }

      /* Do not send key events to global "key navigation" handler.*/
      event.stopPropagation ();
    });
  }

  /* Display a text input for searching through DATA.*/
  Text_input.prototype.show = function show (data) {
    var datalist = create_datalist (data);
    datalist.setAttribute ("id", this.id + "-data");
    this.data = data;
    this.datalist = datalist;
    this.element.appendChild (datalist);
    this.element.removeAttribute ("hidden");
    this.input.focus ();
  };

  Text_input.prototype.hide = function hide () {
    this.element.setAttribute ("hidden", "true");
    this.input.value = "";
    if (this.datalist)
    {
      this.datalist.parentNode.removeChild (this.datalist);
      this.datalist = null;
    }
  };

  function
  Minibuffer ()
  {
    /* Create global container.*/
    var elem = document.createElement ("div");
    elem.setAttribute ("style", "background:pink;z-index:100;position:fixed");

    var menu = new Text_input ("menu");
    menu.render = function (state) {
      if (state.text_input === "menu")
      {
        var current_menu = state.loaded_nodes[state.current].menu;
        if (current_menu)
          this.show (current_menu);
        else
          iframe_dispatch (warn ("No menu in this node"));
      }
    };

    var index = new Text_input ("index");
    index.render = function (state) {
      if (state.text_input === "index")
        this.show (state.index);
    };

    var search = new Search_input ("regexp-search");
    search.render = function (state) {
      if (state.text_input === "regexp-search")
        this.show ();
    };

    elem.appendChild (menu.element);
    elem.appendChild (index.element);
    elem.appendChild (search.element);

    /* Create a container for warning when no menu in current page.*/
    var warn$ = document.createElement ("div");
    warn$.setAttribute ("hidden", "true");
    warn$.appendChild (document.createTextNode ("No menu in this node"));
    elem.appendChild (warn$);

    this.element = elem;
    this.menu = menu;
    this.index = index;
    this.search = search;
    this.warn = warn$;
    this.toid = null;
  }

  Minibuffer.prototype.render = function render (state) {
    if (!state.warning)
      {
        this.warn.setAttribute ("hidden", "true");
        this.toid = null;
      }
    else if (!this.toid)
      {
        var toid = window.setTimeout (function () {
          iframe_dispatch ({ type: WARNING, msg: null });
        }, config.WARNING_TIMEOUT);
        this.warn.removeAttribute ("hidden");
        this.toid = toid;
      }

    if (!state.text_input || state.warning)
      {
        this.menu.hide ();
        this.index.hide ();
        this.search.hide ();
      }
    else
      {
        this.index.render (state);
        this.menu.render (state);
        this.search.render (state);
      }
  };

  /* Create a datalist element containing option elements corresponding
     to the keys in MENU.  */
  function
  create_datalist (menu)
  {
    var datalist = document.createElement ("datalist");
    Object.keys (menu)
          .forEach (function (title) {
            var opt = document.createElement ("option");
            opt.setAttribute ("value", title);
            datalist.appendChild (opt);
          });
    return datalist;
  }

  /* General purpose utilitary functions.  */

  /** Check if 'URL' is an absolute URL.  Return true if this is the case
      otherwise return false.  'URL' must be a USVString representing a valid
      URL.  */
  function
  absolute_url_p (url)
  {
    if (typeof url !== "string")
      throw new TypeError (("'" + url + "' is not a string"));

    return url.includes (":");
  }

  /** Return PATHNAME with any leading directory components removed.  If
      specified, also remove a trailing SUFFIX.  */
  function
  basename (pathname, suffix)
  {
    var res = pathname.replace (/.*[/]/, "");
    if (!suffix)
      return res;
    else if (suffix instanceof RegExp)
      return res.replace (suffix, "");
    else /* typeof SUFFIX === "string" */
      return res.replace (new RegExp ("[.]" + suffix), "");
  }

  /** Apply FUNC to each nodes in the NODE subtree.  The walk follows a depth
      first algorithm.  Only consider the nodes of type NODE_TYPE.  */
  function
  depth_first_walk (node, func, node_type)
  {
    if (!node_type || (node.nodeType === node_type))
      func (node);

    for (var child = node.firstChild; child; child = child.nextSibling)
      depth_first_walk (child, func, node_type);
  }

  /** Return the hash part of HREF without the '#' prefix.  HREF must be
      a string.  If there is no hash part in HREF then return the empty
      string.  */
  function
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
  function
  navigation_links (content)
  {
    var links = content.querySelectorAll ("footer a");
    var res = {};
    /* links have the form MAIN_FILE.html#FRAME-ID.  For convenience
       only store FRAME-ID.  */
    for (var i = 0; i < links.length; i += 1)
      {
        var link = links[i];
        var nav_id = navigation_links.dict[link.getAttribute ("accesskey")];
        if (nav_id)
          res[nav_id] = href_hash (link.getAttribute ("href"));
        else /* this link is part of local table of content. */
          {
            res.menu = res.menu || {};
            res.menu[link.text] = href_hash (link.getAttribute ("href"));
          }
      }

    return res;
  }

  /* Dictionary associating an 'accesskey' property to its navigation id.  */
  navigation_links.dict = { n: "next", p: "prev", u: "up" };

  /* Generate and manage the table of content.  */

  /** Return a relative URL corresponding to HREF, which refers to an anchor of
      'config.INDEX_NAME'.  URL must be a USVString representing an absolute or
      relative URL.

      For example "foo/bar.html" will return "config.INDEX_NAME#bar".  */
  function
  with_sidebar_query (href)
  {
    if (basename (href) === config.INDEX_NAME)
      return config.INDEX_NAME;
    else
      {
        var url = new window.URL (href, window.location);
        var new_hash = basename (url.pathname, /[.]x?html/);
        if (url.hash)
          new_hash += ("." + url.hash.slice (1));
        return config.INDEX_NAME + "#" + new_hash;
      }
  }

  /* Keep children but remove grandchildren (Exception: don't remove
     anything on the current page; however, that's not a problem in the
     Kawa manual).  */
  function
  hide_grand_child_nodes (ul)
  {
    for (var li = ul.firstElementChild; li; li = li.nextElementSibling)
      {
        var a = li.firstElementChild;
        var li$ = a && a.nextElementSibling;
        /* Never remove Overall-Index.  */
        if (li$ && a.getAttribute ("href") !== config.OVERALL_INDEX_NAME)
          li$.setAttribute ("toc-detail", "yes");
      }
  }

  /** Scan ToC entries to see which should be hidden.  */
  function
  scan_toc (node, filename)
  {
    var current = with_sidebar_query (filename);
    var ul = node.querySelector ("ul");
    if (filename === config.INDEX_NAME)
      hide_grand_child_nodes (ul);
    else
      scan_toc1 (ul, current);
  }

  /* Scan ToC entries to see which should be hidden.  Return "current" if node
     matches current, "ancestor" if node is ancestor of current, else
     'null'.  */
  function
  scan_toc1 (node, current)
  {
    if (node.matches ("a"))
      {
        if (current === node.getAttribute ("href"))
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
            if (sib !== ancestor.parentNode
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
  function
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
  function
  create_link_dict (nav)
  {
    var prev_id = config.INDEX_ID;
    var links = {};

    function
    add_link (elem)
    {
      if (elem.matches ("a") && elem.hasAttribute ("href"))
        {
          var id = href_hash (elem.getAttribute ("href"));
          links[prev_id] = Object.assign ({}, links[prev_id], { forward: id });
          links[id] = Object.assign ({}, links[id], { backward: prev_id });
          prev_id = id;
        }
    }

    depth_first_walk (nav, add_link, Node.ELEMENT_NODE);
    /* Add a reference to the first and last node of the manual.  */
    links["*TOP*"] = config.INDEX_ID;
    links["*END*"] = prev_id;
    return links;
  }

  /** Modify LINKS to handle the iframe based navigation properly.  Relative
      links will be opened inside the corresponding iframe and absolute links
      will be opened in a new tab.  LINKS must be an array or a collection of
      nodes.  */
  function
  fix_links (links)
  {
    for (var i = 0; i < links.length; i += 1)
      {
        var link = links[i];
        var href = link.getAttribute ("href");
        if (href)
          {
            if (absolute_url_p (href))
              link.setAttribute ("target", "_blank");
            else
              link.setAttribute ("href", with_sidebar_query (href));
          }
      }
  }

  /* Handle iframed pages.  */

  /* Return an array composed of the filename and the anchor of LINKID.
     LINKID can have the form "foobar.anchor" or just "foobar".  */
  function
  linkid_split (linkid)
  {
    if (!linkid.includes ("."))
      return [linkid, ""];
    else
      {
        var ref = linkid.match (/^(.+)\.(.*)$/).slice (1);
        var id = ref[0];
        var anchor = ref[1];
        return [id, "#" + anchor];
      }
  }

  /* Convert LINKID which has the form "foobar.anchor" or just "foobar",
     to an URL of the form "foobar.xhtml#anchor". */
  function
  linkid_to_url (linkid)
  {
    if (linkid === config.INDEX_ID)
      return config.INDEX_NAME;
    else
      {
        var ref = linkid_split (linkid);
        var pageid = ref[0];
        var hash = ref[1];
        return pageid + ".xhtml" + hash;
      }
  }

  function
  Pages (index_div)
  {
    index_div.setAttribute ("id", config.INDEX_ID);
    index_div.setAttribute ("node", config.INDEX_ID);
    index_div.setAttribute ("hidden", "true");
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sub-pages");
    this.element.appendChild (index_div);
    /* Currently created divs.*/
    this.ids = [];
  }

  Pages.prototype.add_div = function add_div (pageid) {
    var div = document.createElement ("div");
    div.setAttribute ("id", pageid);
    div.setAttribute ("node", pageid);
    div.setAttribute ("hidden", "true");
    this.ids.push (pageid);
    this.element.appendChild (div);

    /* Load pages containing index links.*/
    if (pageid.match (/^.*-index$/i))
      load_page (pageid);
  };

  Pages.prototype.render = function render (state) {
      var that = this;

    /* Create div elements for pages corresponding to newly added
       linkids from 'state.loaded_nodes'.*/
    Object.keys (state.loaded_nodes)
          .map (function (id) { return id.replace (/\..*$/, ""); })
          .filter (function (id) { return !that.ids.includes (id); })
          .reduce (function (acc, id) {
            return ((acc.includes (id)) ? acc : acc.concat ([id]));
          }, [])
          .forEach (function (id) { return that.add_div (id); });

    if (state.current !== this.prev_id)
      {
        if (this.prev_id)
          this.prev_div.setAttribute ("hidden", "true");
        var div = resolve_page (state.current);
        update_history (state.current, state.history);
        div.removeAttribute ("hidden");
        this.prev_id = state.current;
        this.prev_div = div;

        /* XXX: Ensure that focus is not on a hidden iframe which has
           the consequence of making the keyboard event not bubbling.*/
        if (state.current === config.INDEX_ID)
          document.documentElement.focus ();
        else
          div.querySelector ("iframe").focus ();
      }
  };

  /* Load PAGEID.  */
  function
  load_page (pageid)
  {
    var div = resolve_page (pageid);
    /* Making the iframe visible triggers the load of the iframe DOM.  */
    div.removeAttribute ("hidden");
    div.setAttribute ("hidden", "true");
  }

  /* Return the 'div' element that correspond to PAGEID.  */
  function
  resolve_page (linkid)
  {
    var msg;
    var ref = linkid_split (linkid);
    var pageid = ref[0];
    var hash = ref[1];
    var div = document.getElementById (pageid);
    if (!div)
      {
        msg = "no iframe container correspond to identifier: " + pageid;
        throw new ReferenceError (msg);
      }

    /* Load iframe if necessary.  Index page is not inside an iframe.  */
    if (pageid !== config.INDEX_ID)
      {
        var iframe = div.querySelector ("iframe");
        if (!iframe)
          {
            iframe = document.createElement ("iframe");
            iframe.setAttribute ("class", "node");
            iframe.setAttribute ("src", linkid_to_url (pageid));
            div.appendChild (iframe);
          }
        msg = { message_kind: "scroll-to", hash: hash };
        iframe.contentWindow.postMessage (msg, "*");
      }

    return div;
}

  /* Mutate the history of page navigation.  Store LINKID in history
     state, The actual way to store LINKID depends on HISTORY_MODE. */
  function
  update_history (linkid, history_mode)
  {
    var visible_url = window.location.pathname + window.location.search;
    if (linkid !== config.INDEX_ID)
      visible_url += ("#" + linkid);

    var method = window.history[history_mode];
    if (method)
      method.call (window.history, linkid, null, visible_url);
  }

  /* Retun a dictionary whose keys are index keywords and values are
     linkids.  */
  function
  scan_index (content)
  {
    return Array.from (content.links)
                .filter (function (link) { return link.hasAttribute ("xref"); })
                .reduce (function (acc, link) {
                  var linkid = href_hash (link.getAttribute ("href"));
                  var key = link.innerText;
                  acc[key] = linkid;
                  return acc;
                }, {});
  }

  /*-----------------------------------------
  | Event handlers for the iframe context.  |
  `----------------------------------------*/

  /** Initialize the DOM for generic pages loaded in the context of an
      iframe.  */
  function
  on_iframe_load ()
  {
    fix_links (document.links);
    var links = {};
    var linkid = basename (window.location.pathname, /[.]x?html$/);
    links[linkid] = navigation_links (document);
    iframe_dispatch (cache_links (links));

    if (linkid.match (/^.*-index$/i))
      {
        var index_links = scan_index (document);
        iframe_dispatch (cache_index_links (index_links));
      }
  }

  /** Handle messages received via the Message API.  */
  function
  on_iframe_message (event)
  {
    var data = event.data;
    if (data.message_kind === "scroll-to")
      {
        /* Scroll to the anchor corresponding to HASH without saving
           current page in session history.  */
        var url = window.location.pathname + window.location.search;
        window.location.replace ((data.hash) ? (url + data.hash) : url);
      }
  }

  /* Handle the table of content iframed page.  */

  /** Sidebar component encapsulating the iframe and its state.  */
  function
  Sidebar ()
  {
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sidebar");

    /* Create iframe. */
    var iframe = document.createElement ("iframe");
    iframe.setAttribute ("name", "slider");
    iframe.setAttribute ("src", (config.TOC_FILENAME
                                 + "#main=" + config.INDEX_NAME));
    this.element.appendChild (iframe);
    this.iframe = iframe;
  }

  /* Render 'sidebar' according to STATE which is a new state. */
  Sidebar.prototype.render = function render (state) {
    /* Update sidebar to highlight the title corresponding to
       'state.current'.*/
    var msg = { message_kind: "update-sidebar", selected: state.current };
    this.iframe.contentWindow.postMessage (msg, "*");
    this.prev = state.current;
  };

  /*----------------------------------------------
  | Auxilary functions for the sidebar context.  |
  `---------------------------------------------*/

  /* Add a link from TOC_FILENAME to the main index file.  */
  function
  add_header ()
  {
    var li = document.querySelector ("li");
    if (li && li.firstElementChild && li.firstElementChild.matches ("a")
        && li.firstElementChild.getAttribute ("href") === config.INDEX_NAME)
      li.parentNode.removeChild (li);

    var header = document.querySelector ("header");
    var h1 = document.querySelector ("h1");
    if (header && h1)
      {
        var a = document.createElement ("a");
        a.setAttribute ("href", "index.html");
        header.appendChild (a);
        var div = document.createElement ("div");
        a.appendChild (div);
        var span = document.createElement ("span");
        span.appendChild (h1.firstChild);
        div.appendChild (span);
        h1.parentNode.removeChild (h1);
      }
  }

  /*------------------------------------------
  | Event handlers for the sidebar context.  |
  `-----------------------------------------*/

  /** Initialize TOC_FILENAME which must be loaded in the context of an
      iframe.  */
  function
  on_sidebar_load ()
  {
    add_header ();
    document.body.setAttribute ("class", "toc-sidebar");

    /* Specify the base URL to use for all relative URLs.  */
    /* FIXME: Add base also for sub-pages.  */
    var base = document.createElement ("base");
    base.setAttribute ("href",
                       window.location.href.replace (/[/][^/]*$/, "/"));
    document.head.appendChild (base);

    var links = Array.from (document.links);

    /* Create a link referencing the Table of content.  */
    var toc_a = document.createElementNS (config.XHTML_NAMESPACE, "a");
    toc_a.setAttribute ("href", config.TOC_FILENAME);
    toc_a.appendChild (document.createTextNode ("Table of Contents"));
    var toc_li = document.createElementNS (config.XHTML_NAMESPACE, "li");
    toc_li.appendChild (toc_a);
    var index_li = links[links.length - 1].parentNode;
    var index_grand = index_li.parentNode.parentNode;
    /* XXX: hack */
    if (index_grand.matches ("li"))
      index_li = index_grand;
    index_li.parentNode.insertBefore (toc_li, index_li.nextSibling);

    links.push (toc_a);
    fix_links (links);
    scan_toc (document.body, config.INDEX_NAME);

    var divs = Array.from (document.querySelectorAll ("div"));
    divs.reverse ()
        .forEach (function (div) {
          if (div.getAttribute ("class") === "toc-title")
            div.parentNode.removeChild (div);
        });

    /* Get 'backward' and 'forward' link attributes.  */
    var dict = create_link_dict (document.querySelector ("ul"));
    iframe_dispatch (cache_links (dict));
  }

  /** Handle messages received via the Message API.  */
  function
  on_sidebar_message (event)
  {
    var data = event.data;
    if (data.message_kind === "update-sidebar")
      {
        /* Highlight the current LINKID in the table of content.  */
        var selected = data.selected;
        clear_toc_styles (document.body);
        var filename = (selected === config.INDEX_ID) ?
            config.INDEX_NAME : (selected + ".xhtml");
        scan_toc (document.body, filename);
      }
  }

  /* Actions handlers that return a new state.  */

  function
  global_reducer (state, action)
  {
    var res = Object.assign ({}, state, { action: action });
    var linkid;

    switch (action.type)
      {
      case CACHE_LINKS:
        {
          var nodes = Object.assign ({}, state.loaded_nodes);
          Object
            .keys (action.links)
            .forEach (function (key) {
              if (typeof action.links[key] === "object")
                nodes[key] = Object.assign ({}, nodes[key], action.links[key]);
              else
                nodes[key] = action.links[key];
            });

          return Object.assign (res, { loaded_nodes: nodes });
        }
      case CACHE_INDEX_LINKS:
        {
          Object.assign (res.index, action.links);
          return res;
        }
      case CURRENT_URL:
        {
          linkid = (action.pointer) ?
              state.loaded_nodes[action.pointer] : action.url;

          res.current = linkid;
          res.history = action.history;
          res.text_input = null;
          res.warning = null;
          res.loaded_nodes = Object.assign ({}, res.loaded_nodes);
          res.loaded_nodes[linkid] = res.loaded_nodes[linkid] || {};
          return res;
        }
      case NAVIGATE:
        {
          var ids = state.loaded_nodes[state.current];
          linkid = ids[action.direction];
          if (!linkid)
            return state;
          else
            {
              res.current = linkid;
              res.history = action.history;
              res.text_input = null;
              res.warning = null;
              res.loaded_nodes = Object.assign ({}, res.loaded_nodes);
              res.loaded_nodes[action.url] = res.loaded_nodes[action.url] || {};
              return res;
            }
        }
      case SEARCH:
        {
          res.regexp = action.regexp;
          res.text_input = null;
          res.warning = null;
          return res;
        }
      case TEXT_INPUT:
        {
          var needs_update = (state.text_input && !action.input)
              || (!state.text_input && action.input)
              || (state.text_input && action.input
                  && state.text_input !== action.input);

          if (!needs_update)
            return state;
          else
            {
              res.text_input = action.input;
              res.warning = null;
              return res;
            }
        }
      case WARNING:
        {
          res.warning = action.msg;
          if (action.msg !== null)
            res.text_input = null;
          return res;
        }
      default:
        return state;
      }
  }

  /* Handle the index page.  */

  /* Global state manager.  */
  var store;

  /* Aggregation of all the components.   */
  var components = {
    element: null,
    components: [],

    add: function add (component) {
      if (this.element === null)
        throw new Error ("element property must be set first");

      this.components.push (component);
      this.element.appendChild (component.element);
    },

    render: function render (state) {
      this.components
          .forEach (function (cmpt) { return cmpt.render (state); });
    }
  };

  /*--------------------------------------------
  | Event handlers for the top-level context.  |
  `-------------------------------------------*/

  /* Initialize the top level 'config.INDEX_NAME' DOM.  */
  function
  on_index_load ()
  {
    fix_links (document.links);
    document.body.setAttribute ("class", "mainbar");

    /* Move contents of <body> into a a fresh <div> to let the components
       treat the index page like other iframe page.  */
    var index_div = document.createElement ("div");
    for (var ch = document.body.firstChild; ch; ch = document.body.firstChild)
      index_div.appendChild (ch);

    /* Instantiate the components.  */

    components.element = document.body;
    components.add (new Sidebar ());
    components.add (new Pages (index_div));
    components.add (new Minibuffer ());

    var initial_state = {
      /* Dictionary associating page ids to next, prev, up, forward,
         backward link ids.  */
      loaded_nodes: {},
      /* Dictionary associating keyword to linkids.  */
      index: {},
      /* page id of the current page.  */
      current: config.INDEX_ID,
      /* Current mode for handling history.  */
      history: config.HISTORY_REPLACE,
      /* Define the name of current text input.  */
      text_input: null
    };

    store = new Store (global_reducer, initial_state);
    store.subscribe (function () {
      /* eslint-disable no-console */
      return console.log ("state: ", store.state);
      /* eslint-enable no-console */
    });
    store.subscribe (function () {
      return components.render (store.state);
    });

    if (window.location.hash)
      {
        var linkid = window.location.hash.slice (1);
        var action = set_current_url (linkid, config.HISTORY_REPLACE);
        store.dispatch (action);
      }

    /* Retrieve NEXT link and local menu.  */
    var links = {};
    links[config.INDEX_ID] = navigation_links (document);
    store.dispatch (cache_links (links));
  }

  /** Handle messages received via the Message API.  */
  function
  on_index_message (event)
  {
    var data = event.data;
    if (data.message_kind === "action")
      {
        /* Follow up actions to the store.  */
        store.dispatch (data.action);
      }
  }

  /** Event handler for 'popstate' events.  */
  function
  on_popstate (event)
  {
    var linkid = event.state;
    store.dispatch (set_current_url (linkid, false));
  }

  /** Depending on the role of the document launching this script, different
      event handlers are registered.  This script can be used in the context of:

      - the index page of the manual which manages the state of the application
      - the iframe which contains the lateral table of content
      - other iframes which contain other pages of the manual

      This is done to allow referencing the same script inside every HTML page.
      This has the benefits of reducing the number of HTTP requests required to
      fetch the Javascript code and simplifying the work of the Texinfo HTML
      converter.  */

  /*-------------------------
  | Common event handlers.  |
  `------------------------*/

  function
  on_click (event)
  {
    for (var target = event.target; target !== null; target = target.parentNode)
      {
        if ((target instanceof Element) && target.matches ("a"))
          {
            var href = target.getAttribute ("href");
            if (!absolute_url_p (href))
              {
                var linkid = href_hash (href) || config.INDEX_ID;
                iframe_dispatch (set_current_url (linkid));
                event.preventDefault ();
                event.stopPropagation ();
                return;
            }
          }
      }
  }

  function
  on_unload ()
  {
    /* Cross origin requests are not supported in file protocol.  */
    if (window.location.protocol !== "file:")
    {
      var request = new XMLHttpRequest ();
      request.open ("GET", "(WINDOW-CLOSED)");
      request.send (null);
    }
  }

  /* Handle Keyboard 'keyup' events.  */
  function
  on_keyup (event)
  {
    var value = on_keyup.dict[event.key];
    if (value)
      {
        var func = value[0];
        var arg = value[1];
        var action = func (arg);
        if (action)
          iframe_dispatch (action);
      }
  }

  /* Dictionary associating an Event 'key' property to its navigation id.  */
  on_keyup.dict = {
    i: [show_text_input, "index"],
    l: [window.history.back.bind (window.history)],
    m: [show_text_input, "menu"],
    n: [navigate, "next"],
    p: [navigate, "prev"],
    r: [window.history.forward.bind (window.history)],
    s: [show_text_input, "regexp-search"],
    t: [set_current_url_pointer, "*TOP*"],
    u: [navigate, "up"],
    "]": [navigate, "forward"],
    "[": [navigate, "backward"],
    "<": [set_current_url_pointer, "*TOP*"],
    ">": [set_current_url_pointer, "*END*"]
  };

  /*--------------------
  | Context dispatch.  |
  `-------------------*/

  var inside_iframe = top !== window;
  var inside_sidebar = inside_iframe && window.name === "slider";
  var inside_index_page = (window.location.pathname.endsWith (config.INDEX_NAME)
                           || window.location.pathname.endsWith ("/"));

  if (inside_index_page)
    {
      window.addEventListener ("DOMContentLoaded", on_index_load, false);
      window.addEventListener ("message", on_index_message, false);
      window.onpopstate = on_popstate;
    }
  else if (inside_sidebar)
    {
      window.addEventListener ("DOMContentLoaded", on_sidebar_load, false);
      window.addEventListener ("message", on_sidebar_message, false);
    }
  else if (inside_iframe)
    {
      window.addEventListener ("DOMContentLoaded", on_iframe_load, false);
      window.addEventListener ("message", on_iframe_message, false);
    }
  else
    {
      /* Jump to 'config.INDEX_NAME' and adapt the selected iframe.  */
      window.location.replace (with_sidebar_query (window.location.href));
    }

  /* Register common event handlers.  */
  window.addEventListener ("beforeunload", on_unload, false);
  window.addEventListener ("click", on_click, false);
  /* XXX: handle 'keyup' event instead of 'keypress' since Chromium
     doesn't handle the 'Escape' key properly.  See
     https://bugs.chromium.org/p/chromium/issues/detail?id=9061.  */
  window.addEventListener ("keyup", on_keyup, false);
} ());
