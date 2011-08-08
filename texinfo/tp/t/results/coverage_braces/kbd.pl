use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'kbd'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'kbd: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in kbd'
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
            'line_nr' => 1,
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
          'text' => 'kbd in code: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in first '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in nested kbd'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'kbd',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 3,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
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
          'text' => 'kbd in kbd: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in top kbd '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in nested kbd'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'kbd',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
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
          'text' => 'kbd in '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'example:
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
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in example in kbd'
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
                'line_nr' => 11,
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
            'line_nr' => 12,
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
        'line_nr' => 9,
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'kbd in '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'format:
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
      'cmdname' => 'format',
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
              'text' => 'in format
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in format in kbd'
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
                'line_nr' => 18,
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
                  'text' => 'format'
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
            'command_argument' => 'format',
            'text_arg' => 'format'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 19,
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
        'line_nr' => 16,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'kbd'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[0];
$result_trees{'kbd'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[0]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[0];
$result_trees{'kbd'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[0];
$result_trees{'kbd'}{'contents'}[0]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[1]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[2];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'line_nr'} = $result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'kbd'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[2];
$result_trees{'kbd'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[2];
$result_trees{'kbd'}{'contents'}[2]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[3]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[4];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'line_nr'} = $result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'kbd'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[4];
$result_trees{'kbd'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[4];
$result_trees{'kbd'}{'contents'}[4]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[5]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[6];
$result_trees{'kbd'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[6];
$result_trees{'kbd'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[6];
$result_trees{'kbd'}{'contents'}[6]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[7]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[8]{'contents'}[0]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[8];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[8];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[8];
$result_trees{'kbd'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[8];
$result_trees{'kbd'}{'contents'}[8]{'extra'}{'end_command'} = $result_trees{'kbd'}{'contents'}[8]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[8]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[9]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[10];
$result_trees{'kbd'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[10];
$result_trees{'kbd'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[10];
$result_trees{'kbd'}{'contents'}[10]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[11]{'parent'} = $result_trees{'kbd'};
$result_trees{'kbd'}{'contents'}[12]{'contents'}[0]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[12];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[1];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[12];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'extra'}{'command'} = $result_trees{'kbd'}{'contents'}[12];
$result_trees{'kbd'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'kbd'}{'contents'}[12];
$result_trees{'kbd'}{'contents'}[12]{'extra'}{'end_command'} = $result_trees{'kbd'}{'contents'}[12]{'contents'}[2];
$result_trees{'kbd'}{'contents'}[12]{'parent'} = $result_trees{'kbd'};

$result_texis{'kbd'} = 'kbd: @code{in kbd}.

kbd in code: @code{in first @kbd{in nested kbd}}.

kbd in kbd: @kbd{in top kbd @kbd{in nested kbd}}.

kbd in @@example:

@example 
in example
@code{in example in kbd}.
@end example

kbd in @@format:

@format 
in format
@code{in format in kbd}.
@end format
';


$result_texts{'kbd'} = 'kbd: in kbd.

kbd in code: in first in nested kbd.

kbd in kbd: in top kbd in nested kbd.

kbd in @example:

in example
in example in kbd.

kbd in @format:

in format
in format in kbd.
';

$result_errors{'kbd'} = [];



$result_converted{'plaintext'}->{'kbd'} = 'kbd: `in kbd\'.

   kbd in code: `in first `in nested kbd\'\'.

   kbd in kbd: `in top kbd `in nested kbd\'\'.

   kbd in @example:

     in example
     `in example in kbd\'.

   kbd in @format:

in format
`in format in kbd\'.
';


$result_converted{'html'}->{'kbd'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>kbd: <code>in kbd</code>.
</p>
<p>kbd in code: <code>in first <kbd>in nested kbd</kbd></code>.
</p>
<p>kbd in kbd: <kbd>in top kbd <kbd>in nested kbd</kbd></kbd>.
</p>
<p>kbd in @example:
</p>
<div class="example">
<pre class="example">in example
<code>in example in kbd</code>.
</pre></div>

<p>kbd in @format:
</p>
<div class="format">
<pre class="format">in format
<code>in format in kbd</code>.
</pre></div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'kbd'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
