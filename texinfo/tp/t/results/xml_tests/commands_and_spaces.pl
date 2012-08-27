use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'commands_and_spaces'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'foo',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'some @value',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'arg_line' => '  foo   some @value
'
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
              'parent' => {},
              'text' => 'ggg',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'unmacro',
          'extra' => {
            'arg_line' => '  ggg
'
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
              'parent' => {},
              'text' => '@arrow',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'clickstyle',
          'extra' => {
            'arg_line' => '  @arrow
'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '  after  cropmarks.
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'cropmarks',
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
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'a'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '(b)'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '(c)'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(d)'
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
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'a'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'b'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'c'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'd'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'e'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ]
            ],
            'spaces_before_argument' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'a'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'b'
                },
                {
                  'parent' => {},
                  'text' => ' 
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'c'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'd'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'e'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'extra' => {
            'brace_command_contents' => [
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ],
              [
                {}
              ]
            ],
            'spaces_before_argument' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Note'
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
          'cmdname' => 'quotation',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Q
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
                      'text' => 'quotation'
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
                'command_argument' => 'quotation',
                'spaces_after_command' => {},
                'text_arg' => 'quotation'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 18,
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
            'end_command' => {},
            'spaces_after_command' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 16,
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'ff'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
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
                  'text' => 'b'
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
                  'text' => 'f
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
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'In caption '
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
                'float' => {},
                'spaces_before_argument' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 22,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'j.
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
                          'text' => 'Short'
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
              'cmdname' => 'shortcaption',
              'contents' => [],
              'extra' => {
                'float' => {},
                'spaces_before_argument' => {
                  'parent' => {},
                  'text' => '',
                  'type' => 'empty_spaces_before_argument'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '  g.
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
                'spaces_after_command' => {},
                'text_arg' => 'float'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 24,
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
            'normalized' => 'b',
            'shortcaption' => {},
            'spaces_after_command' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'ff'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 20,
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
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
                          'text' => '  ',
                          'type' => 'empty_spaces_after_command'
                        },
                        {
                          'parent' => {},
                          'text' => '0.4  0.6'
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
                  'cmdname' => 'columnfractions',
                  'extra' => {
                    'misc_args' => [
                      '0.4',
                      '0.6'
                    ],
                    'spaces_after_command' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 26,
                    'macro' => ''
                  },
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'multitable',
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
                      'text' => 'multitable'
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
                'command_argument' => 'multitable',
                'spaces_after_command' => {},
                'text_arg' => 'multitable'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 27,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'columnfractions' => [],
            'end_command' => {},
            'max_columns' => 2,
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
                  'text' => '  ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aa b'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '  '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'cmd'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 29,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'gg hh j 
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'multitable',
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
                      'text' => 'multitable'
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
                'command_argument' => 'multitable',
                'spaces_after_command' => {},
                'text_arg' => 'multitable'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 30,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {},
            'max_columns' => 5,
            'prototypes' => [
              {
                'contents' => [],
                'parent' => {},
                'type' => 'bracketed_multitable_prototype'
              },
              {},
              {
                'text' => 'gg',
                'type' => 'row_prototype'
              },
              {
                'text' => 'hh',
                'type' => 'row_prototype'
              },
              {
                'text' => 'j',
                'type' => 'row_prototype'
              }
            ],
            'prototypes_line' => [
              {
                'text' => '  ',
                'type' => 'prototype_space'
              },
              {},
              {
                'text' => '  ',
                'type' => 'prototype_space'
              },
              {},
              {
                'text' => 'gg',
                'type' => 'row_prototype'
              },
              {
                'text' => ' ',
                'type' => 'prototype_space'
              },
              {
                'text' => 'hh',
                'type' => 'row_prototype'
              },
              {
                'text' => ' ',
                'type' => 'prototype_space'
              },
              {
                'text' => 'j',
                'type' => 'row_prototype'
              },
              {
                'text' => ' 
',
                'type' => 'prototype_space'
              }
            ],
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'T'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '  ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'a'
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
              'cmdname' => 'footnote',
              'contents' => [],
              'extra' => {
                'spaces_before_argument' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 32,
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
              'parent' => {},
              'text' => 'Math '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => '\\underline'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' a, b'
                        }
                      ],
                      'line_nr' => {
                        'file_name' => '',
                        'line_nr' => 34,
                        'macro' => ''
                      },
                      'parent' => {},
                      'type' => 'bracketed'
                    },
                    {
                      'parent' => {},
                      'text' => ' '
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'math',
              'contents' => [],
              'extra' => {
                'spaces_before_argument' => {}
              },
              'line_nr' => {},
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
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'http://ggg'
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_at_end'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'indicateurl',
              'contents' => [],
              'extra' => {
                'brace_command_contents' => [
                  [
                    {}
                  ]
                ],
                'spaces_before_argument' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 36,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'a'
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'b'
              }
            ]
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'c'
              }
            ]
          },
          {
            'manual_content' => [
              {
                'parent' => {},
                'text' => 'd'
              }
            ]
          }
        ],
        'normalized' => 'a',
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
  'type' => 'document_root'
};
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[6];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[4]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[2]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[3]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[4]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'extra'}{'end_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'extra'}{'float'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'extra'}{'float'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'extra'}{'spaces_before_argument'}{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[4];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'caption'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'end_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[5];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'node_content'}[0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[1]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'shortcaption'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'contents'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'extra'}{'type'}{'content'}[0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'extra'}{'columnfractions'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'extra'}{'misc_args'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'extra'}{'end_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'line_nr'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'args'}[0]{'contents'}[1]{'line_nr'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'extra'}{'command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'end_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'prototypes'}[0]{'contents'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'prototypes'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'prototypes'}[1] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'prototypes_line'}[1] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'prototypes_line'}[3] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'line_nr'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'args'}[0]{'contents'}[3]{'line_nr'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'line_nr'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'args'}[0]{'contents'}[2]{'line_nr'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'extra'}{'spaces_before_argument'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'nodes_manuals'}[1]{'manual_content'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[1];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'nodes_manuals'}[2]{'manual_content'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[2];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'nodes_manuals'}[3]{'manual_content'}[0]{'parent'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[3];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'extra'}{'spaces_after_command'} = $result_trees{'commands_and_spaces'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'commands_and_spaces'}{'contents'}[1]{'parent'} = $result_trees{'commands_and_spaces'};

$result_texis{'commands_and_spaces'} = '@set  foo   some @value

@unmacro  ggg

@clickstyle  @arrow

@cropmarks  after  cropmarks.

@node a ,(b),(c) , (d)   

@image{ a ,b,c , d,e }

@image{ a ,b 
,c , d,e }

@quotation  Note  
Q
@end quotation

@float  ff , b   
f
@caption{ In caption }j.
@shortcaption{Short}  g.
@end float

@multitable  @columnfractions  0.4  0.6  
@end multitable

@multitable  {aa b}  @var{cmd}gg hh j 
@end multitable

T@footnote{  a}.

Math @math{ \\underline{ a, b} }.

@indicateurl{ http://ggg }

';


$result_texts{'commands_and_spaces'} = '




a

a

Note  
Q

ff, b   
f
j.
  g.



T.

Math \\underline{ a, b} .

http://ggg

';

$result_sectioning{'commands_and_spaces'} = {};

$result_nodes{'commands_and_spaces'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'a'
  },
  'node_next' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'b'
        }
      ]
    }
  },
  'node_prev' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'c'
        }
      ]
    }
  },
  'node_up' => {
    'extra' => {
      'manual_content' => [
        {
          'text' => 'd'
        }
      ]
    }
  }
};

