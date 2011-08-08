use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'ctrl'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'A'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'ctrl',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
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
          'text' => 'With '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'B'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'ctrl',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'ctrl'}{'contents'}[0]{'parent'} = $result_trees{'ctrl'};
$result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[1]{'contents'}[0];
$result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ctrl'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[1];
$result_trees{'ctrl'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ctrl'}{'contents'}[1];
$result_trees{'ctrl'}{'contents'}[1]{'parent'} = $result_trees{'ctrl'};
$result_trees{'ctrl'}{'contents'}[2]{'parent'} = $result_trees{'ctrl'};
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[3];
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ctrl'}{'contents'}[3]{'contents'}[1];
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'ctrl'}{'contents'}[3];
$result_trees{'ctrl'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'ctrl'}{'contents'}[3];
$result_trees{'ctrl'}{'contents'}[3]{'parent'} = $result_trees{'ctrl'};

$result_texis{'ctrl'} = '
@ctrl{A}

With @ctrl{B}.
';


$result_texts{'ctrl'} = '
A

With B.
';

$result_errors{'ctrl'} = [
  {
    'error_line' => ':2: warning: @ctrl is obsolete.
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@ctrl is obsolete.',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: @ctrl is obsolete.
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@ctrl is obsolete.',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'ctrl'} = 'A

   With B.
';


$result_converted{'html'}->{'ctrl'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>^A
</p>
<p>With ^B.
</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'ctrl'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
