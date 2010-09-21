use vars qw(%result_texts %result_trees %result_errors);

################ good
$result_trees{'good'} = {
                          'contents' => [
                                          {
                                            'args' => [
                                                        {
                                                          'args' => [
                                                                      {
                                                                        'parent' => {},
                                                                        'text' => '0.4',
                                                                        'type' => 'fraction'
                                                                      },
                                                                      {
                                                                        'parent' => {},
                                                                        'text' => '.6',
                                                                        'type' => 'fraction'
                                                                      },
                                                                      {
                                                                        'parent' => {},
                                                                        'text' => '5.',
                                                                        'type' => 'fraction'
                                                                      }
                                                                    ],
                                                          'cmdname' => 'columnfractions',
                                                          'parent' => {}
                                                        }
                                                      ],
                                            'cmdname' => 'multitable',
                                            'parent' => {}
                                          }
                                        ]
                        };
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'args'}[2]{'parent'} = $result_trees{'good'}{'contents'}[0]{'args'}[0];
$result_trees{'good'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good'}{'contents'}[0];
$result_trees{'good'}{'contents'}[0]{'parent'} = $result_trees{'good'};

$result_texts{'good'} = '@multitable @columnfractions 0.4 .6 5.
@end multitable
';

$result_errors{'good'} = [];


################ good_comment
$result_trees{'good_comment'} = {
                                  'contents' => [
                                                  {
                                                    'args' => [
                                                                {
                                                                  'args' => [
                                                                              {
                                                                                'parent' => {},
                                                                                'text' => '0.4',
                                                                                'type' => 'fraction'
                                                                              },
                                                                              {
                                                                                'parent' => {},
                                                                                'text' => '.6',
                                                                                'type' => 'fraction'
                                                                              },
                                                                              {
                                                                                'parent' => {},
                                                                                'text' => '5.',
                                                                                'type' => 'fraction'
                                                                              }
                                                                            ],
                                                                  'cmdname' => 'columnfractions',
                                                                  'parent' => {}
                                                                },
                                                                {
                                                                  'args' => [
                                                                              {
                                                                                'parent' => {},
                                                                                'text' => ' comment
',
                                                                                'type' => 'misc_arg'
                                                                              }
                                                                            ],
                                                                  'cmdname' => 'c',
                                                                  'parent' => {}
                                                                }
                                                              ],
                                                    'cmdname' => 'multitable',
                                                    'parent' => {}
                                                  }
                                                ]
                                };
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'args'}[2]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'good_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'good_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'good_comment'}{'contents'}[0];
$result_trees{'good_comment'}{'contents'}[0]{'parent'} = $result_trees{'good_comment'};

$result_texts{'good_comment'} = '@multitable @columnfractions 0.4 .6 5. @c comment
@end multitable
';

$result_errors{'good_comment'} = [];


################ good_space_comment
$result_trees{'good_space_comment'} = {
                                        'contents' => [
                                                        {
                                                          'args' => [
                                                                      {
                                                                        'args' => [
                                                                                    {
                                                                                      'parent' => {},
                                                                                      'text' => '0',
                                                                                      'type' => 'fraction'
                                                                                    },
                                                                                    {
                                                                                      'parent' => {},
                                                                                      'text' => '1',
                                                                                      'type' => 'fraction'
                                                                                    }
                                                                                  ],
                                                                        'cmdname' => 'columnfractions',
                                                                        'parent' => {}
                                                                      },
                                                                      {
                                                                        'args' => [
                                                                                    {
                                                                                      'parent' => {},
                                                                                      'text' => ' space comment
',
                                                                                      'type' => 'misc_arg'
                                                                                    }
                                                                                  ],
                                                                        'cmdname' => 'c',
                                                                        'parent' => {}
                                                                      }
                                                                    ],
                                                          'cmdname' => 'multitable',
                                                          'parent' => {}
                                                        }
                                                      ]
                                      };
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'args'}[1]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'good_space_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'good_space_comment'}{'contents'}[0];
$result_trees{'good_space_comment'}{'contents'}[0]{'parent'} = $result_trees{'good_space_comment'};

$result_texts{'good_space_comment'} = '@multitable @columnfractions 0 1 @c space comment
@end multitable
';

$result_errors{'good_space_comment'} = [];


################ not_fraction
$result_trees{'not_fraction'} = {
                                  'contents' => [
                                                  {
                                                    'args' => [
                                                                {
                                                                  'cmdname' => 'columnfractions',
                                                                  'parent' => {}
                                                                }
                                                              ],
                                                    'cmdname' => 'multitable',
                                                    'parent' => {}
                                                  }
                                                ]
                                };
