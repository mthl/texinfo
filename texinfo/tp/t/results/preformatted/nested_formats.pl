use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'nested_formats'} = {
  'contents' => [
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'in -- format/example
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
            'line_nr' => 2,
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
            'line_nr' => 7,
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
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'parent' => {},
                  'text' => 'in -- example/format
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
            'line_nr' => 10,
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
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[0];
$result_trees{'nested_formats'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'nested_formats'}{'contents'}[0]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[0]{'parent'} = $result_trees{'nested_formats'};
$result_trees{'nested_formats'}{'contents'}[1]{'parent'} = $result_trees{'nested_formats'};
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'nested_formats'}{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'nested_formats'}{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'nested_formats'}{'contents'}[2]{'contents'}[2];
$result_trees{'nested_formats'}{'contents'}[2]{'parent'} = $result_trees{'nested_formats'};

$result_texis{'nested_formats'} = '@format
@example

in -- format/example

@end example
@end format

@example
@format

in -- example/format

@end format
@end example
';


$result_texts{'nested_formats'} = '
in -- format/example



in -- example/format

';

$result_errors{'nested_formats'} = [];



$result_converted{'plaintext'}->{'nested_formats'} = '
     in -- format/example


     in -- example/format

';


$result_converted{'html'}->{'nested_formats'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="format">
<div class="example">
<pre class="example">
in -- format/example

</pre></div>
</div>

<div class="example">
<div class="format">
<pre class="example">
in -- example/format

</pre></div>
</div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'nested_formats'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
