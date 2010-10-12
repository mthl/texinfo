use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'wrong_command'} = {
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
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => '3.4'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'b',
                      'contents' => [],
                      'parent' => {},
                      'remaining_args' => 0
                    },
                    {
                      'parent' => {},
                      'text' => ' 
'
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
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'parent'} = $result_trees{'wrong_command'};
$result_trees{'wrong_command'}{'contents'}[1]{'parent'} = $result_trees{'wrong_command'};

$result_texts{'wrong_command'} = '@multitable @columnfractions @b{3.4} 
@end multitable';

$result_errors{'wrong_command'} = [
  {
    'error_line' => ':1: Bad argument to @columnfractions
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Bad argument to @columnfractions',
    'type' => 'error'
  },
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


