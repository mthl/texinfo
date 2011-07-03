use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'comment_space_comand_in_float'} = {
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text '
                },
                {
                  'cmdname' => ' ',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'label '
                },
                {
                  'cmdname' => ' ',
                  'parent' => {}
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' float
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Float
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
                      'extra' => {
                        'command' => {}
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'float'
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
                'command_argument' => 'float',
                'text_arg' => 'float'
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
            'block_command_line_contents' => [
              [
                {},
                {}
              ],
              [
                {},
                {}
              ]
            ],
            'end_command' => {},
            'node_content' => [
              {},
              {}
            ],
            'normalized' => 'label--',
            'type' => {
              'content' => [
                {},
                {}
              ],
              'normalized' => 'Text--'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'number' => 1,
          'parent' => {}
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
                  'extra' => {
                    'command' => {}
                  },
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text '
                },
                {
                  'cmdname' => ' ',
                  'parent' => {}
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => ' listoffloats
',
                      'type' => 'misc_arg'
                    }
                  ],
                  'cmdname' => 'c',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'listoffloats',
          'extra' => {
            'type' => {
              'content' => [
                {},
                {}
              ],
              'normalized' => 'Text--'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
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
$result_trees{'comment_space_comand_in_float'}{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'};
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[3]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][1] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][1] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[2];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[1] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[2];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'extra'}{'type'}{'content'}[1] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'extra'}{'type'}{'content'}[0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'extra'}{'type'}{'content'}[1] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'comment_space_comand_in_float'}{'contents'}[1]{'parent'} = $result_trees{'comment_space_comand_in_float'};

$result_texis{'comment_space_comand_in_float'} = '@node Top

@float Text @ , label @ @c float
Float
@end float

@listoffloats Text @ @c listoffloats
';


$result_texts{'comment_space_comand_in_float'} = '
Float

';

$result_sectioning{'comment_space_comand_in_float'} = {};

$result_nodes{'comment_space_comand_in_float'} = {
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

$result_menus{'comment_space_comand_in_float'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'comment_space_comand_in_float'} = [];


$result_floats{'comment_space_comand_in_float'} = {
  'Text--' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'label--',
        'type' => {
          'content' => [
            {
              'text' => 'Text '
            },
            {
              'cmdname' => ' '
            }
          ],
          'normalized' => 'Text--'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'comment_space_comand_in_float'}{'Text--'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'comment_space_comand_in_float'}{'Text--'}[0];



$result_converted{'plaintext'}->{'comment_space_comand_in_float'} = 'Float

Text   1

* Menu:

* Text   1: label  .                     

';


$result_converted{'info'}->{'comment_space_comand_in_float'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

Float

Text   1

* Menu:

* Text   1: label  .                     



Tag Table:
Node: Top52
Ref: label  86

End Tag Table
';

1;
