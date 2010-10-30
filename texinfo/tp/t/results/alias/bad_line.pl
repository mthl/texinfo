use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'bad_line'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'garbage-on-line =cmd garbage'
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
      'cmdname' => 'alias',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'garbage-on-line =cmd '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in code'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
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
      'cmdname' => 'alias',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'bad_line'}{'contents'}[0]{'parent'} = $result_trees{'bad_line'};
$result_trees{'bad_line'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[1]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_line'}{'contents'}[1]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_line'}{'contents'}[1]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[1];
$result_trees{'bad_line'}{'contents'}[1]{'parent'} = $result_trees{'bad_line'};
$result_trees{'bad_line'}{'contents'}[2]{'parent'} = $result_trees{'bad_line'};
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'bad_line'}{'contents'}[3]{'args'}[0];
$result_trees{'bad_line'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'bad_line'}{'contents'}[3];
$result_trees{'bad_line'}{'contents'}[3]{'parent'} = $result_trees{'bad_line'};

$result_texis{'bad_line'} = '
@alias garbage-on-line =cmd garbage

@alias garbage-on-line =cmd @code{in code}
';


$result_texts{'bad_line'} = '

';

$result_errors{'bad_line'} = [
  {
    'error_line' => ':2: Bad argument to @alias
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Bad argument to @alias',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Superfluous argument to @alias
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Superfluous argument to @alias',
    'type' => 'error'
  },
  {
    'error_line' => ':4: Bad argument to @alias
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Bad argument to @alias',
    'type' => 'error'
  }
];


1;
