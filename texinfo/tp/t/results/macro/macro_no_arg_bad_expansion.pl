use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'macro_no_arg_bad_expansion'} = {
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
      'extra' => {
        'arg_line' => ' test1
',
        'macrobody' => 'res1
'
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
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'}{'contents'}[0];
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'};
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[1]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'};
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[2]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'};
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'}{'contents'}[3];
$result_trees{'macro_no_arg_bad_expansion'}{'contents'}[3]{'parent'} = $result_trees{'macro_no_arg_bad_expansion'};

$result_texis{'macro_no_arg_bad_expansion'} = '@macro test1
res1
@end macro

res1 abc
';


$result_texts{'macro_no_arg_bad_expansion'} = '
res1 abc
';

$result_errors{'macro_no_arg_bad_expansion'} = [
  {
    'error_line' => ':5: warning: @test1 defined with zero or more than one argument should be invoked with {}
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@test1 defined with zero or more than one argument should be invoked with {}',
    'type' => 'warning'
  }
];


$result_indices{'macro_no_arg_bad_expansion'} = undef;


1;
