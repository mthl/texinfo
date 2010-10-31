use vars qw(%result_texis %result_texts %result_trees %result_errors 
%results_indices %result_sectioning %result_nodes);

$result_trees{'sections'} = {
  'contents' => [
    {
      'contents' => [],
      'type' => 'text_root'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'a chapter'
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
      'cmdname' => 'chapter',
      'contents' => [],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'sections'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sections'}{'contents'}[1]{'args'}[0];
$result_trees{'sections'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'sections'}{'contents'}[1]{'args'}[0];
$result_trees{'sections'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'sections'}{'contents'}[1]{'args'}[0];
$result_trees{'sections'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sections'}{'contents'}[1];
$result_trees{'sections'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'sections'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'sections'}{'contents'}[1]{'parent'} = $result_trees{'sections'};

$result_texis{'sections'} = '@chapter a chapter
';


$result_texts{'sections'} = 'a chapter
';

$result_sectioning{'sections'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {},
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'sections'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'sections'};

$result_errors{'sections'} = [];


1;
