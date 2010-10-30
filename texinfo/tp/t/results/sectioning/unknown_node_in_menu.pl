use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'unknown_node_in_menu'} = {
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
                      'text' => 'unknown'
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
                  'normalized' => 'unknown'
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
    }
  ],
  'type' => 'document_root'
};
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'unknown_node_in_menu'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'unknown_node_in_menu'}{'contents'}[1]{'parent'} = $result_trees{'unknown_node_in_menu'};

$result_texis{'unknown_node_in_menu'} = '@node Top

@menu
* unknown::
@end menu
';


$result_texts{'unknown_node_in_menu'} = '
* unknown::
';

$result_sectioning{'unknown_node_in_menu'} = {};

$result_nodes{'unknown_node_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menus' => [
    {
      'cmdname' => 'menu'
    }
  ],
  'node_up' => {
    'manual_content' => [
      {
        'text' => 'dir'
      }
    ]
  }
};

$result_menus{'unknown_node_in_menu'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'unknown_node_in_menu'} = [
  {
    'error_line' => ':4: Menu reference to nonexistent node `unknown\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Menu reference to nonexistent node `unknown\'',
    'type' => 'error'
  }
];


1;
