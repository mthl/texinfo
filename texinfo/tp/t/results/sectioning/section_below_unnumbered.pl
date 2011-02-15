use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'section_below_unnumbered'} = {
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
          'cmdname' => 'contents',
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
        'normalized' => 'Top'
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
      'cmdname' => 'top',
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
              'text' => 'Top node.
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
                      'text' => 'Unn'
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
                  'normalized' => 'Unn'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 10,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
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
        },
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
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
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
              'text' => 'Unn'
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
            'normalized' => 'Unn'
          }
        ],
        'normalized' => 'Unn'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 14,
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
              'text' => 'Unn'
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
      'cmdname' => 'unnumbered',
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
                      'text' => 'Sec'
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
                  'normalized' => 'Sec'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 18,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
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
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 15,
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
              'text' => 'Sec'
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
            'normalized' => 'Sec'
          }
        ],
        'normalized' => 'Sec'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 21,
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
              'text' => 'Sec'
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
      'cmdname' => 'section',
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
              'text' => 'Should be unnumbered.
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
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 22,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'section_below_unnumbered'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_below_unnumbered'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'section_below_unnumbered'}{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[2];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[3];
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_below_unnumbered'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'section_below_unnumbered'}{'contents'}[3]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[4];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[4]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[5];
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'section_below_unnumbered'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'section_below_unnumbered'}{'contents'}[5]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'section_below_unnumbered'}{'contents'}[6];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'section_below_unnumbered'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'section_below_unnumbered'}{'contents'}[6]{'parent'} = $result_trees{'section_below_unnumbered'};
$result_trees{'section_below_unnumbered'}{'contents'}[7]{'parent'} = $result_trees{'section_below_unnumbered'};

$result_texis{'section_below_unnumbered'} = '
@contents

@node Top
@top Top

Top node.

@menu
* Unn::
@end menu


@node Unn
@unnumbered Unn

@menu
* Sec::
@end menu

@node Sec
@section Sec

Should be unnumbered.

@bye
';


$result_texts{'section_below_unnumbered'} = '

Top
***

Top node.

* Unn::


Unn
***

* Sec::

Sec
===

Should be unnumbered.

';

$result_sectioning{'section_below_unnumbered'} = {
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
          'cmdname' => 'unnumbered',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Unn'
              }
            }
          },
          'level' => 1,
          'section_childs' => [
            {
              'cmdname' => 'section',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'Sec'
                  }
                }
              },
              'level' => 2,
              'section_up' => {}
            }
          ],
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'section_below_unnumbered'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'section_below_unnumbered'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'section_below_unnumbered'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'section_below_unnumbered'}{'section_childs'}[0];
$result_sectioning{'section_below_unnumbered'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'section_below_unnumbered'};

$result_nodes{'section_below_unnumbered'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'unnumbered',
        'extra' => {},
        'level' => 1
      },
      'normalized' => 'Unn'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'section',
          'extra' => {},
          'level' => 2
        },
        'normalized' => 'Sec'
      },
      'node_up' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
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
$result_nodes{'section_below_unnumbered'}{'menu_child'}{'menu_child'}{'node_up'} = $result_nodes{'section_below_unnumbered'}{'menu_child'};
$result_nodes{'section_below_unnumbered'}{'menu_child'}{'node_prev'} = $result_nodes{'section_below_unnumbered'};
$result_nodes{'section_below_unnumbered'}{'menu_child'}{'node_up'} = $result_nodes{'section_below_unnumbered'};
$result_nodes{'section_below_unnumbered'}{'node_next'} = $result_nodes{'section_below_unnumbered'}{'menu_child'};

$result_menus{'section_below_unnumbered'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menu_child' => {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Unn'
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'Sec'
      },
      'menu_up' => {},
      'menu_up_hash' => {
        'Unn' => 1
      }
    },
    'menu_up' => {},
    'menu_up_hash' => {
      'Top' => 1
    }
  }
};
$result_menus{'section_below_unnumbered'}{'menu_child'}{'menu_child'}{'menu_up'} = $result_menus{'section_below_unnumbered'}{'menu_child'};
$result_menus{'section_below_unnumbered'}{'menu_child'}{'menu_up'} = $result_menus{'section_below_unnumbered'};

$result_errors{'section_below_unnumbered'} = [];



$result_converted{'plaintext'}->{'section_below_unnumbered'} = '
Top
Unn
  Sec
Top
***

Top node.

* Menu:

* Unn::

Unn
***

* Menu:

* Sec::

Sec
===

Should be unnumbered.

';

1;
