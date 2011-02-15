use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'double_copying'} = {
  'contents' => [
    {
      'cmdname' => 'copying',
      'contents' => [
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
              'text' => 'This is a copyright notice
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
          'cmdname' => 'copying',
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
                  'parent' => {},
                  'text' => 'And a second one (?)
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
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
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_copying'}{'contents'}[0]{'contents'}[2];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'double_copying'}{'contents'}[0]{'contents'}[4];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_copying'}{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'double_copying'}{'contents'}[0]{'contents'}[4];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'double_copying'}{'contents'}[0];
$result_trees{'double_copying'}{'contents'}[0]{'parent'} = $result_trees{'double_copying'};
$result_trees{'double_copying'}{'contents'}[1]{'parent'} = $result_trees{'double_copying'};

$result_texis{'double_copying'} = '@copying

This is a copyright notice

@copying
And a second one (?)
@end copying
@end copying
';


$result_texts{'double_copying'} = '';

$result_errors{'double_copying'} = [
  {
    'error_line' => ':5: Region copying inside region copying is not allowed
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Region copying inside region copying is not allowed',
    'type' => 'error'
  },
  {
    'error_line' => ':5: warning: Multiple @copying
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Multiple @copying',
    'type' => 'warning'
  }
];


1;
