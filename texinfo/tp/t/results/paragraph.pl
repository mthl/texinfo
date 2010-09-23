use vars qw(%result_texts %result_trees %result_errors);

################ text
$result_trees{'text'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'text'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text'}{'contents'}[0];
$result_trees{'text'}{'contents'}[0]{'parent'} = $result_trees{'text'};

$result_texts{'text'} = 'text';

$result_errors{'text'} = [];


################ text comment
$result_trees{'text comment'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' comment',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'text comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text comment'}{'contents'}[0];
$result_trees{'text comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'text comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text comment'}{'contents'}[0];
$result_trees{'text comment'}{'contents'}[0]{'parent'} = $result_trees{'text comment'};

$result_texts{'text comment'} = 'text@c comment';

$result_errors{'text comment'} = [];


################ text space comment
$result_trees{'text space comment'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => ' text  '
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => ' space comment',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'c',
          'parent' => {}
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'text space comment'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'text space comment'}{'contents'}[0];
$result_trees{'text space comment'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'text space comment'}{'contents'}[0]{'contents'}[1];
$result_trees{'text space comment'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'text space comment'}{'contents'}[0];
$result_trees{'text space comment'}{'contents'}[0]{'parent'} = $result_trees{'text space comment'};

$result_texts{'text space comment'} = ' text  @c space comment';

$result_errors{'text space comment'} = [];


################ text line
$result_trees{'text line'} = {
  'contents' => [
    {
      'parent' => {},
      'text' => '
',
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text
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
      'type' => 'normal_line'
    }
  ]
};
$result_trees{'text line'}{'contents'}[0]{'parent'} = $result_trees{'text line'};
$result_trees{'text line'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'text line'}{'contents'}[1];
$result_trees{'text line'}{'contents'}[1]{'parent'} = $result_trees{'text line'};
$result_trees{'text line'}{'contents'}[2]{'parent'} = $result_trees{'text line'};

$result_texts{'text line'} = '
text

';

$result_errors{'text line'} = [];


################ comment between text
$result_trees{'comment between text'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text
'
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
        },
        {
          'parent' => {},
          'text' => 'end para'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'comment between text'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'comment between text'}{'contents'}[0];
$result_trees{'comment between text'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'comment between text'}{'contents'}[0]{'contents'}[1];
$result_trees{'comment between text'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'comment between text'}{'contents'}[0];
$result_trees{'comment between text'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'comment between text'}{'contents'}[0];
$result_trees{'comment between text'}{'contents'}[0]{'parent'} = $result_trees{'comment between text'};

$result_texts{'comment between text'} = 'text
@c comment
end para';

$result_errors{'comment between text'} = [];


################ two lines
$result_trees{'two lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => 'text l 1
'
        },
        {
          'parent' => {},
          'text' => 'text l 2
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'two lines'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'two lines'}{'contents'}[0];
$result_trees{'two lines'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'two lines'}{'contents'}[0];
$result_trees{'two lines'}{'contents'}[0]{'parent'} = $result_trees{'two lines'};

$result_texts{'two lines'} = 'text l 1
text l 2
';

$result_errors{'two lines'} = [];


################ no paragraph commands
$result_trees{'no paragraph commands'} = {
  'contents' => [
    {
      'cmdname' => '*',
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'title font'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'titlefont',
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'parent' => {},
      'text' => '
'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'aa'
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
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'ee'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'parent' => {},
      'remaining_args' => 0
    },
    {
      'parent' => {},
      'text' => '
'
    }
  ]
};
$result_trees{'no paragraph commands'}{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'};
$result_trees{'no paragraph commands'}{'contents'}[1]{'parent'} = $result_trees{'no paragraph commands'};
$result_trees{'no paragraph commands'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[2]{'args'}[0];
$result_trees{'no paragraph commands'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[2];
$result_trees{'no paragraph commands'}{'contents'}[2]{'parent'} = $result_trees{'no paragraph commands'};
$result_trees{'no paragraph commands'}{'contents'}[3]{'parent'} = $result_trees{'no paragraph commands'};
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[0];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[1];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[2];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[3];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[4]{'contents'}[0]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'args'}[4]{'parent'} = $result_trees{'no paragraph commands'}{'contents'}[4];
$result_trees{'no paragraph commands'}{'contents'}[4]{'parent'} = $result_trees{'no paragraph commands'};
$result_trees{'no paragraph commands'}{'contents'}[5]{'parent'} = $result_trees{'no paragraph commands'};

$result_texts{'no paragraph commands'} = '@*
@titlefont{title font}
@image{aa, bb, cc, dd, ee}
';

$result_errors{'no paragraph commands'} = [];


################ paragraph command
$result_trees{'paragraph command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => '@',
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
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
      'type' => 'normal_line'
    },
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
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
          'text' => '.
'
        }
      ],
      'parent' => {},
      'type' => 'paragraph'
    }
  ]
};
$result_trees{'paragraph command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph command'}{'contents'}[0];
$result_trees{'paragraph command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph command'}{'contents'}[0];
$result_trees{'paragraph command'}{'contents'}[0]{'parent'} = $result_trees{'paragraph command'};
$result_trees{'paragraph command'}{'contents'}[1]{'parent'} = $result_trees{'paragraph command'};
$result_trees{'paragraph command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph command'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph command'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph command'}{'contents'}[2]{'contents'}[0];
$result_trees{'paragraph command'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'paragraph command'}{'contents'}[2];
$result_trees{'paragraph command'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'paragraph command'}{'contents'}[2];
$result_trees{'paragraph command'}{'contents'}[2]{'parent'} = $result_trees{'paragraph command'};

$result_texts{'paragraph command'} = '@@

@b{aaa}.
';

$result_errors{'paragraph command'} = [];



1;