$result_trees{'not_fraction'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'not_fraction'}{'contents'}[0];
$result_trees{'not_fraction'}{'contents'}[0]{'parent'} = $result_trees{'not_fraction'};

$result_texts{'not_fraction'} = '@multitable @columnfractions
@end multitable
';

$result_errors{'not_fraction'} = [
                                   {
                                     'error_line' => ':1: column fraction not a number: aaa
',
                                     'file_name' => '',
                                     'line_nr' => 1,
                                     'macro' => '',
                                     'text' => 'column fraction not a number: aaa',
                                     'type' => 'error'
                                   }
                                 ];


################ empty
$result_trees{'empty'} = {
                           'contents' => [
                                           {
                                             'args' => [
                                                         {
                                                           'cmdname' => 'columnfractions',
                                                           'parent' => {}
                                                         }
                                                       ],
                                             'cmdname' => 'multitable',
                                             'parent' => {}
                                           }
                                         ]
                         };
$result_trees{'empty'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty'}{'contents'}[0];
$result_trees{'empty'}{'contents'}[0]{'parent'} = $result_trees{'empty'};

$result_texts{'empty'} = '@multitable @columnfractions
@end multitable
';

$result_errors{'empty'} = [
                            {
                              'error_line' => ':1: Empty @columnfractions
',
                              'file_name' => '',
                              'line_nr' => 1,
                              'macro' => '',
                              'text' => 'Empty @columnfractions',
                              'type' => 'error'
                            }
                          ];


################ empty_comment
$result_trees{'empty_comment'} = {
                                   'contents' => [
                                                   {
                                                     'args' => [
                                                                 {
                                                                   'cmdname' => 'columnfractions',
                                                                   'parent' => {}
                                                                 },
                                                                 {
                                                                   'args' => [
                                                                               {
                                                                                 'parent' => {},
                                                                                 'text' => '
',
                                                                                 'type' => 'misc_arg'
                                                                               }
                                                                             ],
                                                                   'cmdname' => 'c',
                                                                   'parent' => {}
                                                                 }
                                                               ],
                                                     'cmdname' => 'multitable',
                                                     'parent' => {}
                                                   }
                                                 ]
                                 };
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0]{'args'}[1];
$result_trees{'empty_comment'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_comment'}{'contents'}[0];
$result_trees{'empty_comment'}{'contents'}[0]{'parent'} = $result_trees{'empty_comment'};

$result_texts{'empty_comment'} = '@multitable @columnfractions @c
@end multitable
';

$result_errors{'empty_comment'} = [
                                    {
                                      'error_line' => ':1: @columnfractions accepts only fractions as argument
',
                                      'file_name' => '',
                                      'line_nr' => 1,
                                      'macro' => '',
                                      'text' => '@columnfractions accepts only fractions as argument',
                                      'type' => 'error'
                                    }
                                  ];


################ wrong_command
$result_trees{'wrong_command'} = {
                                   'contents' => [
                                                   {
                                                     'args' => [
                                                                 {
                                                                   'cmdname' => 'columnfractions',
                                                                   'parent' => {}
                                                                 },
                                                                 {
                                                                   'args' => [
                                                                               {
                                                                                 'contents' => [
                                                                                                 {
                                                                                                   'parent' => {},
                                                                                                   'text' => '3.4'
                                                                                                 }
                                                                                               ],
                                                                                 'parent' => {},
                                                                                 'type' => 'brace_command_arg'
                                                                               }
                                                                             ],
                                                                   'cmdname' => 'b',
                                                                   'parent' => {},
                                                                   'remaining_args' => 0
                                                                 },
                                                                 {
                                                                   'parent' => {},
                                                                   'text' => ' 
'
                                                                 }
                                                               ],
                                                     'cmdname' => 'multitable',
                                                     'parent' => {}
                                                   }
                                                 ]
                                 };
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'args'}[0]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0]{'args'}[1];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'wrong_command'}{'contents'}[0];
$result_trees{'wrong_command'}{'contents'}[0]{'parent'} = $result_trees{'wrong_command'};

$result_texts{'wrong_command'} = '@multitable @columnfractions @b{3.4}  
@end multitable
';

$result_errors{'wrong_command'} = [
                                    {
                                      'error_line' => ':1: @columnfractions accepts only fractions as argument
',
                                      'file_name' => '',
                                      'line_nr' => 1,
                                      'macro' => '',
                                      'text' => '@columnfractions accepts only fractions as argument',
                                      'type' => 'error'
                                    }
                                  ];



1;
