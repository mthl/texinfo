use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'space_command_in_image'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'f--ile'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'cmdname' => ' ',
              'parent' => {}
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
          undef,
          undef,
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
      'parent' => {},
      'text' => ' '
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'f--ile'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'cmdname' => ':',
              'parent' => {}
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
          undef,
          undef,
          [
            {}
          ]
        ]
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[3];
$result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'space_command_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[0]{'parent'} = $result_trees{'space_command_in_image'};
$result_trees{'space_command_in_image'}{'contents'}[1]{'parent'} = $result_trees{'space_command_in_image'};
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[0];
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2];
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2];
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2];
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[3];
$result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'space_command_in_image'}{'contents'}[2];
$result_trees{'space_command_in_image'}{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[2]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'space_command_in_image'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'space_command_in_image'}{'contents'}[2]{'line_nr'} = $result_trees{'space_command_in_image'}{'contents'}[0]{'line_nr'};
$result_trees{'space_command_in_image'}{'contents'}[2]{'parent'} = $result_trees{'space_command_in_image'};

$result_texis{'space_command_in_image'} = '@image{f--ile,,,@ } @image{f--ile,,,@:}';


$result_texts{'space_command_in_image'} = 'f--ile f--ile';

$result_errors{'space_command_in_image'} = [];



$result_converted{'plaintext'}->{'space_command_in_image'} = 'Image description""\\.Image description""\\.';


$result_converted{'html'}->{'space_command_in_image'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<img src="f--ile.png" alt="&nbsp;"> <img src="f--ile.png" alt="f--ile"><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'space_command_in_image'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
