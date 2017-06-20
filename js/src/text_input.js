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
import { iframe_dispatch } from "./store";

export class
Text_input
{
  constructor (id)
  {
    let div = document.createElement ("div");
    div.setAttribute ("id", "menu-input");
    div.setAttribute ("style", "background:pink;z-index:100;position:fixed");
    div.setAttribute ("hidden", "true");
    div.appendChild (document.createTextNode ("menu:"));

    let input = document.createElement ("input");
    input.setAttribute ("type", "search");
    input.setAttribute ("list", "menu");
    div.appendChild (input);

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

    this.element = div;
    this.input = input;
    this.id = id;
  }

  render (state)
  {
    if (state.text_input_visible)
      {
        /* Create a datalist for the menu completions.  */
        let datalist = document.createElement ("datalist");
        datalist.setAttribute ("id", "menu");

        let current_menu = state.loaded_nodes[state.current].menu;
        if (current_menu)
          {
            this.current_menu = current_menu;
            Object.keys (current_menu)
                  .forEach (title => {
                    let opt = document.createElement ("option");
                    opt.setAttribute ("value", title);
                    datalist.appendChild (opt);
                  });
          }

        this.element.appendChild (datalist);
        this.element.removeAttribute ("hidden");
        this.input.focus ();
      }
    else
      {
        this.element.setAttribute ("hidden", "true");
        this.input.value = "";
        /* Remove the datalist if found.  */
        let datalist = this.element.querySelector ("datalist");
        if (datalist)
          datalist.parentNode.removeChild (datalist);
      }
  }
}
