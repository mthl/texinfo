use vars qw(%result_texis %result_texts %result_trees %result_errors);

$result_trees{'value_in_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'node1',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'Node 1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'parent' => {},
          'special' => {
            'arg_line' => ' node1 Node 1
'
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'type' => 'text_root'
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
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => '(dir)'
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
      'cmdname' => 'node',
      'contents' => [],
      'parent' => {}
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
              'text' => 'Expansion in Node Names'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
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
                      'text' => 'Node 1  '
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
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
      'parent' => {}
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
              'text' => 'Node 1'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [],
      'parent' => {}
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
              'text' => 'Chapter 1'
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
      'cmdname' => 'chapter',
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
              'parent' => {},
              'text' => 'sec1',
              'type' => 'misc_arg'
            },
            {
              'parent' => {},
              'text' => 'Section 1.1',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'parent' => {},
          'special' => {
            'arg_line' => ' sec1 Section 1.1
'
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
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
                      'text' => 'Section 1.1'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
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
      'parent' => {}
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
              'text' => 'Section 1.1'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Node 1'
            }
          ],
          'parent' => {},
          'type' => 'misc_line_arg'
        },
        {
          'contents' => [
            {
              'text' => ' ',
              'type' => 'empty_spaces_before_argument'
            },
            {
              'parent' => {},
              'text' => 'Node 1'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Node 1'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'contents' => [],
              'parent' => {}
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
      ],
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[1]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[2];
$result_trees{'value_in_node'}{'contents'}[2]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[3]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'value_in_node'}{'contents'}[4];
$result_trees{'value_in_node'}{'contents'}[4]{'parent'} = $result_trees{'value_in_node'};
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[2]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[2];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'args'}[3];
$result_trees{'value_in_node'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1];
$result_trees{'value_in_node'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'value_in_node'}{'contents'}[5];
$result_trees{'value_in_node'}{'contents'}[5]{'parent'} = $result_trees{'value_in_node'};

$result_texis{'value_in_node'} = '@set node1 Node 1

@node Top, (dir), (dir), (dir)
@top Expansion in Node Names

@menu
* Node 1  ::
@end menu

@node Node 1,, Top, Top
@chapter Chapter 1

@set sec1 Section 1.1

@menu
* Section 1.1::
@end menu

@node Section 1.1, , Node 1, Node 1

@xref{Node 1}.
';


$result_texts{'value_in_node'} = '
Expansion in Node Names

* Node 1  ::

Chapter 1


* Section 1.1::


.
';

$result_errors{'value_in_node'} = [];


