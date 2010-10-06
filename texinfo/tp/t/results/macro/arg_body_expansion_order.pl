use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'arg_body_expansion_order'} = {
  'contents' => [
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
          'text' => 'othermacro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'initial
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' othermacro
',
        'macrobody' => 'initial
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
          'text' => 'redefineothermacro',
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
          'text' => '@unmacro othermacro
',
          'type' => 'raw'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'different
',
              'type' => 'raw'
            }
          ],
          'parent' => {},
          'special' => {
            'macro_line' => ' othermacro
'
          }
        },
        {
          'parent' => {},
          'text' => '\\arg\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'arg' => 0
        },
        'macro_line' => ' redefineothermacro {arg}
',
        'macrobody' => '@unmacro othermacro
@macro othermacro
different
@end macro
\\arg\\
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
          'text' => 'othermacro',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'unmacro',
      'parent' => {}
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'othermacro',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'different
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'macro_line' => ' othermacro
',
        'macrobody' => 'different
'
      }
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'different
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'arg_body_expansion_order'}{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[1];
$result_trees{'arg_body_expansion_order'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[1];
$result_trees{'arg_body_expansion_order'}{'contents'}[1]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[2]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3]{'contents'}[1];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[3];
$result_trees{'arg_body_expansion_order'}{'contents'}[3]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[4]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[5];
$result_trees{'arg_body_expansion_order'}{'contents'}[5]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[6];
$result_trees{'arg_body_expansion_order'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[6];
$result_trees{'arg_body_expansion_order'}{'contents'}[6]{'parent'} = $result_trees{'arg_body_expansion_order'};
$result_trees{'arg_body_expansion_order'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'arg_body_expansion_order'}{'contents'}[7];
$result_trees{'arg_body_expansion_order'}{'contents'}[7]{'parent'} = $result_trees{'arg_body_expansion_order'};

$result_texts{'arg_body_expansion_order'} = '
@macro othermacro
initial
@end macro

@macro redefineothermacro {arg}
@unmacro othermacro
@macro othermacro
different
@end macro
\\arg\\
@end macro

@unmacro othermacro
@macro othermacro
different
@end macro
different
';

$result_errors{'arg_body_expansion_order'} = [];


