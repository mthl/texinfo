use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'comments_in_example'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Example with comments 2 lines
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'second line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'Example with comments 1 line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
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
            'line_nr' => 10,
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
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comments_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[0];
$result_trees{'comments_in_example'}{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[3];
$result_trees{'comments_in_example'}{'contents'}[3]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[2];
$result_trees{'comments_in_example'}{'contents'}[4]{'parent'} = $result_trees{'comments_in_example'};

$result_texis{'comments_in_example'} = 'Example with comments 2 lines
@example 
line @c comment
second line @c comment
@end example

Example with comments 1 line
@example
line @c comment
@end example
';


$result_texts{'comments_in_example'} = 'Example with comments 2 lines
line second line 
Example with comments 1 line
line ';

$result_errors{'comments_in_example'} = [];



$result_converted{'plaintext'}->{'comments_in_example'} = 'Example with comments 2 lines
     line second line 

   Example with comments 1 line
     line 
';


$result_converted{'html'}->{'comments_in_example'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>Example with comments 2 lines
</p><div class="example">
<pre class="example">line second line </pre></div>

<p>Example with comments 1 line
</p><div class="example">
<pre class="example">line </pre></div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'comments_in_example'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
