/* qtinfo.js - Qt/Javascript UI for Texinfo manuals
   Copyright (C) 2019 Free Software Foundation, Inc.

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

/*----------------------------------.
| For communication with Qt process |
`----------------------------------*/

/* object shared with controlling Qt/C++ process */
var core;

/* For use with QWebChannel.  To be called after qwebchannel.js has been 
   loaded. */
function wc_init()
{
  if (!inside_top_page)
    return;

  if (location.search != "")
    var baseUrl
      = (/[?&]webChannelBaseUrl=([A-Za-z0-9\-:/\.]+)/.exec(location.search)[1]);
  else
    var baseUrl = "ws://localhost:12345";

  var socket = new WebSocket(baseUrl);

  socket.onclose = function()
    {
      console.error("web channel closed");
    };

  socket.onerror = function(error)
    {
      console.error("web channel error: " + error);
    };

  socket.onopen = function()
    {
      new QWebChannel(socket, function(channel)
        {
          window.core = channel.objects.core;

          /* Receive signals from Qt/C++ side.

             We don't have code to receive "actions" from the C++ side:
             the action message-passing architecture is only used to 
             circumvent same-origin policy restrictions on some browsers for 
             file: URI's, and for web_channel_override to hook into. */

          channel.objects.core.setUrl.connect(function(url) {
            alert("asked to go to " + url);
          });

          channel.objects.core.set_current_url.connect(function(url) {
            store.dispatch (actions.set_current_url (url));
          });

          channel.objects.core.search.connect(function(string) {
            store.dispatch (actions.search (string));
          });

          channel.objects.core.echo.connect(function(msg) {
            store.dispatch ({
              type: "echo",
              msg: msg
            });
          });
        });
    };

  var store_dispatch = Store.prototype.dispatch;
  Store.prototype.dispatch = function (action)
    {
      if (!web_channel_override (this, action))
        store_dispatch.call (this, action);
    };
  /* Overriding just the dispatch function works better than
     assigining 'store' to a different object, as store.state
     is used as well. */
}


/* Return true if the standard function doesn't need to be called. */
function web_channel_override (store, action)
{
  var state = store.state;
  switch (action.type)
    {
    case "external-manual":
      {
        window.core.external_manual (action.url);
        return 1;
      }
    case "input":
      {
        if (action.input == "index")
          window.core.show_text_input (action.input, state.index);
        else if (0 && action.input == "menu")
          {
            /* Menu code is disabled currently - it is not especially
               useful.  */
            var current_menu = state.loaded_nodes[state.current].menu;
            if (current_menu)
              window.core.show_text_input (action.input, current_menu);
            else
              store.dispatch (actions.warn ("No menu in this node"));
          }
        else if (action.input == "regexp-search")
          window.core.show_search ();
        return 1;
      }
    default:
      {
        return 0;
      }
    }
}

wc_init();
