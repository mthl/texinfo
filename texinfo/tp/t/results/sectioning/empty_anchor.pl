use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'empty_anchor'} = {
  'contents' => [
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
          'cmdname' => 'anchor',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '. 
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => '   ',
                  'type' => 'empty_spaces_before_argument'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'anchor',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
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
  'type' => 'text_root'
};
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[0];
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0];
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0];
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[2];
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0];
$result_trees{'empty_anchor'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'empty_anchor'}{'contents'}[0];
$result_trees{'empty_anchor'}{'contents'}[0]{'parent'} = $result_trees{'empty_anchor'};

$result_texis{'empty_anchor'} = '@anchor{}. 
@anchor{   }.
';


$result_texts{'empty_anchor'} = '. 
.
';

$result_errors{'empty_anchor'} = [
  {
    'error_line' => ':1: Empty argument in @anchor
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Empty argument in @anchor',
    'type' => 'error'
  },
  {
    'error_line' => ':2: Empty argument in @anchor
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Empty argument in @anchor',
    'type' => 'error'
  }
];


1;
