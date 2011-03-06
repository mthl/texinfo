use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'space_in_def_for_index'} = {
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
          'cmdname' => 'deffn',
          'contents' => [
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' Category '
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' '
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' name '
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' '
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' argument '
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' argument2...
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'extra' => {
                'def_args' => [
                  [
                    'category',
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    }
                  ],
                  [
                    'spaces',
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    }
                  ],
                  [
                    'name',
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    }
                  ],
                  [
                    'spaces',
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    }
                  ],
                  [
                    'arg',
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    }
                  ],
                  [
                    'spaces',
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    }
                  ],
                  [
                    'arg',
                    {
                      'text' => 'argument2...'
                    }
                  ]
                ],
                'def_command' => 'deffn',
                'def_parsed_hash' => {
                  'category' => {},
                  'name' => {}
                },
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {}
                  ],
                  'index_at_command' => 'deffn',
                  'index_name' => 'fn',
                  'index_prefix' => 'f',
                  'key' => ' name ',
                  'node' => {},
                  'number' => 1
                },
                'original_def_cmdname' => 'deffn'
              },
              'parent' => {},
              'type' => 'def_line'
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'AAA1'
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' '
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'AAA2'
                        }
                      ],
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' arg3
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'deffnx',
              'extra' => {
                'def_args' => [
                  [
                    'category',
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    }
                  ],
                  [
                    'spaces',
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    }
                  ],
                  [
                    'name',
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    }
                  ],
                  [
                    'spaces',
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    }
                  ],
                  [
                    'arg',
                    {
                      'text' => 'arg3'
                    }
                  ]
                ],
                'def_command' => 'deffn',
                'def_parsed_hash' => {
                  'category' => {},
                  'name' => {}
                },
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {}
                  ],
                  'index_at_command' => 'deffn',
                  'index_name' => 'fn',
                  'index_prefix' => 'f',
                  'key' => 'AAA2',
                  'node' => {},
                  'number' => 2
                },
                'original_def_cmdname' => 'deffnx'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'def_line'
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
                      'text' => 'deffn'
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
                'command_argument' => 'deffn',
                'text_arg' => 'deffn'
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
            'end_command' => {}
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'fn'
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
              'fn'
            ]
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
$result_trees{'space_in_def_for_index'}{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'contents'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5]{'contents'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'node'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[2][1]{'contents'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[2][1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'command'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'space_in_def_for_index'}{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'space_in_def_for_index'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'space_in_def_for_index'}{'contents'}[1]{'parent'} = $result_trees{'space_in_def_for_index'};

$result_texis{'space_in_def_for_index'} = '@node Top

@deffn { Category } { name } { argument } argument2...
@deffnx {AAA1} {AAA2} arg3
@end deffn

@printindex fn
';


$result_texts{'space_in_def_for_index'} = '
 Category   name   argument  argument2...
AAA1 AAA2 arg3

';

$result_sectioning{'space_in_def_for_index'} = {};

$result_nodes{'space_in_def_for_index'} = {
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

$result_menus{'space_in_def_for_index'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'space_in_def_for_index'} = [];



$result_converted{'info'}->{'space_in_def_for_index'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

 --  Category : name argument argument2...
 -- AAA1: AAA2 arg3

 [index ]
* Menu:

* name :                                 Top.                   (line 3)
* AAA2:                                  Top.                   (line 4)



Tag Table:
Node: Top52

End Tag Table
';

1;
