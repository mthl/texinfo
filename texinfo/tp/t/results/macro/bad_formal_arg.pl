use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'bad_formal_arg'} = {
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
          'text' => 'bad',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => '',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'not_empty',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bad macro
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' bad  { , not_empty}
',
        'args_index' => {
          '' => 0,
          'not_empty' => 1
        },
        'invalid_syntax' => 1,
        'macrobody' => 'in bad macro
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
      'extra' => {
        'command' => {}
      },
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
          'text' => 'bad-space',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'first',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'in 2arg',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'bad space
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'arg_line' => ' bad-space{first, in 2arg}
',
        'args_index' => {
          'first' => 0,
          'in 2arg' => 1
        },
        'invalid_syntax' => 1,
        'macrobody' => 'bad space
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
      'extra' => {
        'command' => {}
      },
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
          'text' => 'bar',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => ':::',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'macro',
      'contents' => [
        {
          'parent' => {},
          'text' => 'in bar
',
          'type' => 'raw'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in macro foo
',
              'type' => 'raw'
            }
          ],
          'extra' => {
            'arg_line' => ' foo {? aaa}
'
          },
          'parent' => {}
        },
        {
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        }
      ],
      'extra' => {
        'arg_line' => ' bar {:::}
',
        'args_index' => {
          ':::' => 0
        },
        'invalid_syntax' => 1,
        'macrobody' => 'in bar
@macro foo {? aaa}
in macro foo
@end macro
'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'extra' => {
        'command' => {}
      },
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'bad_formal_arg'}{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[1]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[2]{'extra'}{'command'} = $result_trees{'bad_formal_arg'}{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[2]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[3]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[4]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[5]{'extra'}{'command'} = $result_trees{'bad_formal_arg'}{'contents'}[4];
$result_trees{'bad_formal_arg'}{'contents'}[5]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[6]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[2]{'extra'}{'command'} = $result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[1];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[7]{'parent'} = $result_trees{'bad_formal_arg'};
$result_trees{'bad_formal_arg'}{'contents'}[8]{'extra'}{'command'} = $result_trees{'bad_formal_arg'}{'contents'}[7];
$result_trees{'bad_formal_arg'}{'contents'}[8]{'parent'} = $result_trees{'bad_formal_arg'};

$result_texis{'bad_formal_arg'} = '
@macro bad  { , not_empty}
in bad macro
@end macro

@macro bad-space{first, in 2arg}
bad space
@end macro

@macro bar {:::}
in bar
@macro foo {? aaa}
in macro foo
@end macro
@end macro
';


$result_texts{'bad_formal_arg'} = '


';

$result_errors{'bad_formal_arg'} = [
  {
    'error_line' => ':2: Bad or empty @macro formal argument: 
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: ',
    'type' => 'error'
  },
  {
    'error_line' => ':6: Bad or empty @macro formal argument: in 2arg
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: in 2arg',
    'type' => 'error'
  },
  {
    'error_line' => ':10: Bad or empty @macro formal argument: :::
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Bad or empty @macro formal argument: :::',
    'type' => 'error'
  }
];


1;
