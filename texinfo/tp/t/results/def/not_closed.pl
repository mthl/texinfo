use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'not_closed'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
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
                  'text' => 'truc bidule machin
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
                  'text' => 'truc'
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
                  'text' => 'bidule'
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
                  'text' => 'machin'
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
                  'text' => 'truc chose args
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'truc'
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
                  'text' => 'chose'
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
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'defvar',
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
                          'text' => 'type1 var bidule
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
                          'text' => 'Variable'
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
                          'text' => 'type1'
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
                          'text' => 'var'
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
                          'text' => 'bidule'
                        }
                      ]
                    ],
                    'def_command' => 'defvar',
                    'def_parsed_hash' => {
                      'category' => {},
                      'name' => {}
                    },
                    'index_entry' => {
                      'command' => {},
                      'content' => [
                        {}
                      ],
                      'index_at_command' => 'defvar',
                      'index_name' => 'vr',
                      'index_prefix' => 'v',
                      'number' => 1
                    },
                    'original_def_cmdname' => 'defvar'
                  },
                  'parent' => {},
                  'type' => 'def_line'
                }
              ],
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'def_item'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed'}{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'not_closed'}{'contents'}[0]{'contents'}[2];
$result_trees{'not_closed'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'not_closed'}{'contents'}[0];
$result_trees{'not_closed'}{'contents'}[0]{'parent'} = $result_trees{'not_closed'};

$result_texis{'not_closed'} = '@deffn truc bidule machin
@deffnx truc chose args
@defvar type1 var bidule
@end defvar
@end deffn
';


$result_texts{'not_closed'} = 'truc: bidule machin
truc: chose args
Variable: type1 var bidule
';

$result_errors{'not_closed'} = [
  {
    'error_line' => ':1: Entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Entry for index `fn\' outside of any node',
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
    'error_line' => ':3: Entry for index `vr\' outside of any node
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Entry for index `vr\' outside of any node',
    'type' => 'error'
  },
  {
    'error_line' => ':3: No matching `@end defvar\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'No matching `@end defvar\'',
    'type' => 'error'
  },
  {
    'error_line' => ':3: No matching `@end deffn\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'No matching `@end deffn\'',
    'type' => 'error'
  }
];


1;
