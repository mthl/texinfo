use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'wrong arg on line following kbdinputstyle'
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
          'cmdname' => 'kbdinputstyle',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'bad'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad'}{'contents'}[0]{'contents'}[1];
$result_trees{'bad'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'bad'}{'contents'}[0];
$result_trees{'bad'}{'contents'}[0]{'parent'} = $result_trees{'bad'};

$result_texis{'bad'} = 'kbdinputstyle @kbdinputstyle wrong arg on line following kbdinputstyle
';


$result_texts{'bad'} = 'kbdinputstyle ';

$result_errors{'bad'} = [
  {
    'error_line' => ':1: warning: @kbdinputstyle should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@kbdinputstyle should only appear at a line beginning',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: @kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle\'',
    'type' => 'error'
  }
];


$result_indices{'bad'} = undef;


1;
