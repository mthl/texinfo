use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'section_before_part'} = {
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
              'text' => 'section'
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
      'cmdname' => 'section',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'misc_content' => [
          {}
        ]
      },
      'level' => 2,
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'number' => 1,
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
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'part'
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
      'cmdname' => 'part',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'contents',
          'parent' => {}
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
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'section_before_part'}{'contents'}[0]{'parent'} = $result_trees{'section_before_part'};
$result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_before_part'}{'contents'}[1];
$result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[1]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_before_part'}{'contents'}[1]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_before_part'}{'contents'}[1]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[1];
$result_trees{'section_before_part'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[1];
$result_trees{'section_before_part'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'section_before_part'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'section_before_part'}{'contents'}[1]{'parent'} = $result_trees{'section_before_part'};
$result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'section_before_part'}{'contents'}[2];
$result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2]{'args'}[0];
$result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2];
$result_trees{'section_before_part'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2];
$result_trees{'section_before_part'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'section_before_part'}{'contents'}[2];
$result_trees{'section_before_part'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'section_before_part'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'section_before_part'}{'contents'}[2]{'parent'} = $result_trees{'section_before_part'};

$result_texis{'section_before_part'} = '@section section 

@part part

@contents
';


$result_texts{'section_before_part'} = '1 section
=========

part
****

';

$result_sectioning{'section_before_part'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'section',
      'extra' => {},
      'level' => 2,
      'number' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_up' => {}
    }
  ]
};
$result_sectioning{'section_before_part'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'section_before_part'};
$result_sectioning{'section_before_part'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'section_before_part'};

$result_errors{'section_before_part'} = [];



$result_converted{'plaintext'}->{'section_before_part'} = '1 section
=========

  1 section
part
';

1;
