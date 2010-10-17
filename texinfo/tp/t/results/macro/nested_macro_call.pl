use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'nested_macro_call'} = {
  'contents' => [
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
          'text' => '(machin)
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'arg_line' => ' machin{}
',
        'macrobody' => '(machin)
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
      'args' => [
        {
          'parent' => {},
          'text' => 'truc',
          'type' => 'macro_name'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => '@machin{}
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
        'arg_line' => ' truc{}
',
        'macrobody' => '@machin{}

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
      'contents' => [
        {
          'parent' => {},
          'text' => 'Before (machin)
'
        },
        {
          'parent' => {},
          'text' => ' after truc.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'nested_macro_call'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[0];
$result_trees{'nested_macro_call'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[0];
$result_trees{'nested_macro_call'}{'contents'}[0]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[1]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[2]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[3];
$result_trees{'nested_macro_call'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[3];
$result_trees{'nested_macro_call'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[3];
$result_trees{'nested_macro_call'}{'contents'}[3]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[4]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[5]{'parent'} = $result_trees{'nested_macro_call'};
$result_trees{'nested_macro_call'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[6];
$result_trees{'nested_macro_call'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'nested_macro_call'}{'contents'}[6];
$result_trees{'nested_macro_call'}{'contents'}[6]{'parent'} = $result_trees{'nested_macro_call'};

$result_texis{'nested_macro_call'} = '@macro machin{}
(machin)
@end macro

@macro truc{}
@machin{}

@end macro

Before (machin)
 after truc.
';

$result_errors{'nested_macro_call'} = [];


