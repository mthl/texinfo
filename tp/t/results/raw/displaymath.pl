use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'displaymath'} = {
  'contents' => [
    {
      'cmdname' => 'displaymath',
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
          'text' => '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS',
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[1]{'parent'} = $result_trees{'displaymath'};

$result_texis{'displaymath'} = '@displaymath
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
@end displaymath
';


$result_texts{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
';

$result_errors{'displaymath'} = [];


$result_floats{'displaymath'} = {};



$result_converted{'file_html'}->{'displaymath'} = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.indentedblock {margin-right: 0em}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
kbd {font-style: oblique}
pre.display {font-family: inherit}
pre.format {font-family: inherit}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
span.nolinebreak {white-space: nowrap}
span.roman {font-family: initial; font-weight: normal}
span.sansserif {font-family: sans-serif; font-weight: normal}
ul.no-bullet {list-style: none}
-->
</style>

<script type=\'text/javascript\'>
MathJax = {
  options: {
    skipHtmlTags: {\'[-]\': [\'pre\']},
    ignoreHtmlClass: \'tex2jax_ignore\',
    processHtmlClass: \'tex2jax_process\'
  },
};
</script><script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>
</head>

<body lang="en" class="tex2jax_ignore">
<em class="tex2jax_process">\\[\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
\\]</em>

<a href=\'js_licenses.html\' rel=\'jslicense\'><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'file_html'}->{'displaymath'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'displaymath'} = '<informalequation><mathphrase>\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</mathphrase></informalequation>';


$result_converted{'plaintext'}->{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
';

1;