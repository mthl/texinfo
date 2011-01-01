use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'numbering_captions_listoffloats'} = {
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
        'line_nr' => 1,
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
              'text' => 'Test floats'
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
                  'text' => 'Text'
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
                  'text' => 'text with a lot of features'
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
                      'type' => 'empty_spaces_before_paragraph'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An example of float caption'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'enddots',
                          'contents' => [],
                          'parent' => {}
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'TeX',
                          'contents' => [],
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => ' and someething'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 7,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'text-with-a-lot-of-features',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          },
          'number' => 1,
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
                  'text' => 'No label but caption and shortcaption.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No label'
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
                'float' => {}
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No label'
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
                'float' => {}
              },
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
'
            }
          ],
          'extra' => {
            'block_command_line_contents' => [
              [
                {}
              ]
            ],
            'caption' => {},
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
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
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type'
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
                  'text' => 'No type but caption and shortcaption.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No type'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 20,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No type'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 21,
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
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type',
            'shortcaption' => {}
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'number' => 1,
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
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type and no caption'
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
                  'text' => 'No type but label and no caption nor shortcaption.
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
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type-and-no-caption'
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 25,
            'macro' => ''
          },
          'number' => 2,
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
        },
        {
          'cmdname' => 'float',
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
                  'text' => 'No label, no type, no caption no shortcaption.
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
          'float_section' => {},
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
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
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
                  'text' => 'No label, no type, but caption and shortcaption.
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C No label, no type, but caption and shortcaption.'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 38,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC No label, no type, but caption and shortcaption.'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 39,
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
            }
          ],
          'extra' => {
            'caption' => {},
            'shortcaption' => {}
          },
          'float_section' => {},
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type 2'
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
                  'text' => 'Second float with no type.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No type 2'
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
                'float' => {}
              },
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
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No type 2'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 46,
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
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type-2',
            'shortcaption' => {}
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 42,
            'macro' => ''
          },
          'number' => 3,
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Warning'
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
                  'text' => 'warning in top'
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
                  'text' => 'A warning
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C A warning'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 52,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC A warning'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 53,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'warning-in-top',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Warning'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 49,
            'macro' => ''
          },
          'number' => 1,
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
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
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
              'text' => 'chapter'
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
            'normalized' => 'chapter'
          }
        ],
        'normalized' => 'chapter'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 56,
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
              'text' => 'A chapter'
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
                  'text' => 'Text'
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
                  'text' => 'text in chapter'
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
                  'text' => 'Text in chapter
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C Text in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 62,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'text-in-chapter',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 59,
            'macro' => ''
          },
          'number' => '1.1',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
                  'text' => 'float with a lot of features and no shortcaption'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_before_paragraph'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An example of float caption, no shortcaption'
                        },
                        {
                          'args' => [
                            {
                              'contents' => [],
                              'parent' => {},
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'enddots',
                          'contents' => [],
                          'parent' => {}
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 66,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 65,
            'macro' => ''
          },
          'number' => '1.2',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'th'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '\'',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'or'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '`',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'me'
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
                  'text' => 'theoreme'
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
                  'text' => 'A th'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '\'',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'or'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '`',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'me
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C A th'
                        },
                        {
                          'args' => [
                            {
                              'parent' => {},
                              'text' => 'e'
                            }
                          ],
                          'cmdname' => '\'',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'or'
                        },
                        {
                          'args' => [
                            {
                              'parent' => {},
                              'text' => 'e'
                            }
                          ],
                          'cmdname' => '`',
                          'parent' => {}
                        },
                        {
                          'parent' => {},
                          'text' => 'me'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 72,
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
          'extra' => {
            'block_command_line_contents' => [
              [
                {},
                {},
                {},
                {},
                {}
              ],
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'theoreme',
            'type' => {
              'content' => [
                {},
                {},
                {},
                {},
                {}
              ],
              'normalized' => 'th_00e9or_00e8me'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 69,
            'macro' => ''
          },
          'number' => '1.1',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type in chapter'
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
                  'text' => 'float with no type.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No type in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 78,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No type in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 79,
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
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type-in-chapter',
            'shortcaption' => {}
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 75,
            'macro' => ''
          },
          'number' => '1.1',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Warning'
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
                  'text' => 'warning in chapter'
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
                  'text' => 'A warning
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C A warning in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 85,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC A warning in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 86,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'warning-in-chapter',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Warning'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 82,
            'macro' => ''
          },
          'number' => '1.1',
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
                      'text' => 'section'
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
                  'normalized' => 'section'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 90,
                'macro' => ''
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
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 57,
        'macro' => ''
      },
      'number' => 1,
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
              'text' => 'section'
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
            'normalized' => 'section'
          }
        ],
        'normalized' => 'section'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 93,
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
              'text' => 'A section'
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
                  'text' => 'Text'
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
                  'text' => 'text in section'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'A text in float no caption a label a type.
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
            'block_command_line_contents' => [
              [
                {}
              ],
              [
                {}
              ]
            ],
            'node_content' => [
              {}
            ],
            'normalized' => 'text-in-section',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 96,
            'macro' => ''
          },
          'number' => '1.3',
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 94,
        'macro' => ''
      },
      'number' => '1.1',
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
              'text' => 'Unnumbered'
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
            'normalized' => 'Unnumbered'
          }
        ],
        'normalized' => 'Unnumbered'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 102,
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
              'text' => 'Unnumbered'
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
                      'text' => 'Section within unnumbered'
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
                  'normalized' => 'Section-within-unnumbered'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 106,
                'macro' => ''
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
                  'text' => 'Text'
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
                  'text' => 'unnumbered float'
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
                  'text' => 'unnum
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC unnumbered float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 110,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C unnumbered float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 111,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'unnumbered-float',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 108,
            'macro' => ''
          },
          'number' => 5,
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type in unnumbered'
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
                  'text' => 'float with no type.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No type in unnumbered'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 116,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No type in unnumbered'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 117,
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
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type-in-unnumbered',
            'shortcaption' => {}
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 113,
            'macro' => ''
          },
          'number' => 5,
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
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 103,
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
              'text' => 'Section within unnumbered'
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
            'normalized' => 'Section-within-unnumbered'
          }
        ],
        'normalized' => 'Section-within-unnumbered'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 121,
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
              'text' => 'Section within unnumbered'
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
                  'text' => 'Text'
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
                  'text' => 'Section within unnumbered float'
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
                  'text' => 'Section within unnumbered
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC Section within unnumbered'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 127,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C Section within unnumbered'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 128,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'Section-within-unnumbered-float',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 125,
            'macro' => ''
          },
          'number' => 6,
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 122,
        'macro' => ''
      },
      'number' => '1.2',
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
              'text' => 'Chapter with unnumbsubsec'
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
            'normalized' => 'Chapter-with-unnumbsubsec'
          }
        ],
        'normalized' => 'Chapter-with-unnumbsubsec'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 131,
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
              'text' => 'Chapter with unnumbsubsec'
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
                      'text' => 'unnumbered sec'
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
                  'normalized' => 'unnumbered-sec'
                }
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 135,
                'macro' => ''
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
                  'text' => 'Text'
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
                  'text' => 'Chapter with subsec float'
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
                  'text' => 'Chap
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC Chapter with subsec'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 139,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C Chapter with subsec'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 140,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'Chapter-with-subsec-float',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 137,
            'macro' => ''
          },
          'number' => '2.1',
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
        'line_nr' => 132,
        'macro' => ''
      },
      'number' => 2,
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
              'text' => 'unnumbered sec'
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
            'normalized' => 'unnumbered-sec'
          }
        ],
        'normalized' => 'unnumbered-sec'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 143,
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
              'text' => 'unnumbered sec'
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
      'cmdname' => 'unnumberedsec',
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
                  'text' => 'unnumbered sec float'
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
                  'text' => 'Chap
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC unnumbered sec float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 148,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C unnumbered sec float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 149,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'unnumbered-sec-float',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 146,
            'macro' => ''
          },
          'number' => '2.2',
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'label but no type in unnumbered subsec in chapter'
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
                  'text' => 'float with no type.
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
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'C No type in unnumbered subsec in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 155,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'SC No type in unnumbered subsec in chapter'
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
                'float' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 156,
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
          'extra' => {
            'block_command_line_contents' => [
              undef,
              [
                {}
              ]
            ],
            'caption' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'label-but-no-type-in-unnumbered-subsec-in-chapter',
            'shortcaption' => {}
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 152,
            'macro' => ''
          },
          'number' => '2.1',
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
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 144,
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
              'text' => 'Appendix for float'
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
            'normalized' => 'Appendix-for-float'
          }
        ],
        'normalized' => 'Appendix-for-float'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 159,
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
              'text' => 'Appendix for float'
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
      'cmdname' => 'appendix',
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'Text'
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
                  'text' => 'appendix sec float'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Appendix
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'SC appendix sec float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 165,
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'C appendix sec float'
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
                    'float' => {}
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 166,
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
            'node_content' => [
              {}
            ],
            'normalized' => 'appendix-sec-float',
            'shortcaption' => {},
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'float_section' => {},
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 162,
            'macro' => ''
          },
          'number' => 'A.1',
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
        'line_nr' => 160,
        'macro' => ''
      },
      'number' => 'A',
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
              'text' => 'list of floats'
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
            'normalized' => 'list-of-floats'
          }
        ],
        'normalized' => 'list-of-floats'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 169,
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
              'text' => 'list of floats'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'See '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text in section'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
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
                'line_nr' => 172,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            },
            {
              'parent' => {},
              'text' => 'And ('
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text in chapter'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'pxref',
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
                'line_nr' => 173,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ').
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
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
                'line_nr' => 174,
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
              'text' => 'And now a ref (without manual or printed manual)
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text with a lot of features'
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
                      'text' => 'cross ref'
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
                      'text' => 'title'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
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
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 177,
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
              'text' => 'And now a ref (with manual without printed manual)
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text with a lot of features'
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
                      'text' => 'cross ref'
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
                      'text' => 'title'
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
                      'text' => 'manual'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
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
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 180,
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
              'text' => 'And now a ref (without manual with a printed manual)
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'text with a lot of features'
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
                      'text' => 'cross ref'
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
                      'text' => 'title'
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
                      'text' => ' ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'printed manual title'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
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
                  undef,
                  [
                    {}
                  ]
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 183,
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
              'text' => 'A ref to float without type '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'label but no type'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
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
                'line_nr' => 185,
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
                  'text' => 'Text'
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
          'cmdname' => 'listoffloats',
          'extra' => {
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Text'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 187,
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
                  'text' => 'th'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '\'',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'or'
                },
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => 'e'
                    }
                  ],
                  'cmdname' => '`',
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => 'me'
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
          'cmdname' => 'listoffloats',
          'extra' => {
            'type' => {
              'content' => [
                {},
                {},
                {},
                {},
                {}
              ],
              'normalized' => 'th_00e9or_00e8me'
            }
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 188,
            'macro' => ''
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
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 170,
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
$result_trees{'numbering_captions_listoffloats'}{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[8]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[9]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[10]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[11]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[12]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[13]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[15]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[17]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[19]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[21]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[22]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[23]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[24]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[25]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[26]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][1] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][2] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][3] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[0][4] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'type'}{'content'}[1] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'type'}{'content'}[2] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'type'}{'content'}[3] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'extra'}{'type'}{'content'}[4] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[9]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[11]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[12]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[13]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[14]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[15]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[16]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[17]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[18]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[8]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[9]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[11]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[13]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'args'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[15]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'block_command_line_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'extra'}{'node_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'extra'}{'node_content'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[17]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'extra'}{'brace_command_contents'}[3][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'extra'}{'brace_command_contents'}[1][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'extra'}{'brace_command_contents'}[2][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'extra'}{'brace_command_contents'}[4][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'args'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[7]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[8]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[9]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[10]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[11]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'extra'}{'type'}{'content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'extra'}{'type'}{'content'}[1] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'extra'}{'type'}{'content'}[2] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'extra'}{'type'}{'content'}[3] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'extra'}{'type'}{'content'}[4] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'args'}[0]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[12]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[13]{'parent'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'extra'}{'misc_content'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'args'}[0]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'parent'} = $result_trees{'numbering_captions_listoffloats'};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[19]{'parent'} = $result_trees{'numbering_captions_listoffloats'};

$result_texis{'numbering_captions_listoffloats'} = '@node Top
@top Test floats

@float Text, text with a lot of features

@caption{ An example of float caption@enddots{}}
@shortcaption{@TeX{} and someething}
@end float

@float Text
No label but caption and shortcaption.

@caption{C No label}
@shortcaption{SC No label}
@end float

@float ,label but no type
No type but caption and shortcaption.

@caption{C No type}
@shortcaption{SC No type}
@end float


@float ,label but no type and no caption
No type but label and no caption nor shortcaption.

@end float


@float
No label, no type, no caption no shortcaption.

@end float

@float
No label, no type, but caption and shortcaption.
@caption{C No label, no type, but caption and shortcaption.}
@shortcaption{SC No label, no type, but caption and shortcaption.}
@end float

@float ,label but no type 2
Second float with no type.

@caption{C No type 2}
@shortcaption{SC No type 2}
@end float

@float Warning, warning in top
A warning

@caption{C A warning}
@shortcaption{SC A warning}
@end float

@node chapter
@chapter A chapter

@float Text, text in chapter
Text in chapter

@caption{C Text in chapter}
@end float

@float Text, float with a lot of features and no shortcaption
@caption{ An example of float caption, no shortcaption@enddots{}}
@end float

@float th@\'eor@`eme, theoreme
A th@\'eor@`eme

@caption{C A th@\'eor@`eme}
@end float

@float ,label but no type in chapter
float with no type.

@caption{C No type in chapter}
@shortcaption{SC No type in chapter}
@end float

@float Warning, warning in chapter
A warning

@caption{C A warning in chapter}
@shortcaption{SC A warning in chapter}
@end float

@menu
* section::
@end menu

@node section
@section A section

@float Text, text in section

A text in float no caption a label a type.

@end float

@node Unnumbered
@unnumbered Unnumbered

@menu
* Section within unnumbered::
@end menu
@float Text, unnumbered float
unnum
@shortcaption{SC unnumbered float}
@caption{C unnumbered float}
@end float
@float ,label but no type in unnumbered
float with no type.

@caption{C No type in unnumbered}
@shortcaption{SC No type in unnumbered}
@end float


@node Section within unnumbered
@section Section within unnumbered


@float Text, Section within unnumbered float
Section within unnumbered
@shortcaption{SC Section within unnumbered}
@caption{C Section within unnumbered}
@end float

@node Chapter with unnumbsubsec
@chapter Chapter with unnumbsubsec

@menu
* unnumbered sec::
@end menu
@float Text, Chapter with subsec float
Chap
@shortcaption{SC Chapter with subsec}
@caption{C Chapter with subsec}
@end float

@node unnumbered sec
@unnumberedsec unnumbered sec

@float Text, unnumbered sec float
Chap
@shortcaption{SC unnumbered sec float}
@caption{C unnumbered sec float}
@end float

@float ,label but no type in unnumbered subsec in chapter
float with no type.

@caption{C No type in unnumbered subsec in chapter}
@shortcaption{SC No type in unnumbered subsec in chapter}
@end float

@node Appendix for float
@appendix Appendix for float

@float Text, appendix sec float

Appendix
@shortcaption{SC appendix sec float}
@caption{C appendix sec float}
@end float

@node list of floats
@unnumbered list of floats

See @ref{text in section}.
And (@pxref{text in chapter}).
@xref{text with a lot of features}.

And now a ref (without manual or printed manual)
@ref{text with a lot of features, cross ref, title}.

And now a ref (with manual without printed manual)
@ref{text with a lot of features, cross ref, title, manual}.

And now a ref (without manual with a printed manual)
@ref{text with a lot of features, cross ref, title,, printed manual title}.

A ref to float without type @ref{label but no type}.

@listoffloats Text
@listoffloats th@\'eor@`eme

@bye
';


$result_texts{'numbering_captions_listoffloats'} = 'Test floats
***********





No label but caption and shortcaption.




No type but caption and shortcaption.





No type but label and no caption nor shortcaption.



No label, no type, no caption no shortcaption.


No label, no type, but caption and shortcaption.



Second float with no type.




A warning




1 A chapter
***********

Text in chapter





A the\'ore`me



float with no type.




A warning




* section::

1.1 A section
=============


A text in float no caption a label a type.


Unnumbered
**********

* Section within unnumbered::
unnum


float with no type.





1.2 Section within unnumbered
=============================


Section within unnumbered



2 Chapter with unnumbsubsec
***************************

* unnumbered sec::
Chap



unnumbered sec
==============

Chap



float with no type.




Appendix A Appendix for float
*****************************


Appendix



list of floats
**************

See .
And ().
.

And now a ref (without manual or printed manual)
.

And now a ref (with manual without printed manual)
.

And now a ref (without manual with a printed manual)
.

A ref to float without type .


';

$result_sectioning{'numbering_captions_listoffloats'} = {
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
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'chapter'
              }
            }
          },
          'level' => 1,
          'number' => 1,
          'section_childs' => [
            {
              'cmdname' => 'section',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'section'
                  }
                }
              },
              'level' => 2,
              'number' => '1.1',
              'section_up' => {}
            }
          ],
          'section_up' => {}
        },
        {
          'cmdname' => 'unnumbered',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Unnumbered'
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
                    'normalized' => 'Section-within-unnumbered'
                  }
                }
              },
              'level' => 2,
              'number' => '1.2',
              'section_up' => {}
            }
          ],
          'section_prev' => {},
          'section_up' => {}
        },
        {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Chapter-with-unnumbsubsec'
              }
            }
          },
          'level' => 1,
          'number' => 2,
          'section_childs' => [
            {
              'cmdname' => 'unnumberedsec',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'unnumbered-sec'
                  }
                }
              },
              'level' => 2,
              'section_up' => {}
            }
          ],
          'section_prev' => {},
          'section_up' => {}
        },
        {
          'cmdname' => 'appendix',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'Appendix-for-float'
              }
            }
          },
          'level' => 1,
          'number' => 'A',
          'section_prev' => {},
          'section_up' => {}
        },
        {
          'cmdname' => 'unnumbered',
          'extra' => {
            'associated_node' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'list-of-floats'
              }
            }
          },
          'level' => 1,
          'section_prev' => {},
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[0]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[1]{'section_prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[1]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[2]{'section_childs'}[0]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[2];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[2]{'section_prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[1];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[2]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[3]{'section_prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[2];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[3]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[4]{'section_prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[3];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_childs'}[4]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'numbering_captions_listoffloats'};

$result_nodes{'numbering_captions_listoffloats'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0
    },
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

$result_menus{'numbering_captions_listoffloats'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'numbering_captions_listoffloats'} = [
  {
    'error_line' => ':38: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 38,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':39: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 39,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':110: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 110,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':111: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 111,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':127: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 127,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':128: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 128,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':139: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 139,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':140: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 140,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':148: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 148,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':149: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 149,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':165: warning: @shortcaption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 165,
    'macro' => '',
    'text' => '@shortcaption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':166: warning: @caption should be right below `@float\'
',
    'file_name' => '',
    'line_nr' => 166,
    'macro' => '',
    'text' => '@caption should be right below `@float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':56: warning: unreferenced node `chapter\'
',
    'file_name' => '',
    'line_nr' => 56,
    'macro' => '',
    'text' => 'unreferenced node `chapter\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':102: warning: unreferenced node `Unnumbered\'
',
    'file_name' => '',
    'line_nr' => 102,
    'macro' => '',
    'text' => 'unreferenced node `Unnumbered\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':131: warning: unreferenced node `Chapter with unnumbsubsec\'
',
    'file_name' => '',
    'line_nr' => 131,
    'macro' => '',
    'text' => 'unreferenced node `Chapter with unnumbsubsec\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':159: warning: unreferenced node `Appendix for float\'
',
    'file_name' => '',
    'line_nr' => 159,
    'macro' => '',
    'text' => 'unreferenced node `Appendix for float\'',
    'type' => 'warning'
  },
  {
    'error_line' => ':169: warning: unreferenced node `list of floats\'
',
    'file_name' => '',
    'line_nr' => 169,
    'macro' => '',
    'text' => 'unreferenced node `list of floats\'',
    'type' => 'warning'
  }
];


$result_floats{'numbering_captions_listoffloats'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label-but-no-type',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {
        'cmdname' => 'top',
        'extra' => {},
        'level' => 0
      },
      'number' => 1
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'label-but-no-type-and-no-caption'
      },
      'float_section' => {},
      'number' => 2
    },
    {
      'cmdname' => 'float',
      'float_section' => {}
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {}
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label-but-no-type-2',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {},
      'number' => 3
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label-but-no-type-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 1
      },
      'number' => '1.1'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label-but-no-type-in-unnumbered',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {
        'cmdname' => 'unnumbered',
        'extra' => {},
        'level' => 1
      },
      'number' => 5
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'label-but-no-type-in-unnumbered-subsec-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      },
      'float_section' => {
        'cmdname' => 'unnumberedsec',
        'extra' => {},
        'level' => 2
      },
      'number' => '2.1'
    }
  ],
  'Text' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'text-with-a-lot-of-features',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {},
      'number' => 1
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {}
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'text-in-chapter',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {},
      'number' => '1.1'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {},
      'number' => '1.2'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'text-in-section',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'section',
        'extra' => {},
        'level' => 2,
        'number' => '1.1'
      },
      'number' => '1.3'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'unnumbered-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {},
      'number' => 5
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'Section-within-unnumbered-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'section',
        'extra' => {},
        'level' => 2,
        'number' => '1.2'
      },
      'number' => 6
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'Chapter-with-subsec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'chapter',
        'extra' => {},
        'level' => 1,
        'number' => 2
      },
      'number' => '2.1'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'unnumbered-sec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {},
      'number' => '2.2'
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'appendix-sec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'float_section' => {
        'cmdname' => 'appendix',
        'extra' => {},
        'level' => 1,
        'number' => 'A'
      },
      'number' => 'A.1'
    }
  ],
  'Warning' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'warning-in-top',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Warning'
            }
          ],
          'normalized' => 'Warning'
        }
      },
      'float_section' => {},
      'number' => 1
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'warning-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        },
        'type' => {
          'content' => [
            {
              'text' => 'Warning'
            }
          ],
          'normalized' => 'Warning'
        }
      },
      'float_section' => {},
      'number' => '1.1'
    }
  ],
  'th_00e9or_00e8me' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'theoreme',
        'type' => {
          'content' => [
            {
              'text' => 'th'
            },
            {
              'cmdname' => '\''
            },
            {
              'text' => 'or'
            },
            {
              'cmdname' => '`'
            },
            {
              'text' => 'me'
            }
          ],
          'normalized' => 'th_00e9or_00e8me'
        }
      },
      'float_section' => {},
      'number' => '1.1'
    }
  ]
};
$result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[0];
$result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[0];
$result_floats{'numbering_captions_listoffloats'}{''}[1]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[2]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[3];
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[3];
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[4];
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[4];
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[5];
$result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[5];
$result_floats{'numbering_captions_listoffloats'}{''}[6]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[6];
$result_floats{'numbering_captions_listoffloats'}{''}[6]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[6];
$result_floats{'numbering_captions_listoffloats'}{''}[7]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[7];
$result_floats{'numbering_captions_listoffloats'}{''}[7]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[2]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[2];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[2]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[3]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[3];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[3]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[5];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[5];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[6]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[6]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[6];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[6]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[6];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[7]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[7]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[8];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[8];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[7]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[9]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[9];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[9]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[9];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'th_00e9or_00e8me'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'th_00e9or_00e8me'}[0];
$result_floats{'numbering_captions_listoffloats'}{'th_00e9or_00e8me'}[0]{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'float_section'};



