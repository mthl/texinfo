use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'at_commands_in_node'} = {
  'contents' => [
    {
      'contents' => [],
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
              'text' => 'A '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'sc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'sc',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' node '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => 'i'
                }
              ],
              'cmdname' => '"',
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
                              'text' => 'i'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'dotless',
                      'contents' => [],
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '"',
              'contents' => [],
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
                          'parent' => {},
                          'text' => 'E'
                        }
                      ],
                      'cmdname' => '=',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '`',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'l',
              'contents' => [],
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
                          'parent' => {},
                          'text' => 'C'
                        }
                      ],
                      'cmdname' => '\'',
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => ',',
              'contents' => [],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'exclamdown',
              'contents' => [],
              'parent' => {}
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
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {},
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [],
            'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
          }
        ],
        'normalized' => 'A-SC-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1'
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
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[10];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[10]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[11]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[13]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[14];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[14]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'at_commands_in_node'}{'contents'}[1];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[1] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[2] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[3] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[4];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[4] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[5];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[5] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[6];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[6] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[7];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[7] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[8];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[8] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[9];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[9] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[10];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[10] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[11];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[11] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[12];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[12] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[13];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'}[13] = $result_trees{'at_commands_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[14];
$result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'} = $result_trees{'at_commands_in_node'}{'contents'}[1]{'extra'}{'node_content'};
$result_trees{'at_commands_in_node'}{'contents'}[1]{'parent'} = $result_trees{'at_commands_in_node'};

$result_texis{'at_commands_in_node'} = '@node A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}';


$result_texts{'at_commands_in_node'} = '';

$result_sectioning{'at_commands_in_node'} = {
  'text' => '_ROOT'
};
$result_errors{'at_commands_in_node'} = [];


1;
