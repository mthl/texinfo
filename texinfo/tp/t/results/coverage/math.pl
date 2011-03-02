use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'math'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Simple math
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'x^i'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '\\over'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '\\tan y'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
          'contents' => [],
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
          'text' => 'Math with '
        },
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '-command
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'math code'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a < b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
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
          'text' => 'Complex
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => '\\underline'
                },
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'math \\hbox'
                            },
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => ' code '
                                }
                              ],
                              'parent' => {},
                              'type' => 'bracketed'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 8,
                        'macro' => ''
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'cmdname' => '\\',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'i \\sum_'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'i'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '\\underline'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f'
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'math',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
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
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '\\ outside of math
'
        },
        {
          'cmdname' => '\\',
          'parent' => {}
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'math'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[0]{'contents'}[1];
$result_trees{'math'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[0];
$result_trees{'math'}{'contents'}[0]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[1]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3];
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'line_nr'} = $result_trees{'math'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'math'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'math'}{'contents'}[2];
$result_trees{'math'}{'contents'}[2]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[3]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1];
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'line_nr'} = $result_trees{'math'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'line_nr'};
$result_trees{'math'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[4];
$result_trees{'math'}{'contents'}[4]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[5]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'math'}{'contents'}[6];
$result_trees{'math'}{'contents'}[6]{'parent'} = $result_trees{'math'};
$result_trees{'math'}{'contents'}[7]{'parent'} = $result_trees{'math'};

$result_texis{'math'} = 'Simple math
@math{{x^i}\\over{\\tan y}}

Math with @@-command
@math{@code{math code} a < b}

Complex
@math{ \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}}

@@\\ outside of math
@\\

';


$result_texts{'math'} = 'Simple math
{x^i}\\over{\\tan y}

Math with @-command
math code a < b

Complex
\\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

@\\ outside of math
\\

';

$result_errors{'math'} = [
  {
    'error_line' => ':11: warning: @\\ should only appear in math context
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => '@\\ should only appear in math context',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'math'} = 'Simple math {x^i}\\over{\\tan y}

   Math with @-command `math code\' a < b

   Complex \\underline{`math \\hbox{ code }\'} \\i \\sum_{i}{\\underline{f}}

   @\\ outside of math \\

';

1;
