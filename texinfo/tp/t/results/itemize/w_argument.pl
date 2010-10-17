use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'w_argument'} = {
  'contents' => [
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
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'w',
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
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'itemize',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '--build='
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'option',
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 0
                },
                {
                  'parent' => {},
                  'text' => ' platform on which the program is compiled,
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '--target='
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'option',
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 0
                },
                {
                  'parent' => {},
                  'text' => ' target platform on which the program is processed.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        }
      ],
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'w_argument'}{'contents'}[0]{'contents'}[2];
$result_trees{'w_argument'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'w_argument'}{'contents'}[0];
$result_trees{'w_argument'}{'contents'}[0]{'parent'} = $result_trees{'w_argument'};
$result_trees{'w_argument'}{'contents'}[1]{'parent'} = $result_trees{'w_argument'};

$result_texis{'w_argument'} = '@itemize @w{}
@item @option{--build=} platform on which the program is compiled,
@item @option{--target=} target platform on which the program is processed.
@end itemize
';


$result_texts{'w_argument'} = '--build= platform on which the program is compiled,
--target= target platform on which the program is processed.
';

$result_errors{'w_argument'} = [];


