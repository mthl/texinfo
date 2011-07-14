use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'comments_in_text'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' lone comment
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'c',
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
          'text' => 'Text line followed by a comment on the same line and another below '
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
          'text' => 'Text line after the comment followed by a comment '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' c
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'comment',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'Text line after the text line followed by the comment.
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
          'text' => 'Comment at the end of the line '
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
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comments_in_text'}{'contents'}[0]{'parent'} = $result_trees{'comments_in_text'};
$result_trees{'comments_in_text'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[1];
$result_trees{'comments_in_text'}{'contents'}[1]{'parent'} = $result_trees{'comments_in_text'};
$result_trees{'comments_in_text'}{'contents'}[2]{'parent'} = $result_trees{'comments_in_text'};
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[1];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[2];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[4];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[3];
$result_trees{'comments_in_text'}{'contents'}[3]{'parent'} = $result_trees{'comments_in_text'};
$result_trees{'comments_in_text'}{'contents'}[4]{'parent'} = $result_trees{'comments_in_text'};
$result_trees{'comments_in_text'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[5];
$result_trees{'comments_in_text'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[5]{'contents'}[1];
$result_trees{'comments_in_text'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'comments_in_text'}{'contents'}[5];
$result_trees{'comments_in_text'}{'contents'}[5]{'parent'} = $result_trees{'comments_in_text'};

$result_texis{'comments_in_text'} = '
@c lone comment

Text line followed by a comment on the same line and another below @c comment
@c comment
Text line after the comment followed by a comment @comment c
Text line after the text line followed by the comment.

Comment at the end of the line @c comment
';


$result_texts{'comments_in_text'} = '

Text line followed by a comment on the same line and another below Text line after the comment followed by a comment Text line after the text line followed by the comment.

Comment at the end of the line ';

$result_errors{'comments_in_text'} = [];



$result_converted{'plaintext'}->{'comments_in_text'} = 'Text line followed by a comment on the same line and another below Text
line after the comment followed by a comment Text line after the text
line followed by the comment.

   Comment at the end of the line
';


$result_converted{'html'}->{'comments_in_text'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>Text line followed by a comment on the same line and another below Text line after the comment followed by a comment Text line after the text line followed by the comment.
</p>
<p>Comment at the end of the line </p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'comments_in_text'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
