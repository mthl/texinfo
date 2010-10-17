use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'menu_entry_no_entry'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '* a1:
'
            },
            {
              'parent' => {},
              'text' => '* a2:  
'
            },
            {
              'parent' => {},
              'text' => '* a1c:'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' c
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '* a2c:  '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' c
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '* a4'
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
              'cmdname' => 'b',
              'contents' => [],
              'parent' => {},
              'remaining_args' => 0
            },
            {
              'parent' => {},
              'text' => ': 
'
            },
            {
              'parent' => {},
              'text' => '* a5'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'b'
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
              'text' => ': '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' c
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
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
  ]
};
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[10];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[12];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'};
$result_trees{'menu_entry_no_entry'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'};

$result_texis{'menu_entry_no_entry'} = '@menu
* a1:
* a2:  
* a1c:@c c
* a2c:  @c c
* a4@b{a}: 
* a5@b{b}: @c c
@end menu
';


$result_texts{'menu_entry_no_entry'} = '* a1:
* a2:  
* a1c:* a2c:  * a4a: 
* a5b: ';

$result_errors{'menu_entry_no_entry'} = [];


