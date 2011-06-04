use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'footnote_no_node'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'top'
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
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
              'text' => 'F'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'In footnote'
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
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 0,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'footnote_no_node'}{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'};
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'}{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'footnote_no_node'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'footnote_no_node'}{'contents'}[1]{'parent'} = $result_trees{'footnote_no_node'};

$result_texis{'footnote_no_node'} = '@top top

F@footnote{In footnote}.
';


$result_texts{'footnote_no_node'} = 'top
***

F.
';

$result_sectioning{'footnote_no_node'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'top',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'footnote_no_node'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'footnote_no_node'};

$result_errors{'footnote_no_node'} = [];



$result_converted{'plaintext'}->{'footnote_no_node'} = 'top
***

F(1).

   ---------- Footnotes ----------

   (1) In footnote

';

1;
