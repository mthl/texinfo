use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'nested_args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in samp'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'samp',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'descr '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in b'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'line_nr' => {},
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'S'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'e'
                        }
                      ],
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
                  'text' => 'ction'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'manual'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'cite',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'xref',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {},
                {},
                {}
              ],
              [
                {},
                {}
              ],
              [
                {},
                {},
                {}
              ],
              [
                {}
              ]
            ],
            'node_argument' => {
              'node_content' => [
                {},
                {},
                {}
              ],
              'normalized' => '_0040-in-samp'
            }
          },
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'line_nr'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2]{'line_nr'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[3]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[1][1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[2][1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[2][2] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'contents'}[3];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[1] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[2] = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'parent'} = $result_trees{'nested_args'};

$result_texis{'nested_args'} = '@xref{@@ @samp{in samp}, descr @b{in b}, S@~{e}ction, 
@cite{manual}}.';


$result_texts{'nested_args'} = '.';

$result_errors{'nested_args'} = [];



$result_converted{'plaintext'}->{'nested_args'} = '*Note descr in b: (`manual\')@ `in samp\'.
';


$result_converted{'html'}->{'nested_args'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>See <a href="manual.html#g_t_0040-in-samp">(manual)S&#7869;ction</a>.</p><p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'nested_args'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
