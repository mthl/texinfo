use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'no_brace'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'TeX',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' and '
        },
        {
          'cmdname' => 'code',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' code'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'no_brace'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_brace'}{'contents'}[0];
$result_trees{'no_brace'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_brace'}{'contents'}[0];
$result_trees{'no_brace'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_brace'}{'contents'}[0];
$result_trees{'no_brace'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'no_brace'}{'contents'}[0];
$result_trees{'no_brace'}{'contents'}[0]{'parent'} = $result_trees{'no_brace'};

$result_texis{'no_brace'} = '@TeX and @code code';


$result_texts{'no_brace'} = 'TeX and  code';

$result_errors{'no_brace'} = [
  {
    'error_line' => ':1: @TeX expected braces
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@TeX expected braces',
    'type' => 'error'
  },
  {
    'error_line' => ':1: @code expected braces
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@code expected braces',
    'type' => 'error'
  }
];


