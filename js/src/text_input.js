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
  constructor (id, func)
  {
    this.id = id;
    this.create_input_div (id + ": ");
    this.create_input (id + "-data");
    this.input_keypress (func);
  }

  create_input_div (text)
  {
    let div = document.createElement ("div");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode (text));
    this.element = div;
  }

  create_input (list_id)
  {
    let input = document.createElement ("input");
    input.setAttribute ("type", "search");
    input.setAttribute ("list", list_id);
    this.input = input;
    this.element.appendChild (input);
  }

  /* Define a special key handler when INPUT is focused and visible.  */
  input_keypress (func)
  {
    this.input.addEventListener ("keypress", event => {
      if (event.key === "Escape")
        iframe_dispatch (actions.hide_component (this.id));
      else if (event.key === "Enter")
        func (this.data, this.input);

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
    this.element.appendChild (datalist);
    this.element.removeAttribute ("hidden");
    this.input.focus ();
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

    let menu = new Text_input ("menu", (data, input) => {
      let linkid = data[input.value];
      if (linkid)
        iframe_dispatch (actions.set_current_url (linkid));
    });

    let index = new Text_input ("index", (data, input) => {
      let linkid = data[input.value];
      if (linkid)
        iframe_dispatch (actions.set_current_url (linkid));
    });

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
    if (!state.text_input)
      this.hide_elements ();
    else
      {
        switch (state.text_input)
          {
          case "menu":
            {
              let menu = state.loaded_nodes[state.current].menu;
              if (menu)
                this.menu.show (menu);
              else
                this.show_menu_warning ();
              break;
            }
          case "index":
            this.index.show (state.index);
            break;
          default:
            break;
          }
      }
  }

  /* Display a warning indicating that there is no menu in current node.  */
  show_menu_warning ()
  {
    /* Check if a menu warning is already displayed.  */
    if (this.toid)
      window.clearTimeout (this.toid);
    else
      this.warn.removeAttribute ("hidden");

    this.toid = window.setTimeout (() => {
      iframe_dispatch (actions.hide_component ("menu"));
      this.toid = null;
    }, config.WARNING_TIMEOUT);
  }

  /* Hide both menu input and menu warning.  */
  hide_elements ()
  {
    this.menu.element.setAttribute ("hidden", "true");
    this.index.element.setAttribute ("hidden", "true");
    this.warn.setAttribute ("hidden", "true");
    this.menu.input.value = "";
    this.index.input.value = "";

    /* Check if a menu warning is already displayed.  */
    if (this.toid)
      {
        window.clearTimeout (this.toid);
        this.toid = null;
      }

    /* Remove the datalist if found.  */
    this.element.querySelectorAll ("datalist")
                .forEach (el => el.parentNode.removeChild (el));
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
