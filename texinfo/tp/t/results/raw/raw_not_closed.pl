use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'raw_not_closed'} = {
  'contents' => [
    {
      'cmdname' => 'html',
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
          'text' => 'This is some html
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '<address> my address </address>
',
          'type' => 'raw'
        }
      ],
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
$result_trees{'raw_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_not_closed'}{'contents'}[0];
$result_trees{'raw_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_not_closed'}{'contents'}[0];
$result_trees{'raw_not_closed'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'raw_not_closed'}{'contents'}[0];
$result_trees{'raw_not_closed'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'raw_not_closed'}{'contents'}[0];
$result_trees{'raw_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'raw_not_closed'};

$result_texis{'raw_not_closed'} = '@html

This is some html
<address> my address </address>
@end html';


$result_texts{'raw_not_closed'} = '';

$result_errors{'raw_not_closed'} = [
  {
    'error_line' => ':4: No matching `@end html\'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'No matching `@end html\'',
    'type' => 'error'
  }
];


1;
