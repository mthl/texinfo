$manual_tree = { 'cmdname' => 'multitable',
  'args' => [
             { 'type' => 'bracketed',
               'contents' => [
                               {'text' => 'aaaa'},
                            ]
             },
             { 'type' => 'bracketed',
               'contents' => [
                               {'text' => 'xx'},
                               {'cmdname' => 'b',
                                'args' => [
                                            {
                                              'type' => 'cmdarg',
                                              'contents' => [
                                                            { 'text' => 'rr' }
                                                         ]
                                            }
                                          ]
                               }
                            ]
             },
             { 'type' => 'line',
               'contents' => [
                               {'text' => 'ccc'},
                            ]
             },
          ],
  'extra' => { 'number_of_columns' => 3 },
  'contents' => [
           { 'type' => 'multitable_title',
             'contents' => [
                             { 'type' => 'paragraph',
                               'contents' => [
                                                { 'text' => "title" },
                                                { 'cmdname' => 'verb',
                                                  'args' => [
                                                               { 'text' => ' in verb } ',
                                                                 'type' => 'raw' }
                                                            ],
                                                  'type' => ':'
                                                },
                                                { 'cmdname' => '@'},
                                                { 'text' => ".\n"},
                                             ]
                             }
                           ]
           },
           { 'cmdname' => 'item',
             'type' => 'multitable_row',
             'extra' => {'row_number' => 1},
             'contents' => [
                             {  
                                'type' => 'multitable_cell',
                                'extra' => {'col_number' => 1,
                                            'row_number' => 1},
                                'contents' => [ {'text' => "\n" } ]
                              }
                           ]
           }

  ]
};

$manual_tree_result = '@multitable {aaaa} {xx@b{rr}} ccc
title@verb{: in verb } :}@@.
@item
@end multitable
';

1;
