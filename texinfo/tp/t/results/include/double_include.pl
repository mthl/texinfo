use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'double_include'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
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
              'text' => 'inc_file.texi In included file.'
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
      'cmdname' => 'include',
      'parent' => {}
    }
  ]
};
$result_trees{'double_include'}{'contents'}[0]{'parent'} = $result_trees{'double_include'};
$result_trees{'double_include'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'double_include'}{'contents'}[1]{'args'}[0];
$result_trees{'double_include'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'double_include'}{'contents'}[1]{'args'}[0];
$result_trees{'double_include'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'double_include'}{'contents'}[1]{'args'}[0];
$result_trees{'double_include'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_include'}{'contents'}[1];
$result_trees{'double_include'}{'contents'}[1]{'parent'} = $result_trees{'double_include'};

$result_texis{'double_include'} = '
@include inc_file.texi In included file.
';


$result_texts{'double_include'} = '
';

$result_errors{'double_include'} = [
  {
    'error_line' => 'inc_file.texi:2: @include: Cannot find inc_file.texi In included file.
',
    'file_name' => 't/include//inc_file.texi',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@include: Cannot find inc_file.texi In included file.',
    'type' => 'error'
  }
];


