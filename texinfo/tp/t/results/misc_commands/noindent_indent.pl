use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'noindent_indent'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'indent',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
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
          'text' => 'First para
'
        }
      ],
      'extra' => {
        'indent' => 1
      },
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
      'cmdname' => 'noindent',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    },
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
          'text' => 'qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
'
        },
        {
          'parent' => {},
          'text' => 'qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
'
        }
      ],
      'extra' => {
        'noindent' => 1
      },
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
      'cmdname' => 'noindent',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => ' ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'noindent in para.
'
        }
      ],
      'extra' => {
        'noindent' => 1
      },
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
      'cmdname' => 'indent',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => ' ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'unneeded indent
'
        }
      ],
      'extra' => {
        'indent' => 1
      },
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'noindent_indent'}{'contents'}[0]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[1]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[2]{'extra'}{'command'} = $result_trees{'noindent_indent'}{'contents'}[1];
$result_trees{'noindent_indent'}{'contents'}[2]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'noindent_indent'}{'contents'}[3];
$result_trees{'noindent_indent'}{'contents'}[3]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[4]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[5]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[6]{'extra'}{'command'} = $result_trees{'noindent_indent'}{'contents'}[5];
$result_trees{'noindent_indent'}{'contents'}[6]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'noindent_indent'}{'contents'}[7];
$result_trees{'noindent_indent'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'noindent_indent'}{'contents'}[7];
$result_trees{'noindent_indent'}{'contents'}[7]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[8]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[9]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[10]{'extra'}{'command'} = $result_trees{'noindent_indent'}{'contents'}[9];
$result_trees{'noindent_indent'}{'contents'}[10]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'noindent_indent'}{'contents'}[11];
$result_trees{'noindent_indent'}{'contents'}[11]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[12]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[13]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[14]{'extra'}{'command'} = $result_trees{'noindent_indent'}{'contents'}[13];
$result_trees{'noindent_indent'}{'contents'}[14]{'parent'} = $result_trees{'noindent_indent'};
$result_trees{'noindent_indent'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'noindent_indent'}{'contents'}[15];
$result_trees{'noindent_indent'}{'contents'}[15]{'parent'} = $result_trees{'noindent_indent'};

$result_texis{'noindent_indent'} = '
@indent
First para

@noindent
qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

@noindent noindent in para.

@indent unneeded indent
';


$result_texts{'noindent_indent'} = '
First para

qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

noindent in para.

unneeded indent
';

$result_errors{'noindent_indent'} = [];



$result_converted{'plaintext'}->{'noindent_indent'} = '   First para

qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

noindent in para.

   unneeded indent
';


$result_converted{'html'}->{'noindent_indent'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>First para
</p>
<p>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</p>
<p>noindent in para.
</p>
<p>unneeded indent
</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'noindent_indent'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