$result_menus{'commands_and_spaces'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'a'
  }
};

$result_errors{'commands_and_spaces'} = [];


$result_floats{'commands_and_spaces'} = {
  'ff' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {},
            'spaces_before_argument' => {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            }
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
        'normalized' => 'b',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {},
            'spaces_before_argument' => {
              'text' => '',
              'type' => 'empty_spaces_before_argument'
            }
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'ff'
            }
          ],
          'normalized' => 'ff'
        }
      },
      'number' => 1
    }
  ]
};
$result_floats{'commands_and_spaces'}{'ff'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'commands_and_spaces'}{'ff'}[0];
$result_floats{'commands_and_spaces'}{'ff'}[0]{'extra'}{'end_command'}{'extra'}{'command'} = $result_floats{'commands_and_spaces'}{'ff'}[0];
$result_floats{'commands_and_spaces'}{'ff'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'commands_and_spaces'}{'ff'}[0];



$result_converted{'xml'}->{'commands_and_spaces'} = '<set name="foo" line="  foo   some @value">some @value</set>


<clickstyle command="arrow" line="  @arrow">@arrow</clickstyle>

<cropmarks line="  after  cropmarks."></cropmarks>

<node name="a" spaces=" " trailingspaces=" "><nodename>a</nodename><nodenext>(b)</nodenext><nodeprev trailingspaces=" ">(c)</nodeprev><nodeup spaces=" " trailingspaces="   ">(d)</nodeup></node>

<image spaces=" "><imagefile>a </imagefile><imagewidth>b</imagewidth><imageheight>c </imageheight><alttext spaces=" ">d</alttext><imageextension>e </imageextension></image>

<image spaces=" "><imagefile>a </imagefile><imagewidth>b 
</imagewidth><imageheight>c </imageheight><alttext spaces=" ">d</alttext><imageextension>e </imageextension></image>

<quotation spaces="  "><quotationtype>Note  </quotationtype>
<para>Q
</para></quotation>

<float name="b" type="ff" spaces="  "><floattype>ff </floattype><floatname spaces=" ">b   </floatname>
<para>f
</para><caption spaces=" "><para>In caption </para></caption><para>j.
</para><shortcaption><para>Short</para></shortcaption><para>  g.
</para></float>

<multitable spaces="  "><columnfractions line="  0.4  0.6  "><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions>
</multitable>

<multitable spaces="  "><columnprototypes><columnprototype bracketed="on">aa b</columnprototype>  <columnprototype><var>cmd</var></columnprototype><columnprototype>gg</columnprototype> <columnprototype>hh</columnprototype> <columnprototype>j</columnprototype> </columnprototypes>
</multitable>

<para>T<footnote spaces="  "><para>a</para></footnote>.
</para>
<para>Math <math spaces=" ">\\underline{ a, b} </math>.
</para>
<para><indicateurl spaces=" ">http://ggg </indicateurl>
</para>
';

1;
