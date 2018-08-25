use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'end_of_lines_protected'} = {
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
                  'text' => 'category'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'deffn_name'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'arguments'
                },
                {
                  'text' => '    ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'more'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'args   with end of line within'
                    }
                  ],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 2,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => 'with'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'text' => '3'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'cmdname' => '@',
                  'parent' => {}
                },
                {
                  'text' => ' ',
                  'type' => 'spaces'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'one last arg'
                    }
                  ],
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 4,
                    'macro' => ''
                  },
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                },
                {
                  'text' => '
',
                  'type' => 'spaces_at_end'
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
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'name',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
              ],
              [
                'arg',
                {}
              ],
              [
                'spaces',
                {}
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
              'content_normalized' => [
                {}
              ],
              'in_code' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_type_command' => 'deffn',
              'key' => 'deffn_name',
              'number' => 1
            },
            'original_def_cmdname' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
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
                  'text' => 'deffn
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
            'command_argument' => 'deffn',
            'spaces_after_command' => {},
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {},
        'spaces_after_command' => {}
      },
      'line_nr' => {},
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[15]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[17]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[19]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[19];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[19]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[0][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[1][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[2][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[3][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[4][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[5][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[6][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[7][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[9][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[10];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[10][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[11];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[11][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[12];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[12][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[13];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[13][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[14];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[15];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[15][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[16];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[16][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[17];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[17][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[18];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[18][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[19];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[19][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[20];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'extra'}{'spaces_after_command'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'extra'}{'spaces_after_command'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'line_nr'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'line_nr'};
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'};

$result_texis{'end_of_lines_protected'} = '@deffn category deffn_name arguments    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
';


$result_texts{'end_of_lines_protected'} = 'category: deffn_name arguments    more args   with end of line within with 3 @ @ one last arg
deffn
';

$result_errors{'end_of_lines_protected'} = [
  {
    'error_line' => ':4: warning: entry for index `fn\' outside of any node
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'end_of_lines_protected'} = ' -- category: deffn_name arguments more args with end of line within
          with 3 @ @ one last arg
     deffn
';

1;
