use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'node'} = {
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
              'text' => 'one arg 
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 4
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
              'text' => 'one arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'two arg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 3
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
              'text' => 'one arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'two arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'three arg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 2
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
              'text' => 'one arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'two arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'three arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'four arg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 1
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
              'text' => 'one arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'two arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'three arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'four arg'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'five arg
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 0
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
              'text' => 'comment '
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
              'cmdname' => 'comment',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 4
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
              'text' => 'arg1 '
            },
            {
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'comma',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' arg2'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'c'
                }
              ],
              'cmdname' => ',',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'edilla'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'comma in strong,'
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
              'text' => ' '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comma , end
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
      'cmdname' => 'node',
      'parent' => {},
      'remaining_args' => 2
    }
  ]
};
$result_trees{'node'}{'contents'}[0]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[1];
$result_trees{'node'}{'contents'}[1]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[0];
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[0];
$result_trees{'node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[2];
$result_trees{'node'}{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2]{'args'}[1];
$result_trees{'node'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[2];
$result_trees{'node'}{'contents'}[2]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[0];
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[0];
$result_trees{'node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[1];
$result_trees{'node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[3]{'args'}[2];
$result_trees{'node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[3];
$result_trees{'node'}{'contents'}[3]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[0];
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[0];
$result_trees{'node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[1];
$result_trees{'node'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[2];
$result_trees{'node'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[4]{'args'}[3];
$result_trees{'node'}{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'node'}{'contents'}[4];
$result_trees{'node'}{'contents'}[4]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[0];
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[0];
$result_trees{'node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[1];
$result_trees{'node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[2];
$result_trees{'node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[3];
$result_trees{'node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[5]{'args'}[4];
$result_trees{'node'}{'contents'}[5]{'args'}[4]{'parent'} = $result_trees{'node'}{'contents'}[5];
$result_trees{'node'}{'contents'}[5]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[6]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[7]{'args'}[0];
$result_trees{'node'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[7];
$result_trees{'node'}{'contents'}[7]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[8]{'parent'} = $result_trees{'node'};
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[0];
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[0];
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[2];
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[0];
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[0];
$result_trees{'node'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9];
$result_trees{'node'}{'contents'}[9]{'args'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'node'}{'contents'}[9]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[1];
$result_trees{'node'}{'contents'}[9]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[1];
$result_trees{'node'}{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'node'}{'contents'}[9];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[1];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[2]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[3];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'contents'}[3]{'parent'} = $result_trees{'node'}{'contents'}[9]{'args'}[2];
$result_trees{'node'}{'contents'}[9]{'args'}[2]{'parent'} = $result_trees{'node'}{'contents'}[9];
$result_trees{'node'}{'contents'}[9]{'parent'} = $result_trees{'node'};

$result_texis{'node'} = '
@node one arg 
@node one arg, two arg
@node one arg, two arg, three arg
@node one arg, two arg, three arg, four arg
@node one arg, two arg, three arg, four arg, five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
';

$result_errors{'node'} = [];


