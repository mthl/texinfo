use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'zero_argument'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'foo',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in foo
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' foo {}
',
        'macrobody' => 'in foo
'
      }
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
      'args' => [
        {
          'parent' => {},
          'text' => 'bar',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bar
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' bar
',
        'macrobody' => 'in bar
'
      }
    },
    {
      'parent' => {},
      'text' => '',
      'type' => 'empty_line_after_command'
    }
  ]
};
$result_trees{'zero_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[0];
$result_trees{'zero_argument'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[0];
$result_trees{'zero_argument'}{'contents'}[0]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[1]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[2]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[3];
$result_trees{'zero_argument'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'zero_argument'}{'contents'}[3];
$result_trees{'zero_argument'}{'contents'}[3]{'parent'} = $result_trees{'zero_argument'};
$result_trees{'zero_argument'}{'contents'}[4]{'parent'} = $result_trees{'zero_argument'};

$result_texis{'zero_argument'} = '@macro foo {}
in foo
@end macro

@macro bar
in bar
@end macro';

$result_errors{'zero_argument'} = [];


