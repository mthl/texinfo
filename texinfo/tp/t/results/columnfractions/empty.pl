use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'empty'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' 
',
                      'type' => 'empty_line_after_command'
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
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty'}{'contents'}[0]{'args'}[0];
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'parent'} = $result_trees{'empty'};
$result_trees{'empty'}{'contents'}[1]{'parent'} = $result_trees{'empty'};

$result_texis{'empty'} = '@multitable @columnfractions 
@end multitable';


$result_texts{'empty'} = '';

$result_errors{'empty'} = [
  {
    'error_line' => ':1: @columnfractions missing argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@columnfractions missing argument',
    'type' => 'error'
  }
];


