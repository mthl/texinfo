use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'reference_to_external_manual'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'text_root'
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
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
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
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '(info)'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'info'
                    }
                  ]
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
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
                'line_nr' => 6,
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
            'line_nr' => 4,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'reference_to_external_manual'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'};
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'reference_to_external_manual'}{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'reference_to_external_manual'}{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'reference_to_external_manual'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'reference_to_external_manual'}{'contents'}[1]{'parent'} = $result_trees{'reference_to_external_manual'};

$result_texis{'reference_to_external_manual'} = '
@node Top

@menu
* (info)::
@end menu
';


$result_texts{'reference_to_external_manual'} = '

* (info)::
';

$result_sectioning{'reference_to_external_manual'} = {};

$result_nodes{'reference_to_external_manual'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'info'
        }
      ]
    }
  },
  'menus' => [
    {
      'cmdname' => 'menu',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'menu',
            'text_arg' => 'menu'
          }
        }
      }
    }
  ],
  'node_next' => {},
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ]
    }
  }
};
$result_nodes{'reference_to_external_manual'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'reference_to_external_manual'}{'menus'}[0];
$result_nodes{'reference_to_external_manual'}{'node_next'} = $result_nodes{'reference_to_external_manual'}{'menu_child'};

$result_menus{'reference_to_external_manual'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'info'
        }
      ]
    }
  }
};

$result_errors{'reference_to_external_manual'} = [];



$result_converted{'plaintext'}->{'reference_to_external_manual'} = '* Menu:

* (info)::
';

1;
