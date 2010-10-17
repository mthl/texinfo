use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'empty_set'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'myspace',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => '',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'parent' => {},
      'special' => {
        'arg_line' => ' myspace
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
          'text' => '1  1
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'empty_set'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_set'}{'contents'}[0];
$result_trees{'empty_set'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_set'}{'contents'}[0];
$result_trees{'empty_set'}{'contents'}[0]{'parent'} = $result_trees{'empty_set'};
$result_trees{'empty_set'}{'contents'}[1]{'parent'} = $result_trees{'empty_set'};
$result_trees{'empty_set'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'empty_set'}{'contents'}[2];
$result_trees{'empty_set'}{'contents'}[2]{'parent'} = $result_trees{'empty_set'};

$result_texis{'empty_set'} = '@set myspace

1  1
';

$result_errors{'empty_set'} = [];


