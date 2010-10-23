use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'not_closed_itemize'} = {
  'contents' => [
    {
      'cmdname' => 'itemize',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'not_closed_itemize'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'not_closed_itemize'}{'contents'}[0];
$result_trees{'not_closed_itemize'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'not_closed_itemize'}{'contents'}[0];
$result_trees{'not_closed_itemize'}{'contents'}[0]{'parent'} = $result_trees{'not_closed_itemize'};

$result_texis{'not_closed_itemize'} = '@itemize
@end itemize';


$result_texts{'not_closed_itemize'} = '';

$result_errors{'not_closed_itemize'} = [
  {
    'error_line' => ':1: No matching `@end itemize\'
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'No matching `@end itemize\'',
    'type' => 'error'
  }
];


