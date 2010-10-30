use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices %result_sectioning %result_nodes);

$result_trees{'footnote_ending_on_empty_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in footnote.
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
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_ending_on_empty_line'}{'contents'}[0];
$result_trees{'footnote_ending_on_empty_line'}{'contents'}[0]{'parent'} = $result_trees{'footnote_ending_on_empty_line'};

$result_texis{'footnote_ending_on_empty_line'} = 'text@footnote{ in footnote.

}';


$result_texts{'footnote_ending_on_empty_line'} = 'text';

$result_errors{'footnote_ending_on_empty_line'} = [];


1;
