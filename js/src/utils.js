/* utils.js - General purpose utilitary functions */

/** Check wether the current script is loaded inside an Iframe.
    Return true if this is the case otherwise return false.  */
export function
inside_iframe_p ()
{
  return top != window;
}

/** Check if FILE_NAME corresponds to the entry file of the
    manual.  */
export function
inside_index_page_p (file_name)
{
  return file_name.endsWith ("/index.html") || file_name.endsWith ("/");
}

/** Check if LINK is an absolute url.  Return true if this is the case
    otherwise return false.  LINK must be a string representing a
    valid URL.  */
export function
absolute_url_p (url)
{
  return url.includes (":");
}

/** Return PATHNAME with any leading directory components removed.  If
    specified, also remove a trailing SUFFIX.  */
export function
basename (pathname, suffix)
{
  let res = pathname.replace (/.*[/]/, "");
  if (!suffix)
    return res;
  else if (suffix instanceof RegExp)
    return res.replace (suffix, "");
  else                          /* typeof SUFFIX == "string" */
    return res.replace (new RegExp ("[.]" + suffix), "");
}

/** Apply FUNC to each nodes in the NODE subtree.  The walk follows a depth
    first algorithm.  Only consider the nodes of type NODE_TYPE.  */
export function
depth_first_walk (node, func, node_type)
{
  if (!node_type || (node.nodeType === Node.ELEMENT_NODE))
    func (node);

  for (let child = node.firstChild; child; child = child.nextSibling)
    depth_first_walk (child, func, node_type);
}
