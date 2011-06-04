use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'wrong_braces_with_end_of_lines'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
      'contents' => [
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
                  'text' => 'category name args '
                },
                {
                  'contents' => [
                    {
                      'text' => '   ',
                      'type' => 'empty_spaces_before_argument'
                    },
                    {
                      'parent' => {},
                      'text' => 'more args'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_space_at_end_def_bracketed'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'category'
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
                  'text' => 'name'
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
                'arg',
                {
                  'text' => 'args'
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
                'arg',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 1
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'deffn with '
                },
                {
                  'cmdname' => '{',
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
          'parent' => {},
          'type' => 'def_item'
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 4,
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
    },
    {
      'cmdname' => 'deffn',
      'contents' => [
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
                  'text' => 'category name args    more args
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
                  'text' => 'category'
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
                  'text' => 'name'
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
                'arg',
                {
                  'text' => 'args'
                }
              ],
              [
                'spaces',
                {
                  'text' => '    ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'more'
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
                'arg',
                {
                  'text' => 'args'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 2
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'deffn with '
                },
                {
                  'cmdname' => '}',
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
          'parent' => {},
          'type' => 'def_item'
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
                  'text' => 'deffn'
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
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 9,
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
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'contents'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'};
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'};
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'};
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'extra'}{'command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'contents'}[2];
$result_trees{'wrong_braces_with_end_of_lines'}{'contents'}[2]{'parent'} = $result_trees{'wrong_braces_with_end_of_lines'};

$result_texis{'wrong_braces_with_end_of_lines'} = '@deffn category name args {   more args
}deffn with @{
@end deffn 

@deffn category name args    more args
deffn with @}
@end deffn 
';


$result_texts{'wrong_braces_with_end_of_lines'} = 'category: name args more args
deffn with {

category: name args    more args
deffn with }
';

$result_errors{'wrong_braces_with_end_of_lines'} = [
  {
    'error_line' => ':2: Misplaced {
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => ':2: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':6: Misplaced }
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => ':7: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
    'type' => 'error'
  }
];


1;
