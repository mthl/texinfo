use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'index_entries'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'cindex entry
'
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
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'truc
'
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
      'type' => 'normal_line'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'index truc
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'trucindex',
      'parent' => {}
    }
  ]
};
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[0]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[0];
$result_trees{'index_entries'}{'contents'}[0]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[1]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[2];
$result_trees{'index_entries'}{'contents'}[2]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[3]{'parent'} = $result_trees{'index_entries'};
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[4]{'args'}[0];
$result_trees{'index_entries'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'index_entries'}{'contents'}[4];
$result_trees{'index_entries'}{'contents'}[4]{'parent'} = $result_trees{'index_entries'};

$result_texts{'index_entries'} = '@cindex cindex entry

@defindex truc

@trucindex index truc
';

$result_errors{'index_entries'} = [];


