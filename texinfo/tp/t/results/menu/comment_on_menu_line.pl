use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'comment_on_menu_line'} = {
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => '  ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'parent' => {},
              'type' => 'menu_comment'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'first'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'first'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
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
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'command' => {},
                'command_argument' => 'menu',
                'text_arg' => 'menu'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
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
              'text' => 'first'
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
        'line_nr' => 7,
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
              'text' => 'first'
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
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'first'
          }
        ],
        'normalized' => 'first'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'comment_on_menu_line'}{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'};
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'comment_on_menu_line'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'comment_on_menu_line'}{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'};
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[2];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[2];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'comment_on_menu_line'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'};
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_menu_line'}{'contents'}[3];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_on_menu_line'}{'contents'}[3];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'comment_on_menu_line'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'comment_on_menu_line'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'comment_on_menu_line'}{'contents'}[3]{'parent'} = $result_trees{'comment_on_menu_line'};

$result_texis{'comment_on_menu_line'} = '@node Top

@menu  @c
* first::
@end menu

@chapter first
@node first
';


$result_texts{'comment_on_menu_line'} = '
* first::

1 first
*******
';

$result_sectioning{'comment_on_menu_line'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'comment_on_menu_line'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'comment_on_menu_line'};

$result_nodes{'comment_on_menu_line'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'chapter',
      'extra' => {},
      'level' => 1,
      'number' => 1
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          }
        }
      }
    }
  ],
  'node_next' => {},
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'comment_on_menu_line'}{'menu_child'}{'node_prev'} = $result_nodes{'comment_on_menu_line'};
$result_nodes{'comment_on_menu_line'}{'menu_child'}{'node_up'} = $result_nodes{'comment_on_menu_line'};
$result_nodes{'comment_on_menu_line'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'comment_on_menu_line'}{'menus'}[0];
$result_nodes{'comment_on_menu_line'}{'node_next'} = $result_nodes{'comment_on_menu_line'}{'menu_child'};
$result_nodes{'comment_on_menu_line'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'comment_on_menu_line'};

$result_menus{'comment_on_menu_line'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'comment_on_menu_line'}{'menu_child'}{'menu_up'} = $result_menus{'comment_on_menu_line'};

$result_errors{'comment_on_menu_line'} = [];



$result_converted{'plaintext'}->{'comment_on_menu_line'} = '* Menu:

* first::

1 first
*******

';


$result_converted{'html'}->{'comment_on_menu_line'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="texi2html">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="#Top" rel="start" title="Top">
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
<div class="header">
<p>
Next: <a href="#first" accesskey="n" rel="next">first</a>, Up: <a href="dir.html#Top" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>

<table class="menu" border="0" cellspacing="0">
<tr><th colspan="3" align="left" valign="top"></th></tr><tr><td align="left" valign="top">&bull; <a href="#first" accesskey="1">first</a>:</td><td>&nbsp;&nbsp;</td><td align="left" valign="top">
</td></tr>
</table>

<a name="first-1"></a>
<h1 class="chapter">1 first</h1>
<hr>
<a name="first"></a>
<div class="header">
<p>
Previous: <a href="#Top" accesskey="p" rel="previous">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h3 class="node-heading">first</h3>
<hr>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'comment_on_menu_line'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
