use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'something_before_columnfractions'} = {
  'contents' => [
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
              'text' => 'aaa '
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
                      'text' => '0.3 0.7'
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
              'cmdname' => 'columnfractions',
              'extra' => {
                'misc_args' => [
                  '0.3',
                  '0.7'
                ]
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'multitable',
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        }
      ],
      'extra' => {
        'max_columns' => 2
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'something_before_columnfractions'}{'contents'}[0];
$result_trees{'something_before_columnfractions'}{'contents'}[0]{'parent'} = $result_trees{'something_before_columnfractions'};
$result_trees{'something_before_columnfractions'}{'contents'}[1]{'parent'} = $result_trees{'something_before_columnfractions'};

$result_texis{'something_before_columnfractions'} = '@multitable aaa @columnfractions 0.3 0.7
@end multitable';


$result_texts{'something_before_columnfractions'} = '';

$result_errors{'something_before_columnfractions'} = [];


1;
