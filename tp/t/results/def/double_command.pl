use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'double_command'} = {
  'contents' => [
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
                  'text' => 'func'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'plot'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => '(',
                  'type' => 'delimiter'
                },
                {
                  'text' => 'a'
                },
                {
                  'text' => ',',
                  'type' => 'delimiter'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'b'
                },
                {
                  'text' => ',',
                  'type' => 'delimiter'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'c'
                },
                {
                  'text' => ',',
                  'type' => 'delimiter'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => '...'
                },
                {
                  'text' => ')',
                  'type' => 'delimiter'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
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
                          'text' => 'func'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => 'plot2'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => '(',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => 'a'
                        },
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => 'b'
                        },
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => 'c'
                        },
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => '...'
                        },
                        {
                          'text' => ',',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => ' ',
                          'type' => 'spaces'
                        },
                        {
                          'text' => 'd'
                        },
                        {
                          'text' => ')',
                          'type' => 'delimiter'
                        },
                        {
                          'text' => '
',
                          'type' => 'spaces_at_end'
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
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'name',
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'arg',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'arg',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'arg',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'arg',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'spaces',
                        {}
                      ],
                      [
                        'arg',
                        {}
                      ],
                      [
                        'delimiter',
                        {}
                      ],
                      [
                        'spaces',
                        {}
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
                      'content_normalized' => [
                        {}
                      ],
                      'in_code' => 1,
                      'index_at_command' => 'deffnx',
                      'index_name' => 'fn',
                      'index_type_command' => 'deffn',
                      'key' => 'plot2',
                      'number' => 1
                    },
                    'invalid_nesting' => 1,
                    'not_after_command' => 1,
                    'original_def_cmdname' => 'deffnx',
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 1,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'def_line'
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
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'name',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'delimiter',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'delimiter',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'delimiter',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'delimiter',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'delimiter',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_type_command' => 'deffn',
              'key' => 'plot',
              'number' => 2
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {},
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'def_item'
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
            'command_argument' => 'deffn',
            'spaces_after_command' => {},
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {},
      'parent' => {}
    },
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
                  'text' => 'func'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'aaaa'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'args'
                },
                {
                  'text' => '  ',
                  'type' => 'spaces'
                },
                {
                  'cmdname' => 'defvr',
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
                              'text' => 'c--ategory'
                            },
                            {
                              'text' => ' ',
                              'type' => 'spaces'
                            },
                            {
                              'text' => 'd--efvr_name'
                            },
                            {
                              'text' => '
',
                              'type' => 'spaces_at_end'
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
                            {}
                          ],
                          [
                            'spaces',
                            {}
                          ],
                          [
                            'name',
                            {}
                          ],
                          [
                            'spaces',
                            {}
                          ]
                        ],
                        'def_command' => 'defvr',
                        'def_parsed_hash' => {
                          'category' => {},
                          'name' => {}
                        },
                        'index_entry' => {
                          'command' => {},
                          'content' => [
                            {}
                          ],
                          'content_normalized' => [
                            {}
                          ],
                          'in_code' => 1,
                          'index_at_command' => 'defvr',
                          'index_name' => 'vr',
                          'index_type_command' => 'defvr',
                          'key' => 'd--efvr_name',
                          'number' => 1
                        },
                        'original_def_cmdname' => 'defvr'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 5,
                        'macro' => ''
                      },
                      'parent' => {},
                      'type' => 'def_line'
                    }
                  ],
                  'extra' => {
                    'invalid_nesting' => 1,
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {},
                  'parent' => {}
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
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'name',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_type_command' => 'deffn',
              'key' => 'aaaa',
              'number' => 3
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {},
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'bbb
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'parent' => {},
          'type' => 'def_item'
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
            'command_argument' => 'deffn',
            'spaces_after_command' => {},
            'text_arg' => 'deffn'
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
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[0][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[1][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[2][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[3][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[4];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[4][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[5];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[5][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[6];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[6][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[7];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[7][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[8];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[8][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[9];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[9][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[10];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[10][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[11];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[11][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[12];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[12][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[13];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[13][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[14];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[14][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[15];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[15][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[16];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[16][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[17];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[17][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[18];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[18][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[19];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_args'}[19][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[20];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'index_entry'}{'command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[5][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[7][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[9][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[11][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[12][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[13][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[15];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[15][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[16][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[17];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'line_nr'};
$result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[0]{'line_nr'} = $result_trees{'double_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18]{'line_nr'};
$result_trees{'double_command'}{'contents'}[0]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[1]{'parent'} = $result_trees{'double_command'};
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'line_nr'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'line_nr'};
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[5][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'line_nr'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'line_nr'};
$result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[1];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'double_command'}{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[2];
$result_trees{'double_command'}{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'double_command'}{'contents'}[2]{'line_nr'} = $result_trees{'double_command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[7]{'contents'}[0]{'line_nr'};
$result_trees{'double_command'}{'contents'}[2]{'parent'} = $result_trees{'double_command'};

$result_texis{'double_command'} = '@deffn func plot (a, b, c, ...) @deffnx func plot2 (a, b, c, ..., d)
aaa
@end deffn

@deffn func aaaa args  @defvr c--ategory d--efvr_name
bbb
@end deffn
';


$result_texts{'double_command'} = 'func: plot (a, b, c, ...) func: plot2 (a, b, c, ..., d)

aaa

func: aaaa args  c--ategory: d--efvr_name

bbb
';

$result_errors{'double_command'} = [
  {
    'error_line' => ':1: warning: @deffnx should only appear at the beginning of a line
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@deffnx should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: must be after `@deffn\' to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'must be after `@deffn\' to use `@deffnx\'',
    'type' => 'error'
  },
  {
    'error_line' => ':1: warning: @deffnx should not appear in @deffn
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@deffnx should not appear in @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @defvr should only appear at the beginning of a line
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@defvr should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: @defvr should not appear in @deffn
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@defvr should not appear in @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: warning: entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'entry for index `vr\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: no matching `@end defvr\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'no matching `@end defvr\'',
    'type' => 'error'
  },
  {
    'error_line' => ':5: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  }
];


1;
