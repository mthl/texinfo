use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'top_no_argument_and_content'} = {
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
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
              'text' => 'A.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'misc_content' => []
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
$result_trees{'top_no_argument_and_content'}{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_content'};
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_content'}{'contents'}[1]{'args'}[0];
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'top_no_argument_and_content'}{'contents'}[1];
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_content'}{'contents'}[1];
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'top_no_argument_and_content'}{'contents'}[1]{'contents'}[1];
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'top_no_argument_and_content'}{'contents'}[1];
$result_trees{'top_no_argument_and_content'}{'contents'}[1]{'parent'} = $result_trees{'top_no_argument_and_content'};

$result_texis{'top_no_argument_and_content'} = '@top

A.
';


$result_texts{'top_no_argument_and_content'} = '
A.
';

$result_sectioning{'top_no_argument_and_content'} = {
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
$result_sectioning{'top_no_argument_and_content'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'top_no_argument_and_content'};

$result_errors{'top_no_argument_and_content'} = [];



$result_converted{'plaintext'}->{'top_no_argument_and_content'} = 'A.
';

1;
