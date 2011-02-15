use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'comments_in_example'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Example with comments 2 lines
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'second line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
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
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'Example with comments 1 line
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
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
              'text' => 'line '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'preformatted'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
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
  'type' => 'text_root'
};
$result_trees{'comments_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[0];
$result_trees{'comments_in_example'}{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[2]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[3]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[4];
$result_trees{'comments_in_example'}{'contents'}[4]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[5];
$result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1];
$result_trees{'comments_in_example'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'comments_in_example'}{'contents'}[5];
$result_trees{'comments_in_example'}{'contents'}[5]{'parent'} = $result_trees{'comments_in_example'};
$result_trees{'comments_in_example'}{'contents'}[6]{'parent'} = $result_trees{'comments_in_example'};

$result_texis{'comments_in_example'} = 'Example with comments 2 lines
@example 
line @c comment
second line @c comment
@end example

Example with comments 1 line
@example
line @c comment
@end example
';


$result_texts{'comments_in_example'} = 'Example with comments 2 lines
line second line 
Example with comments 1 line
line ';

$result_errors{'comments_in_example'} = [];



$result_converted{'plaintext'}->{'comments_in_example'} = 'Example with comments 2 lines
     line second line 

   Example with comments 1 line
     line 
';

1;
