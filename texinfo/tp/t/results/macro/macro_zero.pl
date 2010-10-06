use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_zero'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'zero',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '0
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' zero
',
        'macrobody' => '0
'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Macro
'
        },
        {
          'parent' => {},
          'text' => '0
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'macro_zero'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_zero'}{'contents'}[0];
$result_trees{'macro_zero'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_zero'}{'contents'}[0];
$result_trees{'macro_zero'}{'contents'}[0]{'parent'} = $result_trees{'macro_zero'};
$result_trees{'macro_zero'}{'contents'}[1]{'parent'} = $result_trees{'macro_zero'};
$result_trees{'macro_zero'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_zero'}{'contents'}[2];
$result_trees{'macro_zero'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'macro_zero'}{'contents'}[2];
$result_trees{'macro_zero'}{'contents'}[2]{'parent'} = $result_trees{'macro_zero'};

$result_texts{'macro_zero'} = '@macro zero
0
@end macro

Macro
0
';

$result_errors{'macro_zero'} = [];


