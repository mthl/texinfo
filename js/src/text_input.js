/* text-input.js - Component for menu navigation
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

import * as actions from "./actions";
import config from "./config";
import { iframe_dispatch } from "./store";

class
Text_input
{
  constructor (id)
  {
    this.id = id;

    /* Create input div element.  */
    let div = document.createElement ("div");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode (id + ": "));
    this.element = div;

    /* Create input element.  */
    let input = document.createElement ("input");
    input.setAttribute ("type", "search");
    input.setAttribute ("list", id + "-data");
    this.input = input;
    this.element.appendChild (input);

    /* Define a special key handler when 'this.input' is focused and
       visible.  */
    this.input.addEventListener ("keypress", event => {
      if (event.key === "Escape")
        iframe_dispatch (actions.hide_text_input ());
      else if (event.key === "Enter")
        {
          let linkid = this.data[this.input.value];
          if (linkid)
            iframe_dispatch (actions.set_current_url (linkid));
        }

      /* Do not send key events to global "key navigation" handler.  */
      event.stopPropagation ();
    });
  }

  /* Display a text input for searching through DATA.  */
  show (data)
  {
    let datalist = create_datalist (data);
    datalist.setAttribute ("id", this.id + "-data");
    this.data = data;
    this.datalist = datalist;
    this.element.appendChild (datalist);
    this.element.removeAttribute ("hidden");
    this.input.focus ();
  }

  hide ()
  {
    this.element.setAttribute ("hidden", "true");
    this.input.value = "";
    if (this.datalist)
      {
        this.datalist.parentNode.removeChild (this.datalist);
        this.datalist = null;
      }
  }
}

export class
Minibuffer
{
  constructor ()
  {
    /* Create global container.  */
    let elem = document.createElement ("div");
    elem.setAttribute ("style", "background:pink;z-index:100;position:fixed");

    let menu = new Text_input ("menu");
    menu.render = function (state) {
      if (state.text_input === "menu")
        {
          let current_menu = state.loaded_nodes[state.current].menu;
          if (current_menu)
            this.show (current_menu);
          else
            iframe_dispatch (actions.warn ("No menu in this node"));
        }
    };

    let index = new Text_input ("index");
    index.render = function (state) {
      if (state.text_input === "index")
        this.show (state.index);
    };

    elem.appendChild (menu.element);
    elem.appendChild (index.element);

    /* Create a container for warning when no menu in current page.  */
    let warn = document.createElement ("div");
    warn.setAttribute ("hidden", "true");
    warn.appendChild (document.createTextNode ("No menu in this node"));
    elem.appendChild (warn);

    this.element = elem;
    this.menu = menu;
    this.index = index;
    this.warn = warn;
    this.toid = null;
  }

  render (state)
  {
    if (!state.warning)
      {
        this.warn.setAttribute ("hidden", "true");
        this.toid = null;
      }
    else if (!this.toid)
      {
        let toid = window.setTimeout (() => {
          iframe_dispatch ({ type: actions.WARNING, msg: null });
        }, config.WARNING_TIMEOUT);
        this.warn.removeAttribute ("hidden");
        this.toid = toid;
      }

    if (!state.text_input || state.warning)
      {
        this.menu.hide ();
        this.index.hide ();
      }
    else
      {
        this.index.render (state);
        this.menu.render (state);
      }
  }
}

/* Create a datalist element containing option elements corresponding
   to the keys in MENU.  */
function
create_datalist (menu)
{
  let datalist = document.createElement ("datalist");
  Object.keys (menu)
        .forEach (title => {
          let opt = document.createElement ("option");
          opt.setAttribute ("value", title);
          datalist.appendChild (opt);
        });
  return datalist;
}
