local c = require('config.colors')

local hl_groups = {
  -- General
  Normal         = { fg = c.fg, ctermfg = 250, ctermbg = 234 },
  Comment        = { fg = c.fd, ctermfg = 7, italic = true   },
  Title          = { fg = c.magenta },
  Twilight       = { fg = c.fd      },

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
  Operator       = { fg = c.cyan    },
  PreCondit      = { fg = c.magenta },
  PreProc        = { fg = c.magenta },
  Repeat         = { fg = c.magenta },
  Tag            = { fg = c.red     },
  Statement      = { fg = c.magenta },
  String         = { fg = c.green   },
  StorageClass   = { fg = c.magenta },
  Structure      = { fg = c.magenta },
  Typedef        = { fg = c.magenta },
  Type           = { fg = c.magenta },

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
  Special        = { fg = c.fg     },
  SpecialChar    = { fg = c.yellow },
  SpecialComment = { fg = c.fd     },
  SpecialKey     = { fg = c.cyan   },
  TermCursor     = { fg = c.fg     },

  -- Search
  IncSearch      = { bg = c.ac     },
  Search         = { bg = c.ac     },
  CurSearch      = { bg = c.fg, fg = c.bg },
  Conceal        = { bg = c.ac     },

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
  Visual         = { bg = c.ac },

  -- Line number column
  CursorLineFold = { fg = c.fg },
  CursorLineNr   = { fg = c.fg },
  CursorLineSign = { fg = c.fg },
  LineNr         = { fg = c.ac },
  LineNrAbove    = { fg = c.ac },
  LineNrBelow    = { fg = c.ac },

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
  FloatBorder        = { bg = c.bg, fg = c.fd },
  FloatShadow        = { bg = c.bd },
  FloatShadowThrough = { bg = c.bd },

  -- Tabbar
  WinbarNC       = { fg = c.fd },
  WinSeparator   = { fg = c.ac },

  -- Line win separator split
  StatusLine     = { bg = 'NONE' },
  StatusLineNC   = { fg = c.fg   },

  -- Languages

  -- html
  htmlArg            = { fg = c.yellow },
  htmlH1             = { fg = c.fg     },
  htmlH2             = { fg = c.fg     },
  htmlH3             = { fg = c.fg     },
  htmlH4             = { fg = c.fg     },
  htmlH5             = { fg = c.fg     },
  htmlH6             = { fg = c.fg     },
  htmlSpecialTagName = { fg = c.red    },
  htmlTag            = { fg = c.fg     },
  htmlTagName        = { fg = c.red    },
  htmlTitle          = { fg = c.fg     },
  htmlLink           = { fg = c.fg     },

  -- markdown
  markdownBlockquote       = { fg = c.fg      },
  markdownCodeDelimiter    = { fg = c.fg      },
  markdownId               = { fg = c.magenta },
  markdownH1               = { fg = c.magenta },
  markdownH2               = { fg = c.magenta },
  markdownH3               = { fg = c.magenta },
  markdownH4               = { fg = c.magenta },
  markdownH5               = { fg = c.magenta },
  markdownH6               = { fg = c.magenta },
  markdownHeadingDelimiter = { fg = c.magenta },
  markdownHeadingRule      = { fg = c.magenta },
  markdownListMarker       = { fg = c.yellow  },
  markdownRule             = { fg = c.magenta },
  markdownUrl              = { fg = c.fg      },

  -- css
  cssClassName    = { fg   = c.red    },
  cssClassNameDot = { fg   = c.orange },
  cssDefinition   = { link = 'cssClassName' },
  cssHacks        = { fg   = c.fg     },
  cssTagName      = { fg   = c.red    },
  cssVendor       = { fg   = c.fg     },

  -- js
  javaScriptBraces   = { link = 'Delimiter' },
  javaScriptFunction = { fg = c.magenta     },

  -- Diagnostic
  DiagnosticError            = { fg = c.red                    },
  DiagnosticFloatingError    = { fg = c.red                    },
  DiagnosticFloatingHiting   = { fg = c.cyan                   },
  DiagnosticFloatingInfo     = { fg = c.blue                   },
  DiagnosticFloatingOk       = { fg = c.green                  },
  DiagnosticFloatingWarn     = { fg = c.yellow                 },
  DiagnosticHint             = { fg = c.cyan                   },
  DiagnosticInfo             = { fg = c.blue                   },
  DiagnosticOk               = { fg = c.green                  },
  DiagnosticSignError        = { fg = c.red                    },
  DiagnosticSignHint         = { fg = c.cyan                   },
  DiagnosticSignOk           = { fg = c.green                  },
  DiagnosticSignWarn         = { fg = c.yellow                 },
  DiagnosticUnnecessary      = { fg = c.comment, italic = true },
  DiagnosticVirtualTextError = { fg = c.red                    },
  DiagnosticVirtualTextHint  = { fg = c.cyan                   },
  DiagnosticVirtualTextInfo  = { fg = c.blue                   },
  DiagnosticVirtualTextOk    = { fg = c.green                  },
  DiagnosticVirtualTextWarn  = { fg = c.yellow                 },
  DiagnosticWarn             = { fg = c.yellow                 },

  -- Diff
  DiffAdd      = { fg = c.green },
  DiffChange   = { fg = c.blue  },
  DiffDelete   = { fg = c.red   },
  DiffText     = { fg = c.fg    },

  -- Float
  FoldColumn   = { bg = c.ac, fg = c.cyan },
  Folder       = { bg = c.ac, fg = c.cyan },

  -- Help
  healthHeadingChar   = { fg = c.fg  },
  helpHeader          = { fg = c.blue },
  helpSectionDelim    = { fg = c.blue },

  -- tree-sitter

  -- Text
  ['@text.literal']       = { link = 'Comment'         },
  ['@text.reference']     = { link = 'Identifier'      },
  ['@text.title']         = { link = 'Title'           },
  ['@text.uri']           = { link = 'Underlined'      },
  ['@text.underline']     = { link = 'Underlined'      },
  ['@text.todo']          = { link = 'Todo'            },

  -- Miscs
  ['@comment']            = { link = 'Comment'         },
  ['@punctuation']        = { link = 'Delimiter'       },

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

  -- Functions
  ['@function']           = { link = 'Function'        },
  ['@function.builtin']   = { link = 'Special'         },
  ['@function.macro']     = { link = 'Macro'           },
  ['@parameter']          = { link = 'Identifier'      },
  ['@method']             = { link = 'Function'        },
  ['@field']              = { link = 'Identifier'      },
  ['@property']           = { link = 'Identifier'      },
  ['@constructor']        = { link = 'Special'         },

  -- Keywords
  ['@conditional']        = { link = 'Conditional'     },
  ['@repeat']             = { link = 'Repeat'          },
  ['@label']              = { link = 'Label'           },
  ['@operator']           = { link = 'Operator'        },
  ['@keyword']            = { link = 'Keyword'         },
  ['@exception']          = { link = 'Exception'       },
  ['@variable']           = { fg   = nil, bg = nil     }, -- using default foreground reduces visual overloa,
  ['@type']               = { link = 'Type'            },
  ['@type.definition']    = { link = 'Typedef'         },
  ['@storageclass']       = { link = 'StorageClass'    },
  ['@namespace']          = { link = 'Identifier'      },
  ['@include']            = { link = 'Include'         },
  ['@preproc']            = { link = 'PreProc'         },
  ['@debug']              = { link = 'Debug'           },
  ['@tag']                = { link = 'Tag'             },

  -- Diff
  ['@diff.plus']          = { link = 'DiffAdd'         },
  ['@diff.delta']         = { link = 'DiffChange'      },
  ['@diff.minus']         = { link = 'DiffDelete'      },
 
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

------------------------------------------------------------
  -- Plugins
------------------------------------------------------------

  -- codium
  CodeiumAnnotation        = { fg = c.fg },
  CodeiumSuggestion        = { fg = c.fd },

  -- fzf-lua
  FzfLuaBorder             = { fg = c.fd },
  FzfLuaPreviewBorder      = { fg = c.fd },

  -- indent-line
  SnacksIndent             = { fg = c.ac  },
  SnacksIndentScope        = { fg = c.ac  },
  MiniIndentscopeSymbol    = { fg = c.ac  },
  MiniIndentscopeSymbolOff    = { fg = c.ac  },

  -- hop
  HopNextKey               = { fg = c.blue    },
  HopNextKey1              = { fg = c.red     },
  HopNextKey2              = { fg = c.orange  },
  HopNextKey3              = { fg = c.magenta },
  HopUnmatched             = { fg = c.fd      },

  -- lazy
  LazyNormal               = { bg = c.bd     },
  LazyProgressDone         = { fg = c.blue   },
  LazyProp                 = { bg = c.ac     },

  --markdown
  mkdCodeEnd               = { fg = c.fg      },
  mkdCodeStart             = { fg = c.fg      },
  mkdHeading               = { fg = c.red     },
  mkdInlineURL             = { fg = c.blue    },
  mkdLineBreak             = { link = 'NONE'  },
  mkdLink                  = { fg = c.blue    },
  mkdURL                   = { fg = c.magenta },

  -- mini-tabline
  TabLine                  = { fg = c.fd     },

  -- netrw
  netrwTreeBar = { fg = c.fg },

  -- which-key
  WhichKey                 = { fg = c.blue    },
  WhichKeyDesc             = { fg = c.fg      },
  WhichKeyFloat            = { bg = c.bd      },
  WhichKeyGroup            = { fg = c.magenta },
  WhichKeySeparator        = { fg = c.fg      },
}

-- Loop for colors
for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end

-- Spell
vim.cmd('hi SpellBad guisp=' .. c.red)
vim.cmd('hi SpellCap guisp=' .. c.blue)
vim.cmd('hi SpellRare guisp=' .. c.magenta)
vim.cmd('hi SpellLocal guisp=' .. c.cyan)
