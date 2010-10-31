use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'unnumbered_no_argument'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
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
      'cmdname' => 'unnumbered',
      'contents' => [],
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'unnumbered_no_argument'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unnumbered_no_argument'}{'contents'}[1]{'args'}[0];
$result_trees{'unnumbered_no_argument'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unnumbered_no_argument'}{'contents'}[1];
$result_trees{'unnumbered_no_argument'}{'contents'}[1]{'parent'} = $result_trees{'unnumbered_no_argument'};

$result_texis{'unnumbered_no_argument'} = '@unnumbered
';


$result_texts{'unnumbered_no_argument'} = '
';

$result_sectioning{'unnumbered_no_argument'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'unnumbered',
      'level' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'unnumbered_no_argument'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'unnumbered_no_argument'};

$result_errors{'unnumbered_no_argument'} = [
  {
    'error_line' => ':1: @unnumbered missing argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@unnumbered missing argument',
    'type' => 'error'
  }
];


1;
