/* xml.h -- xml output declarations.
   $Id: xml.h,v 1.19 2003-11-27 11:48:08 dirt Exp $

   Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   Written by Philippe Martin <feloy@free.fr>.  */

#ifndef XML_H
#define XML_H

/* Options. */

/* Separate index entries into divisions for each letters. */
extern int xml_index_divisions;
extern int xml_sort_index;

extern int xml_no_indent;

extern int xml_node_open;
extern int xml_no_para;
extern char *xml_node_id;
extern int xml_last_section_output_position;

extern int xml_in_xref_token;
extern int xml_in_bookinfo;
extern int xml_in_book_title;
extern int xml_in_abstract;

enum xml_element
{
  TEXINFO=0, SETFILENAME, TITLEFONT, SETTITLE, 
  /* Node */
  NODE /* 4 */, NODENEXT, NODEPREV, NODEUP,
  /* Structuring */
  CHAPTER /* 8 */, SECTION, SUBSECTION, SUBSUBSECTION,
  TOP /* 12 */, UNNUMBERED, UNNUMBEREDSEC, UNNUMBEREDSUBSEC,
    UNNUMBEREDSUBSUBSEC,  
  APPENDIX /* 17 */, APPENDIXSEC, APPENDIXSUBSEC, APPENDIXSUBSUBSEC, 
  MAJORHEADING /* 21 */, CHAPHEADING, HEADING, SUBHEADING, SUBSUBHEADING,
  /* Titlepage */
  TITLEPAGE /* 26 */, AUTHOR, BOOKTITLE, BOOKSUBTITLE,
  /* Menu */
  MENU /* 30 */, MENUENTRY, MENUTITLE, MENUCOMMENT, MENUNODE, NODENAME,
  /* -- */
  ACRONYM/* 36 */, TT, CODE, COMMAND_TAG, ENV, FILE_TAG, OPTION, SAMP,
    KBD, URL, KEY, VAR, SC, DFN, EMPH, STRONG,
    CITE, NOTFIXEDWIDTH, I, B, R,  
  TITLE, 
  IFINFO, 
  SP, CENTER,
  DIRCATEGORY,
  QUOTATION, EXAMPLE, SMALLEXAMPLE, LISP, SMALLLISP, CARTOUCHE,
    COPYING, FORMAT, SMALLFORMAT, DISPLAY, SMALLDISPLAY, VERBATIM,
  FOOTNOTE, LINEANNOTATION,
  TIP, NOTE, IMPORTANT, WARNING, CAUTION,
  ITEMIZE, ITEMFUNCTION, ITEM, ENUMERATE, TABLE, TABLEITEM, TABLETERM,
  INDEXTERM, 
  MATH,
  XREF, XREFNODENAME, XREFINFONAME, XREFPRINTEDDESC, XREFINFOFILE,
    XREFPRINTEDNAME, 
  INFOREF, INFOREFNODENAME, INFOREFREFNAME, INFOREFINFONAME, 
  UREF, UREFURL, UREFDESC, UREFREPLACEMENT,
  EMAIL, EMAILADDRESS, EMAILNAME,
  GROUP, FLOAT, FLOATTYPE, CAPTION,
  FLOATTABLE, FLOATFIGURE, FLOATEXAMPLE,
  PRINTINDEX, LISTOFFLOATS,
  ANCHOR, 
  IMAGE,
  PRIMARY, SECONDARY, INFORMALFIGURE, MEDIAOBJECT, IMAGEOBJECT,
    IMAGEDATA, TEXTOBJECT,  
  INDEXENTRY, PRIMARYIE, SECONDARYIE, INDEXDIV,
  MULTITABLE, TGROUP, COLSPEC, THEAD, TBODY, ENTRY, ROW,
  BOOKINFO, ABSTRACT, REPLACEABLE, ENVAR, COMMENT, FUNCTION, LEGALNOTICE,
  CONTENTS, SHORTCONTENTS, DOCUMENTLANGUAGE,
  SETVALUE, CLEARVALUE,
  DEFINITION, DEFINITIONTERM, DEFINITIONITEM,
  DEFCATEGORY, DEFFUNCTION, DEFVARIABLE, DEFPARAM, DEFDELIMITER, DEFTYPE,
  DEFPARAMTYPE, DEFDATATYPE, DEFCLASS, DEFCLASSVAR, DEFOPERATION,
  PARA
};

extern void xml_insert_element (/* int name, int arg */);
extern char *xml_id (/* char *id */);
extern char *xml_get_assoc_for_id (/* char *id */);

#endif /* XML_H */
