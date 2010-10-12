use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'good'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' '
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
                      'text' => '0.4 .6 5.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'columnfractions',
              'parent' => {},
              'special' => {
                'misc_args' => [
                  '0.4',
                  '.6',
                  '5.'
                ]
              }
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'parent' => {},
      'special' => {
        'max_columns' => 3
      }
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0];
$result_trees{'good'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0];
$result_trees{'good'}{'contents'}[0]{'parent'} = $result_trees{'good'};
$result_trees{'good'}{'contents'}[1]{'parent'} = $result_trees{'good'};

$result_texts{'good'} = '@multitable @columnfractions 0.4 .6 5.
@end multitable';

$result_errors{'good'} = [];


