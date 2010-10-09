use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'table'} = {
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
              'cmdname' => 'asis',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'table',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'table item
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'item',
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'table itemx
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'itemx',
          'parent' => {}
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
              'text' => 'In table
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
              'cmdname' => 'samp',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' samp
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'vtable',
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' after vtable
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'index entry
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
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'vtable item
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'item',
          'parent' => {}
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' after item
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'key
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'kindex',
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'itemx vtable '
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' comment in itemx line
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
          'cmdname' => 'itemx',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'remaining_args' => 0
    }
  ]
};
$result_trees{'table'}{'contents'}[0]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[4];
$result_trees{'table'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[2]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[1];
$result_trees{'table'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[2];
$result_trees{'table'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[3]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[3]{'contents'}[4];
$result_trees{'table'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'table'}{'contents'}[3];
$result_trees{'table'}{'contents'}[3]{'parent'} = $result_trees{'table'};

$result_texts{'table'} = '
@table @asis
@item table item
@itemx table itemx

In table
@end table

@vtable @samp@c samp
@c after vtable
@cindex index entry

@item vtable item
@c after item
@kindex key
@itemx itemx vtable @comment comment in itemx line

@end vtable
';

$result_errors{'table'} = [];


