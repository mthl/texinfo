use vars qw(%result_texts %result_trees %result_errors);

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
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'format',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => 'code',
                  'parent' => {},
                  'type' => 'command_as_argument'
                },
                {
                  'parent' => {},
                  'text' => '
'
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
                      'text' => 'item in table in format
'
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
          'parent' => {},
          'remaining_args' => 0
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'preformatted'}{'contents'}[0]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[1]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[2]{'parent'} = $result_trees{'preformatted'};
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[1];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'preformatted'}{'contents'}[3]{'contents'}[0];
$result_trees{'preformatted'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'preformatted'}{'contents'}[3];
$result_trees{'preformatted'}{'contents'}[3]{'parent'} = $result_trees{'preformatted'};

$result_texts{'preformatted'} = '
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

$result_errors{'preformatted'} = [];


