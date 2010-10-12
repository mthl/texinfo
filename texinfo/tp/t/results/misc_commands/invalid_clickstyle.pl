use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'invalid_clickstyle'} = {
  'contents' => [
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
          'text' => '@result',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' @result on the same line
'
      }
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
          'text' => 'A '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'click',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' (result on the same line).
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
      'args' => [
        {
          'parent' => {},
          'text' => '@nocmd',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' @nocmd
'
      }
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
          'text' => 'A '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'click',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' (nocmd).
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
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' something
'
      }
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
          'text' => 'A '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'click',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' (something).
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'invalid_clickstyle'}{'contents'}[0]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[1];
$result_trees{'invalid_clickstyle'}{'contents'}[1]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[2]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[3];
$result_trees{'invalid_clickstyle'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[3]{'contents'}[1];
$result_trees{'invalid_clickstyle'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[3];
$result_trees{'invalid_clickstyle'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[3];
$result_trees{'invalid_clickstyle'}{'contents'}[3]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[4]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[5];
$result_trees{'invalid_clickstyle'}{'contents'}[5]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[6]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[7];
$result_trees{'invalid_clickstyle'}{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[7]{'contents'}[1];
$result_trees{'invalid_clickstyle'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[7];
$result_trees{'invalid_clickstyle'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[7];
$result_trees{'invalid_clickstyle'}{'contents'}[7]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[8]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[9]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[10]{'parent'} = $result_trees{'invalid_clickstyle'};
$result_trees{'invalid_clickstyle'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[11];
$result_trees{'invalid_clickstyle'}{'contents'}[11]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[11]{'contents'}[1];
$result_trees{'invalid_clickstyle'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[11];
$result_trees{'invalid_clickstyle'}{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'invalid_clickstyle'}{'contents'}[11];
$result_trees{'invalid_clickstyle'}{'contents'}[11]{'parent'} = $result_trees{'invalid_clickstyle'};

$result_texts{'invalid_clickstyle'} = '
@clickstyle @result on the same line

A @click{} (result on the same line).

@clickstyle @nocmd

A @click{} (nocmd).

@clickstyle something

A @click{} (something).
';

$result_errors{'invalid_clickstyle'} = [
  {
    'error_line' => ':2: warning: Remaining argument on @clickstyle line: on the same line
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Remaining argument on @clickstyle line: on the same line',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: @clickstyle should only accept a @-command as argument, not ` something
\'
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => '@clickstyle should only accept a @-command as argument, not ` something
\'',
    'type' => 'error'
  }
];


