use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'quote_dash_in_example'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
              'parent' => {},
              'text' => 'and now -- yes---now and ``so\'\'.
'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
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
$result_trees{'quote_dash_in_example'}{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_example'};
$result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_example'}{'contents'}[1];
$result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'quote_dash_in_example'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_example'}{'contents'}[1];
$result_trees{'quote_dash_in_example'}{'contents'}[1]{'parent'} = $result_trees{'quote_dash_in_example'};
$result_trees{'quote_dash_in_example'}{'contents'}[2]{'parent'} = $result_trees{'quote_dash_in_example'};

$result_texis{'quote_dash_in_example'} = '
@example
and now -- yes---now and ``so\'\'.

@end example
';


$result_texts{'quote_dash_in_example'} = '
and now -- yes---now and ``so\'\'.

';

$result_errors{'quote_dash_in_example'} = [];



$result_converted{'plaintext'}->{'quote_dash_in_example'} = '
     and now -- yes---now and ``so\'\'.

';

1;
