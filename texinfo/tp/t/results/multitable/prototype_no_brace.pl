use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'prototype_no_brace'} = {
  'contents' => [
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
              'text' => 'aa'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'FF'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'var',
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
              'text' => ' b    cc
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
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
                  'text' => 'multitable'
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
            'command_argument' => 'multitable',
            'text_arg' => 'multitable'
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
        'end_command' => {},
        'max_columns' => 4,
        'prototypes' => [
          {
            'text' => 'aa',
            'type' => 'row_prototype'
          },
          {},
          {
            'text' => 'b',
            'type' => 'row_prototype'
          },
          {
            'text' => 'cc',
            'type' => 'row_prototype'
          }
        ]
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'prototype_no_brace'}{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'prototype_no_brace'}{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'prototype_no_brace'}{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'contents'}[0];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'extra'}{'prototypes'}[1] = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'prototype_no_brace'}{'contents'}[0]{'line_nr'} = $result_trees{'prototype_no_brace'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'prototype_no_brace'}{'contents'}[0]{'parent'} = $result_trees{'prototype_no_brace'};

$result_texis{'prototype_no_brace'} = '@multitable aa@var{FF} b    cc
@end multitable
';


$result_texts{'prototype_no_brace'} = '';

$result_errors{'prototype_no_brace'} = [];



$result_converted{'plaintext'}->{'prototype_no_brace'} = '';

1;
