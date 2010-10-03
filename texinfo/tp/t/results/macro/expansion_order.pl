use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'expansion_order'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'bidule',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@machin{}
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' bidule{arg}
',
        'macrobody' => '@machin{}
'
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
          'parent' => {},
          'text' => 'machin',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '\\\\arg\\\\
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
      'parent' => {},
      'special' => {
        'macro_line' => ' machin
',
        'macrobody' => '\\\\arg\\\\

'
      }
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '\\arg\\
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    }
  ]
};
$result_trees{'expansion_order'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'expansion_order'}{'contents'}[0];
$result_trees{'expansion_order'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'expansion_order'}{'contents'}[0];
$result_trees{'expansion_order'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'expansion_order'}{'contents'}[0];
$result_trees{'expansion_order'}{'contents'}[0]{'parent'} = $result_trees{'expansion_order'};
$result_trees{'expansion_order'}{'contents'}[1]{'parent'} = $result_trees{'expansion_order'};
$result_trees{'expansion_order'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'expansion_order'}{'contents'}[2];
$result_trees{'expansion_order'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'expansion_order'}{'contents'}[2];
$result_trees{'expansion_order'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'expansion_order'}{'contents'}[2];
$result_trees{'expansion_order'}{'contents'}[2]{'parent'} = $result_trees{'expansion_order'};
$result_trees{'expansion_order'}{'contents'}[3]{'parent'} = $result_trees{'expansion_order'};
$result_trees{'expansion_order'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'expansion_order'}{'contents'}[4];
$result_trees{'expansion_order'}{'contents'}[4]{'parent'} = $result_trees{'expansion_order'};
$result_trees{'expansion_order'}{'contents'}[5]{'parent'} = $result_trees{'expansion_order'};

$result_texts{'expansion_order'} = '@macro bidule{arg}
@machin{}
@end macro

@macro machin
\\\\arg\\\\

@end macro

\\arg\\

';

$result_errors{'expansion_order'} = [];


