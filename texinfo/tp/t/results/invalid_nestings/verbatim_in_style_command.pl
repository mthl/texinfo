use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'verbatim_in_style_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'code',
          'contents' => [],
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'verbatim',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'parent' => {},
          'text' => 'verbatim
',
          'type' => 'raw'
        }
      ],
      'extra' => {
        'invalid_nesting' => 1
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'verbatim_in_style_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'verbatim_in_style_command'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'verbatim_in_style_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'verbatim_in_style_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'verbatim_in_style_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'verbatim_in_style_command'}{'contents'}[0];
$result_trees{'verbatim_in_style_command'}{'contents'}[0]{'parent'} = $result_trees{'verbatim_in_style_command'};
$result_trees{'verbatim_in_style_command'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'verbatim_in_style_command'}{'contents'}[1];
$result_trees{'verbatim_in_style_command'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'verbatim_in_style_command'}{'contents'}[1];
$result_trees{'verbatim_in_style_command'}{'contents'}[1]{'parent'} = $result_trees{'verbatim_in_style_command'};
$result_trees{'verbatim_in_style_command'}{'contents'}[2]{'parent'} = $result_trees{'verbatim_in_style_command'};

$result_texis{'verbatim_in_style_command'} = '@code{
}@verbatim
verbatim
@end verbatim
';


$result_texts{'verbatim_in_style_command'} = '
verbatim
';

$result_errors{'verbatim_in_style_command'} = [
  {
    'error_line' => ':2: warning: @verbatim should not appear in @code
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@verbatim should not appear in @code',
    'type' => 'warning'
  },
  {
    'error_line' => ':1: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':5: Misplaced }
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


1;
