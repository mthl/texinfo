use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'enumerate_and_empty_lines'} = {
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
                  'text' => 'first item
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
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' 
',
              'type' => 'empty_line_after_command'
            },
            {
              'cmdname' => 'example',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In example
'
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'parent' => {},
                      'text' => 'end example.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
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
          'extra' => {
            'item_number' => 2
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'empty line.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
          'extra' => {
            'item_number' => 3
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
            },
            {
              'cmdname' => 'example',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In second example
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'preformatted'
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
          'extra' => {
            'item_number' => 4
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
            {
              'parent' => {},
              'text' => ' 
',
              'type' => 'empty_line_after_command'
            },
            {
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Quotation
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
          'extra' => {
            'item_number' => 5
          },
          'parent' => {}
        },
        {
          'cmdname' => 'item',
          'contents' => [
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
            },
            {
              'cmdname' => 'quotation',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'quotation after a blank line
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
          'extra' => {
            'item_number' => 6
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
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
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
                  'text' => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
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
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[0];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'};
$result_trees{'enumerate_and_empty_lines'}{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'};
$result_trees{'enumerate_and_empty_lines'}{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'};
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'enumerate_and_empty_lines'}{'contents'}[3];
$result_trees{'enumerate_and_empty_lines'}{'contents'}[3]{'parent'} = $result_trees{'enumerate_and_empty_lines'};
$result_trees{'enumerate_and_empty_lines'}{'contents'}[4]{'parent'} = $result_trees{'enumerate_and_empty_lines'};

$result_texis{'enumerate_and_empty_lines'} = '@enumerate
@item first item
@item 
@example
In example

end example.
@end example
@item 

empty line.
@item

@example
In second example
@end example
@item 
@quotation
Quotation
@end quotation

@item

@quotation
quotation after a blank line
@end quotation
@end enumerate

@enumerate
@item aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
@end enumerate
';


$result_texts{'enumerate_and_empty_lines'} = '1. first item
2. In example

end example.
3. 
empty line.
4. 
In second example
5. Quotation

6. 
quotation after a blank line

1. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
';

$result_errors{'enumerate_and_empty_lines'} = [];



$result_converted{'plaintext'}->{'enumerate_and_empty_lines'} = '  1. first item
  2.      In example

          end example.
  3. 
     empty line.
  4. 
          In second example
  5.      Quotation

  6. 
          quotation after a blank line

  1. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg
     vvvvvvvvv ggggggggg h
';

1;
