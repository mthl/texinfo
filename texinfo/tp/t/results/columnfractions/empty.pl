use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'empty'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'columnfractions',
              'parent' => {},
              'special' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'parent' => {},
      'special' => {
        'max_columns' => 0
      }
    }
  ]
};
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'parent'} = $result_trees{'empty'};

$result_texts{'empty'} = '@multitable @columnfractions 
@end multitable
';

$result_errors{'empty'} = [
  {
    'error_line' => ':1: Empty @columnfractions
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Empty @columnfractions',
    'type' => 'error'
  }
];


