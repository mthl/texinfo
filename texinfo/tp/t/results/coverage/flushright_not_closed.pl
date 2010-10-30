use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'flushright_not_closed'} = {
  'contents' => [
    {
      'cmdname' => 'flushright',
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
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'text flushed right
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'flushright_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'flushright_not_closed'}{'contents'}[0];
$result_trees{'flushright_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'flushright_not_closed'}{'contents'}[0];
$result_trees{'flushright_not_closed'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'flushright_not_closed'}{'contents'}[0]{'contents'}[2];
$result_trees{'flushright_not_closed'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'flushright_not_closed'}{'contents'}[0];
$result_trees{'flushright_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'flushright_not_closed'};

$result_texis{'flushright_not_closed'} = '@flushright

text flushed right
@end flushright';


$result_texts{'flushright_not_closed'} = '
text flushed right
';

$result_errors{'flushright_not_closed'} = [
  {
    'error_line' => ':3: No matching `@end flushright\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'No matching `@end flushright\'',
    'type' => 'error'
  }
];


1;
