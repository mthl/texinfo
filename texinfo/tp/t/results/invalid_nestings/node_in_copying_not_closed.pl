use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'node_in_copying_not_closed'} = {
  'contents' => [
    {
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
                  'text' => 'This is an unterminatted copyright notice
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
          'parent' => {}
        }
      ],
      'type' => 'text_root'
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
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {},
      'special' => {
        'node_content' => [],
        'normalized' => 'Top'
      }
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
              'text' => 'Top section'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'insertcopying',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'};
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'special'}{'node_content'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'};
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'};

$result_texis{'node_in_copying_not_closed'} = '@copying

This is an unterminatted copyright notice


@end copying@node Top
@top Top section

@insertcopying
';


$result_texts{'node_in_copying_not_closed'} = 'Top section


';

$result_sectioning{'node_in_copying_not_closed'} = {
  'childs' => [
    {
      'level' => 0,
      'up' => {}
    }
  ],
  'level' => -1,
  'text' => '_ROOT'
};
$result_sectioning{'node_in_copying_not_closed'}{'childs'}[0]{'up'} = $result_sectioning{'node_in_copying_not_closed'};
$result_errors{'node_in_copying_not_closed'} = [
  {
    'error_line' => ':6: No matching `@end copying\'
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'No matching `@end copying\'',
    'type' => 'error'
  }
];


1;
