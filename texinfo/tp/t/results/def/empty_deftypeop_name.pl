use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'empty_deftypeop_name'} = {
  'contents' => [
    {
      'cmdname' => 'deftypeop',
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
                  'text' => 'Command'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'com'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Window'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'int'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'code',
                      'contents' => [],
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' expose'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'exp'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'Command'
                }
              ],
              [
                'class',
                {}
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'type',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'name',
                {
                  'text' => 'expose'
                }
              ],
              [
                'arg',
                {}
              ]
            ],
            'def_command' => 'deftypeop',
            'def_parsed_hash' => {
              'category' => {},
              'class' => {},
              'name' => {},
              'type' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {
                  'parent' => {
                    'contents' => [],
                    'type' => 'root_line'
                  },
                  'text' => '',
                  'type' => 'empty_line'
                },
                {},
                {},
                {
                  'parent' => {},
                  'text' => ' on '
                },
                {},
                {}
              ],
              'def' => 1,
              'index_at_command' => 'deftypeop',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            },
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
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
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1]{'contents'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'contents'};
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[5][1];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'type'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0]{'parent'}{'contents'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'};
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[1] = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[5][1];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[3]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0]{'parent'};
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[4] = $result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'}{'contents'}[0];
$result_trees{'empty_deftypeop_name'}{'contents'}[0]{'parent'} = $result_trees{'empty_deftypeop_name'};
$result_trees{'empty_deftypeop_name'}{'contents'}[1]{'parent'} = $result_trees{'empty_deftypeop_name'};

$result_texis{'empty_deftypeop_name'} = '@deftypeop Command@code{com} {Window@code{int}} expose@var{exp}
@end deftypeop
';


$result_texts{'empty_deftypeop_name'} = 'Commandcom Windowint exposeexp
';

$result_errors{'empty_deftypeop_name'} = [];


1;
