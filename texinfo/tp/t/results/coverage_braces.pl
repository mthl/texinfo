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
                  'text' => 'in  b'
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
          'text' => '.'
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
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};

$result_texts{'simple'} = '@b{in  b}.';

$result_errors{'simple'} = [];


################ nested
$result_trees{'nested'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'type the characters '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'l o g o u t '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'RET'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'key',
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'kbd',
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'nested'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested'}{'contents'}[0];
$result_trees{'nested'}{'contents'}[0]{'parent'} = $result_trees{'nested'};

$result_texts{'nested'} = 'type the characters @kbd{l o g o u t @key{RET}}.';

$result_errors{'nested'} = [];


################ nested_args
$result_trees{'nested_args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in samp'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'samp',
                  'parent' => {},
                  'remaining_args' => 0
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'descr '
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
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'xref',
          'parent' => {},
          'remaining_args' => 3
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nested_args'}{'contents'}[0]{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_args'}{'contents'}[0];
$result_trees{'nested_args'}{'contents'}[0]{'parent'} = $result_trees{'nested_args'};

$result_texts{'nested_args'} = '@xref{@@ @samp{in samp}, descr @b{in b}}';

$result_errors{'nested_args'} = [];


################ too much args
$result_trees{'too much args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'AZE'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'A truc Z b, E eep'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'abbr',
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'too much args'}{'contents'}[0]{'contents'}[0];
$result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'too much args'}{'contents'}[0]{'contents'}[0];
$result_trees{'too much args'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'too much args'}{'contents'}[0];
$result_trees{'too much args'}{'contents'}[0]{'parent'} = $result_trees{'too much args'};

$result_texts{'too much args'} = '@abbr{AZE, A truc Z b, E eep}';

$result_errors{'too much args'} = [];



1;
