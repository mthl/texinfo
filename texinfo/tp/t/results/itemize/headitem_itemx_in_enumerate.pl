use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'headitem_itemx_in_enumerate'} = {
  'contents' => [
    {
      'cmdname' => 'enumerate',
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
                  'text' => 'item enumerate
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
                  'text' => 'itemx enumerate
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
                  'text' => 'headitem enumerate
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 1
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'enumerate_specification' => 0
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
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[5];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0];
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[0]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'};
$result_trees{'headitem_itemx_in_enumerate'}{'contents'}[1]{'parent'} = $result_trees{'headitem_itemx_in_enumerate'};

$result_texis{'headitem_itemx_in_enumerate'} = '@enumerate
@item item enumerate
 itemx enumerate
 headitem enumerate
@end enumerate
';


$result_texts{'headitem_itemx_in_enumerate'} = 'item enumerate
itemx enumerate
headitem enumerate
';

$result_errors{'headitem_itemx_in_enumerate'} = [
  {
    'error_line' => ':3: @itemx not meaningful inside `@enumerate\' block
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@itemx not meaningful inside `@enumerate\' block',
    'type' => 'error'
  },
  {
    'error_line' => ':4: @headitem not meaningful inside `@enumerate\' block
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => '@headitem not meaningful inside `@enumerate\' block',
    'type' => 'error'
  }
];


1;
