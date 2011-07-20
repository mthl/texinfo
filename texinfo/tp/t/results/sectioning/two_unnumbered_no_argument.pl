use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'two_unnumbered_no_argument'} = {
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'unnumbered',
      'contents' => [],
      'extra' => {
        'missing_argument' => 1
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
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
              'text' => '
',
              'type' => 'empty_line_after_command'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        }
      ],
      'cmdname' => 'unnumbered',
      'contents' => [],
      'extra' => {
        'missing_argument' => 1
      },
      'level' => 1,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'two_unnumbered_no_argument'}{'contents'}[0]{'parent'} = $result_trees{'two_unnumbered_no_argument'};
$result_trees{'two_unnumbered_no_argument'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[1];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[1]{'args'}[0];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[1];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[1]{'parent'} = $result_trees{'two_unnumbered_no_argument'};
$result_trees{'two_unnumbered_no_argument'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[2];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[2]{'args'}[0];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'two_unnumbered_no_argument'}{'contents'}[2];
$result_trees{'two_unnumbered_no_argument'}{'contents'}[2]{'parent'} = $result_trees{'two_unnumbered_no_argument'};

$result_texis{'two_unnumbered_no_argument'} = '@unnumbered
@unnumbered
';


$result_texts{'two_unnumbered_no_argument'} = '';

$result_sectioning{'two_unnumbered_no_argument'} = {
  'level' => 0,
  'section_childs' => [
    {
      'cmdname' => 'unnumbered',
      'extra' => {
        'missing_argument' => 1
      },
      'level' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'unnumbered',
      'extra' => {
        'missing_argument' => 1
      },
      'level' => 1,
      'section_prev' => {},
      'section_up' => {},
      'toplevel_prev' => {}
    }
  ]
};
$result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'two_unnumbered_no_argument'};
$result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[1]{'section_prev'} = $result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[0];
$result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'two_unnumbered_no_argument'};
$result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[1]{'toplevel_prev'} = $result_sectioning{'two_unnumbered_no_argument'}{'section_childs'}[0];

$result_errors{'two_unnumbered_no_argument'} = [
  {
    'error_line' => ':1: @unnumbered missing argument
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@unnumbered missing argument',
    'type' => 'error'
  },
  {
    'error_line' => ':2: @unnumbered missing argument
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => '@unnumbered missing argument',
    'type' => 'error'
  }
];



$result_converted{'plaintext'}->{'two_unnumbered_no_argument'} = '';

1;
