use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'double_recursive_macro_call'} = {
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
          'parent' => {},
          'text' => 'mac1',
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
          'text' => '@mac2{}
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' mac1 {arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => '@mac2{}
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
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
          'text' => 'mac2',
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
          'text' => '@mac1{}
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' mac2{arg}
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => '@mac1{}
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      },
      'parent' => {}
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
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'double_recursive_macro_call'}{'contents'}[0]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[1];
$result_trees{'double_recursive_macro_call'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[1];
$result_trees{'double_recursive_macro_call'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[1];
$result_trees{'double_recursive_macro_call'}{'contents'}[1]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[2]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[3]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[4];
$result_trees{'double_recursive_macro_call'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[4];
$result_trees{'double_recursive_macro_call'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'double_recursive_macro_call'}{'contents'}[4];
$result_trees{'double_recursive_macro_call'}{'contents'}[4]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[5]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[6]{'parent'} = $result_trees{'double_recursive_macro_call'};
$result_trees{'double_recursive_macro_call'}{'contents'}[7]{'parent'} = $result_trees{'double_recursive_macro_call'};

$result_texis{'double_recursive_macro_call'} = '
@macro mac1 {arg}
@mac2{}
@end macro

@macro mac2{arg}
@mac1{}
@end macro


';


$result_texts{'double_recursive_macro_call'} = '



';

$result_errors{'double_recursive_macro_call'} = [
  {
    'error_line' => ':10: Recursive call of macro mac2 is not allowed; use @rmacro if needed (possibly involving @mac1)
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => 'mac1',
    'text' => 'Recursive call of macro mac2 is not allowed; use @rmacro if needed',
    'type' => 'error'
  }
];


1;
