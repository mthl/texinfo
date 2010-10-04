use vars qw(%result_texts %result_trees %result_errors);

$result_trees{'accents'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'a',
              'type' => 'space_command_arg'
            }
          ],
          'cmdname' => 'ringaccent',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'accent at end of line '
        },
        {
          'cmdname' => 'ringaccent',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
'
        },
        {
          'parent' => {},
          'text' => 'accent at end of line and spaces '
        },
        {
          'cmdname' => 'ringaccent',
          'contents' => [],
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'accent character with spaces '
        },
        {
          'cmdname' => '~',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => ' following.
'
        },
        {
          'parent' => {},
          'text' => 'accent character at end of line '
        },
        {
          'cmdname' => '~',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'normal_line'
    }
  ]
};
$result_trees{'accents'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'accents'}{'contents'}[0]{'contents'}[0];
$result_trees{'accents'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'accents'}{'contents'}[0];
$result_trees{'accents'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'accents'}{'contents'}[0];
$result_trees{'accents'}{'contents'}[0]{'parent'} = $result_trees{'accents'};
$result_trees{'accents'}{'contents'}[1]{'parent'} = $result_trees{'accents'};
$result_trees{'accents'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'accents'}{'contents'}[2];
$result_trees{'accents'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'accents'}{'contents'}[2];
$result_trees{'accents'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'accents'}{'contents'}[2];
$result_trees{'accents'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'accents'}{'contents'}[2];
$result_trees{'accents'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'accents'}{'contents'}[2];
$result_trees{'accents'}{'contents'}[2]{'parent'} = $result_trees{'accents'};
$result_trees{'accents'}{'contents'}[3]{'parent'} = $result_trees{'accents'};
$result_trees{'accents'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'accents'}{'contents'}[4];
$result_trees{'accents'}{'contents'}[4]{'parent'} = $result_trees{'accents'};
$result_trees{'accents'}{'contents'}[5]{'parent'} = $result_trees{'accents'};

$result_texts{'accents'} = '@ringaccent a

accent at end of line @ringaccent
accent at end of line and spaces @ringaccent
accent character with spaces @~ following.
accent character at end of line @~

';

$result_errors{'accents'} = [
  {
    'error_line' => ':3: warning: Accent command `@ringaccent\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'Accent command `@ringaccent\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: Accent command `@ringaccent\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Accent command `@ringaccent\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => ':6: warning: Accent command `@~\' must not be followed by whitespace
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'Accent command `@~\' must not be followed by whitespace',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: Accent command `@~\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Accent command `@~\' must not be followed by new line',
    'type' => 'warning'
  }
];


