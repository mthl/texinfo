use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'long_uref_after_item'} = {
  'contents' => [
    {
      'cmdname' => 'itemize',
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'uref',
                  'contents' => [],
                  'extra' => {
                    'brace_command_contents' => [
                      [
                        {}
                      ]
                    ]
                  },
                  'line_nr' => {
                    'file_name' => '',
                    'line_nr' => 3,
                    'macro' => ''
                  },
                  'parent' => {}
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'block_command_line_contents' => [
          [
            {
              'cmdname' => 'bullet',
              'parent' => {},
              'type' => 'command_as_argument'
            }
          ]
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
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
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'brace_command_contents'}[0][0] = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'extra'}{'block_command_line_contents'}[0][0]{'parent'} = $result_trees{'long_uref_after_item'}{'contents'}[0];
$result_trees{'long_uref_after_item'}{'contents'}[0]{'parent'} = $result_trees{'long_uref_after_item'};
$result_trees{'long_uref_after_item'}{'contents'}[1]{'parent'} = $result_trees{'long_uref_after_item'};

$result_texis{'long_uref_after_item'} = '@itemize
@item
@uref{http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html}
@end itemize
';


$result_texts{'long_uref_after_item'} = 'http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html
';

$result_errors{'long_uref_after_item'} = [];



$result_converted{'plaintext'}->{'long_uref_after_item'} = '   * 
     `http://foo.org/some/long/url/which/goes/past/eighty/columns/and/has/no/alternative/text.html\'
';

1;
