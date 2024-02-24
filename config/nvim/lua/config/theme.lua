local c = require('config.colors')

local hl_groups = {
  -- General
  Normal         = { fg = c.fg, ctermfg = 250, ctermbg = 234 },
  Comment        = { fg = c.fgd, ctermfg = 7, italic = true },
  Title          = { fg = c.purple  },
  Twilight       = { fg = c.fgd },

  -- Sintaxy
  Boolean        = { fg = c.orange },
  Character      = { fg = c.green  },
  Conditional    = { fg = c.purple },
  Constant       = { fg = c.orange },
  Define         = { fg = c.purple },
  ErrorMsg       = { fg = c.red    },
  Exception      = { fg = c.purple },
  Float          = { fg = c.orange },
  Function       = { fg = c.blue   },
  Identifier     = { fg = c.red    },
  Include        = { fg = c.purple },
  Keyword        = { fg = c.purple },
  Label          = { fg = c.red    },
  Macro          = { fg = c.red    },
  Number         = { fg = c.orange },
  Operator       = { fg = c.cyan   },
  PreCondit      = { fg = c.purple },
  PreProc        = { fg = c.purple },
  Repeat         = { fg = c.purple },
  Tag            = { fg = c.green  },
  Statement      = { fg = c.purple },
  String         = { fg = c.green  },

  -- Keys [] {} ()
  Type           = { fg = c.purple },
  Typedef        = { fg = c.purple },
  StorageClass   = { fg = c.purple },
  Structure      = { fg = c.purple },

  -- Extras
  Debug          = { fg = c.yellow  },
  Directory      = { fg = c.blue    },
  EndOfBuffer    = { fg = c.fgd     },
  NonText        = { fg = c.fgd     },
  Special        = { fg = c.blue    },
  SpecialChar    = { fg = c.yellow  },
  SpecialComment = { fg = c.fgd     },
  SpecialKey     = { fg = c.cyan    },
  TermCursor     = { fg = c.fg      },

  -- Float popup
  NormalFloat        = { bg = c.bg },
  FloatBorder        = { bg = c.bg, fg = c.fgd },
  FloatShadow        = { bg = c.bgd },
  FloatShadowThrough = { bg = c.bgd },

  -- Search
  Delimiter      = { fg = c.purple },
  IncSearch      = { bg = c.sel    },
  MatchParen     = { fg = c.yellow },
  Search         = { bg = c.sel    },
  CurSearch      = { bg = c.sel    },
  Conceal        = { bg = c.sel    },

  -- Messages
  ModeMsg        = { fg = c.fgd     },
  MoreMsg        = { fg = c.fgd     },
  Question       = { fg = c.fg      },
  WarningMsg     = { fg = c.yellow  },

  -- Alerts
  Ignore         = { fg = c.fg      },
  Error          = { fg = c.red     },
  Todo           = { fg = c.purple  },

  -- Line tilde blank
  EndOfBuffer    = { fg = c.bg },

  -- Line highlight
  CursorLine     = { bg = c.bgl },

  -- Select text
  Visual         = { bg = c.sel },

  -- Line number column
  CursorLineFold = { fg = c.fg  },
  CursorLineNr   = { fg = c.fg  },
  CursorLineSign = { fg = c.fg  },
  LineNr         = { fg = c.sel },
  LineNrAbove    = { fg = c.sel },
  LineNrBelow    = { fg = c.sel },

  -- Pmenu
  Pmenu          = { bg = c.bgd },
  PmenuSbar      = { bg = c.bgd },
  PmenuSel       = { bg = c.bgl },
  PmenuThumb     = { bg = c.bgl },

  -- Pmenu coc
  CocFloating       = { bg = c.bgd  },
  CocFloatSbar      = { bg = c.bgd  },
  CocFloatThumb     = { bg = c.bgl  },
  CocMenuSel        = { bg = c.bgl  },
  CocPumDetail      = { fg = c.fgd  },
  CocPumMenu        = { bg = c.bgd  },
  CocPumShortcut    = { fg = c.fgd  },
  CocPumVirtualText = { fg = c.fgd  },
  CocSearch         = { fg = c.blue },

  -- Tab bar
  WinbarNC          = { fg = c.fgd },

  -- Line win separator split
  StatusLine        = { bg = 'NONE' },
  StatusLineNC      = { fg = c.fg   },
  WinSeparator      = { fg = c.sel  },

  --Diff
  DiffAdd           = { fg = c.fgd },
  DiffDelete        = { fg = c.fgd },
  DiffChange        = { fg = c.fgd },
  DiffText          = { fg = c.fgd },

  -- Languages

  -- html
  htmlArg            = { fg = c.yellow }, -- attr
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
  markdownBlockquote       = { fg = c.fg     },
  markdownCodeDelimiter    = { fg = c.fg     },
  markdownId               = { fg = c.purple },
  markdownH1               = { fg = c.purple },
  markdownH2               = { fg = c.purple },
  markdownH3               = { fg = c.purple },
  markdownH4               = { fg = c.purple },
  markdownH5               = { fg = c.purple },
  markdownH6               = { fg = c.purple },
  markdownHeadingDelimiter = { fg = c.purple },
  markdownHeadingRule      = { fg = c.purple },
  markdownListMarker       = { fg = c.yellow },
  markdownRule             = { fg = c.purple },
  markdownUrl              = { fg = c.fg     },

  -- css
  cssClassNameDot = { fg = c.orange },
  cssClassName    = { fg = c.orange },
  cssHacks        = { fg = c.fg     },
  cssTagName      = { fg = c.red    },
  cssVendor       = { fg = c.fg     },

  -- Diagnostic
  DiagnosticError            = { fg = c.red },
  DiagnosticFloatingError    = { fg = c.red },
  DiagnosticFloatingHiting   = { fg = c.cyan },
  DiagnosticFloatingInfo     = { fg = c.blue },
  DiagnosticFloatingOk       = { fg = c.green },
  DiagnosticFloatingWarn     = { fg = c.yellow },
  DiagnosticHint             = { fg = c.cyan },
  DiagnosticInfo             = { fg = c.blue },
  DiagnosticOk               = { fg = c.green },
  DiagnosticSignError        = { fg = c.red },
  DiagnosticSignHint         = { fg = c.cyan },
  DiagnosticSignOk           = { fg = c.green },
  DiagnosticSignWarn         = { fg = c.yellow },
  DiagnosticUnnecessary      = { fg = c.comment, italic = true },
  DiagnosticVirtualTextError = { fg = c.red },
  DiagnosticVirtualTextHint  = { fg = c.cyan },
  DiagnosticVirtualTextInfo  = { fg = c.blue },
  DiagnosticVirtualTextOk    = { fg = c.green },
  DiagnosticVirtualTextWarn  = { fg = c.yellow },
  DiagnosticWarn             = { fg = c.yellow },

  -- Diff
  DiffAdd      = { fg = c.green },
  DiffChange   = { fg = c.blue },
  DiffDelete   = { fg = c.red },
  DiffText     = { fg = c.fg },

  -- Float
  FoldColumn   = { bg = c.sel, fg = c.cyan },
  Folder       = { bg = c.sel, fg = c.cyan },

  -- I dont know
  ColorColumn  = { bg = c.red, fg = c.bg },
  CursorColumn = { fg = c.sel },

  -- Tree-sitter

  -- - Text
  ['@text.literal']      = { link = 'Comment' },
  ['@text.reference']    = { link = 'Identifier' },
  ['@text.title']        = { link = 'Title' },
  ['@text.uri']          = { link = 'Underlined' },
  ['@text.underline']    = { link = 'Underlined' },
  ['@text.todo']         = { link = 'Todo' },

  -- - Miscs
  ['@comment']           = { link = 'Comment' },
  ['@punctuation']       = { link = 'Delimiter' },

  -- - Constants
  ['@constant']          = { link = 'Constant' },
  ['@constant.builtin']  = { link = 'Special' },
  ['@constant.macro']    = { link = 'Define' },
  ['@define']            = { link = 'Define' },
  ['@macro']             = { link = 'Macro' },
  ['@string']            = { link = 'String' },
  ['@string.escape']     = { link = 'SpecialChar' },
  ['@string.special']    = { link = 'SpecialChar' },
  ['@character']         = { link = 'Character' },
  ['@character.special'] = { link = 'SpecialChar' },
  ['@number']            = { link = 'Number' },
  ['@boolean']           = { link = 'Boolean' },
  ['@float']             = { link = 'Float' },

  -- - Functions
  ['@function']          = { link = 'Function' },
  ['@function.builtin']  = { link = 'Special' },
  ['@function.macro']    = { link = 'Macro' },
  ['@parameter']         = { link = 'Identifier' },
  ['@method']            = { link = 'Function' },
  ['@field']             = { link = 'Identifier' },
  ['@property']          = { link = 'Identifier' },
  ['@constructor']       = { link = 'Special' },

  -- - Keywords
  ['@conditional']       = { link = 'Conditional' },
  ['@repeat']            = { link = 'Repeat' },
  ['@label']             = { link = 'Label' },
  ['@operator']          = { link = 'Operator' },
  ['@keyword']           = { link = 'Keyword' },
  ['@exception']         = { link = 'Exception' },
  ['@variable']          = { fg   = nil, bg = nil }, -- using default foreground reduces visual overloa,
  ['@type']              = { link = 'Type' },
  ['@type.definition']   = { link = 'Typedef' },
  ['@storageclass']      = { link = 'StorageClass' },
  ['@namespace']         = { link = 'Identifier' },
  ['@include']           = { link = 'Include' },
  ['@preproc']           = { link = 'PreProc' },
  ['@debug']             = { link = 'Debug' },
  ['@tag']               = { link = 'Tag' },

  -- - LSP semantic tokens
  ['@lsp.type.class']         = { link = 'Structure' },
  ['@lsp.type.comment']       = { link = 'Comment' },
  ['@lsp.type.decorator']     = { link = 'Function' },
  ['@lsp.type.enum']          = { link = 'Structure' },
  ['@lsp.type.enumMember']    = { link = 'Constant' },
  ['@lsp.type.function']      = { link = 'Function' },
  ['@lsp.type.interface']     = { link = 'Structure' },
  ['@lsp.type.macro']         = { link = 'Macro' },
  ['@lsp.type.method']        = { link = 'Function' },
  ['@lsp.type.namespace']     = { link = 'Structure' },
  ['@lsp.type.parameter']     = { link = 'Identifier' },
  ['@lsp.type.property']      = { link = 'Identifier' },
  ['@lsp.type.struct']        = { link = 'Structure' },
  ['@lsp.type.type']          = { link = 'Type' },
  ['@lsp.type.typeParameter'] = { link = 'TypeDef' },
  ['@lsp.type.variable']      = { link = '@variable' }, -- links to tree-sitter group to reduce overloa,

------------------------------------------------------------
  -- Plugins
------------------------------------------------------------

  -- netrw
  netrwTreeBar = { fg = c.fg },

  -- codium
  CodiumAnnotation = { fg = c.fg },
  CodiumSuggestion = { fg = c.fgd },

  -- indent-line
  IblIndent = { fg = c.sel  },
  IblScope =  { fg = c.red, bg = c.blue  },

  -- bufferline
  BufferLineCloseButtonVisible = { bg = 'NONE' },
  BufferLineIndicatorVisible   = { bg = 'NONE' },
  BufferLineModified           = { bg = 'NONE' },

  -- hop
  HopNextKey               = { fg = c.red    },
  HopNextKey1              = { fg = c.blue   },
  HopNextKey2              = { fg = c.orange },
  HopNextKey3              = { fg = c.purple },
  HopUnmatched             = { fg = c.fgd    },

  -- lazy
  LazyNormal               = { bg = c.bgd },
  LazyProp                 = { bg = c.sel },

  -- nvim-tree
  NvimTreeCursorLine       = { bg = c.bgl },
  NvimTreeFolder           = { fg = c.fg  },
  NvimTreeFolderIcon       = { fg = c.fg  },
  NvimTreeFolderName       = { fg = c.fg  },
  NvimTreeEmptyFolderName  = { fg = c.fg  },
  NvimTreeOpenedFolderName = { fg = c.fg  },
  NvimTreeNormal           = { bg = c.bg  },
  NvimTreeNormalNC         = { bg = c.bg  },
  NvimTreeRootFolder       = { fg = c.fg  },
  NvimTreeOpenedFile       = { fg = c.fg  },
  NvimTreeVertSplit        = { fg = c.sel },
  NvimTreeWindowPicker     = { fg = c.fg  },

  -- mini-jump
  MiniJump                 = { fg = c.red  },

  -- telescope
  TelescopeMultiSelection  = { fg = c.fg   },
  TelescopeMultiIcon       = { fg = c.fg   },
  TelescopeNormal          = { fg = c.fg   },
  TelescopePreviewNormal   = { fg = c.fg   },
  TelescopePromptNormal    = { fg = c.fg   },
  TelescopeResultsNormal   = { fg = c.fg   },
  TelescopePromptBorder    = { fg = c.fgd  },
  TelescopeResultsBorder   = { fg = c.fgd  },
  TelescopePreviewBorder   = { fg = c.fgd  },
  TelescopeSelection       = { bg = c.bgl  },
  TelescopeSelectionCaret  = { fg = c.fg, bg = c.bgl },
  TelescopeTitle           = { fg = c.fg   },
  TelescopePromptTitle     = { fg = c.fg   },
  TelescopeResultsTitle    = { fg = c.fg   },
  TelescopePreviewTitle    = { fg = c.fg   },
  TelescopePromptCounter   = { fg = c.fgd  },
  TelescopeMatching        = { fg = c.blue },
  TelescopePromptPrefix    = { fg = c.fg   },

  -- which-key
  WhichKey                 = { fg = c.blue   },
  WhichKeyDesc             = { fg = c.fg     },
  WhichKeyFloat            = { bg = c.bgd    },
  WhichKeyGroup            = { fg = c.purple },
  WhichKeySeparator        = { fg = c.fg     },
}

-- Loop for colors
for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end

-- Spell
vim.cmd('highlight SpellBad guisp=' .. c.red)
vim.cmd('highlight SpellCap guisp=' .. c.blue)
vim.cmd('highlight SpellRare guisp=' .. c.purple)
vim.cmd('highlight SpellLocal guisp=' .. c.cyan)

