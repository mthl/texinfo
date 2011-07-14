use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'command_in_heading_footing'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => ' something @thispage @thischapternum
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'everyheading',
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
          'text' => 'In text '
        },
        {
          'cmdname' => 'thispage',
          'extra' => {
            'invalid_nesting' => 1
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => 'thischapternum',
          'extra' => {
            'invalid_nesting' => 1
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' text.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'command_in_heading_footing'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[0];
$result_trees{'command_in_heading_footing'}{'contents'}[0]{'parent'} = $result_trees{'command_in_heading_footing'};
$result_trees{'command_in_heading_footing'}{'contents'}[1]{'parent'} = $result_trees{'command_in_heading_footing'};
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[2];
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[2];
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[2];
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[2];
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'command_in_heading_footing'}{'contents'}[2];
$result_trees{'command_in_heading_footing'}{'contents'}[2]{'parent'} = $result_trees{'command_in_heading_footing'};

$result_texis{'command_in_heading_footing'} = '@everyheading something @thispage @thischapternum

In text @thispage @thischapternum text.
';


$result_texts{'command_in_heading_footing'} = '
In text   text.
';

$result_errors{'command_in_heading_footing'} = [
  {
    'error_line' => ':3: @thispage should only appear in heading or footing
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@thispage should only appear in heading or footing',
    'type' => 'error'
  },
  {
    'error_line' => ':3: @thischapternum should only appear in heading or footing
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@thischapternum should only appear in heading or footing',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'command_in_heading_footing'} = 'In text text.
';


$result_converted{'html'}->{'command_in_heading_footing'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>In text   text.
</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'command_in_heading_footing'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
