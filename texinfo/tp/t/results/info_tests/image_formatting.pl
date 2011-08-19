use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'image_formatting'} = {
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
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
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile,l--i'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'l--i'
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
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile,,l--e'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'l--e'
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
                  undef,
                  [
                    {}
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile,,,alt'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'alt'
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
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile,,,,e-d-xt'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'e--xt'
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
                  undef,
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile,aze,az,alt,e--xt'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aze'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'az'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'alt'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'e--xt'
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
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f-ile,aze,,a--lt'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f-ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aze'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a--lt'
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
                  undef,
                  [
                    {}
                  ]
                ]
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
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'file'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => '.,aze,az,alt,'
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'file'
                    },
                    {
                      'cmdname' => '{',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'file ext'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' e--xt'
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 10,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'f--ile'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'file',
                      'contents' => [],
                      'line_nr' => {},
                      'parent' => {}
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'cmdname' => '.',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aze'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'az'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'alt'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'file ext'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'file',
                      'contents' => [],
                      'line_nr' => {},
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' e--xt'
                    },
                    {
                      'cmdname' => '}',
                      'parent' => {}
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
                    {},
                    {},
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
                    {},
                    {},
                    {}
                  ]
                ]
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
                      'parent' => {},
                      'text' => 'image'
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
                  ]
                ]
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
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'image'
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
                  ]
                ]
              },
              'line_nr' => {},
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
        },
        {
          'cmdname' => 'example',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 14,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
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
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile,l--i'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 15,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'l--i'
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
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile,,l--e'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 16,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'l--e'
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
                      undef,
                      [
                        {}
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile,,,alt'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 17,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'alt'
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
                      undef,
                      undef,
                      [
                        {}
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile,,,,e-d-xt'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 18,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'e--xt'
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
                      undef,
                      undef,
                      undef,
                      [
                        {}
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile,aze,az,alt,e--xt'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 19,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'aze'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'az'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'alt'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'e--xt'
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
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f-ile,aze,,a--lt'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 20,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'f-ile'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'aze'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'a--lt'
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
                      undef,
                      [
                        {}
                      ]
                    ]
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
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'file'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'f--ile'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => '.,aze,az,alt,'
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'file'
                        },
                        {
                          'cmdname' => '{',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'file ext'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' e--xt'
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 21,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'f--ile'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'file',
                          'contents' => [],
                          'line_nr' => {},
                          'parent' => {}
                        },
                        {
                          'cmdname' => '@',
                          'parent' => {}
                        },
                        {
                          'cmdname' => '.',
                          'parent' => {}
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'aze'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'az'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'alt'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    },
                    {
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'parent' => {},
                                  'text' => 'file ext'
                                }
                              ],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'file',
                          'contents' => [],
                          'line_nr' => {},
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' e--xt'
                        },
                        {
                          'cmdname' => '}',
                          'parent' => {}
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
                        {},
                        {},
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
                        {},
                        {},
                        {}
                      ]
                    ]
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
                          'parent' => {},
                          'text' => 'image'
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
                      ]
                    ]
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 22,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'image'
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
                      ]
                    ]
                  },
                  'line_nr' => {},
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                'command' => {},
                'command_argument' => 'example',
                'text_arg' => 'example'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
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
            'line_nr' => 13,
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
                  'text' => 'f--ile'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a very long alt argument that could span more than one line who knows'
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
              undef,
              undef,
              [
                {}
              ]
            ]
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 25,
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'in para
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f--ile'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'a very long alt argument that could span more than one line who knows'
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
                  undef,
                  undef,
                  [
                    {}
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 28,
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
$result_trees{'image_formatting'}{'contents'}[0]{'parent'} = $result_trees{'image_formatting'};
$result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[4]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[8]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[12]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[16]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[20]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[24]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[26]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[27]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[19]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[29]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][1] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][2] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[30]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[31]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[33]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[32]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[34]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'contents'}[35]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'extra'}{'command'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[4]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[8]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[12]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[16]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[20]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[24]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[26]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[27]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[16]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[18]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'contents'}[19]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[29]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][1] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[0][2] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[0]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[1]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[2]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][1] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'extra'}{'brace_command_contents'}[4][2] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'args'}[4]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[28]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[30]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[31]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[33]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'line_nr'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[32]{'line_nr'};
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[34]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[35]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'extra'}{'command'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'contents'}[2];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[3];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8];
$result_trees{'image_formatting'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'image_formatting'}{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'image_formatting'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'image_formatting'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'image_formatting'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'image_formatting'}{'contents'}[1]{'parent'} = $result_trees{'image_formatting'};

