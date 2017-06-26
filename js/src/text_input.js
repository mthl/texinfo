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
  constructor ()
  {
    /* Create global container.  */
    let elem = document.createElement ("div");
    elem.setAttribute ("style", "background:pink;z-index:100;position:fixed");

    /* Create container for menu input.  */
    let menu_div = document.createElement ("div");
    menu_div.setAttribute ("id", "menu-div");
    menu_div.setAttribute ("hidden", "true");
    menu_div.appendChild (document.createTextNode ("menu: "));
    elem.appendChild (menu_div);

    let menu_input = document.createElement ("input");
    menu_input.setAttribute ("type", "search");
    menu_input.setAttribute ("list", "menu_data");
    menu_div.appendChild (menu_input);

    /* Define a special key handler when INPUT is focused and visible.  */
    menu_input.addEventListener ("keypress", event => {
      if (event.key === "Escape")
        iframe_dispatch (actions.hide_component ("menu"));
      else if (event.key === "Enter")
        {
          let linkid = this.current_menu[this.menu_input.value];
          if (linkid)
            iframe_dispatch (actions.set_current_url (linkid));
        }

      /* Do not send key events to global "key navigation" handler.  */
      event.stopPropagation ();
    });

    /* Create container for index input.  */
    let index_div = document.createElement ("div");
    index_div.setAttribute ("id", "index-div");
    index_div.setAttribute ("hidden", "true");
    index_div.appendChild (document.createTextNode ("index: "));
    elem.appendChild (index_div);

    let index_input = document.createElement ("input");
    index_input.setAttribute ("type", "search");
    index_input.setAttribute ("list", "index_data");
    index_div.appendChild (index_input);

    index_input.addEventListener ("keypress", event => {
      if (event.key === "Escape")
        iframe_dispatch (actions.hide_component ("index"));
      else if (event.key === "Enter")
      {
        let linkid = this.current_index[this.index_input.value];
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
    this.menu_container = menu_div;
    this.menu_input = menu_input;
    this.index_container = index_div;
    this.index_input = index_input;
    this.warn = warn;
    this.toid = null;
    this.current_menu = null;
    this.current_index = null;
  }

  render (state)
  {
    if (!state.text_input_visible)
      this.hide_elements ();
    else
      {
        switch (state.text_input_type)
          {
          case "menu":
            {
              let menu = state.loaded_nodes[state.current].menu;
              if (menu)
                this.show_menu_input (menu);
              else
                this.show_menu_warning ();
              break;
            }
          case "index":
            {
              this.show_index_input (state.index);
              break;
            }
          default:
            break;
          }
      }
  }

  /* Display a text input for searching through the current menu.  */
  show_menu_input (menu)
  {
    let datalist = create_datalist (menu);
    datalist.setAttribute ("id", "menu_data");
    this.current_menu = menu;
    this.menu_container.appendChild (datalist);
    this.menu_container.removeAttribute ("hidden");
    this.menu_input.focus ();
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

  /* Display a text input for searching through the current index.  */
  show_index_input (index)
  {
    let datalist = create_datalist (index);
    datalist.setAttribute ("id", "index_data");
    this.current_index = index;
    this.index_container.appendChild (datalist);
    this.index_container.removeAttribute ("hidden");
    this.index_input.focus ();
  }

  /* Hide both menu input and menu warning.  */
  hide_elements ()
  {
    this.menu_container.setAttribute ("hidden", "true");
    this.index_container.setAttribute ("hidden", "true");
    this.warn.setAttribute ("hidden", "true");
    this.menu_input.value = "";
    this.index_input.value = "";

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
