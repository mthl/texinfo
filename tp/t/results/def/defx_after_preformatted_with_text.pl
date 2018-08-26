use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'defx_after_preformatted_with_text'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
                      'extra' => {
                        'def_role' => 'category'
                      },
                      'text' => 'fset'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'i'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'var',
                      'contents' => [],
                      'extra' => {
                        'def_role' => 'name'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 2,
                        'macro' => ''
                      },
                      'parent' => {}
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'arg'
                      },
                      'text' => 'a'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'arg'
                      },
                      'text' => 'g'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
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
                  'index_at_command' => 'deffn',
                  'index_name' => 'fn',
                  'index_type_command' => 'deffn',
                  'key' => 'i',
                  'number' => 1
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
                      'text' => 'Text in preformatted.
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'parent' => {},
              'type' => 'inter_def_item'
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
                          'text' => 'truc'
                        }
                      ],
                      'extra' => {
                        'def_role' => 'category'
                      },
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 5,
                        'macro' => ''
                      },
                      'parent' => {},
                      'type' => 'bracketed_def_content'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'name'
                      },
                      'text' => 'bidulr'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'arg'
                      },
                      'text' => 'machin...'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
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
                    'arg',
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
                  'key' => 'bidulr',
                  'number' => 2
                },
                'not_after_command' => 1,
                'original_def_cmdname' => 'deffnx',
                'spaces_after_command' => {}
              },
              'line_nr' => {},
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
                'command_argument' => 'deffn',
                'spaces_after_command' => {},
                'text_arg' => 'deffn'
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
            'end_command' => {},
            'spaces_after_command' => {}
          },
          'line_nr' => {},
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
                  'text' => 'example'
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
            'command_argument' => 'example',
            'spaces_after_command' => {},
            'text_arg' => 'example'
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
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[5][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[7][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'line_nr'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[0][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[1][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[2][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[3][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[4][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[5];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_args'}[5][1] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[6];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'line_nr'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'extra'}{'spaces_after_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'line_nr'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[2];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'contents'}[0];
$result_trees{'defx_after_preformatted_with_text'}{'contents'}[0]{'parent'} = $result_trees{'defx_after_preformatted_with_text'};

$result_texis{'defx_after_preformatted_with_text'} = '@example
@deffn fset @var{i} a g
Text in preformatted.

@deffnx {truc} bidulr machin...
@end deffn
@end example
';


$result_texts{'defx_after_preformatted_with_text'} = 'fset: i a g
Text in preformatted.

truc: bidulr machin...
';

$result_errors{'defx_after_preformatted_with_text'} = [
  {
    'error_line' => ':2: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => ':5: must be after `@deffn\' to use `@deffnx\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'must be after `@deffn\' to use `@deffnx\'',
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
