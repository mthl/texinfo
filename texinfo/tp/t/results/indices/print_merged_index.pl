use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'print_merged_index'} = {
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
              'text' => 'fn cp'
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
      'cmdname' => 'syncodeindex',
      'extra' => {
        'misc_args' => [
          'fn',
          'cp'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => 'fn'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'printindex',
      'extra' => {
        'misc_args' => [
          'fn'
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0];
$result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0];
$result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0];
$result_trees{'print_merged_index'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[0];
$result_trees{'print_merged_index'}{'contents'}[0]{'parent'} = $result_trees{'print_merged_index'};
$result_trees{'print_merged_index'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[1]{'args'}[0];
$result_trees{'print_merged_index'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[1]{'args'}[0];
$result_trees{'print_merged_index'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'print_merged_index'}{'contents'}[1];
$result_trees{'print_merged_index'}{'contents'}[1]{'parent'} = $result_trees{'print_merged_index'};

$result_texis{'print_merged_index'} = '@syncodeindex fn cp
@printindex fn';


$result_texts{'print_merged_index'} = '';

$result_errors{'print_merged_index'} = [
  {
    'error_line' => ':2: warning: Printing an index `fn\' merged in another one `cp\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Printing an index `fn\' merged in another one `cp\'',
    'type' => 'warning'
  }
];


$result_indices{'print_merged_index'} = {
  'merged_indices' => {
    'fn' => 'cp'
  }
};


1;
