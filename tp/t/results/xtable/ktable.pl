use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'ktable'} = {
  'contents' => [
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
              'cmdname' => 'kbd',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'command_as_argument'
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
      'cmdname' => 'ktable',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
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
                          'text' => 'C-y'
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
                  'cmdname' => 'item',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'content_normalized' => [],
                      'in_code' => 1,
                      'index_at_command' => 'item',
                      'index_name' => 'ky',
                      'index_type_command' => 'ktable',
                      'key' => 'C-y',
                      'number' => 1
                    },
                    'misc_content' => [],
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'table_term'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'yyy
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'table_item'
            }
          ],
          'parent' => {},
          'type' => 'table_entry'
        },
        {
          'contents' => [
            {
              'contents' => [
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
                          'text' => 'C-z'
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
                  'cmdname' => 'item',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'content_normalized' => [],
                      'in_code' => 1,
                      'index_at_command' => 'item',
                      'index_name' => 'ky',
                      'index_type_command' => 'ktable',
                      'key' => 'C-z',
                      'number' => 2
                    },
                    'misc_content' => [],
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 4,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'table_term'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'zzz
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'table_item'
            }
          ],
          'parent' => {},
          'type' => 'table_entry'
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
                  'text' => 'ktable'
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
            'command_argument' => 'ktable',
            'spaces_after_command' => {},
            'text_arg' => 'ktable'
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
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {},
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
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'command_as_argument'
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
      'cmdname' => 'vtable',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
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
                          'text' => 'y'
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
                  'cmdname' => 'item',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'content_normalized' => [],
                      'in_code' => 1,
                      'index_at_command' => 'item',
                      'index_name' => 'vr',
                      'index_type_command' => 'vtable',
                      'key' => 'y',
                      'number' => 1
                    },
                    'misc_content' => [],
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 9,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'table_term'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'yyy
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'table_item'
            }
          ],
          'parent' => {},
          'type' => 'table_entry'
        },
        {
          'contents' => [
            {
              'contents' => [
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
                          'text' => 'z'
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
                  'cmdname' => 'item',
                  'extra' => {
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'content_normalized' => [],
                      'in_code' => 1,
                      'index_at_command' => 'item',
                      'index_name' => 'vr',
                      'index_type_command' => 'vtable',
                      'key' => 'z',
                      'number' => 2
                    },
                    'misc_content' => [],
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 11,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'table_term'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'zzz
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {},
              'type' => 'table_item'
            }
          ],
          'parent' => {},
          'type' => 'table_entry'
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
                  'text' => 'vtable'
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
            'command_argument' => 'vtable',
            'spaces_after_command' => {},
            'text_arg' => 'vtable'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ],
        'command_as_argument' => {},
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'ktable'}{'contents'}[0]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[0]{'line_nr'} = $result_trees{'ktable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ktable'}{'contents'}[0]{'parent'} = $result_trees{'ktable'};
$result_trees{'ktable'}{'contents'}[1]{'parent'} = $result_trees{'ktable'};
$result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'misc_content'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'ktable'}{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'ktable'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'ktable'}{'contents'}[2]{'contents'}[2];
$result_trees{'ktable'}{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'ktable'}{'contents'}[2]{'line_nr'} = $result_trees{'ktable'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'ktable'}{'contents'}[2]{'parent'} = $result_trees{'ktable'};

$result_texis{'ktable'} = '@ktable @kbd
@item C-y
yyy
@item C-z
zzz
@end ktable

@vtable @code
@item y
yyy
@item z
zzz
@end vtable
';


$result_texts{'ktable'} = 'C-y
yyy
C-z
zzz

y
yyy
z
zzz
';

$result_errors{'ktable'} = [
  {
    'error_line' => ':2: warning: entry for index `ky\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'entry for index `ky\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: entry for index `ky\' outside of any node
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'entry for index `ky\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':9: warning: entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'entry for index `vr\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':11: warning: entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'entry for index `vr\' outside of any node',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'ktable'} = '\'C-y\'
     yyy
\'C-z\'
     zzz

\'y\'
     yyy
\'z\'
     zzz
';


$result_converted{'html_text'}->{'ktable'} = '<dl compact="compact">
<dt><kbd>C-y</kbd>
<a name="index-C_002dy"></a>
</dt>
<dd><p>yyy
</p></dd>
<dt><kbd>C-z</kbd>
<a name="index-C_002dz"></a>
</dt>
<dd><p>zzz
</p></dd>
</dl>

<dl compact="compact">
<dt><code>y</code>
<a name="index-y"></a>
</dt>
<dd><p>yyy
</p></dd>
<dt><code>z</code>
<a name="index-z"></a>
</dt>
<dd><p>zzz
</p></dd>
</dl>
';


$result_converted{'xml'}->{'ktable'} = '<ktable commandarg="kbd" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="kbd"><indexterm index="ky" number="1">C-y</indexterm>C-y</itemformat></item>
</tableterm><tableitem><para>yyy
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="kbd"><indexterm index="ky" number="2">C-z</indexterm>C-z</itemformat></item>
</tableterm><tableitem><para>zzz
</para></tableitem></tableentry></ktable>

<vtable commandarg="code" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="code"><indexterm index="vr" number="1">y</indexterm>y</itemformat></item>
</tableterm><tableitem><para>yyy
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="code"><indexterm index="vr" number="2">z</indexterm>z</itemformat></item>
</tableterm><tableitem><para>zzz
</para></tableitem></tableentry></vtable>
';

1;
