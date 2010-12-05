use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted);

$result_trees{'quotation_author'} = {
  'contents' => [
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
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'First Author'
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
          'cmdname' => 'author',
          'extra' => {
            'misc_content' => [
              {}
            ],
            'quotation' => {}
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 3,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'quotation
'
            },
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
                      'text' => 'S'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => 'e'
                        }
                      ],
                      'cmdname' => '~',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => 'cond author'
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
              'cmdname' => 'author',
              'extra' => {
                'misc_content' => [
                  {},
                  {},
                  {}
                ],
                'quotation' => {}
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'quotation continues.
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
      'extra' => {
        'authors' => [
          {},
          {}
        ]
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
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'extra'}{'misc_content'}[0] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[1];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'extra'}{'quotation'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[4]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'misc_content'}[0] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'misc_content'}[1] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'misc_content'}[2] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'quotation'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'quotation_author'}{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'extra'}{'authors'}[0] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[2];
$result_trees{'quotation_author'}{'contents'}[0]{'extra'}{'authors'}[1] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'quotation_author'}{'contents'}[0]{'parent'} = $result_trees{'quotation_author'};
$result_trees{'quotation_author'}{'contents'}[1]{'parent'} = $result_trees{'quotation_author'};

$result_texis{'quotation_author'} = '@quotation

@author First Author
quotation
@author S@~econd author
quotation continues.

@end quotation
';


$result_texts{'quotation_author'} = '
quotation
quotation continues.

';

$result_errors{'quotation_author'} = [];



$result_converted{'plaintext'}->{'quotation_author'} = '
     quotation quotation continues.

                           -- _First Author_
                          -- _Se~cond author_
';

1;
