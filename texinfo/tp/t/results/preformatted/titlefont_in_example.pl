use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'titlefont_in_example'} = {
  'contents' => [
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Title'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'titlefont',
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
          'contents' => [
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'parent' => {},
              'text' => 'Text.
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'titlefont_in_example'}{'contents'}[0];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'titlefont_in_example'}{'contents'}[0]{'contents'}[3];
$result_trees{'titlefont_in_example'}{'contents'}[0]{'parent'} = $result_trees{'titlefont_in_example'};

$result_texis{'titlefont_in_example'} = '@example
@titlefont{Title}
Text.
@end example
';


$result_texts{'titlefont_in_example'} = 'Title
Text.
';

$result_errors{'titlefont_in_example'} = [];



$result_converted{'plaintext'}->{'titlefont_in_example'} = '     Title
**********

     Text.
';


$result_converted{'html'}->{'titlefont_in_example'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Title</title>

<meta name="description" content="Title">
<meta name="keywords" content="Title">
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

<div class="example">
<h1 class="titlefont">Title</h1><pre class="example">
Text.
</pre></div>
<p>


</p>
</body>
</html>
';

1;
