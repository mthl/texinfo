use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'include_at_end_line'} = {
  'contents' => [
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
              'text' => 'inc_file.texi'
            },
            {
              'cmdname' => '
',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'include',
      'parent' => {},
      'special' => {
        'text_arg' => 'inc_file.texi '
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
          'text' => 'After.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0];
$result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0];
$result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0];
$result_trees{'include_at_end_line'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'include_at_end_line'}{'contents'}[0];
$result_trees{'include_at_end_line'}{'contents'}[0]{'parent'} = $result_trees{'include_at_end_line'};
$result_trees{'include_at_end_line'}{'contents'}[1]{'parent'} = $result_trees{'include_at_end_line'};
$result_trees{'include_at_end_line'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'include_at_end_line'}{'contents'}[2];
$result_trees{'include_at_end_line'}{'contents'}[2]{'parent'} = $result_trees{'include_at_end_line'};

$result_texis{'include_at_end_line'} = '@include inc_file.texi@

After.';


$result_texts{'include_at_end_line'} = '
After.';

$result_errors{'include_at_end_line'} = [
  {
    'error_line' => ':1: @include: Cannot find inc_file.texi 
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@include: Cannot find inc_file.texi ',
    'type' => 'error'
  }
];


