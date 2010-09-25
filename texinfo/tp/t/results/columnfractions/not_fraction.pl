use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'not_fraction'} = {
  'contents' => [
    {
      'args' => [
        {
          'cmdname' => 'columnfractions',
          'parent' => {}
        }
      ],
      'cmdname' => 'multitable',
      'parent' => {},
      'special' => {
        'max_columns' => 0
      }
    }
  ]
};
$result_trees{'not_fraction'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'not_fraction'}{'contents'}[0];
$result_trees{'not_fraction'}{'contents'}[0]{'parent'} = $result_trees{'not_fraction'};

$result_texts{'not_fraction'} = '@multitable @columnfractions
@end multitable
';

$result_errors{'not_fraction'} = [
  {
    'error_line' => ':1: column fraction not a number: aaa
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'column fraction not a number: aaa',
    'type' => 'error'
  }
];


