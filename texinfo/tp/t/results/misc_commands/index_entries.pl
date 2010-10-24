use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'index_entries'} = {
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
              'text' => 'cindex entry'
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
      'cmdname' => 'cindex',
      'parent' => {}
    },
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
              'text' => 'truc'
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
      'cmdname' => 'defindex',
      'parent' => {},
      'special' => {
        'misc_args' => [
          'truc'
        ]
      }
    },
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
              'text' => 'index truc'
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
      'cmdname' => 'trucindex',
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[0]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entries'}{'contents'}[0]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entries'}{'contents'}[0]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[1]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[2];
$result_trees{'index_entries'}{'contents'}[2]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[3]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[4]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'index_entries'}{'contents'}[4]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'index_entries'}{'contents'}[4]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[4];
$result_trees{'index_entries'}{'contents'}[4]{'parent'} = $result_trees{'index_entries'};

$result_texis{'index_entries'} = '@cindex cindex entry

@defindex truc

@trucindex index truc
';


$result_texts{'index_entries'} = '

';

$result_errors{'index_entries'} = [];


$result_indices{'index_entries'} = {
  'index_names' => {
    'cp' => {
      'c' => 0,
      'cp' => 0
    },
    'fn' => {
      'f' => 1,
      'fn' => 1
    },
    'ky' => {
      'k' => 1,
      'ky' => 1
    },
    'pg' => {
      'p' => 1,
      'pg' => 1
    },
    'tp' => {
      't' => 1,
      'tp' => 1
    },
    'truc' => {
      'truc' => 0
    },
    'vr' => {
      'v' => 1,
      'vr' => 1
    }
  }
};


1;
