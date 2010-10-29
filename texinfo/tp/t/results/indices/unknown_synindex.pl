use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'unknown_synindex'} = {
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
              'text' => 'c truc'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'synindex',
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'unknown_synindex'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_synindex'}{'contents'}[0]{'args'}[0];
$result_trees{'unknown_synindex'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_synindex'}{'contents'}[0]{'args'}[0];
$result_trees{'unknown_synindex'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'unknown_synindex'}{'contents'}[0];
$result_trees{'unknown_synindex'}{'contents'}[0]{'parent'} = $result_trees{'unknown_synindex'};

$result_texis{'unknown_synindex'} = '@synindex c truc';


$result_texts{'unknown_synindex'} = '';

$result_errors{'unknown_synindex'} = [
  {
    'error_line' => ':1: Unknown from index `c\' in @synindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Unknown from index `c\' in @synindex',
    'type' => 'error'
  },
  {
    'error_line' => ':1: Unknown to index name `truc\' in @synindex
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Unknown to index name `truc\' in @synindex',
    'type' => 'error'
  }
];


1;
