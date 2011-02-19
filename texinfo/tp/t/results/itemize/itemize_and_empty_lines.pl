use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'itemize_and_empty_lines'} = {
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
              'text' => 'youhou'
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'cmdname' => 'item',
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
                  'text' => 'first item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In example
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'end example.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'extra' => {
            'item_number' => 2
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'empty line.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 3
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'cmdname' => 'example',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In second example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 14,
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
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
            'item_number' => 4
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'quotation after a blank line
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 23,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'extra' => {
            'item_number' => 5
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {}
          ]
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
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
                  'text' => 'first item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In example
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'end example.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'extra' => {
            'item_number' => 2
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'empty line.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 3
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'cmdname' => 'example',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In second example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 41,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'extra' => {
            'item_number' => 4
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 45,
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
            'item_number' => 5
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'quotation after a blank line
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 51,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'extra' => {
            'item_number' => 6
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {
              'cmdname' => 'bullet',
              'parent' => {},
              'type' => 'command_as_argument'
            }
          ]
        ],
        'command_as_argument' => {}
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'An itemize
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
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'minus',
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'cmdname' => 'item',
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
                  'text' => 'truc 
'
                },
                {
                  'parent' => {},
                  'text' => 'line
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
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
        'command_as_argument' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 57,
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'After itemize
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'A nested itemize
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
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'minus',
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'cmdname' => 'item',
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
                  'text' => 'truc 
'
                },
                {
                  'parent' => {},
                  'text' => 'line
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
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'cmdname' => 'bullet',
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
              'cmdname' => 'itemize',
              'contents' => [
                {
                  'cmdname' => 'item',
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
                          'text' => 'in nested itemize
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'extra' => {
                    'item_number' => 1
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
                'command_as_argument' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 68,
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'After inside nested itemize.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
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
        'command_as_argument' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 65,
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'After nested itemize
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
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'cmdname' => 'bullet',
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
      'cmdname' => 'itemize',
      'contents' => [
        {
          'cmdname' => 'item',
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
                  'text' => 'the version number of Texinfo and the program(s) or manual(s) involved.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
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
                  'text' => 'hardware and operating system names and versions.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 2
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
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
                  'text' => 'something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
'
                },
                {
                  'parent' => {},
                  'text' => 'b b bbbbbbbbbbbbbbbbbbbbbbb.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 3
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
        'command_as_argument' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 75,
        'macro' => ''
      },
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
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[6]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[6]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'contents'}[7]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'extra'}{'command_as_argument'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[4]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[5]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[6];
$result_trees{'itemize_and_empty_lines'}{'contents'}[6]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'extra'}{'command_as_argument'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[7]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[8]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[9];
$result_trees{'itemize_and_empty_lines'}{'contents'}[9]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[10]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[11]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[12];
$result_trees{'itemize_and_empty_lines'}{'contents'}[12]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[4];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'extra'}{'command_as_argument'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[13]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[14]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[15];
$result_trees{'itemize_and_empty_lines'}{'contents'}[15]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[16]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'contents'}[2]{'parent'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'extra'}{'command_as_argument'} = $result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'args'}[0]{'contents'}[1];
$result_trees{'itemize_and_empty_lines'}{'contents'}[17]{'parent'} = $result_trees{'itemize_and_empty_lines'};
$result_trees{'itemize_and_empty_lines'}{'contents'}[18]{'parent'} = $result_trees{'itemize_and_empty_lines'};

$result_texis{'itemize_and_empty_lines'} = '@itemize youhou
@item first item
@item
@example
In example

end example.
@end example
@item

empty line.
@item

@example
In second example
@end example
@quotation
Quotation
@end quotation

@item

@quotation
quotation after a blank line
@end quotation
@end itemize

@itemize
@item first item
@item
@example
In example

end example.
@end example
@item

empty line.
@item

@example
In second example
@end example
@item
@quotation
Quotation
@end quotation

@item

@quotation
quotation after a blank line
@end quotation
@end itemize

An itemize
@itemize @minus
@item truc 
line
@end itemize
After itemize


A nested itemize
@itemize @minus
@item truc 
line
@itemize @bullet
@item in nested itemize
@end itemize
After inside nested itemize.
@end itemize
After nested itemize

@itemize @bullet
@item the version number of Texinfo and the program(s) or manual(s) involved.
@item hardware and operating system names and versions.
@item something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
@end itemize
';


$result_texts{'itemize_and_empty_lines'} = 'first item
In example

end example.

empty line.

In second example
Quotation


quotation after a blank line

first item
In example

end example.

empty line.

In second example
Quotation


quotation after a blank line

An itemize
truc 
line
After itemize


A nested itemize
truc 
line
in nested itemize
After inside nested itemize.
After nested itemize

the version number of Texinfo and the program(s) or manual(s) involved.
hardware and operating system names and versions.
something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
';

$result_errors{'itemize_and_empty_lines'} = [];



$result_converted{'plaintext'}->{'itemize_and_empty_lines'} = '   youhou first item
   youhou In example

          end example.
   youhou 
     empty line.
   youhou 
          In second example
          Quotation

   youhou 
          quotation after a blank line

   * first item
   *      In example

          end example.
   * 
     empty line.
   * 
          In second example
   *      Quotation

   * 
          quotation after a blank line

   An itemize
   - truc line
   After itemize

   A nested itemize
   - truc line
        * in nested itemize
     After inside nested itemize.
   After nested itemize

   * the version number of Texinfo and the program(s) or manual(s)
     involved.
   * hardware and operating system names and versions.
   * something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa b b
     bbbbbbbbbbbbbbbbbbbbbbb.
';

1;
