use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'space_in_image'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'a'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'bb'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'cc'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'dd'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'e'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'contents' => [],
      'extra' => {
        'brace_command_contents' => [
          [
            {}
          ],
          [
            {}
          ],
          [
            {}
          ],
          [
            {}
          ],
          [
            {}
          ]
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'f'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[1];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[2];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[3];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[3];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[4];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[4];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[2]{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'parent'} = $result_trees{'space_in_image'};
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'line_nr'} = $result_trees{'space_in_image'}{'contents'}[0]{'line_nr'};
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'parent'} = $result_trees{'space_in_image'};

$result_texis{'space_in_image'} = '@image{ a ,bb, cc,dd ,e }. @image{ f }.';


$result_texts{'space_in_image'} = 'a. f.';

$result_errors{'space_in_image'} = [];



$result_converted{'plaintext'}->{'space_in_image'} = 'An image text before paragraph.. [Another image text, in paragraph.].
';


$result_converted{'html'}->{'space_in_image'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<img src="a.e" alt="dd"><p>. <img src="f.jpg" alt="f">.</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'space_in_image'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  },
  {
    'file_name' => '',
    'error_line' => ':1: warning: @image file `a\' (for HTML) not found, using `a.e\'
',
    'text' => '@image file `a\' (for HTML) not found, using `a.e\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 1
  },
  {
    'file_name' => '',
    'error_line' => ':1: warning: @image file `f\' (for HTML) not found, using `f.jpg\'
',
    'text' => '@image file `f\' (for HTML) not found, using `f.jpg\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 1
  }
];


1;
