use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'caption_in_example'} = {
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
              'text' => 'float'
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'example',
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
                  'text' => 'in example 
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'caption'
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
                'line_nr' => 6,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'After caption
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => 'example'
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
                'command_argument' => 'example',
                'text_arg' => 'example'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
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
            'line_nr' => 10,
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
        'caption' => {},
        'end_command' => {},
        'type' => {
          'content' => [
            {}
          ],
          'normalized' => 'float'
        }
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'float'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'caption_in_example'}{'contents'}[0];
$result_trees{'caption_in_example'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'extra'}{'caption'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'caption_in_example'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'caption_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'caption_in_example'}{'contents'}[0]{'extra'}{'type'}{'content'}[0] = $result_trees{'caption_in_example'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'caption_in_example'}{'contents'}[0]{'parent'} = $result_trees{'caption_in_example'};

$result_texis{'caption_in_example'} = '@float float

@example
in example 

@caption{caption}

After caption
@end example
@end float
';


$result_texts{'caption_in_example'} = 'float

in example 



After caption
';

$result_errors{'caption_in_example'} = [
  {
    'error_line' => ':6: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  }
];


$result_floats{'caption_in_example'} = {
  'float' => [
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
        'type' => {
          'content' => [
            {
              'text' => 'float'
            }
          ],
          'normalized' => 'float'
        }
      }
    }
  ]
};
$result_floats{'caption_in_example'}{'float'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'caption_in_example'}{'float'}[0];
$result_floats{'caption_in_example'}{'float'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'caption_in_example'}{'float'}[0];



$result_converted{'plaintext'}->{'caption_in_example'} = '     in example



     After caption

float: caption
';


$result_converted{'html'}->{'caption_in_example'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="float">

<div class="example">
<pre class="example">in example 

</pre><pre class="example">

After caption
</pre></div>
</div><p><strong>float: </strong>caption</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'caption_in_example'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
