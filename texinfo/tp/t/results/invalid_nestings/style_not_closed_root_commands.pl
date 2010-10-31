use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'style_not_closed_root_commands'} = {
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
                      'text' => 'chapter'
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
                  'normalized' => 'chapter'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
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
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'not closed
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
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
              'text' => 'chapter'
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
            'normalized' => 'chapter'
          }
        ],
        'normalized' => 'chapter'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'menu_up_hash' => {
        'Top' => 1
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
              'text' => 'chapter'
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
      'cmdname' => 'chapter',
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
                      'text' => 'still not closed
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    },
    {
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'style_not_closed_root_commands'}{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'};
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[2];
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'extra'}{'node_content'};
$result_trees{'style_not_closed_root_commands'}{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'};
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'style_not_closed_root_commands'}{'contents'}[3];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'style_not_closed_root_commands'}{'contents'}[3]{'parent'} = $result_trees{'style_not_closed_root_commands'};
$result_trees{'style_not_closed_root_commands'}{'contents'}[4]{'parent'} = $result_trees{'style_not_closed_root_commands'};

$result_texis{'style_not_closed_root_commands'} = '@node Top

@menu
* chapter::
@end menu

@code{not closed

}@node chapter
@chapter chapter

@code{still not closed

}@bye
';


$result_texts{'style_not_closed_root_commands'} = '
* chapter::

not closed

chapter

still not closed

';

$result_sectioning{'style_not_closed_root_commands'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'chapter'
          },
          'menu_up_hash' => {
            'Top' => 1
          }
        }
      },
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'style_not_closed_root_commands'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'style_not_closed_root_commands'};

$result_nodes{'style_not_closed_root_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'normalized' => 'chapter'
    },
    'menu_up_hash' => {
      'Top' => 1
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
    'extra' => {},
    'manual_content' => [
      {
        'text' => 'dir'
      }
    ]
  }
};
$result_nodes{'style_not_closed_root_commands'}{'menu_child'}{'node_prev'} = $result_nodes{'style_not_closed_root_commands'};
$result_nodes{'style_not_closed_root_commands'}{'menu_child'}{'node_up'} = $result_nodes{'style_not_closed_root_commands'};
$result_nodes{'style_not_closed_root_commands'}{'node_next'} = $result_nodes{'style_not_closed_root_commands'}{'menu_child'};

$result_menus{'style_not_closed_root_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'chapter'
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'style_not_closed_root_commands'}{'menu_child'}{'menu_up'} = $result_menus{'style_not_closed_root_commands'};

$result_errors{'style_not_closed_root_commands'} = [
  {
    'error_line' => ':8: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':13: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  }
];


1;
