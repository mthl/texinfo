use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'footnote_no_node'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
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
              'text' => 'top'
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
      'cmdname' => 'top',
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
              'parent' => {},
              'text' => 'F'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'In footnote'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
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
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'footnote_no_node'}{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'};
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'};

$result_texis{'footnote_no_node'} = '@top top

F@footnote{In footnote}.
';


$result_texts{'footnote_no_node'} = 'top
***

F.
';

$result_sectioning{'footnote_no_node'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'footnote_no_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'footnote_no_node'};

$result_errors{'footnote_no_node'} = [];



$result_converted{'plaintext'}->{'footnote_no_node'} = 'top
***

F(1).

   ---------- Footnotes ----------

   (1) In footnote

';


$result_converted{'html'}->{'footnote_no_node'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texi2html, http://www.gnu.org/software/texinfo/ -->
<head>
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
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

<a name="top"></a>
<h1 class="top">top</h1>

<p>F<a name="DOCF1" href="#FOOT1">(1)</a>.
</p><div class="footnote">
<hr>
<h3 class="footnote">Footnotes</h3>

<h3><a name="FOOT1" href="#DOCF1">(1)</a></h3>
<p>In footnote</p>
</div>
<hr>
<p>


</p>
</body>
</html>
';

1;
