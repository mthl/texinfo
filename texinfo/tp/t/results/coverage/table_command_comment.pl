use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'table_command_comment'} = {
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
              'cmdname' => 'code',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' in comment
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'table',
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
                  'text' => 'item'
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
          'cmdname' => 'item',
          'extra' => {
            'misc_content' => [
              {}
            ]
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
                  'text' => 'table'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'table',
            'text_arg' => 'table'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
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
        'command_as_argument' => {},
        'end_command' => {}
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
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'}[0] = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'};

$result_texis{'table_command_comment'} = '@table @code@c in comment
@item item
@end table';


$result_texts{'table_command_comment'} = 'item
';

$result_errors{'table_command_comment'} = [];



$result_converted{'plaintext'}->{'table_command_comment'} = '`item\'
';


$result_converted{'html'}->{'table_command_comment'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<dl compact="compact">
<dt><code>item</code></dt>
</dl>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'table_command_comment'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
