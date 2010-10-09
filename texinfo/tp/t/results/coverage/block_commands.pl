use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'block_commands'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'group',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in group
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
              'text' => 'warning
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'quotation',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
              'text' => 'a float'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'b float
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'float',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In float
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in caption
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
                      'text' => 'in caption'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
            }
          ],
          'cmdname' => 'caption',
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
      'remaining_args' => 0
    }
  ]
};
$result_trees{'block_commands'}{'contents'}[0]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[1];
$result_trees{'block_commands'}{'contents'}[1]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[2]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[3]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[4]{'parent'} = $result_trees{'block_commands'};
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'args'}[1];
$result_trees{'block_commands'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'block_commands'}{'contents'}[5]{'contents'}[3];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'block_commands'}{'contents'}[5];
$result_trees{'block_commands'}{'contents'}[5]{'parent'} = $result_trees{'block_commands'};

$result_texts{'block_commands'} = '
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float


@caption{in caption

in caption}
@end float
';

$result_errors{'block_commands'} = [];


