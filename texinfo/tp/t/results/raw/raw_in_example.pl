use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'raw_in_example'} = {
  'contents' => [
    {
      'cmdname' => 'example',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
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
                  'text' => 'in html
',
                  'type' => 'raw'
                }
              ],
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0];
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'raw_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'raw_in_example'}{'contents'}[0];
$result_trees{'raw_in_example'}{'contents'}[0]{'parent'} = $result_trees{'raw_in_example'};
$result_trees{'raw_in_example'}{'contents'}[1]{'parent'} = $result_trees{'raw_in_example'};

$result_texis{'raw_in_example'} = '@example
@html
in html
@end html
@end example
';


$result_texts{'raw_in_example'} = '';

$result_errors{'raw_in_example'} = [];



$result_converted{'plaintext'}->{'raw_in_example'} = '
';

1;
