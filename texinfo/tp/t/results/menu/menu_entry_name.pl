use vars qw(%result_texis %result_trees %result_errors);

$result_trees{'menu_entry_name'} = {
  'contents' => [
    {
      'cmdname' => 'menu',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b1.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b2.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',     ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b3.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => ',    ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b1.'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '. ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a '
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f) b2 .'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a.n'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b3.'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.         ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b1.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b2.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '.  ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '* ',
              'type' => 'menu_entry_leading_text'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'a'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_name'
            },
            {
              'parent' => {},
              'text' => ': ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '(f)b3.c'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_node'
            },
            {
              'parent' => {},
              'text' => '. ',
              'type' => 'menu_entry_separator'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'd
'
                }
              ],
              'parent' => {},
              'type' => 'menu_entry_description'
            }
          ],
          'parent' => {},
          'type' => 'menu_entry'
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
  ]
};
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[2]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[3]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[4]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'args'}[5]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10];
$result_trees{'menu_entry_name'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'menu_entry_name'}{'contents'}[0];
$result_trees{'menu_entry_name'}{'contents'}[0]{'parent'} = $result_trees{'menu_entry_name'};
$result_trees{'menu_entry_name'}{'contents'}[1]{'parent'} = $result_trees{'menu_entry_name'};

$result_texis{'menu_entry_name'} = '@menu
* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
@end menu
';

$result_errors{'menu_entry_name'} = [];


