use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty_comment'} = {
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
                      'text' => ' '
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'columnfractions',
              'parent' => {},
              'special' => {}
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
        'max_columns' => 0
      }
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'parent'} = $result_trees{'empty_comment'};
$result_trees{'empty_comment'}{'contents'}[1]{'parent'} = $result_trees{'empty_comment'};

$result_texts{'empty_comment'} = '@multitable @columnfractions @c
@end multitable';

$result_errors{'empty_comment'} = [
  {
    'error_line' => ':1: Empty @columnfractions
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Empty @columnfractions',
    'type' => 'error'
  }
];


