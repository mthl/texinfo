use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'macro_for_ignored_line_command'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'page-macro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@page
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' page-macro
',
        'macrobody' => '@page
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
      'cmdname' => 'page',
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'macro_for_ignored_line_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'macro_for_ignored_line_command'}{'contents'}[0];
$result_trees{'macro_for_ignored_line_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'macro_for_ignored_line_command'}{'contents'}[0];
$result_trees{'macro_for_ignored_line_command'}{'contents'}[0]{'parent'} = $result_trees{'macro_for_ignored_line_command'};
$result_trees{'macro_for_ignored_line_command'}{'contents'}[1]{'parent'} = $result_trees{'macro_for_ignored_line_command'};
$result_trees{'macro_for_ignored_line_command'}{'contents'}[2]{'parent'} = $result_trees{'macro_for_ignored_line_command'};
$result_trees{'macro_for_ignored_line_command'}{'contents'}[3]{'parent'} = $result_trees{'macro_for_ignored_line_command'};

$result_texis{'macro_for_ignored_line_command'} = '@macro page-macro
@page
@end macro

@page
';


$result_texts{'macro_for_ignored_line_command'} = '
';

$result_errors{'macro_for_ignored_line_command'} = [];


$result_indices{'macro_for_ignored_line_command'} = undef;


1;
