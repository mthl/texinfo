use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'equivalent_nodes'} = {
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
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'emph',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              },
              'parent' => {}
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
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'node'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'strong',
                      'contents' => [],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 4,
                        'macro' => ''
                      },
                      'parent' => {}
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
                  'normalized' => 'node'
                }
              },
              'line_nr' => {},
              'parent' => {},
              'type' => 'menu_entry'
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
                'line_nr' => 5,
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
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node'
          }
        ],
        'normalized' => 'Top'
      },
      'line_nr' => {},
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'samp',
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'node'
          }
        ],
        'normalized' => 'node'
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'equivalent_nodes'}{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'};
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'line_nr'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'line_nr'};
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'equivalent_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[1]{'line_nr'} = $result_trees{'equivalent_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'line_nr'};
$result_trees{'equivalent_nodes'}{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'};
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'label'} = $result_trees{'equivalent_nodes'}{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'equivalent_nodes'}{'contents'}[2];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'equivalent_nodes'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'equivalent_nodes'}{'contents'}[2]{'line_nr'} = $result_trees{'equivalent_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'equivalent_nodes'}{'contents'}[2]{'parent'} = $result_trees{'equivalent_nodes'};

$result_texis{'equivalent_nodes'} = '@node Top, @emph{node}

@menu
* @strong{node}::
@end menu

@node @samp{node}

@xref{node}.
';


$result_texts{'equivalent_nodes'} = '
* node::


.
';

$result_sectioning{'equivalent_nodes'} = {};

$result_nodes{'equivalent_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'node'
    },
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
  'node_next' => {}
};
$result_nodes{'equivalent_nodes'}{'menu_child'}{'node_up'} = $result_nodes{'equivalent_nodes'};
$result_nodes{'equivalent_nodes'}{'menus'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_nodes{'equivalent_nodes'}{'menus'}[0];
$result_nodes{'equivalent_nodes'}{'node_next'} = $result_nodes{'equivalent_nodes'}{'menu_child'};

$result_menus{'equivalent_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'node'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'equivalent_nodes'}{'menu_child'}{'menu_up'} = $result_menus{'equivalent_nodes'};

$result_errors{'equivalent_nodes'} = [];



$result_converted{'info'}->{'equivalent_nodes'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: `node\'

* Menu:

* *node*::


File: ,  Node: `node\',  Up: Top

*Note `node\'::.


Tag Table:
Node: Top52
Node: `node\'110

End Tag Table
';

$result_converted_errors{'info'}->{'equivalent_nodes'} = [
  {
    'file_name' => '',
    'error_line' => ':4: warning: Node expansion `*node*\' in menu differs from normal node expansion ``node\'\'
',
    'text' => 'Node expansion `*node*\' in menu differs from normal node expansion ``node\'\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 4
  }
];


1;
