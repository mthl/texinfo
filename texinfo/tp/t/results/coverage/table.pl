use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'asis',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'space_at_end_block_command'
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'table item'
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
          'cmdname' => 'item',
          'parent' => {}
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
                  'text' => 'table itemx'
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
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
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
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'index entry'
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
              'cmdname' => 'cindex',
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 11,
                'macro' => ''
              },
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'vtable item'
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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'key'
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
          'cmdname' => 'kindex',
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
          },
          'parent' => {}
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
                  'text' => 'itemx vtable'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
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
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'table'}{'contents'}[0]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[2];
$result_trees{'table'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[1]{'contents'}[4];
$result_trees{'table'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'table'}{'contents'}[1];
$result_trees{'table'}{'contents'}[1]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[2]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[3]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[1];
$result_trees{'table'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[2];
$result_trees{'table'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[3];
$result_trees{'table'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'table'}{'contents'}[4]{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'table'}{'contents'}[4];
$result_trees{'table'}{'contents'}[4]{'parent'} = $result_trees{'table'};
$result_trees{'table'}{'contents'}[5]{'parent'} = $result_trees{'table'};

$result_texis{'table'} = '
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


$result_texts{'table'} = '
table item
table itemx

In table


vtable item
itemx vtable

';

$result_errors{'table'} = [];


1;
