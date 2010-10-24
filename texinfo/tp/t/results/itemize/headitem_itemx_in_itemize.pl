use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'headitem_itemx_in_itemize'} = {
  'contents' => [
    {
      'cmdname' => 'itemize',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'before_item'
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'item
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'itemx
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'empty_spaces_after_command'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'headitem
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
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
    }
  ],
  'type' => 'text_root'
};
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'headitem_itemx_in_itemize'}{'contents'}[0];
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_itemize'};
$result_trees{'headitem_itemx_in_itemize'}{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_itemize'};

$result_texis{'headitem_itemx_in_itemize'} = '@itemize
@item item
 itemx
 headitem
@end itemize
';


$result_texts{'headitem_itemx_in_itemize'} = 'item
itemx
headitem
';

$result_errors{'headitem_itemx_in_itemize'} = [
  {
    'error_line' => ':3: @itemx not meaningful inside `@itemize\' block
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@itemx not meaningful inside `@itemize\' block',
    'type' => 'error'
  },
  {
    'error_line' => ':4: @headitem not meaningful inside `@itemize\' block
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@headitem not meaningful inside `@itemize\' block',
    'type' => 'error'
  }
];


