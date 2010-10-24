use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

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
        'arg_line' => ' test1
',
        'macrobody' => 'res1
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
  ],
  'type' => 'text_root'
};
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_expansion'}{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'};
$result_trees{'macro_no_arg_expansion'}{'contents'}[1]{'parent'} = $result_trees{'macro_no_arg_expansion'};
$result_trees{'macro_no_arg_expansion'}{'contents'}[2]{'parent'} = $result_trees{'macro_no_arg_expansion'};
$result_trees{'macro_no_arg_expansion'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_expansion'}{'contents'}[3];
$result_trees{'macro_no_arg_expansion'}{'contents'}[3]{'parent'} = $result_trees{'macro_no_arg_expansion'};

$result_texis{'macro_no_arg_expansion'} = '@macro test1
res1
@end macro

res1 abc
';


$result_texts{'macro_no_arg_expansion'} = '
res1 abc
';

$result_errors{'macro_no_arg_expansion'} = [];


$result_indices{'macro_no_arg_expansion'} = undef;


1;
