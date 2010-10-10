use vars qw(%result_texts %result_trees %result_errors);

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
      'parent' => {},
      'special' => {
        'macro_line' => ' a-cartouche
',
        'macrobody' => 'cartouche
'
      }
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
          'text' => ' '
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
  ]
};
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[0];
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[0];
$result_trees{'macro_in_end_argument'}{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'};
$result_trees{'macro_in_end_argument'}{'contents'}[1]{'parent'} = $result_trees{'macro_in_end_argument'};
$result_trees{'macro_in_end_argument'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[2];
$result_trees{'macro_in_end_argument'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[2]{'contents'}[1];
$result_trees{'macro_in_end_argument'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'macro_in_end_argument'}{'contents'}[2];
$result_trees{'macro_in_end_argument'}{'contents'}[2]{'parent'} = $result_trees{'macro_in_end_argument'};

$result_texts{'macro_in_end_argument'} = '@macro a-cartouche
cartouche
@end macro

@cartouche
 cartouche
@end cartouche
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


