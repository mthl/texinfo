use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'html_expanded'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Before
'
        },
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
              'text' => 'html
',
              'type' => 'raw'
            }
          ],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'after.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0];
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0]{'contents'}[1];
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0]{'contents'}[1];
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0];
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0];
$result_trees{'html_expanded'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'html_expanded'}{'contents'}[0];
$result_trees{'html_expanded'}{'contents'}[0]{'parent'} = $result_trees{'html_expanded'};

$result_texis{'html_expanded'} = 'Before
@html
html
@end html
after.
';


$result_texts{'html_expanded'} = 'Before
after.
';

$result_errors{'html_expanded'} = [];



$result_converted{'plaintext'}->{'html_expanded'} = 'Before html after.
';

1;
