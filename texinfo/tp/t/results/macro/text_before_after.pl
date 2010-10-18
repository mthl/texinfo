use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'text_before_after'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'before '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'mymacro',
              'type' => 'macro_name'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in macro
',
              'type' => 'raw'
            }
          ],
          'parent' => {},
          'special' => {
            'arg_line' => ' mymacro
',
            'macrobody' => 'in macro
'
          }
        },
        {
          'parent' => {},
          'text' => ' ',
          'type' => 'empty_spaces_after_command'
        },
        {
          'parent' => {},
          'text' => 'after
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0];
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0]{'contents'}[1];
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0];
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0];
$result_trees{'text_before_after'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'text_before_after'}{'contents'}[0];
$result_trees{'text_before_after'}{'contents'}[0]{'parent'} = $result_trees{'text_before_after'};

$result_texis{'text_before_after'} = 'before @macro mymacro
in macro
@end macro after
';


$result_texts{'text_before_after'} = 'before after
';

$result_errors{'text_before_after'} = [
  {
    'error_line' => ':1: warning: @macro should only appear at a line beginning
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@macro should only appear at a line beginning',
    'type' => 'warning'
  }
];


