use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'displaymath'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Simple
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => '--{x^i}\\over{\\tan y}',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {},
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
',
      'type' => 'empty_line_after_command'
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
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => '@code{math code} a < b \\sum@sub{i} q@sup{2}',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {},
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => ' \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {},
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
          'text' => 'With a comment
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
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
          'text' => '@c comment in displaymath
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'a/2',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'extra' => {},
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 17,
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
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'displaymath'}{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[1]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[2]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[3]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[4]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[5]{'contents'}[0]{'extra'}{'command'} = $result_trees{'displaymath'}{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[5]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[6]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[7]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[8];
$result_trees{'displaymath'}{'contents'}[8]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[9]{'contents'}[0]{'extra'}{'command'} = $result_trees{'displaymath'}{'contents'}[9];
$result_trees{'displaymath'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[9];
$result_trees{'displaymath'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[9];
$result_trees{'displaymath'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[9];
$result_trees{'displaymath'}{'contents'}[9]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[10]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[11]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[12];
$result_trees{'displaymath'}{'contents'}[12]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[13]{'contents'}[0]{'extra'}{'command'} = $result_trees{'displaymath'}{'contents'}[13];
$result_trees{'displaymath'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[13];
$result_trees{'displaymath'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[13];
$result_trees{'displaymath'}{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[13];
$result_trees{'displaymath'}{'contents'}[13]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[13];
$result_trees{'displaymath'}{'contents'}[13]{'parent'} = $result_trees{'displaymath'};
$result_trees{'displaymath'}{'contents'}[14]{'parent'} = $result_trees{'displaymath'};

$result_texis{'displaymath'} = 'Simple
@displaymath
--{x^i}\\over{\\tan y}
@end displaymath

Math with @@-command
@displaymath
@code{math code} a < b \\sum@sub{i} q@sup{2}
@end displaymath

Complex
@displaymath
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
@end displaymath

With a comment
@displaymath
@c comment in displaymath
a/2
@end displaymath
';


$result_texts{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

Math with @-command
@code{math code} a < b \\sum@sub{i} q@sup{2}

Complex
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}

With a comment
@c comment in displaymath
a/2
';

$result_errors{'displaymath'} = [];


$result_floats{'displaymath'} = {};



$result_converted{'plaintext'}->{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

   Math with @-command
@code{math code} a < b \\sum@sub{i} q@sup{2}

   Complex
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}

   With a comment
@c comment in displaymath
a/2
';


$result_converted{'html_text'}->{'displaymath'} = '<p>Simple
</p><div class="displaymath"><em>--{x^i}\\over{\\tan y}
</em></div>
<p>Math with @-command
</p><div class="displaymath"><em>@code{math code} a &lt; b \\sum@sub{i} q@sup{2}
</em></div>
<p>Complex
</p><div class="displaymath"><em> \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
</em></div>
<p>With a comment
</p><div class="displaymath"><em>@c comment in displaymath
a/2
</em></div>';


$result_converted{'xml'}->{'displaymath'} = '<para>Simple
</para><displaymath>
--{x^i}\\over{\\tan y}
</displaymath>

<para>Math with &arobase;-command
</para><displaymath>
@code{math code} a &lt; b \\sum@sub{i} q@sup{2}
</displaymath>

<para>Complex
</para><displaymath>
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
</displaymath>

<para>With a comment
</para><displaymath>
@c comment in displaymath
a/2
</displaymath>
';


$result_converted{'docbook'}->{'displaymath'} = '<para>Simple
</para><informalequation><mathphrase>--{x^i}\\over{\\tan y}
</mathphrase></informalequation>
<para>Math with @-command
</para><informalequation><mathphrase>@code{math code} a &lt; b \\sum@sub{i} q@sup{2}
</mathphrase></informalequation>
<para>Complex
</para><informalequation><mathphrase> \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
</mathphrase></informalequation>
<para>With a comment
</para><informalequation><mathphrase>@c comment in displaymath
a/2
</mathphrase></informalequation>';

1;
