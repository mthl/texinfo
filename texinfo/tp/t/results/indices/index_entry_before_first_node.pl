use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'index_entry_before_first_node'} = {
  'contents' => [
    {
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'before nodes'
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
              'key' => 'before nodes',
              'number' => 1
            },
            'misc_content' => []
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
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
            'line_nr' => 6,
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
        'line_nr' => 4,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'};
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'index_entry_before_first_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'index_entry_before_first_node'}{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_first_node'};

$result_texis{'index_entry_before_first_node'} = '
@cindex before nodes

@node Top

@printindex cp
';


$result_texts{'index_entry_before_first_node'} = '


';

$result_sectioning{'index_entry_before_first_node'} = {};

$result_nodes{'index_entry_before_first_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
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

$result_menus{'index_entry_before_first_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'index_entry_before_first_node'} = [
  {
    'error_line' => ':2: Entry for index `cp\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'error'
  }
];



$result_converted{'info'}->{'index_entry_before_first_node'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

 [index ]
* Menu:

* before nodes:                          (outside of any node). (line 0)



Tag Table:
Node: Top52

End Tag Table
';

$result_converted_errors{'info'}->{'index_entry_before_first_node'} = [
  {
    'file_name' => '',
    'error_line' => ':2: warning: Entry for index `cp\' outside of any node
',
    'text' => 'Entry for index `cp\' outside of any node',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 2
  }
];


1;
