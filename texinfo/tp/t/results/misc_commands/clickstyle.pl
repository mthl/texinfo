use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'clickstyle'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => '@result',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'clickstyle',
      'parent' => {},
      'special' => {
        'arg_line' => ' @result
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
          'text' => 'A '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'click',
          'contents' => [],
          'parent' => {},
          'remaining_args' => 0
        },
        {
          'parent' => {},
          'text' => ' (result).
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'clickstyle'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'clickstyle'}{'contents'}[0];
$result_trees{'clickstyle'}{'contents'}[0]{'parent'} = $result_trees{'clickstyle'};
$result_trees{'clickstyle'}{'contents'}[1]{'parent'} = $result_trees{'clickstyle'};
$result_trees{'clickstyle'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'clickstyle'}{'contents'}[2];
$result_trees{'clickstyle'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'clickstyle'}{'contents'}[2]{'contents'}[1];
$result_trees{'clickstyle'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'clickstyle'}{'contents'}[2];
$result_trees{'clickstyle'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'clickstyle'}{'contents'}[2];
$result_trees{'clickstyle'}{'contents'}[2]{'parent'} = $result_trees{'clickstyle'};

$result_texis{'clickstyle'} = '@clickstyle @result

A @click{} (result).
';

$result_errors{'clickstyle'} = [];


