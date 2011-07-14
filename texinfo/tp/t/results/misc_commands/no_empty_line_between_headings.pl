use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'no_empty_line_between_headings'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Subheading'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'subheading',
          'extra' => {
            'misc_content' => [
              {}
            ]
          },
          'level' => 3,
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Chapter'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Section'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
      },
      'number' => '1.1',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'no_empty_line_between_headings'}{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'};
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[1]{'parent'} = $result_trees{'no_empty_line_between_headings'};
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[2];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[2];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[2]{'parent'} = $result_trees{'no_empty_line_between_headings'};
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[3];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'no_empty_line_between_headings'}{'contents'}[3];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'no_empty_line_between_headings'}{'contents'}[3]{'parent'} = $result_trees{'no_empty_line_between_headings'};

$result_texis{'no_empty_line_between_headings'} = '@top Top
@subheading Subheading
@chapter Chapter
@section Section
';


$result_texts{'no_empty_line_between_headings'} = 'Top
***
Subheading
----------
1 Chapter
*********
1.1 Section
===========
';

$result_sectioning{'no_empty_line_between_headings'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0,
      'section_childs' => [
        {
          'cmdname' => 'chapter',
          'extra' => {},
          'level' => 1,
          'number' => 1,
          'section_childs' => [
            {
              'cmdname' => 'section',
              'extra' => {},
              'level' => 2,
              'number' => '1.1',
              'section_up' => {}
            }
          ],
          'section_up' => {},
          'toplevel_prev' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0];
$result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_prev'} = $result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0];
$result_sectioning{'no_empty_line_between_headings'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'no_empty_line_between_headings'};

$result_errors{'no_empty_line_between_headings'} = [];



$result_converted{'plaintext'}->{'no_empty_line_between_headings'} = 'Top
***

Subheading
----------

1 Chapter
*********

1.1 Section
===========

';


$result_converted{'html'}->{'no_empty_line_between_headings'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="texi2html">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.smallquotation {font-size: smaller}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
div.smalldisplay {margin-left: 3.2em}
div.smallexample {margin-left: 3.2em}
div.smalllisp {margin-left: 3.2em}
pre.display {font-family: serif}
pre.format {font-family: serif}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
pre.smalldisplay {font-family: serif; font-size: smaller}
pre.smallexample {font-size: smaller}
pre.smallformat {font-family: serif; font-size: smaller}
pre.smalllisp {font-size: smaller}
span.nocodebreak {white-space:pre}
span.nolinebreak {white-space:pre}
span.roman {font-family:serif; font-weight:normal}
span.sansserif {font-family:sans-serif; font-weight:normal}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="en" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<a name="Top"></a>
<h1 class="top">Top</h1>
<a name="Subheading"></a>
<h3 class="subheading">Subheading</h3>
<a name="Chapter"></a>
<h1 class="chapter">1 Chapter</h1>
<a name="Section"></a>
<h2 class="section">1.1 Section</h2>
<hr>
<p>


</p>
</body>
</html>
';

1;
