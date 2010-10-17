use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'macro_not_closed'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'name',
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
        'arg_line' => ' name
'
      }
    }
  ]
};
$result_trees{'macro_not_closed'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_not_closed'}{'contents'}[0];
$result_trees{'macro_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_not_closed'}{'contents'}[0];
$result_trees{'macro_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'macro_not_closed'};

$result_texis{'macro_not_closed'} = '@macro name
in macro
@end macro';


$result_texts{'macro_not_closed'} = '';

$result_errors{'macro_not_closed'} = [
  {
    'error_line' => ':2: No matching `@end macro\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'No matching `@end macro\'',
    'type' => 'error'
  }
];


