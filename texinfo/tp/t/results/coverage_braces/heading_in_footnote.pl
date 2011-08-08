use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'heading_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'T'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'AAA
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
                          'text' => 'H1'
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
                  'cmdname' => 'heading',
                  'extra' => {
                    'misc_content' => [
                      {}
                    ]
                  },
                  'level' => 2,
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 3,
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
                          'text' => 'ind e'
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
                  'cmdname' => 'cindex',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'cindex',
                      'index_name' => 'cp',
                      'index_prefix' => 'c',
                      'key' => 'ind e',
                      'number' => 1
                    },
                    'misc_content' => []
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 4,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'BBB
'
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
            'line_nr' => 1,
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_footnote'}{'contents'}[0];
$result_trees{'heading_in_footnote'}{'contents'}[0]{'parent'} = $result_trees{'heading_in_footnote'};

$result_texis{'heading_in_footnote'} = 'T@footnote{
AAA
@heading H1
@cindex ind e
BBB
}
';


$result_texts{'heading_in_footnote'} = 'T
';

$result_errors{'heading_in_footnote'} = [
  {
    'error_line' => ':4: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'heading_in_footnote'} = 'T(1)

   ---------- Footnotes ----------

   (1) AAA

H1
==

BBB

';


$result_converted{'html'}->{'heading_in_footnote'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p>T<a name="DOCF1" href="#FOOT1">(1)</a>
</p><div class="footnote">
<hr>
<h3 class="footnote">Footnotes</h3>

<h3><a name="FOOT1" href="#DOCF1">(1)</a></h3>
<p>AAA
</p><a name="H1"></a>
<h2 class="heading">H1</h2>
<a name="index-ind-e"></a>
<p>BBB
</p>
</div>
<p>


</p>
</body>
</html>
';

$result_converted_errors{'html'}->{'heading_in_footnote'} = [
  {
    'error_line' => 'warning: Must specify a title with a title command or @top
',
    'text' => 'Must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
