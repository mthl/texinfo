use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'expand_two_same'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'macro2',
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
          'text' => 'With a doubles arg \\arg\\ and re \\arg\\
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
        'arg_line' => ' macro2 { arg }
',
        'args_index' => {
          'arg' => 0
        },
        'macrobody' => 'With a doubles arg \\arg\\ and re \\arg\\

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
      'contents' => [
        {
          'parent' => {},
          'text' => 'Call macro2
'
        },
        {
          'parent' => {},
          'text' => 'With a doubles arg a simple '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'parent' => {},
                  'text' => 'arg'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'parent' => {},
          'text' => ' and re a simple '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'parent' => {},
                  'text' => 'arg'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'empty_line'
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
          'text' => 'Call macro2 with 2 args
'
        },
        {
          'parent' => {},
          'text' => 'With a doubles arg arg with comma , here  and re arg with comma , here 
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
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'expand_two_same'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[0];
$result_trees{'expand_two_same'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[0];
$result_trees{'expand_two_same'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[0];
$result_trees{'expand_two_same'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[0];
$result_trees{'expand_two_same'}{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'args'}[0];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[2];
$result_trees{'expand_two_same'}{'contents'}[2]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[3]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[4]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[5];
$result_trees{'expand_two_same'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'expand_two_same'}{'contents'}[5];
$result_trees{'expand_two_same'}{'contents'}[5]{'parent'} = $result_trees{'expand_two_same'};
$result_trees{'expand_two_same'}{'contents'}[6]{'parent'} = $result_trees{'expand_two_same'};

$result_texis{'expand_two_same'} = '@macro macro2 { arg }
With a doubles arg \\arg\\ and re \\arg\\

@end macro
Call macro2
With a doubles arg a simple @code{
arg}
 and re a simple @code{
arg}


Call macro2 with 2 args
With a doubles arg arg with comma , here  and re arg with comma , here 

';


$result_texts{'expand_two_same'} = 'Call macro2
With a doubles arg a simple 
arg
 and re a simple 
arg


Call macro2 with 2 args
With a doubles arg arg with comma , here  and re arg with comma , here 

';

$result_errors{'expand_two_same'} = [];


$result_indices{'expand_two_same'} = undef;


1;
