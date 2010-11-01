use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'bad_style_nesting'} = {
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
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'cmdname' => 'quotation',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in quotation
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'invalid_nesting' => 1
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
$result_trees{'bad_style_nesting'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'bad_style_nesting'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[0]{'contents'}[0];
$result_trees{'bad_style_nesting'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[0];
$result_trees{'bad_style_nesting'}{'contents'}[0]{'parent'} = $result_trees{'bad_style_nesting'};
$result_trees{'bad_style_nesting'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[1];
$result_trees{'bad_style_nesting'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[1]{'contents'}[1];
$result_trees{'bad_style_nesting'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'bad_style_nesting'}{'contents'}[1];
$result_trees{'bad_style_nesting'}{'contents'}[1]{'parent'} = $result_trees{'bad_style_nesting'};
$result_trees{'bad_style_nesting'}{'contents'}[2]{'parent'} = $result_trees{'bad_style_nesting'};

$result_texis{'bad_style_nesting'} = '@code{
}@quotation
in quotation
@end quotation
';


$result_texts{'bad_style_nesting'} = '
in quotation
';

$result_errors{'bad_style_nesting'} = [
  {
    'error_line' => ':2: warning: @quotation should not appear in @code
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@quotation should not appear in @code',
    'type' => 'warning'
  },
  {
    'error_line' => ':2: @code missing close brace
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@code missing close brace',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Misplaced }
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Misplaced }',
    'type' => 'error'
  }
];


1;
