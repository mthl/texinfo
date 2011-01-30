use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'defx_after_empty_line'} = {
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
                  'text' => 'fset '
                },
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
                  'cmdname' => 'var',
                  'contents' => [],
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => ' a g
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
                  'text' => 'fset'
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
                'arg',
                {
                  'text' => 'a'
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
                  'text' => 'g'
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
              'index_prefix' => 'f'
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'truc'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' bidulr machin...
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
                  'text' => 'bidulr'
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
                  'text' => 'machin...'
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
              'index_prefix' => 'f'
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_args'}[0][1];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'def_args'}[2][1];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'defx_after_empty_line'}{'contents'}[0];
$result_trees{'defx_after_empty_line'}{'contents'}[0]{'parent'} = $result_trees{'defx_after_empty_line'};
$result_trees{'defx_after_empty_line'}{'contents'}[1]{'parent'} = $result_trees{'defx_after_empty_line'};

$result_texis{'defx_after_empty_line'} = '@deffn fset @var{i} a g

@deffnx {truc} bidulr machin...
@end deffn';


$result_texts{'defx_after_empty_line'} = 'fset i a g

truc bidulr machin...
';

$result_errors{'defx_after_empty_line'} = [];


1;
