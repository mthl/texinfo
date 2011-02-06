use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'empty_line_in_example_end'} = {
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
              'parent' => {},
              'text' => 'in example
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
          'text' => 'After line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_line_in_example_end'}{'contents'}[0];
$result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[1];
$result_trees{'empty_line_in_example_end'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_line_in_example_end'}{'contents'}[0];
$result_trees{'empty_line_in_example_end'}{'contents'}[0]{'parent'} = $result_trees{'empty_line_in_example_end'};
$result_trees{'empty_line_in_example_end'}{'contents'}[1]{'parent'} = $result_trees{'empty_line_in_example_end'};
$result_trees{'empty_line_in_example_end'}{'contents'}[2]{'parent'} = $result_trees{'empty_line_in_example_end'};
$result_trees{'empty_line_in_example_end'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_line_in_example_end'}{'contents'}[3];
$result_trees{'empty_line_in_example_end'}{'contents'}[3]{'parent'} = $result_trees{'empty_line_in_example_end'};

$result_texis{'empty_line_in_example_end'} = '@example
in example

@end example

After line
';


$result_texts{'empty_line_in_example_end'} = 'in example


After line
';

$result_errors{'empty_line_in_example_end'} = [];



$result_converted{'plaintext'}->{'empty_line_in_example_end'} = '     in example

After line
';

1;
