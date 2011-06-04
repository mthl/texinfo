use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'heading_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'copying',
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
                      'text' => 'in copying '
                    },
                    {
                      'cmdname' => '@',
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
                              'text' => 'heading'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'emph',
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
                      'text' => '
',
                      'type' => 'spaces_at_end'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'heading',
              'extra' => {
                'misc_content' => [
                  {},
                  {},
                  {},
                  {}
                ]
              },
              'level' => 2,
              'line_nr' => {},
              'parent' => {}
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
                      'text' => 'cindex copying'
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
              'cmdname' => 'cindex',
              'extra' => {
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {}
                  ],
                  'index_at_command' => 'cindex',
                  'index_name' => 'cp',
                  'index_prefix' => 'c',
                  'number' => 1,
                  'region' => {}
                },
                'misc_content' => []
              },
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
                      'text' => 'second in copying '
                    },
                    {
                      'cmdname' => '@',
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
                              'text' => 'subheading'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'emph',
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
                      'text' => '
',
                      'type' => 'spaces_at_end'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'subheading',
              'extra' => {
                'misc_content' => [
                  {},
                  {},
                  {},
                  {}
                ]
              },
              'level' => 3,
              'line_nr' => {},
              'parent' => {}
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
                      'text' => 'copying'
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
                'command_argument' => 'copying',
                'text_arg' => 'copying'
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
        },
        {
          'cmdname' => 'insertcopying',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
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
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[1] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[2] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[3] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'line_nr'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'region'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'misc_content'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'extra'}{'index_entry'}{'content'};
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'}[0] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'}[1] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[2];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'}[2] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'extra'}{'misc_content'}[3] = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'line_nr'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[4]{'line_nr'};
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[0];
$result_trees{'heading_in_copying'}{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'};
$result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'heading_in_copying'}{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'heading_in_copying'}{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'heading_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'heading_in_copying'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'heading_in_copying'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'heading_in_copying'}{'contents'}[1]{'parent'} = $result_trees{'heading_in_copying'};

$result_texis{'heading_in_copying'} = '@copying

@heading in copying @@ @emph{heading}
@cindex cindex copying

@subheading second in copying @@ @emph{subheading}
@end copying

@node Top

@insertcopying
';


$result_texts{'heading_in_copying'} = '


';

$result_sectioning{'heading_in_copying'} = {};

$result_nodes{'heading_in_copying'} = {
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

$result_menus{'heading_in_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'heading_in_copying'} = [];



$result_converted{'plaintext'}->{'heading_in_copying'} = 'in copying @ _heading_
======================

second in copying @ _subheading_
--------------------------------

';

1;
