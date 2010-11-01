use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats);

$result_trees{'value_after_accent'} = {
  'contents' => [
    {
      'args' => [
        {
          'parent' => {},
          'text' => 'a_letter',
          'type' => 'misc_arg'
        },
        {
          'parent' => {},
          'text' => 'a',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'set',
      'extra' => {
        'arg_line' => ' a_letter a
'
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'cmdname' => 'ringaccent',
          'contents' => [],
          'extra' => {
            'spaces' => ' '
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'a
'
        },
        {
          'cmdname' => '~',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => 'a'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'value_after_accent'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[0];
$result_trees{'value_after_accent'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[0];
$result_trees{'value_after_accent'}{'contents'}[0]{'parent'} = $result_trees{'value_after_accent'};
$result_trees{'value_after_accent'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[1];
$result_trees{'value_after_accent'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[1];
$result_trees{'value_after_accent'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[1];
$result_trees{'value_after_accent'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'value_after_accent'}{'contents'}[1];
$result_trees{'value_after_accent'}{'contents'}[1]{'parent'} = $result_trees{'value_after_accent'};

$result_texis{'value_after_accent'} = '@set a_letter a
@ringaccenta
@~a';


$result_texts{'value_after_accent'} = 'a
a';

$result_errors{'value_after_accent'} = [
  {
    'error_line' => ':2: Use braces to give a command as an argument to @ringaccent
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'Use braces to give a command as an argument to @ringaccent',
    'type' => 'error'
  },
  {
    'error_line' => ':3: Use braces to give a command as an argument to @~
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Use braces to give a command as an argument to @~',
    'type' => 'error'
  }
];


1;
