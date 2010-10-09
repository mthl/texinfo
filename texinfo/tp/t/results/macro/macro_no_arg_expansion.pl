use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'macro_no_arg_expansion'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'test1',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'res1
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' test1
',
        'macrobody' => 'res1
'
      }
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
          'text' => 'res1 abc
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'};
$result_trees{'macro_no_arg_expansion'}{'contents'}[1]{'parent'} = $result_trees{'macro_no_arg_expansion'};
$result_trees{'macro_no_arg_expansion'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[2];
$result_trees{'macro_no_arg_expansion'}{'contents'}[2]{'parent'} = $result_trees{'macro_no_arg_expansion'};

$result_texts{'macro_no_arg_expansion'} = '@macro test1
res1
@end macro

res1 abc
';

$result_errors{'macro_no_arg_expansion'} = [];


