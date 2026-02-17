local c = require('config.colors')

local hl_groups = {
  -- General
  Normal         = { fg = c.fg, ctermfg = 250, ctermbg = 234 },
  Comment        = { fg = c.fd, ctermfg = 7 },
  Cursor         = { bg = c.fg, fg = c.bg   },
  Title          = { link = 'Normal'        },
  Twilight       = { link = 'Comment'       },

  -- Sintaxy
  Boolean        = { fg = c.orange  },
  Character      = { fg = c.green   },
  Conditional    = { fg = c.magenta },
  Constant       = { fg = c.orange  },
  Define         = { fg = c.magenta },
  ErrorMsg       = { fg = c.red     },
  Exception      = { fg = c.magenta },
  Float          = { fg = c.orange  },
  Function       = { fg = c.blue    },
  Identifier     = { fg = c.red     },
  Include        = { fg = c.magenta },
  Keyword        = { fg = c.magenta },
  Label          = { fg = c.red     },
  Macro          = { fg = c.red     },
  Number         = { fg = c.orange  },
  Operator       = { fg = c.fg      },
  PreCondit      = { fg = c.magenta },
  PreProc        = { fg = c.magenta },
  Repeat         = { fg = c.magenta },
  Statement      = { fg = c.magenta },
  StorageClass   = { fg = c.fg      },
  String         = { fg = c.green   },
  Structure      = { fg = c.magenta },
  Tag            = { fg = c.red     },
  Typedef        = { fg = c.magenta },
  Type           = { fg = c.magenta },
  Underlined     = { fg = c.blue, underline = true },

  -- Keys [] {} ()
  Delimiter      = { fg = c.fg     },
  MatchParen     = { fg = c.yellow }, -- when inner block

  -- Extras
  Added          = { fg = c.green  },
  Changed        = { fg = c.blue   },
  Debug          = { fg = c.yellow },
  Directory      = { fg = c.blue   },
  EndOfBuffer    = { fg = c.bg     }, -- Line tilde blank
  NonText        = { fg = c.fd     },
  SpecialChar    = { fg = c.orange },
  SpecialComment = { fg = c.fd     },
  Special        = { fg = c.fg     },
  SpecialKey     = { fg = c.cyan   },
  TermCursor     = { fg = c.fg     },

  -- Search
  IncSearch      = { bg = c.sel     },
  Search         = { bg = c.sel     },
  CurSearch      = { bg = c.fg, fg = c.bg },
  Conceal        = { bg = c.sel     },

  -- Messages
  ModeMsg        = { fg = c.fd     },
  MoreMsg        = { fg = c.fd     },
  Question       = { fg = c.fg     },
  WarningMsg     = { fg = c.yellow },

  -- Alerts
  Ignore         = { fg = c.fg      },
  Error          = { fg = c.red     },
  Todo           = { fg = c.magenta },

  -- Line highlight
  CursorLine     = { bg = c.bl },

  -- Select text
  Visual         = { bg = c.sel },

  -- Line number column
  CursorLineFold = { fg = c.fg  },
  CursorLineNr   = { fg = c.fg  },
  CursorLineSign = { fg = c.fg  },
  LineNr         = { fg = c.sel },
  LineNrAbove    = { fg = c.sel },
  LineNrBelow    = { fg = c.sel },

  -- ColorColumn
  ColorColumn    = { bg = c.bl },

  -- Pmenu
  Pmenu          = { bg = c.bd },
  PmenuSel       = { bg = c.bl },
  PmenuSbar      = { bg = c.bd },
  Pmenuac        = { bg = c.bl },
  PmenuThumb     = { bg = c.bl },

  -- Popup
  NormalFloat        = { bg = c.bg },
  FloatBorder        = { bg = c.bg },
  FloatShadow        = { bg = c.bg },
  FloatShadowThrough = { bg = c.bg },

  -- Tabbar
  WinbarNC       = { fg = c.fd  },
  WinSeparator   = { fg = c.sel },

  -- Line win separator split
  StatusLine     = { link = 'Normal' },
  StatusLineNC   = { link = 'Normal' },

  -- Nvim
  NvimInternalError = { fg = c.red   },

  -- dosini
  dosiniLabel       = { link = 'Function'    },
  dosiniValue       = { link = 'Normal'      },

  -- html
  djangoTagBlock     = { link = 'Normal'     },
  djangoStatement    = { link = 'Normal'     },
  djangoFilter       = { link = 'Include'    },
  djangoVarBlock     = { link = 'Include'    },
  htmlArg            = { link = 'Number'     },
  htmlH1             = { link = 'Normal'     },
  htmlH2             = { link = 'Normal'     },
  htmlH3             = { link = 'Normal'     },
  htmlH4             = { link = 'Normal'     },
  htmlH5             = { link = 'Normal'     },
  htmlH6             = { link = 'Normal'     },
  htmlSpecialTagName = { link = 'Definition' },
  htmlTag            = { link = 'Normal'     },
  htmlEndTag         = { link = 'Normal'     },
  htmlTagName        = { link = 'Definition' },
  htmlTitle          = { link = 'Normal'     },
  htmlLink           = { link = 'Normal'     },

  -- markdown
  markdownBlockquote       = { link = 'Normal'   },
  markdownCodeDelimiter    = { link = 'Normal'   },
  markdownId               = { link = 'Normal'   },
  markdownH1               = { link = 'Normal'   },
  markdownH1Delimiter      = { link = 'Function' },
  markdownH2               = { link = 'Normal'   },
  markdownH2Delimiter      = { link = 'Function' },
  markdownH3               = { link = 'Normal'   },
  markdownH3Delimiter      = { link = 'Function' },
  markdownH4               = { link = 'Normal'   },
  markdownH4Delimiter      = { link = 'Function' },
  markdownH5               = { link = 'Normal'   },
  markdownH5Delimiter      = { link = 'Function' },
  markdownH6               = { link = 'Normal'   },
  markdownH6Delimiter      = { link = 'Function' },
  markdownHeadingDelimiter = { link = 'Normal'   },
  markdownHeadingRule      = { link = 'Normal'   },
  markdownListMarker       = { link = 'Normal'   },
  markdownRule             = { link = 'Normal'   },
  markdownUrl              = { link = 'Normal'   },
  mkdCode                  = { link = 'Normal'   },
  mkdCodeDelimiter         = { link = 'Normal'   },
  mkdCodeEnd               = { link = 'Normal'   },
  mkdCodeStart             = { link = 'Normal'   },
  mkdHeading               = { link = 'Function' },
  mkdInlineURL             = { link = 'Normal'   },
  mkdLineBreak             = { link = 'Normal'   },
  mkdLink                  = { link = 'Function' },
  mkdListItem              = { link = 'Normal'   },
  mkdURL                   = { link = 'Normal'   },

  -- js
  javaScriptBraces   = { link = 'Delimiter'      },
  javaScriptFunction = { fg = c.fg               },

  -- json
  jsonCommentError   = { link = 'Comment'        },

  -- Diagnostic
  DiagnosticError            = { fg = c.red     },
  DiagnosticFloatingError    = { fg = c.red     },
  DiagnosticFloatingHiting   = { fg = c.cyan    },
  DiagnosticFloatingInfo     = { fg = c.blue    },
  DiagnosticFloatingOk       = { fg = c.green   },
  DiagnosticFloatingWarn     = { fg = c.yellow  },
  DiagnosticHint             = { fg = c.cyan    },
  DiagnosticInfo             = { fg = c.blue    },
  DiagnosticOk               = { fg = c.green   },
  DiagnosticSignError        = { fg = c.red     },
  DiagnosticSignHint         = { fg = c.cyan    },
  DiagnosticSignOk           = { fg = c.green   },
  DiagnosticSignWarn         = { fg = c.yellow  },
  DiagnosticUnnecessary      = { fg = c.comment },
  DiagnosticVirtualTextError = { fg = c.red     },
  DiagnosticVirtualTextHint  = { fg = c.cyan    },
  DiagnosticVirtualTextInfo  = { fg = c.blue    },
  DiagnosticVirtualTextOk    = { fg = c.green   },
  DiagnosticVirtualTextWarn  = { fg = c.yellow  },
  DiagnosticWarn             = { fg = c.yellow  },

  -- Diff
  DiffAdd      = { fg = c.green    },
  DiffChange   = { fg = c.blue     },
  DiffDelete   = { fg = c.red      },
  DiffText     = { link = 'Normal' },

  -- Float
  FoldColumn   = { bg = c.sel, fg = c.cyan },
  Folder       = { bg = c.sel, fg = c.cyan },

  -- Help
  healthHeadingChar = { link = 'Normal' },
  helpHeader        = { fg   = c.blue   },
  helpSectionDelim  = { fg   = c.blue   },

  -- tree-sitter

  -- Constants
  ['@boolean']            = { link = 'Boolean'         },
  ['@character']          = { link = 'Character'       },
  ['@character.special']  = { link = 'SpecialChar'     },
  ['@constant.builtin']   = { link = 'Special'         },
  ['@constant']           = { link = 'Constant'        },
  ['@constant.macro']     = { link = 'Define'          },
  ['@define']             = { link = 'Define'          },
  ['@float']              = { link = 'Float'           },
  ['@macro']              = { link = 'Macro'           },
  ['@number']             = { link = 'Number'          },
  ['@string.escape']      = { link = 'SpecialChar'     },
  ['@string']             = { link = 'String'          },
  ['@string.special']     = { link = 'SpecialChar'     },
  ['@string.special.url'] = { link = 'SpecialChar'     },

  -- Comments
  ['@comment']            = { link = 'Comment'         },
  ['@comment.todo']       = { link = 'Todo'            },
  ['@punctuation']        = { link = 'Delimiter'       },

  -- Diff
  ['@diff.plus']          = { link = 'DiffAdd'         },
  ['@diff.delta']         = { link = 'DiffChange'      },
  ['@diff.minus']         = { link = 'DiffDelete'      },

  -- Functions
  ['@function']           = { link = 'Function'        },
  ['@function.builtin']   = { link = 'Special'         },
  ['@function.macro']     = { link = 'Macro'           },
  ['@function.method']    = { link = 'Function'        },
  ['@parameter']          = { link = 'Identifier'      },
  ['@method']             = { link = 'Function'        },
  ['@field']              = { link = 'Identifier'      },
  ['@property']           = { link = 'Identifier'      },
  ['@constructor']        = { link = 'Special'         },
  ['@variable.parameter'] = { link = 'Identifier'      },
  ['@variable.parameter.builtin'] = { link = 'Special' },
  ['@variable.member']    = { link = 'Identifier'      },
  ['@attribute']          = { link = 'Macro'           },
  ['@attribute.builtin']  = { link = 'Special'         },

  -- Keywords
  ['@conditional']         = { link = 'Conditional'     },
  ['@debug']               = { link = 'Debug'           },
  ['@exception']           = { link = 'Exception'       },
  ['@include']             = { link = 'Include'         },
  ['@keyword.conditional'] = { link = 'Conditional'    },
  ['@keyword']             = { link = 'Keyword'         },
  ['@keyword.repeat']      = { link = 'Repeat'          },
  ['@keyword.type']        = { link = 'Structure'       },
  ['@label']               = { link = 'Label'           },
  ['@namespace']           = { link = 'Identifier'      },
  ['@operator']            = { link = 'Operator'        },
  ['@preproc']             = { link = 'PreProc'         },
  ['@repeat']              = { link = 'Repeat'          },
  ['@storageclass']        = { link = 'StorageClass'    },
  ['@tag']                 = { link = 'Tag'             },
  ['@tag.builtin']         = { link = 'Tag'             },
  ['@tag.attribute']       = { link = 'Number'          },
  ['@tag.delimiter']       = { link = 'Normal'          },
  ['@type.definition']     = { link = 'Typedef'         },
  ['@type']                = { link = 'Type'            },
  ['@variable']            = { fg   = nil, bg = nil     }, -- using default foreground reduces visual overloa,

  -- LSP semantic tokens
  ['@lsp.type.class']         = { link = 'Structure'  },
  ['@lsp.type.comment']       = { link = 'Comment'    },
  ['@lsp.type.decorator']     = { link = 'Function'   },
  ['@lsp.type.enum']          = { link = 'Structure'  },
  ['@lsp.type.enumMember']    = { link = 'Constant'   },
  ['@lsp.type.function']      = { link = 'Function'   },
  ['@lsp.type.interface']     = { link = 'Structure'  },
  ['@lsp.type.macro']         = { link = 'Macro'      },
  ['@lsp.type.method']        = { link = 'Function'   },
  ['@lsp.type.namespace']     = { link = 'Structure'  },
  ['@lsp.type.parameter']     = { link = 'Identifier' },
  ['@lsp.type.property']      = { link = 'Identifier' },
  ['@lsp.type.struct']        = { link = 'Structure'  },
  ['@lsp.type.type']          = { link = 'Type'       },
  ['@lsp.type.typeParameter'] = { link = 'TypeDef'    },
  ['@lsp.type.variable']      = { link = '@variable'  }, -- links to tree-sitter group to reduce overloa,

  -- Markup
  ['@markup.heading'] =   { link = 'Title'      },
  ['@markup.link'] =      { link = 'Identifier' },
  ['@markup.link.url'] =  { link = 'Underlined' },
  ['@markup.raw'] =       { link = 'Comment'    },
  ['@markup.underline'] = { link = 'Underlined' },

  -- Text
  ['@text.literal']       = { link = 'Comment'         },
  ['@text.reference']     = { link = 'Identifier'      },
  ['@text.title']         = { link = 'Title'           },
  ['@text.uri']           = { link = 'Underlined'      },
  ['@text.underline']     = { link = 'Underlined'      },
  ['@text.todo']          = { link = 'Todo'            },

  -- Languages

  -- bash
  ['@constant.bash']            = { link = 'Identifier' },
  ['@function.builtin.bash']    = { link = 'Function'   },
  ['@punctuation.special.bash'] = { link = 'Identifier' },
  ['@string.regexp.bash']       = { link = 'Normal'     },
  ['@variable.bash']            = { link = 'Identifier' },
  ['@variable.builtin.bash']    = { link = 'Identifier' },
  ['@variable.parameter.bash']  = { link = 'Normal'     },

  -- css
  ['@selectors.css'] = { link = 'Identifier' },
  ['@function.css']  = { link = 'Function'   },
  ['@property.css']  = { link = 'Normal'     },
  ['@value.css']     = { link = 'Number'     },

  -- html
  ['@tag.html']                = { link = 'Identifier' },
  ['@constant.html']           = { link = 'Identifier' },
  ['@string.special.url.html'] = { link = 'String'     },

  -- vimdoc
  ['@comment.note.vimdoc']     = { link = 'Normal'     },
  ['@label.vimdoc']            = { link = 'Identifier' },
  ['@markup.link.vimdoc']      = { link = 'Function'   },
  ['@markup.raw.block.vimdoc'] = { link = 'Normal'     },
  ['@markup.raw.vimdoc']       = { link = 'Normal'     },

------------------------------------------------------------
-- Plugins
------------------------------------------------------------

  -- blink
  BlinkCmpMenu       = { bg = c.bg },
  BlinkCmpMenuBorder = { bg = c.bg },

  -- codium
  CodeiumAnnotation = { fg = c.fg },
  CodeiumSuggestion = { fg = c.fd },

  -- hop
  HopNextKey   = { fg = c.blue    },
  HopNextKey1  = { fg = c.red     },
  HopNextKey2  = { fg = c.orange  },
  HopNextKey3  = { fg = c.magenta },
  HopUnmatched = { fg = c.fd      },

  -- kitty
  KittyColor   = { link = 'Number'     },
  KittyAction  = { link = 'Normal'     },
  KittyKeybind = { link = 'Function'   },
  KittyKeyword = { link = 'Definition' },
  KittyMap     = { link = 'Keyword'    },
  KittyMod     = { link = 'Function'   },
  KittySt      = { link = 'String'     },

  -- lazy
  LazyNormal        = { bg = c.bd   },
  LazyProgressDone  = { fg = c.blue },
  LazyProp          = { bg = c.sel  },
  LazyReasonEvent   = { fg = c.fd   },
  LazyReasonFt      = { fg = c.fd   },
  LazyReasonPlugin  = { fg = c.fd   },
  LazyReasonRequire = { fg = c.fd   },
  LazyReasonSource  = { fg = c.fd   },
  LazyReasonStart   = { fg = c.fd   },

  -- mini-cursorword
  MiniCursorword        = { fg = c.yellow },
  MiniCursorwordCurrent = { fg = c.yellow },

  -- mini-files
  MiniFilesTitle        = { fg = c.fd     },
  MiniFilesTitleFocused = { fg = c.fg     },

  -- mini-jump2d
  MiniJump2dSpot        = { fg = c.red    },
  MiniJump2dSpotUnique  = { fg = c.blue   },
  MiniJump2dSpotAhead   = { fg = c.yellow },

  -- mini-statusline
  MiniStatuslineRecording = { fg = c.red },


  -- netrw
  netrwTreeBar = { link = 'Normal' },

  -- snacks
  SnacksIndent      = { fg   = c.sel          },
  SnacksIndentScope = { link = 'SnacksIndent' },
}

-- Clear all colors
vim.cmd.hi('clear')

-- Spell
vim.cmd('hi SpellBad guisp=' .. c.red)
vim.cmd('hi SpellCap guisp=' .. c.blue)
vim.cmd('hi SpellRare guisp=' .. c.magenta)
vim.cmd('hi SpellLocal guisp=' .. c.cyan)

-- Loop for colors
for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end

