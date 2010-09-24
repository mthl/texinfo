use vars qw(%result_texts %result_trees %result_errors);

################ simple
$result_trees{'simple'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '  }   .  ',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'parent' => {},
          'remaining_args' => 0,
          'type' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '@verb{.  }   .  .}';

$result_errors{'simple'} = [];


################ multiline
$result_trees{'multiline'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'qdsqsddqsdsq
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'parent' => {},
          'remaining_args' => 0,
          'type' => '@'
        },
        {
          'parent' => {},
          'text' => 'after verb.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0]{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'multiline'}{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'multiline'}{'contents'}[0];
$result_trees{'multiline'}{'contents'}[0]{'parent'} = $result_trees{'multiline'};

$result_texts{'multiline'} = '@verb{@
qdsqsddqsdsq

@}after verb.';

$result_errors{'multiline'} = [];


################ nested
$result_trees{'nested'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in b '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' in verb { } ',
                          'type' => 'raw'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'verb',
                  'parent' => {},
                  'remaining_args' => 0,
                  'type' => '/'
                },
                {
                  'parent' => {},
                  'text' => ' in b end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'b',
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'parent'} = $result_trees{'nested'};

$result_texts{'nested'} = '@b{in b @verb{/ in verb { } /} in b end}';

$result_errors{'nested'} = [];


################ comments
$result_trees{'comments'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' comment @c comment
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'in a verb ',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'parent' => {},
          'remaining_args' => 0,
          'type' => 'a'
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
          'text' => 'something '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' in verb',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'parent' => {},
          'remaining_args' => 0,
          'type' => ','
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' other comment',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'comments'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'parent'} = $result_trees{'comments'};
$result_trees{'comments'}{'contents'}[1]{'parent'} = $result_trees{'comments'};
$result_trees{'comments'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[1];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[3];
$result_trees{'comments'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'parent'} = $result_trees{'comments'};

$result_texts{'comments'} = '@verb{a comment @c comment
in a verb a}@c comment

something @verb{, in verb,} @c other comment';

$result_errors{'comments'} = [];


################ end_of_line
$result_trees{'end_of_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'verb at end of line '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '@{ in verb at end of line @c comment
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'and now end',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'parent' => {},
          'remaining_args' => 0,
          'type' => ''
        },
        {
          'parent' => {},
          'text' => 'after end.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'parent'} = $result_trees{'end_of_line'};

$result_texts{'end_of_line'} = 'verb at end of line @verb{

@{ in verb at end of line @c comment
and now end}after end.';

$result_errors{'end_of_line'} = [
  {
    'error_line' => ':1: @verb without associated character
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@verb without associated character',
    'type' => 'error'
  }
];



1;
