use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'close_paragraph_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'para '
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in titlefont'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'titlefont',
      'contents' => [],
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => ' after titlefont.
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
      'contents' => [
        {
          'parent' => {},
          'text' => 'p before sp
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' 4
'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'sp',
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'inew p after sp'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'close_paragraph_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[0];
$result_trees{'close_paragraph_command'}{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[1]{'args'}[0];
$result_trees{'close_paragraph_command'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[1];
$result_trees{'close_paragraph_command'}{'contents'}[1]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[2];
$result_trees{'close_paragraph_command'}{'contents'}[2]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[3]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[4];
$result_trees{'close_paragraph_command'}{'contents'}[4]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[5]{'args'}[0];
$result_trees{'close_paragraph_command'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[5];
$result_trees{'close_paragraph_command'}{'contents'}[5]{'parent'} = $result_trees{'close_paragraph_command'};
$result_trees{'close_paragraph_command'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'close_paragraph_command'}{'contents'}[6];
$result_trees{'close_paragraph_command'}{'contents'}[6]{'parent'} = $result_trees{'close_paragraph_command'};

$result_texts{'close_paragraph_command'} = 'para @titlefont{in titlefont} after titlefont.

p before sp
@sp 4
inew p after sp';

$result_errors{'close_paragraph_command'} = [];


