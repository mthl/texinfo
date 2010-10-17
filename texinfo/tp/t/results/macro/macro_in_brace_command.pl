use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_in_brace_command'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'foo-expansion
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' foo
',
        'macrobody' => 'foo-expansion
'
      }
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
      'args' => [
        {
          'parent' => {},
          'text' => 'bar',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'bar-expansion
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bar
',
        'macrobody' => 'bar-expansion
'
      }
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
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'cmdname' => 'bullet',
              'parent' => {},
              'type' => 'command_as_argument'
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
                          'text' => 'foo-expansion'
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'bar-expansion'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'email',
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 1
                },
                {
                  'parent' => {},
                  'text' => ',
'
                },
                {
                  'parent' => {},
                  'text' => '  also helped.
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
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[3];
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[3];
$result_trees{'macro_in_brace_command'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[4]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[5]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'macro_in_brace_command'}{'contents'}[6];
$result_trees{'macro_in_brace_command'}{'contents'}[6]{'parent'} = $result_trees{'macro_in_brace_command'};
$result_trees{'macro_in_brace_command'}{'contents'}[7]{'parent'} = $result_trees{'macro_in_brace_command'};

$result_texis{'macro_in_brace_command'} = '@macro foo
foo-expansion
@end macro

@macro bar
bar-expansion
@end macro

@itemize @bullet
@item @email{foo-expansion@@bar-expansion},
  also helped.
@end itemize
';


$result_texts{'macro_in_brace_command'} = '

foo-expansion@bar-expansion,
  also helped.
';

$result_errors{'macro_in_brace_command'} = [];


