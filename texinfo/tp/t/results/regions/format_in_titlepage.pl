use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'format_in_titlepage'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'titlepage',
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
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'cmdname' => 'format',
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
                      'parent' => {},
                      'text' => 'Published
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
                          'text' => 'format'
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
                    'command_argument' => 'format',
                    'text_arg' => 'format'
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 5,
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
                'line_nr' => 3,
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
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'titlepage'
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
                'command_argument' => 'titlepage',
                'text_arg' => 'titlepage'
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
            'end_command' => {}
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
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'contents'}[2];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'};
$result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'format_in_titlepage'}{'contents'}[1];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[1];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'format_in_titlepage'}{'contents'}[1];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'format_in_titlepage'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'format_in_titlepage'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'format_in_titlepage'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'format_in_titlepage'}{'contents'}[1]{'parent'} = $result_trees{'format_in_titlepage'};

$result_texis{'format_in_titlepage'} = '@titlepage

@format
Published
@end format

@end titlepage

@node Top

';


$result_texts{'format_in_titlepage'} = '

';

$result_sectioning{'format_in_titlepage'} = {};

$result_nodes{'format_in_titlepage'} = {
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
      ]
    }
  }
};

$result_menus{'format_in_titlepage'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'format_in_titlepage'} = [];



$result_converted{'info'}->{'format_in_titlepage'} = 'This is , produced by makeinfo version 4.13 from .


File: ,  Node: Top,  Up: (dir)



Tag Table:
Node: Top52

End Tag Table
';

1;
