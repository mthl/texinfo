use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'out_of_multitable'} = {
  'contents' => [
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
              'text' => '0.6 0.4 aaa'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'columnfractions',
      'parent' => {},
      'special' => {
        'misc_args' => [
          '0.6',
          '0.4'
        ]
      }
    }
  ],
  'type' => 'text_root'
};
$result_trees{'out_of_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'out_of_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'out_of_multitable'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'out_of_multitable'}{'contents'}[0]{'args'}[0];
$result_trees{'out_of_multitable'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'out_of_multitable'}{'contents'}[0];
$result_trees{'out_of_multitable'}{'contents'}[0]{'parent'} = $result_trees{'out_of_multitable'};

$result_texis{'out_of_multitable'} = '@columnfractions 0.6 0.4 aaa';


$result_texts{'out_of_multitable'} = '';

$result_errors{'out_of_multitable'} = [
  {
    'error_line' => ':1: column fraction not a number: aaa
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'column fraction not a number: aaa',
    'type' => 'error'
  },
  {
    'error_line' => ':1: @columnfractions only meaningful on a @multitable line
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@columnfractions only meaningful on a @multitable line',
    'type' => 'error'
  }
];


$result_indices{'out_of_multitable'} = undef;


1;
