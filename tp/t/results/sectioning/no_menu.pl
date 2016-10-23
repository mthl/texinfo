use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'no_menu'} = {
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
      'contents' => [],
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
        'normalized' => 'Top',
        'spaces_after_command' => {}
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'misc_content' => [],
        'spaces_after_command' => {}
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
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
              'text' => 'c1'
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
            'normalized' => 'c1'
          }
        ],
        'normalized' => 'c1',
        'spaces_after_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
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
              'text' => 'c1'
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
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ],
        'spaces_after_command' => {}
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'number' => 1,
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
              'text' => 'c2'
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
            'normalized' => 'c2'
          }
        ],
        'normalized' => 'c2',
        'spaces_after_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
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
              'text' => 'c2'
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
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ],
        'spaces_after_command' => {}
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      },
      'number' => 2,
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
              'text' => 'c3'
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
            'normalized' => 'c3'
          }
        ],
        'normalized' => 'c3',
        'spaces_after_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
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
              'text' => 'c3'
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
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ],
        'spaces_after_command' => {}
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
        'macro' => ''
      },
      'number' => 3,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'no_menu'}{'contents'}[0]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'no_menu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'no_menu'}{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[1]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[2];
$result_trees{'no_menu'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[2]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[2];
$result_trees{'no_menu'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[2];
$result_trees{'no_menu'}{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[2]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[3];
$result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[3]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[3]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[3]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[3];
$result_trees{'no_menu'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'no_menu'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'no_menu'}{'contents'}[3]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[3]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[4];
$result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[4]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[4]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[4]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[4];
$result_trees{'no_menu'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[4];
$result_trees{'no_menu'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[4]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[4]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[5];
$result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[5]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[5]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[5]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[5];
$result_trees{'no_menu'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'no_menu'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'no_menu'}{'contents'}[5]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[5]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[6];
$result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[6]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[6]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[6]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[6];
$result_trees{'no_menu'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[6];
$result_trees{'no_menu'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[6]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[6]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[7];
$result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[7]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[7]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[7]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[7];
$result_trees{'no_menu'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'no_menu'}{'contents'}[7]{'extra'}{'node_content'};
$result_trees{'no_menu'}{'contents'}[7]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[7]{'parent'} = $result_trees{'no_menu'};
$result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'no_menu'}{'contents'}[8];
$result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[8]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_menu'}{'contents'}[8]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_menu'}{'contents'}[8]{'args'}[0];
$result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'no_menu'}{'contents'}[8];
$result_trees{'no_menu'}{'contents'}[8]{'extra'}{'misc_content'}[0] = $result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'no_menu'}{'contents'}[8]{'extra'}{'spaces_after_command'} = $result_trees{'no_menu'}{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'no_menu'}{'contents'}[8]{'parent'} = $result_trees{'no_menu'};

$result_texis{'no_menu'} = '@node Top
@top

@node c1
@chapter c1

@node c2
@chapter c2

@node c3
@chapter c3
';


$result_texts{'no_menu'} = '
1 c1
****

2 c2
****

3 c3
****
';

$result_sectioning{'no_menu'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {
        'associated_node' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Top'
          }
        }
      },
      'level' => 0,
      'section_childs' => [
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'c1'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        },
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'c2'
              }
            }
          },
          'level' => 1,
          'number' => 2,
          'section_prev' => {},
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        },
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'c3'
              }
            }
          },
          'level' => 1,
          'number' => 3,
          'section_prev' => {},
          'section_up' => {},
          'toplevel_prev' => {},
          'toplevel_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_prev'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[0]{'toplevel_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1]{'toplevel_prev'} = $result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1]{'toplevel_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[2]{'section_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[2]{'toplevel_prev'} = $result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_childs'}[2]{'toplevel_up'} = $result_sectioning{'no_menu'}{'section_childs'}[0];
$result_sectioning{'no_menu'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'no_menu'};

$result_nodes{'no_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'dir'
        }
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'no_menu'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'no_menu'};

$result_menus{'no_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'no_menu'} = [
  {
    'error_line' => ':4: warning: unreferenced node `c1\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'unreferenced node `c1\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: node `c2\' is next for `c1\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'node `c2\' is next for `c1\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: node `Top\' is up for `c1\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'node `Top\' is up for `c1\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: node `Top\' lacks menu item for `c1\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'node `Top\' lacks menu item for `c1\' despite being its Up target',
    'type' => 'error'
  },
  {
    'error_line' => ':7: warning: unreferenced node `c2\'
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'unreferenced node `c2\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: node `c3\' is next for `c2\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'node `c3\' is next for `c2\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: node `c1\' is prev for `c2\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'node `c1\' is prev for `c2\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: node `Top\' is up for `c2\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'node `Top\' is up for `c2\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: node `Top\' lacks menu item for `c2\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'node `Top\' lacks menu item for `c2\' despite being its Up target',
    'type' => 'error'
  },
  {
    'error_line' => ':10: warning: unreferenced node `c3\'
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'unreferenced node `c3\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: warning: node `c2\' is prev for `c3\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'node `c2\' is prev for `c3\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: warning: node `Top\' is up for `c3\' in sectioning but not in menu
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'node `Top\' is up for `c3\' in sectioning but not in menu',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: node `Top\' lacks menu item for `c3\' despite being its Up target
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'node `Top\' lacks menu item for `c3\' despite being its Up target',
    'type' => 'error'
  }
];


1;
