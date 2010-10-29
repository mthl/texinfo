use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'caption_not_closed'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'parent' => {},
              'text' => 'Text
'
            }
          ],
          'parent' => {},
          'type' => 'block_line_arg'
        }
      ],
      'cmdname' => 'float',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Not closed caption
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
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'The caption is closed as soon as '
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'end float is encountered, since
'
                    },
                    {
                      'parent' => {},
                      'text' => 'as much as possible is closed in order to find the '
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'float beginning.
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
                  'type' => 'empty_line'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_context'
            }
          ],
          'cmdname' => 'caption',
          'contents' => [],
          'parent' => {}
        }
      ],
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'caption_not_closed'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1];
$result_trees{'caption_not_closed'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'caption_not_closed'}{'contents'}[0];
$result_trees{'caption_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'caption_not_closed'};
$result_trees{'caption_not_closed'}{'contents'}[1]{'parent'} = $result_trees{'caption_not_closed'};
$result_trees{'caption_not_closed'}{'contents'}[2]{'parent'} = $result_trees{'caption_not_closed'};

$result_texis{'caption_not_closed'} = '@float Text

@caption{Not closed caption

The caption is closed as soon as @@end float is encountered, since
as much as possible is closed in order to find the @@float beginning.

}@end float

';


$result_texts{'caption_not_closed'} = '

';

$result_errors{'caption_not_closed'} = [
  {
    'error_line' => ':8: @caption missing close brace
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => '@caption missing close brace',
    'type' => 'error'
  }
];


1;
