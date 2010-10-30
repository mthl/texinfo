use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'tex_not_closed'} = {
  'contents' => [
    {
      'cmdname' => 'tex',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => 'This is some \\LaTeX{}
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'tex_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'tex_not_closed'}{'contents'}[0];
$result_trees{'tex_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'tex_not_closed'}{'contents'}[0];
$result_trees{'tex_not_closed'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'tex_not_closed'}{'contents'}[0];
$result_trees{'tex_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'tex_not_closed'};

$result_texis{'tex_not_closed'} = '@tex

This is some \\LaTeX{}
@end tex';


$result_texts{'tex_not_closed'} = '';

$result_errors{'tex_not_closed'} = [
  {
    'error_line' => ':3: No matching `@end tex\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'No matching `@end tex\'',
    'type' => 'error'
  }
];


1;
