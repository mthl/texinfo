use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'empty_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'uref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef
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
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'abbr',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef
            ]
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'email',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              undef
            ]
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '~',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'dotless',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'line_nr' => {},
          'parent' => {},
          'type' => ';'
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[2]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[4];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[4]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[6]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[8];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[8]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[10];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[10]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[12];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[12]{'line_nr'} = $result_trees{'empty_commands'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'empty_commands'}{'contents'}[0];
$result_trees{'empty_commands'}{'contents'}[0]{'parent'} = $result_trees{'empty_commands'};

$result_texis{'empty_commands'} = '@uref{} @abbr{} @email{} @code{} @~{} @dotless{} @verb{;;}
';


$result_texts{'empty_commands'} = '    ~  
';

$result_errors{'empty_commands'} = [
  {
    'error_line' => ':1: warning: @abbr missing first argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@abbr missing first argument',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'empty_commands'} = '`\' ~
';


$result_converted{'html'}->{'empty_commands'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p> <abbr></abbr>  <code></code> ~  <tt></tt>
</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'empty_commands'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
