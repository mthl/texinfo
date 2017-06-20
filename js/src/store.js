/* store.js - State manager using an unidirectional dataflow architecture
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

export class
Store
{
  constructor (reducer, state = {})
  {
    this.state = state;
    this.reducer = reducer;
    this.listeners = [];
  }

  dispatch (action)
  {
    /* Handle asynchonous actions which are functions.  */
    if (typeof action === "function")
      action (this.dispatch.bind (this));
    else
      {
        let new_state = this.reducer (this.state, action);
        if (new_state !== this.state)
          {
            this.state = new_state;
            this.listeners.forEach (listener => listener ());
          }
      }
  }

  subscribe (listener)
  {
    this.listeners.push (listener);

    /* Return a function to unsubscribe.  */
    return (() => {
      let idx = this.listeners.indexOf (listener);
      this.listeners.splice (idx, 1);
    });
  }
}

/** Dispatch ACTION to the top-level browsing context.  This function must be
    used in conjunction with an event listener on "message" events in the
    top-level browsing context which must forwards ACTION to an actual
    store.  */
export function
iframe_dispatch (action)
{
  top.postMessage ({ message_kind: "action", action }, "*");
}

export default { Store, iframe_dispatch };
