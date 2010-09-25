use vars qw(%result_texts %result_trees %result_errors);

################ commands
$result_trees{'commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'TeX',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'cmdname' => '
',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'e'
            }
          ],
          'cmdname' => '"',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' '
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
                          'text' => 'i'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'dotless',
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '^',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '~',
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
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'email',
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
          'text' => ' index entry in text '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'LaTeX',
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
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'majorheading '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in b'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'b',
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
      'cmdname' => 'majorheading',
      'parent' => {}
    }
  ]
};
$result_trees{'commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[5];
$result_trees{'commands'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[7];
$result_trees{'commands'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[9]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[9];
$result_trees{'commands'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[11];
$result_trees{'commands'}{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[1]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'contents'}[1];
$result_trees{'commands'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[3]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4];
$result_trees{'commands'}{'contents'}[4]{'parent'} = $result_trees{'commands'};

$result_texts{'commands'} = '@@ @TeX{} @
@"e @^{@dotless{i}} @~{a} @ringaccent a
@email{a, b}

 index entry in text @LaTeX{}

@majorheading majorheading @b{in b}
';

$result_errors{'commands'} = [];



1;
