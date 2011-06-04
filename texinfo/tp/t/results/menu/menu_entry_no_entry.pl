use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'menu_entry_no_entry'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
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
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 6,
                    'macro' => ''
                  },
                  'parent' => {}
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
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 7,
                    'macro' => ''
                  },
                  'parent' => {}
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
              'type' => 'preformatted'
            }
          ],
          'parent' => {},
          'type' => 'menu_comment'
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
                  'text' => 'menu'
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
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
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
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[10]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[12];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'menu_entry_no_entry'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_no_entry'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_no_entry'};

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

$result_errors{'menu_entry_no_entry'} = [
  {
    'error_line' => ':1: @menu seen before first @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@menu seen before first @node',
    'type' => 'error'
  },
  {
    'error_line' => ':1: perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'perhaps your @top node should be wrapped in @ifnottex rather than @ifinfo?',
    'type' => 'error continuation'
  }
];



$result_converted{'plaintext'}->{'menu_entry_no_entry'} = '* Menu:

* a1:
* a2:
* a1c:* a2c:  * a4a:
* a5b: 
';

1;
