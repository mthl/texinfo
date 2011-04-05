use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'empty_command_argument'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'titlefont',
      'contents' => [],
      'extra' => {
        'brace_command_contents' => [
          undef
        ]
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
'
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
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'footnote',
          'contents' => [],
          'line_nr' => {},
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'args' => [
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'verb',
          'contents' => [],
          'line_nr' => {},
          'parent' => {},
          'type' => ':'
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
  'type' => 'text_root'
};
$result_trees{'empty_command_argument'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[0];
$result_trees{'empty_command_argument'}{'contents'}[0]{'parent'} = $result_trees{'empty_command_argument'};
$result_trees{'empty_command_argument'}{'contents'}[1]{'parent'} = $result_trees{'empty_command_argument'};
$result_trees{'empty_command_argument'}{'contents'}[2]{'parent'} = $result_trees{'empty_command_argument'};
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[0];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[1];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[1]{'line_nr'} = $result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[0]{'line_nr'};
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[3]{'line_nr'} = $result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[0]{'line_nr'};
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'empty_command_argument'}{'contents'}[3];
$result_trees{'empty_command_argument'}{'contents'}[3]{'parent'} = $result_trees{'empty_command_argument'};

$result_texis{'empty_command_argument'} = '@titlefont{}

@code{}@footnote{}. @verb{::}.
';


$result_texts{'empty_command_argument'} = '

. .
';

$result_errors{'empty_command_argument'} = [];



$result_converted{'plaintext'}->{'empty_command_argument'} = '`\'(1).  .

   ---------- Footnotes ----------

   (1) 
';

1;
