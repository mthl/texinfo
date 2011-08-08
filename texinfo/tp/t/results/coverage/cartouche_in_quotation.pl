use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'cartouche_in_quotation'} = {
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
              'text' => 'In quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'cartouche',
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
                  'text' => 'In cartouche in quotation
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
                      'text' => 'cartouche'
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
                'command_argument' => 'cartouche',
                'text_arg' => 'cartouche'
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
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'end quotation
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[3];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'cartouche_in_quotation'}{'contents'}[0]{'contents'}[4];
$result_trees{'cartouche_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'cartouche_in_quotation'};

$result_texis{'cartouche_in_quotation'} = '@quotation
In quotation
@cartouche
In cartouche in quotation
@end cartouche
end quotation
@end quotation
';


$result_texts{'cartouche_in_quotation'} = 'In quotation
In cartouche in quotation
end quotation
';

$result_errors{'cartouche_in_quotation'} = [];



$result_converted{'plaintext'}->{'cartouche_in_quotation'} = '     In quotation
     In cartouche in quotation
     end quotation
';


$result_converted{'html'}->{'cartouche_in_quotation'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<blockquote>
<p>In quotation
</p><table class="cartouche" border="1"><tr><td>
<p>In cartouche in quotation
</p></td></tr></table>
<p>end quotation
</p></blockquote>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'cartouche_in_quotation'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
