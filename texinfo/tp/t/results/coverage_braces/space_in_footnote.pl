use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'space_in_footnote'} = {
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
                      'text' => 'in footnote.'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'parent' => {}
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
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'};

$result_texis{'space_in_footnote'} = 'text@footnote{ in footnote.}';


$result_texts{'space_in_footnote'} = 'text';

$result_errors{'space_in_footnote'} = [];


