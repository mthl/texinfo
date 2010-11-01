use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'footnote_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'AAA'
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
                      'text' => 'in footnote
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
                      'text' => 'Second paragraph.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_not_closed'}{'contents'}[0];
$result_trees{'footnote_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'footnote_not_closed'};

$result_texis{'footnote_not_closed'} = 'AAA@footnote{ in footnote

Second paragraph.
}';


$result_texts{'footnote_not_closed'} = 'AAA';

$result_errors{'footnote_not_closed'} = [
  {
    'error_line' => ':3: @footnote missing close brace
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@footnote missing close brace',
    'type' => 'error'
  }
];


1;
