use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'double_top_in_menu'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
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
              'text' => 'ToP'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'top'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top node
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
          'cmdname' => 'menu',
          'contents' => [
            {
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
                      'text' => 'top'
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
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Top'
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
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'TOP'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'myself
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Top'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
          },
          {
            'node_content' => [
              {}
            ],
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'ToP'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'second node.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[3];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'double_top_in_menu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'double_top_in_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'};
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_top_in_menu'}{'contents'}[2];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[2]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'double_top_in_menu'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'double_top_in_menu'}{'contents'}[2]{'parent'} = $result_trees{'double_top_in_menu'};

$result_texis{'double_top_in_menu'} = '@node ToP, top
Top node

@menu
* top::
* TOP:: myself
@end menu

@node top,,ToP,Top
second node.
';


$result_texts{'double_top_in_menu'} = 'Top node

* top::
* TOP:: myself

second node.
';

$result_sectioning{'double_top_in_menu'} = {};

$result_nodes{'double_top_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {},
  'menus' => [
    {
      'cmdname' => 'menu'
    }
  ],
  'node_next' => {}
};
$result_nodes{'double_top_in_menu'}{'menu_child'} = $result_nodes{'double_top_in_menu'};
$result_nodes{'double_top_in_menu'}{'node_next'} = $result_nodes{'double_top_in_menu'};

$result_menus{'double_top_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {},
  'menu_next' => {},
  'menu_prev' => {},
  'menu_up' => {},
  'menu_up_hash' => {
    'Top' => 1
  }
};
$result_menus{'double_top_in_menu'}{'menu_child'} = $result_menus{'double_top_in_menu'};
$result_menus{'double_top_in_menu'}{'menu_next'} = $result_menus{'double_top_in_menu'};
$result_menus{'double_top_in_menu'}{'menu_prev'} = $result_menus{'double_top_in_menu'};
$result_menus{'double_top_in_menu'}{'menu_up'} = $result_menus{'double_top_in_menu'};

$result_errors{'double_top_in_menu'} = [
  {
    'error_line' => ':9: @node `top\' previously defined
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@node `top\' previously defined',
    'type' => 'error'
  },
  {
    'error_line' => ':1: here is the previous definition as @node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'here is the previous definition as @node',
    'type' => 'error continuation'
  }
];


1;
