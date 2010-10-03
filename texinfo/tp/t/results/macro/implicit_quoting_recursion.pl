use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'implicit_quoting_recursion'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'cat',
          'type' => 'macro_name'
        },
        {
          'parent' => {},
          'text' => 'a',
          'type' => 'macro_arg'
        },
        {
          'parent' => {},
          'text' => 'b',
          'type' => 'macro_arg'
        }
      ],
      'cmdname' => 'rmacro',
      'contents' => [
        {
          'parent' => {},
          'text' => '\\a\\\\b\\
',
          'type' => 'raw'
        }
      ],
      'parent' => {},
      'special' => {
        'args_index' => {
          'a' => 0,
          'b' => 1
        },
        'macro_line' => ' cat{a,b}
',
        'macrobody' => '\\a\\\\b\\
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
          'text' => 'natopocotuototam
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[0];
$result_trees{'implicit_quoting_recursion'}{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'};
$result_trees{'implicit_quoting_recursion'}{'contents'}[1]{'parent'} = $result_trees{'implicit_quoting_recursion'};
$result_trees{'implicit_quoting_recursion'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'implicit_quoting_recursion'}{'contents'}[2];
$result_trees{'implicit_quoting_recursion'}{'contents'}[2]{'parent'} = $result_trees{'implicit_quoting_recursion'};

$result_texts{'implicit_quoting_recursion'} = '@rmacro cat{a,b}
\\a\\\\b\\
@end rmacro

natopocotuototam
';

$result_errors{'implicit_quoting_recursion'} = [];


