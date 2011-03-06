use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'paragraph_in_cells'} = {
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'AAA'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '  '
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'BBB'
                }
              ],
              'parent' => {},
              'type' => 'bracketed'
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
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [
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
                      'text' => 'truc '
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 1
              },
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'bidule
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 2
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'row_number' => 1
          },
          'parent' => {},
          'type' => 'row'
        },
        {
          'contents' => [
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
                      'text' => 'begin item
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
                      'text' => 'new paragraph in item.
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
                }
              ],
              'extra' => {
                'cell_number' => 1
              },
              'parent' => {}
            },
            {
              'cmdname' => 'tab',
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
                      'text' => 'begin tab
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
                      'text' => 'new paragraph in tab.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'cell_number' => 2
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'row_number' => 2
          },
          'parent' => {},
          'type' => 'row'
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
                  'text' => 'multitable'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'multitable',
            'text_arg' => 'multitable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'max_columns' => 2,
        'prototypes' => [
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          },
          {
            'contents' => [],
            'parent' => {},
            'type' => 'bracketed_multitable_prototype'
          }
        ]
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
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[2];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'extra'}{'prototypes'}[1]{'contents'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'extra'}{'prototypes'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'};

$result_texis{'paragraph_in_cells'} = '@multitable {AAA}  {BBB}
@item truc @tab bidule
@item begin item

new paragraph in item.

@tab begin tab

new paragraph in tab.
@end multitable';


$result_texts{'paragraph_in_cells'} = 'truc bidule
begin item

new paragraph in item.

begin tab

new paragraph in tab.
';

$result_errors{'paragraph_in_cells'} = [];



$result_converted{'plaintext'}->{'paragraph_in_cells'} = 'truc  bidule
begin begin
item  tab
      
new   new
paragraphparagraph
in    in
item. tab.

';

1;
