use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'accent_argument'} = {
  'contents' => [
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
              'cmdname' => '~',
              'parent' => {},
              'type' => 'command_as_argument'
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
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'itemize',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ]
      },
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
              'cmdname' => '~',
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ]
      },
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
$result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[0];
$result_trees{'accent_argument'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'accent_argument'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[0]{'parent'} = $result_trees{'accent_argument'};
$result_trees{'accent_argument'}{'contents'}[1]{'parent'} = $result_trees{'accent_argument'};
$result_trees{'accent_argument'}{'contents'}[2]{'parent'} = $result_trees{'accent_argument'};
$result_trees{'accent_argument'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'args'}[0];
$result_trees{'accent_argument'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3];
$result_trees{'accent_argument'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3];
$result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'accent_argument'}{'contents'}[3];
$result_trees{'accent_argument'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'accent_argument'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'accent_argument'}{'contents'}[3]{'parent'} = $result_trees{'accent_argument'};
$result_trees{'accent_argument'}{'contents'}[4]{'parent'} = $result_trees{'accent_argument'};

$result_texis{'accent_argument'} = '@itemize @~@comment
@item item
@end itemize

@itemize @~
@item item
@end itemize
';


$result_texts{'accent_argument'} = 'item

item
';

$result_errors{'accent_argument'} = [];


1;
