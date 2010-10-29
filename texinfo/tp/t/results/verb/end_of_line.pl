use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'end_of_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'verb at end of line '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => '@{ in verb at end of line @c comment
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'and now end',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'type' => ''
        },
        {
          'parent' => {},
          'text' => 'after end.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'end_of_line'}{'contents'}[0];
$result_trees{'end_of_line'}{'contents'}[0]{'parent'} = $result_trees{'end_of_line'};

$result_texis{'end_of_line'} = 'verb at end of line @verb{

@{ in verb at end of line @c comment
and now end}after end.';


$result_texts{'end_of_line'} = 'verb at end of line 

@{ in verb at end of line @c comment
and now endafter end.';

$result_errors{'end_of_line'} = [
  {
    'error_line' => ':1: @verb without associated character
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@verb without associated character',
    'type' => 'error'
  }
];


1;
