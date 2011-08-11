use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'math'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Simple math
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '--'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'x^i'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '\\over'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '\\tan y'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
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
          'text' => 'Math with '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '-command
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'math code'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a < b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
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
          'text' => 'Complex
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => '\\underline'
                },
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'math \\hbox'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' code '
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 8,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'cmdname' => '\\',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'i \\sum_'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'i'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '\\underline'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f'
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '\\ outside of math
'
        },
        {
          'cmdname' => '\\',
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
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'math'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[1]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'line_nr'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[3]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'line_nr'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'line_nr'};
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[5]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[7]{'parent'} = $result_trees{'math'};

$result_texis{'math'} = 'Simple math
@math{--{x^i}\\over{\\tan y}}

Math with @@-command
@math{@code{math code} a < b}

Complex
@math{ \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}}

@@\\ outside of math
@\\

';


$result_texts{'math'} = 'Simple math
--{x^i}\\over{\\tan y}

Math with @-command
math code a < b

Complex
\\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

@\\ outside of math
\\

';

$result_errors{'math'} = [
  {
    'error_line' => ':11: warning: @\\ should only appear in math context
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => '@\\ should only appear in math context',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'math'} = 'Simple math --{x^i}\\over{\\tan y}

   Math with @-command `math code\' a < b

   Complex \\underline{`math \\hbox{ code }\'} \\i \\sum_{i}{\\underline{f}}

   @\\ outside of math \\

';


$result_converted{'html'}->{'math'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>Simple math
<em>--{x^i}\\over{\\tan y}</em>
</p>
<p>Math with @-command
<em><code>math code</code> a &lt; b</em>
</p>
<p>Complex
<em>\\underline{<code>math \\hbox{ code }</code>} \\i \\sum_{i}{\\underline{f}}</em>
</p>
<p>@\\ outside of math
\\
</p>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'math'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
