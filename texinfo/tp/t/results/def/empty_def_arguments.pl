use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'empty_def_arguments'} = {
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
                  'parent' => {},
                  'text' => 'fset '
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
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a g
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
                  'text' => 'fset'
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
                {}
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
                  'text' => 'a'
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
                  'text' => 'g'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'id '
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
                          'cmdname' => 'samp',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' ule'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'b',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '    
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
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
                  'text' => ' 
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_command' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
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
                  'text' => 'aaa
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
                  'text' => 'aaa'
                }
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
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
                      'text' => ' '
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
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
                {}
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'extra'}{'def_args'}[2][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[3];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'extra'}{'def_args'}[2][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'extra'}{'def_args'}[0][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'extra'}{'def_args'}[2][1] = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'contents'}[2];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'extra'}{'index_entry'}{'content'} = $result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'extra'}{'def_args'};
$result_trees{'empty_def_arguments'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'empty_def_arguments'}{'contents'}[0];
$result_trees{'empty_def_arguments'}{'contents'}[0]{'parent'} = $result_trees{'empty_def_arguments'};
$result_trees{'empty_def_arguments'}{'contents'}[1]{'parent'} = $result_trees{'empty_def_arguments'};

$result_texis{'empty_def_arguments'} = '@deffn fset @var{i} a g
@deffnx @b{id @samp{i} ule}    
@deffnx 
@deffnx aaa
@deffnx {} {}
@deffnx{}
@deffnx{truc} { }
@deffnx{truc}
@deffnx{} {}
@end deffn
';


$result_texts{'empty_def_arguments'} = 'fset i a g
id i ule    
aaa
 

truc  
truc
 
';

$result_errors{'empty_def_arguments'} = [];


1;
