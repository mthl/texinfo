use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'text_on_command_line'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
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
              'text' => 'text on line
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
            'line_nr' => 2,
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
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'example',
      'contents' => [
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
              'text' => 'text on line followed by text
'
            },
            {
              'parent' => {},
              'text' => 'normal text
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
            'line_nr' => 6,
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
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
                  'text' => 'example text after end'
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
            'text_arg' => 'example text after end'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
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
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'example text after end example nested in example'
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
                'text_arg' => 'example text after end example nested in example'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 14,
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
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
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
            'line_nr' => 15,
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
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'text_on_command_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'text_on_command_line'}{'contents'}[2]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[3]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[4];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[4];
$result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[4];
$result_trees{'text_on_command_line'}{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'text_on_command_line'}{'contents'}[4]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[4]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[5]{'parent'} = $result_trees{'text_on_command_line'};
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'text_on_command_line'}{'contents'}[6];
$result_trees{'text_on_command_line'}{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'text_on_command_line'}{'contents'}[6]{'contents'}[2];
$result_trees{'text_on_command_line'}{'contents'}[6]{'parent'} = $result_trees{'text_on_command_line'};

$result_texis{'text_on_command_line'} = '@example text on line
@end example

@example text on line followed by text
normal text
@end example

@example
in example
@end example text after end

@example
@example
@end example text after end example nested in example
@end example
';


$result_texts{'text_on_command_line'} = 'text on line

text on line followed by text
normal text

in example

';

$result_errors{'text_on_command_line'} = [
  {
    'error_line' => ':10: Superfluous argument to @end example:  text after end
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Superfluous argument to @end example:  text after end',
    'type' => 'error'
  },
  {
    'error_line' => ':14: Superfluous argument to @end example:  text after end example nested in example
',
    'file_name' => '',
    'line_nr' => 14,
    'macro' => '',
    'text' => 'Superfluous argument to @end example:  text after end example nested in example',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'text_on_command_line'} = '     text on line

     text on line followed by text
     normal text

     in example

';


$result_converted{'html'}->{'text_on_command_line'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="example">
<pre class="example">text on line
</pre></div>

<div class="example">
<pre class="example">text on line followed by text
normal text
</pre></div>

<div class="example">
<pre class="example">in example
</pre></div>

<div class="example">
<div class="example">
</div>
</div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'text_on_command_line'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
