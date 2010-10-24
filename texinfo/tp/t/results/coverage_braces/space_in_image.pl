use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'space_in_image'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'a'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'bb'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'cc'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'dd'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'e'
            },
            {
              'parent' => {},
              'text' => ' ',
              'type' => 'spaces_at_end'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'contents' => [],
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '. '
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'empty_spaces_before_argument'
                },
                {
                  'parent' => {},
                  'text' => 'f'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '.'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[1];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[2];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[3];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[3];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[4];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0]{'args'}[4];
$result_trees{'space_in_image'}{'contents'}[0]{'args'}[4]{'parent'} = $result_trees{'space_in_image'}{'contents'}[0];
$result_trees{'space_in_image'}{'contents'}[0]{'parent'} = $result_trees{'space_in_image'};
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'space_in_image'}{'contents'}[1];
$result_trees{'space_in_image'}{'contents'}[1]{'parent'} = $result_trees{'space_in_image'};

$result_texis{'space_in_image'} = '@image{ a ,bb, cc,dd ,e }. @image{ f }.';


$result_texts{'space_in_image'} = 'a. f.';

$result_errors{'space_in_image'} = [];


$result_indices{'space_in_image'} = undef;


1;
