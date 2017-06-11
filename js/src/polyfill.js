/* polyfill.js - Methods required for compatibility reason */

/* eslint-disable */

/* Polyfill for 'window.URL'.  */
import "./url";

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

/* Polyfill for 'Object.assign'.  */
function
object_assign (target, varArgs)
{
  'use strict';
  if (target == null)           /* TypeError if undefined or null.  */
    throw new TypeError ('Cannot convert undefined or null to object');

  var to = Object (target);
  for (var index = 1; index < arguments.length; index++)
    {
      var nextSource = arguments[index];
      /* Skip over if undefined or null */
      if (nextSource != null)
        {
          for (var nextKey in nextSource)
            {
              /* Avoid bugs when hasOwnProperty is shadowed.  */
              if (Object.prototype.hasOwnProperty.call (nextSource, nextKey))
                to[nextKey] = nextSource[nextKey];
            }
        }
    }

  return to;
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

    if (typeof Object.assign != 'function')
      Object.assign = object_assign;
  }
};
