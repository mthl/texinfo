use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'index_entry_before_node'} = {
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
                      'parent' => {},
                      'text' => 'first'
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
                  'normalized' => 'first'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
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
                      'text' => 'second'
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
                  'normalized' => 'second'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
              'text' => 'first'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Para.
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
                  'text' => 'lone entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'cindex',
              'index_name' => 'cp',
              'index_prefix' => 'c',
              'key' => 'lone entry',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 12,
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
            'normalized' => 'first'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'first'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
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
              'text' => 'second'
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
              'text' => 'first'
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
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
            'normalized' => 'second'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'first'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'second'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 14,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'index_entry_before_node'}{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'index_entry_before_node'}{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'parent'} = $result_trees{'index_entry_before_node'};

$result_texis{'index_entry_before_node'} = '@node Top

@menu
* first::
* second::
@end menu

@node first,second,,Top

Para.

@cindex lone entry

@node second,,first,Top

@printindex cp
';


$result_texts{'index_entry_before_node'} = '
* first::
* second::


Para.



';

$result_sectioning{'index_entry_before_node'} = {};

$result_nodes{'index_entry_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second'
      },
      'node_prev' => {},
      'node_up' => {}
    },
    'node_prev' => {},
    'node_up' => {}
  },
  'menus' => [
    {
      'cmdname' => 'menu'
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
$result_nodes{'index_entry_before_node'}{'menu_child'}{'node_next'}{'node_prev'} = $result_nodes{'index_entry_before_node'}{'menu_child'};
$result_nodes{'index_entry_before_node'}{'menu_child'}{'node_next'}{'node_up'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'menu_child'}{'node_prev'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'menu_child'}{'node_up'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'node_next'} = $result_nodes{'index_entry_before_node'}{'menu_child'};

$result_menus{'index_entry_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'first'
    },
    'menu_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second'
      },
      'menu_prev' => {},
      'menu_up' => {},
      'menu_up_hash' => {
        'Top' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'index_entry_before_node'}{'menu_child'}{'menu_next'}{'menu_prev'} = $result_menus{'index_entry_before_node'}{'menu_child'};
$result_menus{'index_entry_before_node'}{'menu_child'}{'menu_next'}{'menu_up'} = $result_menus{'index_entry_before_node'};
$result_menus{'index_entry_before_node'}{'menu_child'}{'menu_up'} = $result_menus{'index_entry_before_node'};

$result_errors{'index_entry_before_node'} = [];



$result_converted{'info'}->{'index_entry_before_node'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Next: first,  Up: (dir)

* Menu:

* first::
* second::


File: ,  Node: first,  Next: second,  Prev: Top,  Up: Top

Para.


File: ,  Node: second,  Prev: first,  Up: Top

 [index ]
* Menu:

* lone entry:                            first.                 (line 4)



Tag Table:
Node: Top52
Node: first131
Node: second199

End Tag Table
';

1;
