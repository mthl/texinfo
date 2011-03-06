use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'printindex_with_space_before'} = {
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
                  'text' => 'index'
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
              'key' => 'index',
              'node' => {},
              'number' => 1
            },
            'misc_content' => []
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Text.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'printindex_with_space_before'}{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'};
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'extra'}{'misc_content'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'};
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[3];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'printindex_with_space_before'}{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'printindex_with_space_before'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'printindex_with_space_before'}{'contents'}[1]{'parent'} = $result_trees{'printindex_with_space_before'};

$result_texis{'printindex_with_space_before'} = '@node Top

@cindex index

Text.
@printindex cp
';


$result_texts{'printindex_with_space_before'} = '

Text.
';

$result_sectioning{'printindex_with_space_before'} = {};

$result_nodes{'printindex_with_space_before'} = {
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

$result_menus{'printindex_with_space_before'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'printindex_with_space_before'} = [];



$result_converted{'info'}->{'printindex_with_space_before'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

Text.

 [index ]
* Menu:

* index:                                 Top.                   (line 3)



Tag Table:
Node: Top52

End Tag Table
';

1;
