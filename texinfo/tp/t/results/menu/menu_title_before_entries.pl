use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'menu_title_before_entries'} = {
  'contents' => [
    {
      'contents' => [],
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
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Horizontal space
'
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'subnode'
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
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'subnode'
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
            'line_nr' => 3,
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
        'line_nr' => 1,
        'macro' => ''
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
              'text' => 'subnode'
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
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'subnode'
          }
        ],
        'normalized' => 'subnode'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'menu_title_before_entries'}{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'};
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_title_before_entries'}{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'command'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'menu_title_before_entries'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'menu_title_before_entries'}{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'};
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'menu_title_before_entries'}{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_title_before_entries'}{'contents'}[2];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'menu_title_before_entries'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'menu_title_before_entries'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'menu_title_before_entries'}{'contents'}[2]{'parent'} = $result_trees{'menu_title_before_entries'};

$result_texis{'menu_title_before_entries'} = '@node Top

@menu
Horizontal space
* subnode::
@end menu

@node subnode
';


$result_texts{'menu_title_before_entries'} = '
Horizontal space
* subnode::

';

$result_sectioning{'menu_title_before_entries'} = {};

$result_nodes{'menu_title_before_entries'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'subnode'
    },
    'node_prev' => {},
    'node_up' => {}
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
$result_nodes{'menu_title_before_entries'}{'menu_child'}{'node_prev'} = $result_nodes{'menu_title_before_entries'};
$result_nodes{'menu_title_before_entries'}{'menu_child'}{'node_up'} = $result_nodes{'menu_title_before_entries'};
$result_nodes{'menu_title_before_entries'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'menu_title_before_entries'}{'menus'}[0];
$result_nodes{'menu_title_before_entries'}{'node_next'} = $result_nodes{'menu_title_before_entries'}{'menu_child'};

$result_menus{'menu_title_before_entries'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'subnode'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'menu_title_before_entries'}{'menu_child'}{'menu_up'} = $result_menus{'menu_title_before_entries'};

$result_errors{'menu_title_before_entries'} = [];



$result_converted{'plaintext'}->{'menu_title_before_entries'} = '* Menu:

Horizontal space
* subnode::

';

1;
