use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'nested_ignore'} = {
  'contents' => [
    {
      'cmdname' => 'ignore',
      'contents' => [
        {
          'parent' => {},
          'text' => '@ignore
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'ignore',
      'contents' => [
        {
          'parent' => {},
          'text' => '@end iftex
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@ifinfo
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'cmdname' => 'ignore',
      'contents' => [
        {
          'parent' => {},
          'text' => '@end ifclear
',
          'type' => 'raw'
        },
        {
          'parent' => {},
          'text' => '@ifclear
',
          'type' => 'raw'
        }
      ],
      'parent' => {}
    }
  ]
};
$result_trees{'nested_ignore'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[0];
$result_trees{'nested_ignore'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[0];
$result_trees{'nested_ignore'}{'contents'}[0]{'parent'} = $result_trees{'nested_ignore'};
$result_trees{'nested_ignore'}{'contents'}[1]{'parent'} = $result_trees{'nested_ignore'};
$result_trees{'nested_ignore'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[2];
$result_trees{'nested_ignore'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[2];
$result_trees{'nested_ignore'}{'contents'}[2]{'parent'} = $result_trees{'nested_ignore'};
$result_trees{'nested_ignore'}{'contents'}[3]{'parent'} = $result_trees{'nested_ignore'};
$result_trees{'nested_ignore'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[4];
$result_trees{'nested_ignore'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'nested_ignore'}{'contents'}[4];
$result_trees{'nested_ignore'}{'contents'}[4]{'parent'} = $result_trees{'nested_ignore'};

$result_texts{'nested_ignore'} = '@ignore
@ignore

@end ignore

@ignore
@end iftex
@ifinfo
@end ignore

@ignore
@end ifclear
@ifclear
@end ignore
';

$result_errors{'nested_ignore'} = [];