$result_converted{'plaintext'}->{'numbering_captions_listoffloats'} = 'Test floats
***********

Text 1: An example of float caption...

No label but caption and shortcaption.

Text: C No label

No type but caption and shortcaption.

1: C No type

No type but label and no caption nor shortcaption.

2
No label, no type, no caption no shortcaption.

No label, no type, but caption and shortcaption.
C No label, no type, but caption and shortcaption.

Second float with no type.

3: C No type 2

A warning

Warning 1: C A warning

1 A chapter
***********

Text in chapter

Text 1.1: C Text in chapter

Text 1.2: An example of float caption, no shortcaption...

A the\'ore`me

the\'ore`me 1.1: C A the\'ore`me

float with no type.

1.1: C No type in chapter

A warning

Warning 1.1: C A warning in chapter

* Menu:

* section::

1.1 A section
=============

A text in float no caption a label a type.

Text 1.3
Unnumbered
**********

* Menu:

* Section within unnumbered::
unnum
Text 5: C unnumbered float
float with no type.

5: C No type in unnumbered

1.2 Section within unnumbered
=============================

Section within unnumbered
Text 6: C Section within unnumbered

2 Chapter with unnumbsubsec
***************************

* Menu:

* unnumbered sec::
Chap
Text 2.1: C Chapter with subsec

