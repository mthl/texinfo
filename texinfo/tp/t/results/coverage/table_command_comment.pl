use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'table_command_comment'} = {
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
              'cmdname' => 'code',
              'parent' => {},
              'type' => 'command_as_argument'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' in comment
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
                  'text' => 'item'
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
        }
      ],
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'table_command_comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'}{'contents'}[0];
$result_trees{'table_command_comment'}{'contents'}[0]{'parent'} = $result_trees{'table_command_comment'};
$result_trees{'table_command_comment'}{'contents'}[1]{'parent'} = $result_trees{'table_command_comment'};

$result_texis{'table_command_comment'} = '@table @code@c in comment
@item item
@end table';


$result_texts{'table_command_comment'} = 'item
';

$result_errors{'table_command_comment'} = [];


