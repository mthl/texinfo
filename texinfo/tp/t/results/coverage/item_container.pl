use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'item_container'} = {
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
              'text' => '+
'
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
                  'text' => 'i--tem +
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
      'parent' => {},
      'remaining_args' => 0
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
              'cmdname' => 'bullet',
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'b--ullet
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
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'item_container'}{'contents'}[0]{'parent'} = $result_trees{'item_container'};
$result_trees{'item_container'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[1]{'args'}[0];
$result_trees{'item_container'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[1]{'args'}[0];
$result_trees{'item_container'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[1]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[1]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[1];
$result_trees{'item_container'}{'contents'}[1]{'parent'} = $result_trees{'item_container'};
$result_trees{'item_container'}{'contents'}[2]{'parent'} = $result_trees{'item_container'};
$result_trees{'item_container'}{'contents'}[3]{'parent'} = $result_trees{'item_container'};
$result_trees{'item_container'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'args'}[0];
$result_trees{'item_container'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'args'}[0];
$result_trees{'item_container'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'args'}[0];
$result_trees{'item_container'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[4];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[4];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'item_container'}{'contents'}[4]{'contents'}[1];
$result_trees{'item_container'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'item_container'}{'contents'}[4];
$result_trees{'item_container'}{'contents'}[4]{'parent'} = $result_trees{'item_container'};
$result_trees{'item_container'}{'contents'}[5]{'parent'} = $result_trees{'item_container'};

$result_texis{'item_container'} = '
@itemize +
@item i--tem +
@end itemize

@itemize @bullet
@item
 b--ullet
@end itemize
';


$result_texts{'item_container'} = '
i--tem +

 b--ullet
';

$result_errors{'item_container'} = [];