unnumbered sec
==============

Chap
Text 2.2: C unnumbered sec float

float with no type.

2.1: C No type in unnumbered subsec in chapter

Appendix A Appendix for float
*****************************

Appendix
Text A.1: C appendix sec float

list of floats
**************

See *note text in section::.  And (*note text in chapter::).  *Note text
with a lot of features::.

   And now a ref (without manual or printed manual) *note cross ref:
text with a lot of features.

   And now a ref (with manual without printed manual) *note cross ref:
(manual)text with a lot of features.

   And now a ref (without manual with a printed manual) *note cross ref:
()text with a lot of features.

   A ref to float without type *note label but no type::.

* Menu:

* Text 1: text with a lot of features.   TeX and someething
* Text 1.1: text in chapter.             C Text in chapter
* Text 1.2: float with a lot of features and no shortcaption.
                                         An example of float ...
* Text 1.3: text in section.             
* Text 5: unnumbered float.              SC unnumbered float
* Text 6: Section within unnumbered float.
                                         SC Section within unnumbered
* Text 2.1: Chapter with subsec float.   SC Chapter with subsec
* Text 2.2: unnumbered sec float.        SC unnumbered sec float
* Text A.1: appendix sec float.          SC appendix sec float

* Menu:

* the\'ore`me 1.1: theoreme.              C A the\'ore`me

';

1;
