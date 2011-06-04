use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'anchor_zero'} = {
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '0'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => '0'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '.
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '0'
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
                  'normalized' => '0'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
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
$result_trees{'anchor_zero'}{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'};
$result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[2];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'extra'}{'label'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4];
$result_trees{'anchor_zero'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'anchor_zero'}{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_zero'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_zero'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'anchor_zero'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'anchor_zero'}{'contents'}[1]{'parent'} = $result_trees{'anchor_zero'};

$result_texis{'anchor_zero'} = '@node Top

@anchor{0}.

@xref{0}.
';


$result_texts{'anchor_zero'} = '
.

.
';

$result_sectioning{'anchor_zero'} = {};

$result_nodes{'anchor_zero'} = {
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

$result_menus{'anchor_zero'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'anchor_zero'} = [];



$result_converted{'info'}->{'anchor_zero'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

.

   *Note 0::.


Tag Table:
Node: Top52
Ref: 086

End Tag Table
';

1;
