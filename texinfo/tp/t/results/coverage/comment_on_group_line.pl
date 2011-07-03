use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements);

use utf8;

$result_trees{'comment_on_group_line'} = {
  'contents' => [
    {
      'cmdname' => 'group',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in group.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'group'
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
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'group',
            'text_arg' => 'group'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'comment_on_group_line'}{'contents'}[0];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'comment_on_group_line'}{'contents'}[0]{'contents'}[3];
$result_trees{'comment_on_group_line'}{'contents'}[0]{'parent'} = $result_trees{'comment_on_group_line'};

$result_texis{'comment_on_group_line'} = '@group @c comment
in group.
@end group
';


$result_texts{'comment_on_group_line'} = 'in group.
';

$result_errors{'comment_on_group_line'} = [];



$result_converted{'plaintext'}->{'comment_on_group_line'} = 'in group.
';

1;
