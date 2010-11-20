use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'macro_in_end_argument'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'a-cartouche',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'cartouche
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' a-cartouche
',
        'macrobody' => 'cartouche
'
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'cartouche',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'cartouche
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[0];
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[0];
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'};
$result_trees{'macro_in_end_argument'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_end_argument'};
$result_trees{'macro_in_end_argument'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_end_argument'};
$result_trees{'macro_in_end_argument'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[3];
$result_trees{'macro_in_end_argument'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[3];
$result_trees{'macro_in_end_argument'}{'contents'}[3]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[3]{'contents'}[2];
$result_trees{'macro_in_end_argument'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[3];
$result_trees{'macro_in_end_argument'}{'contents'}[3]{'parent'} = $result_trees{'macro_in_end_argument'};

$result_texis{'macro_in_end_argument'} = '@macro a-cartouche
cartouche
@end macro

@cartouche
 cartouche
@end cartouche';


$result_texts{'macro_in_end_argument'} = '
cartouche
';

$result_errors{'macro_in_end_argument'} = [
  {
    'error_line' => ':6: No matching `@end cartouche\'
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'No matching `@end cartouche\'',
    'type' => 'error'
  }
];


1;
