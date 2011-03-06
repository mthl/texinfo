use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'empty_cindex_entry'} = {
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
          'args' => [
            {
              'contents' => [
                {
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
          'cmdname' => 'cindex',
          'extra' => {
            'missing_argument' => 1
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
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
$result_trees{'empty_cindex_entry'}{'contents'}[0]{'parent'} = $result_trees{'empty_cindex_entry'};
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'contents'}[0];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_cindex_entry'}{'contents'}[1];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'empty_cindex_entry'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'empty_cindex_entry'}{'contents'}[1]{'parent'} = $result_trees{'empty_cindex_entry'};

$result_texis{'empty_cindex_entry'} = '@node Top
@cindex
';


$result_texts{'empty_cindex_entry'} = '';

$result_sectioning{'empty_cindex_entry'} = {};

$result_nodes{'empty_cindex_entry'} = {
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

$result_menus{'empty_cindex_entry'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'empty_cindex_entry'} = [
  {
    'error_line' => ':2: @cindex missing argument
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@cindex missing argument',
    'type' => 'error'
  }
];



$result_converted{'info'}->{'empty_cindex_entry'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)



Tag Table:
Node: Top52

End Tag Table
';

1;
