use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'end_of_line_protect_at_end'} = {
  'contents' => [
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
                  'text' => 'category2 deffn_name2 arguments2 '
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
                  'text' => 'category2'
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
                  'text' => 'deffn_name2'
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
                  'text' => 'arguments2'
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
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'end_of_line_protect_at_end'}{'contents'}[0]{'parent'} = $result_trees{'end_of_line_protect_at_end'};
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'end_of_line_protect_at_end'}{'contents'}[1];
$result_trees{'end_of_line_protect_at_end'}{'contents'}[1]{'parent'} = $result_trees{'end_of_line_protect_at_end'};

$result_texis{'end_of_line_protect_at_end'} = '
@deffn category2 deffn_name2 arguments2 @end deffn
';


$result_texts{'end_of_line_protect_at_end'} = '
category2: deffn_name2 arguments2
';

$result_errors{'end_of_line_protect_at_end'} = [
  {
    'error_line' => ':2: Unexpected @
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Unexpected @',
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
    'error_line' => ':2: No matching `@end deffn\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end deffn\'',
    'type' => 'error'
  }
];


1;
