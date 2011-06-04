use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'chapter_before_and_after_part'} = {
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
              'text' => 'chapter'
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
      'level' => 1,
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
              'text' => 'chapter 2'
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
        'line_nr' => 5,
        'macro' => ''
      },
      'number' => 2,
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'chapter_before_and_after_part'}{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'};
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[1]{'parent'} = $result_trees{'chapter_before_and_after_part'};
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[2];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[2]{'parent'} = $result_trees{'chapter_before_and_after_part'};
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'extra'}{'command'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[3];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'chapter_before_and_after_part'}{'contents'}[3];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'extra'}{'misc_content'}[0] = $result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'args'}[0]{'contents'}[1];
$result_trees{'chapter_before_and_after_part'}{'contents'}[3]{'parent'} = $result_trees{'chapter_before_and_after_part'};

$result_texis{'chapter_before_and_after_part'} = '@chapter chapter

@part part

@chapter chapter 2
';


$result_texts{'chapter_before_and_after_part'} = '1 chapter
*********

part
****

2 chapter 2
***********
';

$result_sectioning{'chapter_before_and_after_part'} = {
  'level' => -1,
  'section_childs' => [
    {
      'cmdname' => 'chapter',
      'extra' => {},
      'level' => 1,
      'number' => 1,
      'section_up' => {}
    },
    {
      'cmdname' => 'part',
      'extra' => {},
      'level' => 0,
      'section_childs' => [
        {
          'cmdname' => 'chapter',
          'extra' => {},
          'level' => 1,
          'number' => 2,
          'section_up' => {}
        }
      ],
      'section_up' => {}
    }
  ]
};
$result_sectioning{'chapter_before_and_after_part'}{'section_childs'}[0]{'section_up'} = $result_sectioning{'chapter_before_and_after_part'};
$result_sectioning{'chapter_before_and_after_part'}{'section_childs'}[1]{'section_childs'}[0]{'section_up'} = $result_sectioning{'chapter_before_and_after_part'}{'section_childs'}[1];
$result_sectioning{'chapter_before_and_after_part'}{'section_childs'}[1]{'section_up'} = $result_sectioning{'chapter_before_and_after_part'};

$result_errors{'chapter_before_and_after_part'} = [];


1;
