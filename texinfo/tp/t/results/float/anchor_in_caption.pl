use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'anchor_in_caption'} = {
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
                  'text' => 'fl'
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
          'cmdname' => 'listoffloats',
          'extra' => {
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'fl'
            }
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
                  'text' => 'fl'
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
                  'text' => 'label'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'space_at_end_block_command'
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
                  'text' => 'In float.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in caption'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'in anchor'
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
                            'normalized' => 'in-anchor'
                          },
                          'line_nr' => {
                            'file_name' => '',
                            'line_nr' => 7,
                            'macro' => ''
                          },
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'caption',
              'contents' => [],
              'extra' => {
                'float' => {}
              },
              'line_nr' => {},
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
'
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
                'line_nr' => 8,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ],
            'caption' => {},
            'end_command' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'fl'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'number' => 1,
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
$result_trees{'anchor_in_caption'}{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'};
$result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'float'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'line_nr'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'extra'}{'command'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'contents'}[3];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'extra'}{'type'}{'content'}[0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_caption'}{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_caption'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'anchor_in_caption'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'anchor_in_caption'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'anchor_in_caption'}{'contents'}[1]{'parent'} = $result_trees{'anchor_in_caption'};

$result_texis{'anchor_in_caption'} = '@node Top

@listoffloats fl

@float fl, label
In float.
@caption{in caption@anchor{in anchor}}
@end float
';


$result_texts{'anchor_in_caption'} = '

In float.

';

$result_sectioning{'anchor_in_caption'} = {};

$result_nodes{'anchor_in_caption'} = {
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

$result_menus{'anchor_in_caption'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'anchor_in_caption'} = [];


$result_floats{'anchor_in_caption'} = {
  'fl' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'end_command' => {
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'float',
            'text_arg' => 'float'
          }
        },
        'normalized' => 'label',
        'type' => {
          'content' => [
            {
              'text' => 'fl'
            }
          ],
          'normalized' => 'fl'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'anchor_in_caption'}{'fl'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'anchor_in_caption'}{'fl'}[0];
$result_floats{'anchor_in_caption'}{'fl'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'anchor_in_caption'}{'fl'}[0];



$result_converted{'plaintext'}->{'anchor_in_caption'} = '* Menu:

* fl 1: label.                           in caption

In float.

fl 1: in caption
';


$result_converted{'info'}->{'anchor_in_caption'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

* Menu:

* fl 1: label.                           in caption

In float.

fl 1: in caption


Tag Table:
Node: Top52
Ref: label148
Ref: in anchor175

End Tag Table
';

1;
