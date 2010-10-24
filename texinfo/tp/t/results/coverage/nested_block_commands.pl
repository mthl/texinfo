use vars qw(%result_texis %result_texts %result_trees %result_errors %results_indices);

$result_trees{'nested_block_commands'} = {
  'contents' => [
    {
      'cmdname' => 'group',
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
              'text' => 'In group
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'in quotation
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
      'cmdname' => 'group',
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
                  'text' => 'in quotation
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
      'cmdname' => 'group',
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
              'text' => 'In group
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'in quotation
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'after quotation
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
    },
    {
      'cmdname' => 'group',
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
              'text' => 'In group sp b
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
                  'text' => 'in quotation
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
      'cmdname' => 'group',
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
              'text' => 'In group sp b a
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
                  'text' => 'in quotation
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
      'cmdname' => 'group',
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
              'text' => 'In group sp a
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
                  'text' => 'in quotation
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
      'cmdname' => 'group',
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in quotation sp b
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
      'cmdname' => 'group',
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in quotation sp b a
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
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
    },
    {
      'cmdname' => 'group',
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
                  'text' => 'in quotation sp a
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
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
    },
    {
      'cmdname' => 'group',
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
                  'text' => 'in quotation
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'After quotation sp b
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
    },
    {
      'cmdname' => 'group',
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
                  'text' => 'in quotation
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'After quotation sp a
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
      'cmdname' => 'group',
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
                  'text' => 'in quotation
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'After quotation sp b a
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
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0];
$result_trees{'nested_block_commands'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[0];
$result_trees{'nested_block_commands'}{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[5]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[4];
$result_trees{'nested_block_commands'}{'contents'}[6]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[6];
$result_trees{'nested_block_commands'}{'contents'}[6]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[7]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[8]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9];
$result_trees{'nested_block_commands'}{'contents'}[9]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[9];
$result_trees{'nested_block_commands'}{'contents'}[9]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[10]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[11]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'contents'}[5]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[12];
$result_trees{'nested_block_commands'}{'contents'}[12]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[13]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[14]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15];
$result_trees{'nested_block_commands'}{'contents'}[15]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[15];
$result_trees{'nested_block_commands'}{'contents'}[15]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[16]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[17]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18];
$result_trees{'nested_block_commands'}{'contents'}[18]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[18];
$result_trees{'nested_block_commands'}{'contents'}[18]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[19]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[20]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[2];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21];
$result_trees{'nested_block_commands'}{'contents'}[21]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[21];
$result_trees{'nested_block_commands'}{'contents'}[21]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[22]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[23]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24];
$result_trees{'nested_block_commands'}{'contents'}[24]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[24];
$result_trees{'nested_block_commands'}{'contents'}[24]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[25]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[26]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[4];
$result_trees{'nested_block_commands'}{'contents'}[27]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[27];
$result_trees{'nested_block_commands'}{'contents'}[27]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[28]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[29]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[3];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30];
$result_trees{'nested_block_commands'}{'contents'}[30]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[30];
$result_trees{'nested_block_commands'}{'contents'}[30]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[31]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[32]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[1]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[2]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[3]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[4];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[4]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'contents'}[5]{'parent'} = $result_trees{'nested_block_commands'}{'contents'}[33];
$result_trees{'nested_block_commands'}{'contents'}[33]{'parent'} = $result_trees{'nested_block_commands'};
$result_trees{'nested_block_commands'}{'contents'}[34]{'parent'} = $result_trees{'nested_block_commands'};

$result_texis{'nested_block_commands'} = '@group
In group
@quotation
in quotation
@end quotation
@end group

@group
@quotation
in quotation
@end quotation
@end group

@group
In group
@quotation
in quotation
@end quotation
after quotation
@end group

@group

In group sp b
@quotation
in quotation
@end quotation
@end group

@group

In group sp b a

@quotation
in quotation
@end quotation
@end group

@group
In group sp a

@quotation
in quotation
@end quotation
@end group

@group
@quotation

in quotation sp b
@end quotation
@end group

@group
@quotation

in quotation sp b a

@end quotation
@end group

@group
@quotation
in quotation sp a

@end quotation
@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b
@end group

@group
@quotation
in quotation
@end quotation
After quotation sp a

@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b a

@end group
';


$result_texts{'nested_block_commands'} = 'In group
in quotation

in quotation

In group
in quotation
after quotation


In group sp b
in quotation


In group sp b a

in quotation

In group sp a

in quotation


in quotation sp b


in quotation sp b a


in quotation sp a


in quotation

After quotation sp b

in quotation
After quotation sp a


in quotation

After quotation sp b a

';

$result_errors{'nested_block_commands'} = [];


$result_indices{'nested_block_commands'} = undef;


1;