$result_texis{'image_formatting'} = '@node Top

@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}

@example
@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}
@end example

@image{f--ile,,,a very long alt argument that could span more than one line who knows}

in para
@image{f--ile,,,a very long alt argument that could span more than one line who knows}.
';


$result_texts{'image_formatting'} = '
@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

f--ile

in para
f--ile.
';

$result_sectioning{'image_formatting'} = {};

$result_nodes{'image_formatting'} = {
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
      ],
      'top_node_up' => {}
    },
    'type' => 'top_node_up'
  }
};
$result_nodes{'image_formatting'}{'node_up'}{'extra'}{'top_node_up'} = $result_nodes{'image_formatting'};

$result_menus{'image_formatting'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'image_formatting'} = [];



$result_converted{'info'}->{'image_formatting'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)

`@image{f--ile}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ] `@image{f--ile,l--i}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ] `@image{f--ile,,l--e}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
`@image{f--ile,,,alt}\'  [image src="f--ile.png" alt="alt" text="[Image description\\"\\"\\\\.]" ] `@image{f--ile,,,,e-d-xt}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
`@image{f--ile,aze,az,alt,e--xt}\'  [image src="f--ile.png" alt="alt" text="[Image description\\"\\"\\\\.]" ] `@image{f-ile,aze,,a--lt}\' 
`@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}\'  [aaa
bbb
ccc] [aaa
bbb
ccc]

     `@image{f--ile}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
     `@image{f--ile,l--i}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
     `@image{f--ile,,l--e}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
     `@image{f--ile,,,alt}\'  [image src="f--ile.png" alt="alt" text="[Image description\\"\\"\\\\.]" ]
     `@image{f--ile,,,,e-d-xt}\'  [image src="f--ile.png" text="[Image description\\"\\"\\\\.]" ]
     `@image{f--ile,aze,az,alt,e--xt}\'  [image src="f--ile.png" alt="alt" text="[Image description\\"\\"\\\\.]" ]
     `@image{f-ile,aze,,a--lt}\' 
     `@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}\' 
     [aaa
bbb
ccc] [aaa
bbb
ccc]

 [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="Image description\\"\\"\\\\." ]

   in para  [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="[Image description\\"\\"\\\\.]" ].


Tag Table:
Node: Top52

End Tag Table
';

$result_converted_errors{'info'}->{'image_formatting'} = [
  {
    'file_name' => '',
    'error_line' => ':9: warning: Cannot find @image file `f-ile.txt\'
',
    'text' => 'Cannot find @image file `f-ile.txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 9
  },
  {
    'file_name' => '',
    'error_line' => ':10: warning: Cannot find @image file `f--ile@..txt\'
',
    'text' => 'Cannot find @image file `f--ile@..txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 10
  },
  {
    'file_name' => '',
    'error_line' => ':20: warning: Cannot find @image file `f-ile.txt\'
',
    'text' => 'Cannot find @image file `f-ile.txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 20
  },
  {
    'file_name' => '',
    'error_line' => ':21: warning: Cannot find @image file `f--ile@..txt\'
',
    'text' => 'Cannot find @image file `f--ile@..txt\'',
    'type' => 'warning',
    'macro' => '',
    'line_nr' => 21
  }
];


1;
