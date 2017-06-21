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

export class
Text_input
{
  constructor (id)
  {
    /* Create global container.  */
    let elem = document.createElement ("div");
    elem.setAttribute ("style", "background:pink;z-index:100;position:fixed");

    /* Create container for menu search.  */
    let div = document.createElement ("div");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode ("menu:"));
    let input = document.createElement ("input");
    input.setAttribute ("type", "search");
    input.setAttribute ("list", "menu");
    div.appendChild (input);
    elem.appendChild (div);

    /* Define a special key handler when INPUT is focused and visible.  */
    input.addEventListener ("keypress", event => {
      if (event.key === "Escape")
        iframe_dispatch (actions.hide_component (id));
      else if (event.key === "Enter")
        {
          let linkid = this.current_menu[this.input.value];
          if (linkid)
            iframe_dispatch (actions.set_current_url (linkid));
        }

      /* Do not send key events to global "key navigation" handler.  */
      event.stopPropagation ();
    });

    /* Create a container for warning when no menu in current page.  */
    let warn = document.createElement ("div");
    warn.setAttribute ("hidden", "true");
    warn.appendChild (document.createTextNode ("No menu in this node"));
    elem.appendChild (warn);

    this.element = elem;
    this.input_container = div;
    this.input = input;
    this.warn = warn;
    this.id = id;
    this.toid = null;
    this.current_menu = null;
  }

  render (state)
  {
    if (!state.text_input_visible)
      this.hide_elements ();
    else
      {
        let menu = state.loaded_nodes[state.current].menu;
        if (menu)
          this.show_menu_input (menu);
        else
          this.show_menu_warning ();
      }
  }

  /* Display a text input for searching through the current menu.  */
  show_menu_input (menu)
  {
    let datalist = create_datalist (menu);
    datalist.setAttribute ("id", "menu");
    this.current_menu = menu;
    this.input_container.appendChild (datalist);
    this.input_container.removeAttribute ("hidden");
    this.input.focus ();
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
    this.input_container.setAttribute ("hidden", "true");
    this.warn.setAttribute ("hidden", "true");
    this.input.value = "";

    /* Check if a menu warning is already displayed.  */
    if (this.toid)
      {
        window.clearTimeout (this.toid);
        this.toid = null;
      }

    /* Remove the datalist if found.  */
    this.input_container.querySelectorAll ("datalist")
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
