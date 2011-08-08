use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'format_on_first_footnote_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Texte'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => 'quotation',
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
                          'text' => 'in quotation on the first footnote line
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
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
                              'text' => 'quotation'
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
                        'command_argument' => 'quotation',
                        'text_arg' => 'quotation'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 3,
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
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {},
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
          'text' => 'Last text '
        },
        {
          'args' => [
            {
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in example
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
                        'line_nr' => 8,
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
                    'line_nr' => 6,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {},
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'}{'contents'}[2];
$result_trees{'format_on_first_footnote_line'}{'contents'}[2]{'parent'} = $result_trees{'format_on_first_footnote_line'};

$result_texis{'format_on_first_footnote_line'} = 'Texte@footnote{@quotation
in quotation on the first footnote line
@end quotation
}.

Last text @footnote{@example
in example
@end example

}
';


$result_texts{'format_on_first_footnote_line'} = 'Texte.

Last text 
';

$result_errors{'format_on_first_footnote_line'} = [];



$result_converted{'plaintext'}->{'format_on_first_footnote_line'} = 'Texte(1).

   Last text (2)

   ---------- Footnotes ----------

   (1) in quotation on the first footnote line

   (2) in example

';


$result_converted{'html'}->{'format_on_first_footnote_line'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>Texte<a name="DOCF1" href="#FOOT1">(1)</a>.
</p>
<p>Last text <a name="DOCF2" href="#FOOT2">(2)</a>
</p><div class="footnote">
<hr>
<h3 class="footnote">Footnotes</h3>

<h3><a name="FOOT1" href="#DOCF1">(1)</a></h3>
<blockquote>
<p>in quotation on the first footnote line
</p></blockquote>
<h3><a name="FOOT2" href="#DOCF2">(2)</a></h3>
<div class="example">
<pre class="example">in example
</pre></div>

</div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'format_on_first_footnote_line'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
