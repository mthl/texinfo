use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

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
                  'parent' => {},
                  'text' => 'category deffn_name arguments    more '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'args   with end of line within'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => ' with 3 '
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
                  'cmdname' => '@',
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
                      'text' => 'one last arg'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
                  'text' => 'deffn_name'
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
                  'text' => 'arguments'
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
                  'text' => 'with'
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
                  'text' => '3'
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
                {}
              ]
            ],
            'def_command' => 'deffn',
            'index_entry' => {
              'command' => {},
              'content' => [],
              'def' => 1,
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f'
            }
          },
          'parent' => {},
          'type' => 'def_line'
        },
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
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[9]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[8][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[14][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[16][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[6];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'}[18][1] = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[8];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'extra'}{'def_args'};
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_lines_protected'}{'contents'}[0];
$result_trees{'end_of_lines_protected'}{'contents'}[0]{'parent'} = $result_trees{'end_of_lines_protected'};
$result_trees{'end_of_lines_protected'}{'contents'}[1]{'parent'} = $result_trees{'end_of_lines_protected'};

$result_texis{'end_of_lines_protected'} = '@deffn category deffn_name arguments    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
';


$result_texts{'end_of_lines_protected'} = 'category deffn_name arguments    more args   with end of line within with 3 @ @ one last arg
deffn
';

$result_errors{'end_of_lines_protected'} = [];


1;
