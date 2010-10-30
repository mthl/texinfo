use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'preformatted'} = {
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
          'parent' => {},
          'text' => 'e--xample  some  
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
          'text' => '   text
'
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
      'cmdname' => 'format',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'cmdname' => 'code',
                  'parent' => {},
                  'type' => 'command_as_argument'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'space_at_end_block_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'vtable',
          'contents' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'before_item'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'empty_spaces_after_command'
                    },
                    {
                      'parent' => {},
                      'text' => 'item in table in format'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'spaces_at_end'
                    }
                  ],
                  'parent' => {},
                  'type' => 'misc_line_arg'
                }
              ],
              'cmdname' => 'item',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'parent' => {},
              'text' => 'in table in format
'
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
$result_trees{'preformatted'}{'contents'}[0]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[2]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[3]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'preformatted'}{'contents'}[4]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[4];
$result_trees{'preformatted'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[4];
$result_trees{'preformatted'}{'contents'}[4]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[5]{'parent'} = $result_trees{'preformatted'};

$result_texis{'preformatted'} = '
@example
e--xample  some  

   text
@end example

@format
@vtable @code
@item item in table in format

in table in format
@end vtable
@end format
';


$result_texts{'preformatted'} = '
e--xample  some  

   text

item in table in format

in table in format
';

$result_errors{'preformatted'} = [];


1;
