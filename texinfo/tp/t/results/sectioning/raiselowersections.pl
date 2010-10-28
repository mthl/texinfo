use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'raiselowersections'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '\\input texinfo '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' -*-texinfo-*-
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
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
                      'text' => 'Chapter'
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
                  'normalized' => 'Chapter'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
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
                      'text' => 'Second chapter'
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
                  'normalized' => 'Second-chapter'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
              'text' => 'Chapter'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Chapter'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
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
              'text' => 'Chapter'
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
      'cmdname' => 'chapter',
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
                      'text' => 'Chapter in included file'
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
                  'normalized' => 'Chapter-in-included-file'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
          'args' => [
            {
              'parent' => {},
              'text' => 'do-top',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => '',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'arg_line' => ' do-top
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
          'cmdname' => 'lowersections',
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
              'text' => '\\input texinfo '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' -*-texinfo-*-
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
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
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 11,
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
              'text' => 'Chapter in included file'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Chapter-in-included-file'
          }
        ]
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
        'line_nr' => 13,
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
              'text' => 'Chapter in included file'
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
      'cmdname' => 'chapter',
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
                      'text' => 'Section'
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
                  'normalized' => 'Section'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
        'sections_level' => -1
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
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
              'text' => 'Section'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Section'
          }
        ]
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
        'line_nr' => 20,
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
              'text' => 'Section'
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
                      'text' => 'Subsection'
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
                  'normalized' => 'Subsection'
                }
              },
              'parent' => {},
              'type' => 'menu_entry'
            }
          ],
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
        'sections_level' => -1
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
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
              'text' => 'Subsection'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Subsection'
          }
        ]
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
        'line_nr' => 27,
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
              'text' => 'Subsection'
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
      'cmdname' => 'subsection',
      'contents' => [
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
        },
        {
          'cmdname' => 'raisesections',
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
              'text' => 'do-top',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'clear',
          'extra' => {
            'arg_line' => ' do-top
'
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'sections_level' => -1
      },
      'line_nr' => {
        'file_name' => 't/include//section_file.texi',
        'line_nr' => 28,
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
              'text' => 'Second chapter'
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
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Second-chapter'
          }
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 30,
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
              'text' => 'Second chapter'
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
      'cmdname' => 'chapter',
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
              'text' => 'Second chapter
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
          'cmdname' => 'contents',
          'parent' => {}
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 31,
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
$result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[2];
$result_trees{'raiselowersections'}{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[3];
$result_trees{'raiselowersections'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[9]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'contents'}[10]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[4]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[5];
$result_trees{'raiselowersections'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[5]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6];
$result_trees{'raiselowersections'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[6];
$result_trees{'raiselowersections'}{'contents'}[6]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[7];
$result_trees{'raiselowersections'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[7]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[8];
$result_trees{'raiselowersections'}{'contents'}[8]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[9];
$result_trees{'raiselowersections'}{'contents'}[9]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[9]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[4];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[4]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'contents'}[5]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[10];
$result_trees{'raiselowersections'}{'contents'}[10]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[11];
$result_trees{'raiselowersections'}{'contents'}[11]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'raiselowersections'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[11]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0];
$result_trees{'raiselowersections'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12];
$result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12];
$result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[1];
$result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12];
$result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12];
$result_trees{'raiselowersections'}{'contents'}[12]{'contents'}[3]{'parent'} = $result_trees{'raiselowersections'}{'contents'}[12];
$result_trees{'raiselowersections'}{'contents'}[12]{'parent'} = $result_trees{'raiselowersections'};
$result_trees{'raiselowersections'}{'contents'}[13]{'parent'} = $result_trees{'raiselowersections'};

$result_texis{'raiselowersections'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top
@menu
* Chapter::
* Second chapter::
@end menu

@node Chapter
@chapter Chapter

@menu
* Chapter in included file::
@end menu

@set do-top

@lowersections

\\input texinfo @c -*-texinfo-*-


@node Chapter in included file
@chapter Chapter in included file

@menu
* Section::
@end menu

@node Section
@section Section

@menu
* Subsection::
@end menu

@node Subsection
@subsection Subsection


@raisesections

@clear do-top

@node Second chapter
@chapter Second chapter

Second chapter

@contents
@bye
';


$result_texts{'raiselowersections'} = '\\input texinfo 

* Chapter::
* Second chapter::

Chapter

* Chapter in included file::



\\input texinfo 

Chapter in included file

* Section::

Section

* Subsection::

Subsection




Second chapter

Second chapter

';

$result_errors{'raiselowersections'} = [];


$result_indices{'raiselowersections'} = undef;


1;
