/* polyfill.js - Methods required for compatibility reason */

/* eslint-disable */

/* Polyfill for 'String.prototype.matches'.  */
function
string_includes (search, start)
{
  'use strict';
  if (typeof start !== 'number')
    start = 0;

  if (start + search.length > this.length)
    return false;
  else
    return this.indexOf(search, start) !== -1;
}

/* Polyfill for 'Element.matches'.  */
function
element_matches (str)
{
  var document = (this.document || this.ownerDocument);
  var matches = document.querySelectorAll(str);
  var i = matches.length;
  while (--i >= 0 && matches.item(i) !== this) {}
  return i > -1;
}

export default {
  /* Augment prototypes if necessary.  */
  register ()
  {
    if (!String.prototype.includes)
      String.prototype.includes = string_includes;

    if (!Element.prototype.matches)
      {
        Element.prototype.matches = Element.prototype.matchesSelector
          || Element.prototype.mozMatchesSelector
          || Element.prototype.msMatchesSelector
          || Element.prototype.oMatchesSelector
          || Element.prototype.webkitMatchesSelector
          || element_matches;
      }
  }
};
