use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'enumerate_in_example'} = {
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
          'cmdname' => 'enumerate',
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
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'first item
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'parent' => {}
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'second  item
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'still second
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
                }
              ],
              'extra' => {
                'item_number' => 2
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'enumerate_specification' => 0
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
$result_trees{'enumerate_in_example'}{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'};
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'enumerate_in_example'}{'contents'}[1];
$result_trees{'enumerate_in_example'}{'contents'}[1]{'parent'} = $result_trees{'enumerate_in_example'};
$result_trees{'enumerate_in_example'}{'contents'}[2]{'parent'} = $result_trees{'enumerate_in_example'};

$result_texis{'enumerate_in_example'} = '
@example
@enumerate
@item first item
@item second  item

still second
@end enumerate
@end example
';


$result_texts{'enumerate_in_example'} = '
1. first item
2. second  item

still second
';

$result_errors{'enumerate_in_example'} = [];



$result_converted{'plaintext'}->{'enumerate_in_example'} = '
       1. first item
       2. second  item

          still second
';

1;
