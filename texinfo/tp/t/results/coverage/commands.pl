use vars qw(%result_texis %result_trees %result_errors);

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
          'contents' => [],
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
                  'contents' => [],
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => '^',
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
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'parent' => {},
          'special' => {
            'spaces' => ' '
          }
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
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
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
              'text' => 'index entry in text '
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
              'contents' => [],
              'parent' => {}
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
      'cmdname' => 'cindex',
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
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'args'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[0]{'contents'}[13];
$result_trees{'commands'}{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'commands'}{'contents'}[0];
$result_trees{'commands'}{'contents'}[0]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[1]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands'}{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[2];
$result_trees{'commands'}{'contents'}[2]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[3]{'parent'} = $result_trees{'commands'};
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands'}{'contents'}[4]{'args'}[0];
$result_trees{'commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'commands'}{'contents'}[4];
$result_trees{'commands'}{'contents'}[4]{'parent'} = $result_trees{'commands'};

$result_texis{'commands'} = '@@ @TeX{} @
@"e @^{@dotless{i}} @~{a} @ringaccent a
@email{a, b}

@cindex index entry in text @LaTeX{}

@majorheading majorheading @b{in b}
';

$result_errors{'commands'} = [];


