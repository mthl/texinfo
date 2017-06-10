/* component.js - Composable stateful views that render state objects */

import { Sidebar } from "./sidebar";

import config from "./config";

export class
Selected_div
{
  constructor (id)
  {
    this.id = id;
    this.element = null;
  }

  render (id)
  {
    if (id === this.id)
      return;

    if (this.element)
      this.element.setAttribute ("hidden", "true");
    let div = document.getElementById (id);
    div.removeAttribute ("hidden");

    this.id = id;
    this.element = div;
  }
};

export class
Pages
{
  constructor (index_div)
  {
    index_div.setAttribute ("id", config.INDEX_ID);
    index_div.setAttribute ("node", config.INDEX_ID);
    this.element = document.createElement ("div");
    this.element.setAttribute ("id", "sub-pages");
    this.element.appendChild (index_div);
  }

  render (state)
  {
    if (state == this.state)
      return;

    this.state = state;
  }
}

export class
Main_component
{
  constructor (root, index_div)
  {
    let sidebar = new Sidebar ();
    root.appendChild (sidebar.element);
    let pages = new Pages (index_div);
    root.appendChild (pages.element);

    /* Root DOM element.  */
    this.root = root;
    /* Instance of a Sidebar object.  */
    this.sidebar = sidebar;
    /* Currently visible page.  */
    this.selected_div = new Selected_div ();
  }

  render (state)
  {
    this.sidebar.render ({ current: config.INDEX_ID, visible: true });
    this.selected_div.render (state.current);
  }
}
