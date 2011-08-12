use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'quote_dash_in_display'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'display',
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
              'text' => 'and now -- yes---now and ``so\'\'.
'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
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
                  'text' => 'display'
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
            'command_argument' => 'display',
            'text_arg' => 'display'
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'quote_dash_in_display'}{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_display'};
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'quote_dash_in_display'}{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'quote_dash_in_display'}{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'quote_dash_in_display'}{'contents'}[1];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'quote_dash_in_display'}{'contents'}[1]{'contents'}[2];
$result_trees{'quote_dash_in_display'}{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_display'};

$result_texis{'quote_dash_in_display'} = '
@display
and now -- yes---now and ``so\'\'.

@end display
';


$result_texts{'quote_dash_in_display'} = '
and now -- yes---now and ``so\'\'.

';

$result_errors{'quote_dash_in_display'} = [];



$result_converted{'plaintext'}->{'quote_dash_in_display'} = '     and now - yes--now and "so".

';


$result_converted{'html'}->{'quote_dash_in_display'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="display">
<pre class="display">and now &ndash; yes&mdash;now and &ldquo;so&rdquo;.

</pre></div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'quote_dash_in_display'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
