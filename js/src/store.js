/* store.js - module for managing the state */

export default class
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
    if (typeof action == "function")
      action (this.dispatch.bind (this));
    else
      {
        this.state = this.reducer (this.state, action);
        this.listeners.forEach (listener => listener ());
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
