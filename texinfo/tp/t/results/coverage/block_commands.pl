use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'block_commands'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'group',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in group
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'group'
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
            'command_argument' => 'group',
            'text_arg' => 'group'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
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
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'text' => 'warning'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'quotation',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'quotation'
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
            'command_argument' => 'quotation',
            'text_arg' => 'quotation'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'text' => 'a float'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'b float'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'float',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In float
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'caption',
          'contents' => [],
          'extra' => {
            'float' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => 'float'
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
            'command_argument' => 'float',
            'text_arg' => 'float'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ],
          [
            {}
          ]
        ],
        'caption' => {},
        'end_command' => {},
        'node_content' => [
          {}
        ],
        'normalized' => 'b-float',
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'a-float'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'block_commands'}{'contents'}[0]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[1]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[2]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[3]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[4]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'extra'}{'float'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'extra'}{'command'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[5]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'caption'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'end_command'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'extra'}{'type'}{'content'}[0] = $result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'parent'} = $result_trees{'block_commands'};

$result_texis{'block_commands'} = '
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float


@caption{in caption

in caption}
@end float
';


$result_texts{'block_commands'} = '
in group

warning
in quotation

a float, b float
In float



';

$result_errors{'block_commands'} = [];


$result_floats{'block_commands'} = {
  'a-float' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'b-float',
        'type' => {
          'content' => [
            {
              'text' => 'a float'
            }
          ],
          'normalized' => 'a-float'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'block_commands'}{'a-float'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'block_commands'}{'a-float'}[0];
$result_floats{'block_commands'}{'a-float'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'block_commands'}{'a-float'}[0];



$result_converted{'plaintext'}->{'block_commands'} = 'in group

     warning: in quotation

In float

a float 1: in caption

in caption
';


$result_converted{'html'}->{'block_commands'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>in group
</p>
<blockquote>
<p><b>warning:</b> in quotation
</p></blockquote>

<div class="float"><a name="b-float"></a>
<p>In float
</p>


</div><p><strong>a float 1: </strong>in caption
</p>
<p>in caption</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'block_commands'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
