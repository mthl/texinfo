use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'bad'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'kbdinputstyle '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' wrong arg on line following kbdinputstyle
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'kbdinputstyle',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'bad'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad'}{'contents'}[0];
$result_trees{'bad'}{'contents'}[0]{'parent'} = $result_trees{'bad'};

$result_texts{'bad'} = 'kbdinputstyle @kbdinputstyle wrong arg on line following kbdinputstyle
';

$result_errors{'bad'} = [
  {
    'error_line' => ':1: @kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle
\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle
\'',
    'type' => 'error'
  }
];


