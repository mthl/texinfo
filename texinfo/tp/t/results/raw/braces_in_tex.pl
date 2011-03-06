use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'braces_in_tex'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => '$$ 
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '\\chi^2 = \\sum_{i=1}^N
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '\\left(y_i - (a + b x_i)
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '\\over \\sigma_i\\right)^2 
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '$$
',
          'type' => 'raw'
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'cmdname' => 'tex',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'parent' => {},
                  'text' => '$$ 
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '\\chi^2 = \\sum_{i=1}^N
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '\\left(y_i - (a + b x_i)
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '\\over \\sigma_i\\right)^2 
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '$$
',
                  'type' => 'raw'
                }
              ],
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
        'line_nr' => 11,
        'macro' => ''
      },
      'parent' => {}
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
$result_trees{'braces_in_tex'}{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[2]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[3]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[4]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'extra'}{'command'} = $result_trees{'braces_in_tex'}{'contents'}[5];
$result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'braces_in_tex'}{'contents'}[5];
$result_trees{'braces_in_tex'}{'contents'}[5]{'extra'}{'end_command'} = $result_trees{'braces_in_tex'}{'contents'}[5]{'contents'}[2];
$result_trees{'braces_in_tex'}{'contents'}[5]{'parent'} = $result_trees{'braces_in_tex'};
$result_trees{'braces_in_tex'}{'contents'}[6]{'parent'} = $result_trees{'braces_in_tex'};

$result_texis{'braces_in_tex'} = '
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex


@example
@tex
$$ 
\\chi^2 = \\sum_{i=1}^N
\\left(y_i - (a + b x_i)
\\over \\sigma_i\\right)^2 
$$
@end tex
@end example

';


$result_texts{'braces_in_tex'} = '



';

$result_errors{'braces_in_tex'} = [];



$result_converted{'plaintext'}->{'braces_in_tex'} = '
';

1;
