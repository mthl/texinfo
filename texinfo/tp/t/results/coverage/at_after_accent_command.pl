use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'at_after_accent_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'ringaccent',
          'contents' => [],
          'extra' => {
            'spaces' => ' '
          },
          'parent' => {}
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'cmdname' => '^',
          'contents' => [],
          'parent' => {}
        },
        {
          'cmdname' => '@',
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
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'at_after_accent_command'}{'contents'}[0];
$result_trees{'at_after_accent_command'}{'contents'}[0]{'parent'} = $result_trees{'at_after_accent_command'};

$result_texis{'at_after_accent_command'} = '@ringaccent @@. @^@@.
';


$result_texts{'at_after_accent_command'} = '@. @.
';

$result_errors{'at_after_accent_command'} = [
  {
    'error_line' => ':1: Use braces to give a command as an argument to @ringaccent
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Use braces to give a command as an argument to @ringaccent',
    'type' => 'error'
  },
  {
    'error_line' => ':1: Use braces to give a command as an argument to @^
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Use braces to give a command as an argument to @^',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'at_after_accent_command'} = '@.  @.
';


$result_converted{'html'}->{'at_after_accent_command'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>*@. ^@.
</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'at_after_accent_command'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
