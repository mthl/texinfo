use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'raw_commands_and_end_of_lines'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'html',
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
          'parent' => {},
          'text' => 'Surrounded by empty lines.',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Block commands on a line
'
        },
        {
          'cmdname' => 'html',
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
              'parent' => {},
              'text' => 'in block
',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => 'in block l2',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'html',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
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
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'html',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
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
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'after the closing command.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'html',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 22,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '. A symbol on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'html',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 27,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. A symbol after the closing command.
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
      'cmdname' => 'tex',
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
          'parent' => {},
          'text' => 'Surrounded by empty lines.',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'last_raw_newline'
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
      'extra' => {
        'command' => {}
      },
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
          'text' => 'Block commands on a line
'
        },
        {
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 36,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
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
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 46,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'text' => 'after the closing command.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 50,
            'macro' => ''
          },
          'parent' => {}
        },
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
          'parent' => {},
          'text' => '. A symbol on a line.
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
          'text' => 'Before the opening command '
        },
        {
          'cmdname' => 'tex',
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
              'parent' => {},
              'text' => 'in block',
              'type' => 'raw'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'last_raw_newline'
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
          'text' => '. A symbol after the closing command.
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
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'Surrounded by empty lines.
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 59,
        'macro' => ''
      },
      'parent' => {}
    },
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Block commands on a line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'in block
',
          'type' => 'raw'
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
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'in block
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 69,
        'macro' => ''
      },
      'parent' => {}
    },
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
          'parent' => {},
          'text' => 'end commands on a line.
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
          'text' => 'Before the opening command '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'in block
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 74,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => ' ',
      'type' => 'empty_spaces_after_command'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'after the closing command.
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
          'text' => 'Before the opening command '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'in block
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 78,
        'macro' => ''
      },
      'parent' => {}
    },
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
          'parent' => {},
          'text' => '. A symbol on a line.
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
          'text' => 'Before the opening command '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
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
          'parent' => {},
          'text' => 'in block
',
          'type' => 'raw'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 83,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '. A symbol after the closing command.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[4]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[5]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[6]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[7]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[8]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[9]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[10]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[11]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[12]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[13]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[15]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[14];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[15]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[16]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[17]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[18]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[19]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[20]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[21]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[22]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[2]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'contents'}[3]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[23]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[24]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'contents'}[2]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[25]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[26]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[28]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[27];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[28]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[29]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[30];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[30]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[32]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[31];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[32]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[33];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[33]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[34]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[35]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[35];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[35]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[37]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[36];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[37]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[38]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[38];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[38]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[39]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[40]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[40];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[40]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[42]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[41];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[42]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[43]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[43];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[43]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[44]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[45]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[45];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[45]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[47]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[46];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[47]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[48]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[48];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[48]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[49]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[50]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[50];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[50]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51]{'contents'}[0]{'extra'}{'command'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51]{'contents'}[1]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[51]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[52]{'contents'}[0]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'}{'contents'}[52];
$result_trees{'raw_commands_and_end_of_lines'}{'contents'}[52]{'parent'} = $result_trees{'raw_commands_and_end_of_lines'};

$result_texis{'raw_commands_and_end_of_lines'} = '
@html
Surrounded by empty lines.
@end html

Block commands on a line
@html
in block
in block l2
@end html
end commands on a line.

Before the opening command @html
in block
@end html
end commands on a line.

Before the opening command @html
in block
@end html after the closing command.

Before the opening command @html
in block
@end html
. A symbol on a line.

Before the opening command @html
in block
@end html. A symbol after the closing command.

@tex
Surrounded by empty lines.
@end tex

Block commands on a line
@tex
in block
@end tex
end commands on a line.

Before the opening command @tex
in block
@end tex
end commands on a line.

Before the opening command @tex
in block
@end tex after the closing command.

Before the opening command @tex
in block
@end tex
. A symbol on a line.

Before the opening command @tex
in block
@end tex. A symbol after the closing command.

@verbatim
Surrounded by empty lines.
@end verbatim

Block commands on a line
@verbatim
in block
@end verbatim
end commands on a line.

Before the opening command @verbatim
in block
@end verbatim
end commands on a line.

Before the opening command @verbatim
in block
@end verbatim after the closing command.

Before the opening command @verbatim
in block
@end verbatim
. A symbol on a line.

Before the opening command @verbatim
in block
@end verbatim. A symbol after the closing command.
';


