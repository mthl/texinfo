use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'line_passed_and_formats'} = {
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
                  'text' => 'special'
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
                  'text' => 'Quotation special.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
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
                      'text' => 'Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
'
                    },
                    {
                      'parent' => {},
                      'text' => 'fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
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
              'type' => 'empty_line_after_command'
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
            'line_nr' => 3,
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
                  'text' => 'quotation  text
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
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
                      'text' => 'example in   quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
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
              'type' => 'empty_line_after_command'
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
                  'text' => ' In  example.
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => '   In quotation   in example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
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
',
              'type' => 'empty_line_after_command'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 18,
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
                  'text' => 'In 1 example
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
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
                  'text' => 'In 2 example
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
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
                  'text' => 'In 1 quotation
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 32,
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
                  'text' => 'In 2 quotation
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 35,
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
                      'text' => 'Nested quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Quotation 2
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
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
                  'text' => 'In  example.
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => 'In quotation   in example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 49,
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
                  'text' => 'In  example 2.
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 47,
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
                  'text' => 'quotation  text
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
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
                      'text' => 'example in   quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
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
                  'text' => 'quotation  text 2
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 55,
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
              'text' => 'Before quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'quotation  text
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 64,
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
              'text' => 'after end
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
              'text' => 'Before example
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 70,
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
              'text' => 'After example
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
              'text' => 'Before quotation and empty line
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'In quotation
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 76,
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
              'text' => 'After quotation
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
              'text' => 'Before example and empty line
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
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
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 84,
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
              'text' => 'After example
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
              'text' => 'Nested and empty lines
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
              'text' => 'Quotation empty out, spaces inside
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In nested
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
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 96,
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 94,
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
              'text' => 'Quotation empty out, no spaces inside
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                      'text' => 'In nested
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 107,
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 105,
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
              'text' => 'Example empty out, spaces inside
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'In nested
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
',
              'type' => 'empty_line_after_command'
            },
            {
              'contents' => [
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 114,
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
              'text' => 'Example empty out, no spaces inside
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
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
                      'text' => 'In nested
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
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
',
              'type' => 'empty_line_after_command'
            },
            {
              'contents' => [
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 125,
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
              'text' => 'menu
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                      'text' => '(manual)node'
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
                  'manual_content' => [
                    {
                      'parent' => {},
                      'text' => 'manual'
                    }
                  ],
                  'node_content' => [
                    {
                      'parent' => {},
                      'text' => 'node'
                    }
                  ],
                  'normalized' => 'node'
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
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 134,
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
              'text' => 'end menu
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
$result_trees{'line_passed_and_formats'}{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'};
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'extra'}{'block_command_line_contents'}[0][0] = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[12]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[13]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[14]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[15]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[16]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[17]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[18]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[19]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[20]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[21]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[22]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[23]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[24]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[25]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[26]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[27]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[28]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[29]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[29];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[29]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[30]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[31]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[32]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[32];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[32]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[33]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[34]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[34];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[34]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[35]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[36]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[37]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[37];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[37]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[38]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[39]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[39];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[39]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[40]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[41]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[42]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[42];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[42]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[43]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[44]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[44];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[44]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[45]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[46]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[47]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[47];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[47]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[48]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[49]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[49];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[49]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[50]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[51];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[51]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[52]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[53]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[54]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[55]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[55];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[55]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[56]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[57]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[58]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[59]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[59];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[59]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[60]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[61]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[62]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[63]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[63];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[63]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[4];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'contents'}[4]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[64]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[65]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[66]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[67]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[67];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[67]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[3];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'extra'}{'menu_entry_node'}{'manual_content'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'args'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[68]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[69]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[70]{'contents'}[0]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[70];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'contents'}[70]{'parent'} = $result_trees{'line_passed_and_formats'}{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'line_passed_and_formats'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'line_passed_and_formats'}{'contents'}[1]{'parent'} = $result_trees{'line_passed_and_formats'};

$result_texis{'line_passed_and_formats'} = '@node Top

@quotation special
Quotation special.
@quotation 
Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds
@end quotation
@end quotation

@quotation
quotation  text
@example
example in   quotation
@end example
@end quotation

@example
 In  example.
@quotation
   In quotation   in example
@end quotation
@end example

@example
In 1 example
@end example
@example
In 2 example
@end example

@quotation
In 1 quotation
@end quotation
@quotation
In 2 quotation
@end quotation

@quotation 
Quotation
@quotation 
Nested quotation
@end quotation
Quotation 2
@end quotation

@example
In  example.
@quotation
In quotation   in example
@end quotation
In  example 2.
@end example

@quotation
quotation  text
@example
example in   quotation
@end example
quotation  text 2
@end quotation

Before quotation
@quotation
quotation  text
@end quotation
after end

Before example
@example
In example
@end example
After example

Before quotation and empty line
@quotation

In quotation

@end quotation
After quotation

Before example and empty line
@example

In example

@end example
After example

Nested and empty lines

Quotation empty out, spaces inside
@quotation

@quotation

In nested

@end quotation

@end quotation

Quotation empty out, no spaces inside
@quotation

@quotation
In nested
@end quotation

@end quotation

Example empty out, spaces inside
@example

@example

In nested

@end example

@end example

Example empty out, no spaces inside
@example

@example
In nested
@end example

@end example

menu
@menu
* (manual)node::
@end menu
end menu
';


$result_texts{'line_passed_and_formats'} = '
special

Quotation special.
Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds

quotation  text
example in   quotation

 In  example.
   In quotation   in example

In 1 example
In 2 example

In 1 quotation
In 2 quotation

Quotation
Nested quotation
Quotation 2

In  example.
In quotation   in example
In  example 2.

quotation  text
example in   quotation
quotation  text 2

Before quotation
quotation  text
after end

Before example
In example
After example

Before quotation and empty line

In quotation

After quotation

Before example and empty line

In example

After example

Nested and empty lines

Quotation empty out, spaces inside


In nested



Quotation empty out, no spaces inside

In nested


Example empty out, spaces inside


In nested



Example empty out, no spaces inside

In nested


menu
* (manual)node::
end menu
';

$result_sectioning{'line_passed_and_formats'} = {};

$result_nodes{'line_passed_and_formats'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'menus' => [
    {
      'cmdname' => 'menu'
    }
  ],
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

$result_menus{'line_passed_and_formats'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'line_passed_and_formats'} = [];



$result_converted{'plaintext'}->{'line_passed_and_formats'} = '
     special: Quotation special.
          Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq
          klm fsqdlkmfdsq fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds

     quotation text
          example in   quotation

      In  example.
             In quotation   in example

     In 1 example
     In 2 example

     In 1 quotation
     In 2 quotation

     Quotation
          Nested quotation
     Quotation 2

     In  example.
          In quotation   in example
     In  example 2.

     quotation text
          example in   quotation
     quotation text 2

   Before quotation
     quotation text
   after end

   Before example
     In example
   After example

   Before quotation and empty line

     In quotation

   After quotation

   Before example and empty line

     In example

   After example

   Nested and empty lines

   Quotation empty out, spaces inside

          In nested

   Quotation empty out, no spaces inside

          In nested

   Example empty out, spaces inside


          In nested


   Example empty out, no spaces inside

          In nested

   menu
* Menu:

* (manual)node::
   end menu
';

1;
