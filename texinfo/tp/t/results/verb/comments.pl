use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'comments'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' comment @c comment
',
                  'type' => 'raw'
                },
                {
                  'parent' => {},
                  'text' => 'in a verb ',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'type' => 'a'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'something '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' in verb',
                  'type' => 'raw'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'parent' => {},
          'type' => ','
        },
        {
          'parent' => {},
          'text' => ' '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' other comment',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[0]{'contents'}[1];
$result_trees{'comments'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[0];
$result_trees{'comments'}{'contents'}[0]{'parent'} = $result_trees{'comments'};
$result_trees{'comments'}{'contents'}[1]{'parent'} = $result_trees{'comments'};
$result_trees{'comments'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[1];
$result_trees{'comments'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'comments'}{'contents'}[2]{'contents'}[3];
$result_trees{'comments'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'comments'}{'contents'}[2];
$result_trees{'comments'}{'contents'}[2]{'parent'} = $result_trees{'comments'};

$result_texis{'comments'} = '@verb{a comment @c comment
in a verb a}@c comment

something @verb{, in verb,} @c other comment';


$result_texts{'comments'} = ' comment @c comment
in a verb 
something  in verb ';

$result_errors{'comments'} = [];


