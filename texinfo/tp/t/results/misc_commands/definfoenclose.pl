use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'definfoenclose'} = {
  'contents' => [
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
          'text' => 'definfoenclose phoo,//,\\  '
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
                  'text' => 'phoo,//,\\
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'definfoenclose',
          'parent' => {},
          'special' => {
            'misc_args' => [
              'phoo',
              '//',
              '\\'
            ]
          }
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bar'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'phoo',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => '//',
            'end' => '\\'
          },
          'type' => 'definfoenclose_command'
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
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'definfoenclose phi,:,:  '
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
                  'text' => 'phi,:,:
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'definfoenclose',
          'parent' => {},
          'special' => {
            'misc_args' => [
              'phi',
              ':',
              ':'
            ]
          }
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
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bar'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'phi',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => ':',
            'end' => ':'
          },
          'type' => 'definfoenclose_command'
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
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'very strong'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'strong',
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
      'type' => 'empty_line'
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
              'text' => 'strong,(strong:,:)
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'definfoenclose',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'strong',
          '(strong:',
          ':)'
        ]
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' is it really strong? '
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'strong',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0,
          'special' => {
            'begin' => '(strong:',
            'end' => ':)'
          },
          'type' => 'definfoenclose_command'
        },
        {
          'parent' => {},
          'text' => '
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'definfoenclose'}{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[1];
$result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1];
$result_trees{'definfoenclose'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[1];
$result_trees{'definfoenclose'}{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[2]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[0];
$result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[3];
$result_trees{'definfoenclose'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[3];
$result_trees{'definfoenclose'}{'contents'}[3]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[4]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[5];
$result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1];
$result_trees{'definfoenclose'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[5];
$result_trees{'definfoenclose'}{'contents'}[5]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[6]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[0];
$result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[7];
$result_trees{'definfoenclose'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[7];
$result_trees{'definfoenclose'}{'contents'}[7]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[8]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[0];
$result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[9];
$result_trees{'definfoenclose'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[9];
$result_trees{'definfoenclose'}{'contents'}[9]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[10]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[11]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[11]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[11];
$result_trees{'definfoenclose'}{'contents'}[11]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[12]{'parent'} = $result_trees{'definfoenclose'};
$result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[0];
$result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[13];
$result_trees{'definfoenclose'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose'}{'contents'}[13];
$result_trees{'definfoenclose'}{'contents'}[13]{'parent'} = $result_trees{'definfoenclose'};

$result_texis{'definfoenclose'} = '
definfoenclose phoo,//,\\  @definfoenclose phoo,//,\\

@phoo{bar}

definfoenclose phi,:,:  @definfoenclose phi,:,:

@phi{bar}

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }
';


$result_texts{'definfoenclose'} = '
definfoenclose phoo,//,\\  
bar

definfoenclose phi,:,:  
bar

very strong


 is it really strong? 
';

$result_errors{'definfoenclose'} = [
  {
    'error_line' => ':2: warning: @definfoenclose should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@definfoenclose should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':6: warning: @definfoenclose should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@definfoenclose should only appear at a line beginning',
    'type' => 'warning'
  }
];


