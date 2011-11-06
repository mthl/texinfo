use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'tex_expanded_in_copying'} = {
  'contents' => [
    {
      'cmdname' => 'copying',
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
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'aa',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
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
                  'text' => 'copying'
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
            'command_argument' => 'copying',
            'text_arg' => 'copying'
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'contents'}[3];
$result_trees{'tex_expanded_in_copying'}{'contents'}[0]{'parent'} = $result_trees{'tex_expanded_in_copying'};

$result_texis{'tex_expanded_in_copying'} = '@copying
@tex
aa
@end tex
@end copying
';


$result_texts{'tex_expanded_in_copying'} = '';

$result_errors{'tex_expanded_in_copying'} = [];



$result_converted{'html'}->{'tex_expanded_in_copying'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- aa -->
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="tp">
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
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'tex_expanded_in_copying'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
