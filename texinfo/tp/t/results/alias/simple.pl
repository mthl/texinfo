use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'simple'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'myalias = code
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'alias',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'myalias',
          'code'
        ]
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'o-theralias=verb '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
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
      'cmdname' => 'alias',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'o-theralias',
          'verb'
        ]
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Should be code: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'code'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
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
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Should be verb: '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'verb',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'type' => '!'
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'cmdname' => 'code',
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
      'cmdname' => 'table',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'table item (code)
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'item',
          'parent' => {}
        }
      ],
      'parent' => {},
      'remaining_args' => 0
    }
  ]
};
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[1]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'args'}[0];
$result_trees{'simple'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[2]{'args'}[0];
$result_trees{'simple'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[2];
$result_trees{'simple'}{'contents'}[2]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[3]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[4];
$result_trees{'simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'simple'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[4]{'contents'}[1];
$result_trees{'simple'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[4];
$result_trees{'simple'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[4];
$result_trees{'simple'}{'contents'}[4]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[5]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[6];
$result_trees{'simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'simple'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[6]{'contents'}[1];
$result_trees{'simple'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[6];
$result_trees{'simple'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[6];
$result_trees{'simple'}{'contents'}[6]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[7]{'parent'} = $result_trees{'simple'};
$result_trees{'simple'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[8]{'args'}[0];
$result_trees{'simple'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[8]{'args'}[0];
$result_trees{'simple'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[8];
$result_trees{'simple'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[8];
$result_trees{'simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'simple'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[8]{'contents'}[1];
$result_trees{'simple'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[8];
$result_trees{'simple'}{'contents'}[8]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '@alias myalias = code

@alias o-theralias=verb @c comment

Should be code: @code{code}

Should be verb: @verb{!verb!}

@table @code
@item table item (code)
@end table
';

$result_errors{'simple'} = [];