$result_texts{'raw_commands_and_end_of_lines'} = '

Block commands on a line
end commands on a line.

Before the opening command end commands on a line.

Before the opening command after the closing command.

Before the opening command . A symbol on a line.

Before the opening command . A symbol after the closing command.


Block commands on a line
end commands on a line.

Before the opening command end commands on a line.

Before the opening command after the closing command.

Before the opening command . A symbol on a line.

Before the opening command . A symbol after the closing command.

Surrounded by empty lines.

Block commands on a line
in block
end commands on a line.

Before the opening command in block
end commands on a line.

Before the opening command in block
after the closing command.

Before the opening command in block
. A symbol on a line.

Before the opening command in block
. A symbol after the closing command.
';

$result_errors{'raw_commands_and_end_of_lines'} = [
  {
    'error_line' => ':13: warning: @html should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@html should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':18: warning: @html should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 18,
    'macro' => '',
    'text' => '@html should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':20: warning: Superfluous argument to @end html:  after the closing command.
',
    'file_name' => '',
    'line_nr' => 20,
    'macro' => '',
    'text' => 'Superfluous argument to @end html:  after the closing command.',
    'type' => 'warning'
  },
  {
    'error_line' => ':22: warning: @html should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 22,
    'macro' => '',
    'text' => '@html should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':27: warning: @html should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 27,
    'macro' => '',
    'text' => '@html should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':29: warning: Superfluous argument to @end html: . A symbol after the closing command.
',
    'file_name' => '',
    'line_nr' => 29,
    'macro' => '',
    'text' => 'Superfluous argument to @end html: . A symbol after the closing command.',
    'type' => 'warning'
  },
  {
    'error_line' => ':41: warning: @tex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 41,
    'macro' => '',
    'text' => '@tex should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':46: warning: @tex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 46,
    'macro' => '',
    'text' => '@tex should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':48: warning: Superfluous argument to @end tex:  after the closing command.
',
    'file_name' => '',
    'line_nr' => 48,
    'macro' => '',
    'text' => 'Superfluous argument to @end tex:  after the closing command.',
    'type' => 'warning'
  },
  {
    'error_line' => ':50: warning: @tex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 50,
    'macro' => '',
    'text' => '@tex should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':55: warning: @tex should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 55,
    'macro' => '',
    'text' => '@tex should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':57: warning: Superfluous argument to @end tex: . A symbol after the closing command.
',
    'file_name' => '',
    'line_nr' => 57,
    'macro' => '',
    'text' => 'Superfluous argument to @end tex: . A symbol after the closing command.',
    'type' => 'warning'
  },
  {
    'error_line' => ':69: warning: @verbatim should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 69,
    'macro' => '',
    'text' => '@verbatim should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':74: warning: @verbatim should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 74,
    'macro' => '',
    'text' => '@verbatim should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':76: warning: Superfluous argument to @end verbatim:  after the closing command.
',
    'file_name' => '',
    'line_nr' => 76,
    'macro' => '',
    'text' => 'Superfluous argument to @end verbatim:  after the closing command.',
    'type' => 'warning'
  },
  {
    'error_line' => ':78: warning: @verbatim should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 78,
    'macro' => '',
    'text' => '@verbatim should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':83: warning: @verbatim should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 83,
    'macro' => '',
    'text' => '@verbatim should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':85: warning: Superfluous argument to @end verbatim: . A symbol after the closing command.
',
    'file_name' => '',
    'line_nr' => 85,
    'macro' => '',
    'text' => 'Superfluous argument to @end verbatim: . A symbol after the closing command.',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'raw_commands_and_end_of_lines'} = 'Block commands on a line end commands on a line.

   Before the opening command end commands on a line.

   Before the opening command after the closing command.

   Before the opening command .  A symbol on a line.

   Before the opening command .  A symbol after the closing command.

   Block commands on a line end commands on a line.

   Before the opening command end commands on a line.

   Before the opening command after the closing command.

   Before the opening command .  A symbol on a line.

   Before the opening command .  A symbol after the closing command.

Surrounded by empty lines.

   Block commands on a line
in block
   end commands on a line.

   Before the opening command
in block
   end commands on a line.

   Before the opening command
in block
   after the closing command.

   Before the opening command
in block
   .  A symbol on a line.

   Before the opening command
in block
   .  A symbol after the closing command.
';

1;
