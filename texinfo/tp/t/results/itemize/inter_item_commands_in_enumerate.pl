use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'inter_item_commands_in_enumerate'} = {
  'contents' => [
    {
      'cmdname' => 'enumerate',
      'contents' => [
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
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
                  'parent' => {},
                  'text' => ' comment before first item in enumerate
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'comment',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'e--numerate
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
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
                  'text' => 'enumerate'
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
            'command_argument' => 'enumerate',
            'text_arg' => 'enumerate'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'enumerate_specification' => 1
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
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'contents'}[3];
$result_trees{'inter_item_commands_in_enumerate'}{'contents'}[0]{'parent'} = $result_trees{'inter_item_commands_in_enumerate'};

$result_texis{'inter_item_commands_in_enumerate'} = '@enumerate

@comment comment before first item in enumerate
@item e--numerate
@end enumerate
';


$result_texts{'inter_item_commands_in_enumerate'} = '
1. e--numerate
';

$result_errors{'inter_item_commands_in_enumerate'} = [];



$result_converted{'plaintext'}->{'inter_item_commands_in_enumerate'} = '  1. e-numerate
';

1;
