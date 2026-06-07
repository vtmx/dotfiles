local c = {
  bg      = '#23272e',
  bl      = '#2c313c',
  fd      = '#5f6672',
  fg      = '#abb2bf',
  op      = '#88909c',
  sel     = '#3d4556',
  red     = '#e06c75',
  green   = '#98c379',
  yellow  = '#e5c07b',
  orange  = '#d19a66',
  blue    = '#61afef',
  bluel   = '#729fbc',
  magenta = '#c678dd',
  cyan    = '#56b6c2',
}

local hl_groups = {
  -- General
  Normal = { bg = c.bg, fg = c.fg },
  Comment = { fg = c.fd },
  Cursor = { bg = c.fg, fg = c.bg },
  CursorLine = { bg = c.bl },
  EndOfBuffer = { fg = c.bg },
  TermCursor = { link = 'Normal' },
  Title = { link = 'Normal' },
  Twilight = { link = 'Comment' },
  Visual = { bg = c.sel },

  -- Syntaxy
  Boolean = { link = 'Number' },
  Character = { link = 'String' },
  Conditional = { link = 'Statement' },
  Constant = { link = 'Normal' },
  Define = { link = 'Statement' },
  Exception = { link = 'Statement' },
  Float = { link = 'Number' },
  Function = { fg = c.blue },
  Identifier = { fg = c.red },
  Include = { link = 'Statement' },
  Keyword = { link = 'Statement' },
  Label = { link = 'Normal' },
  Macro = { link = 'Identifier'  },
  Number = { fg = c.orange },
  Operator = { link = 'Normal' },
  PreCondit = { link = 'Statement' },
  PreProc = { link = 'Normal' },
  Repeat = { link = 'Statement' },
  SpecialChar = { fg = c.orange },
  SpecialComment = { link = 'Comment' },
  SpecialKey = { fg = c.cyan },
  Special = { link = 'Normal' },
  Statement = { fg = c.magenta },
  StorageClass = { link = 'Normal' },
  String = { fg = c.green },
  Structure = { link = 'Normal' },
  Tag = { link = 'Identifier' },
  Typedef = { link = 'Statement' },
  Type = { link = 'Statement' },
  Underlined = { fg = c.fg, underline = true },

  -- Keys [] {} ()
  Delimiter = { link = 'Operator' },
  MatchParen = { fg = c.orange },

  -- Extras
  Added = { fg = c.green },
  Changed = { fg = c.blue },
  Debug = { fg = c.yellow },
  Directory = { fg = c.blue },
  FoldColumn = { bg = c.sel, fg = c.cyan },
  Folder = { fg = c.blue },
  NonText = { fg = c.fd },
  Removed = { fg = c.red },

  -- Line number column
  CursorLineFold = { link = 'Normal' },
  CursorLineNr = { link = 'Normal' },
  CursorLineSign = { link = 'Normal' },
  LineNr = { fg = c.sel },

  -- ColorColumn
  ColorColumn = { bg = c.bl },

  -- Search
  Conceal = { bg = c.sel },
  CurSearch = { bg = c.fg, fg = c.bg },
  IncSearch = { bg = c.sel },
  Search = { bg = c.sel },
  SnippetTabStop = { link = 'Normal' },

  -- Messages
  ErrorMsg = { fg = c.red },
  ModeMsg = { link = 'Normal' },
  MoreMsg = { link = 'Normal' },
  OkMsg = { fg = c.green },
  Question = { link = 'Normal' },
  WarningMsg = { fg = c.yellow },

  -- Alerts
  Ignore = { link = 'Normal' },
  Error = { fg = c.red },
  Todo = { fg = c.magenta },

  -- Pmenu
  Pmenuac = { bg = c.bl },
  Pmenu = { bg = c.bg },
  PmenuBorder = { link = 'Normal' },
  PmenuExtra = { link = 'Comment' },
  PmenuKind = { link = 'Comment' },
  PmenuMatch = { bg = c.bl },
  PmenuSbar = { bg = c.bg },
  PmenuSel = { bg = c.bl },
  PmenuThumb = { bg = c.fg },

  -- Popup
  NormalFloat = { bg = c.bg },
  FloatBorder = { bg = c.bg },
  FloatShadow = { bg = c.bg },
  FloatShadowThrough = { bg = c.bg },

  -- Tabbar
  Winbar = { link = 'Normal' },
  WinbarNC = { fg = c.fd },
  WinSeparator = { fg = c.sel },

  -- Line win separator split
  StatusLine = { link = 'Normal' },
  StatusLineNC = { link = 'Normal' },

  -- Spell
  SpellBad = { sp = c.red, undercurl = true },
  SpellCap = { sp = c.blue, undercurl = true },
  SpellRare = { sp = c.magenta, undercurl = true },
  SpellLocal = { sp = c.cyan, undercurl = true },

  -- Diagnostic
  DiagnosticError = { fg = c.red },
  DiagnosticFloatingError = { fg = c.red },
  DiagnosticFloatingHiting = { fg = c.cyan },
  DiagnosticFloatingInfo = { fg = c.blue },
  DiagnosticFloatingOk = { fg = c.green },
  DiagnosticFloatingWarn = { fg = c.yellow },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticOk = { fg = c.green },
  DiagnosticSignError = { fg = c.red },
  DiagnosticSignHint = { fg = c.cyan },
  DiagnosticSignOk = { fg = c.green },
  DiagnosticSignWarn = { fg = c.yellow },
  DiagnosticUnderlineError = { sp = c.red, undercurl = true },
  DiagnosticUnderlineHint = { sp = c.cyan, undercurl = true },
  DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
  DiagnosticUnderlineOk = { sp = c.green, undercurl = true },
  DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true },
  DiagnosticUnnecessary = { link = 'Normal' },
  DiagnosticVirtualTextError = { bg = '#39343a', fg = c.red },
  DiagnosticVirtualTextHint = { bg = '#2d333c', fg = c.cyan },
  DiagnosticVirtualTextInfo = { bg = '#303a46', fg = c.blue },
  DiagnosticVirtualTextOk = { bg = '#303a46', fg = c.green },
  DiagnosticVirtualTextWarn = { bg = '#3b3c3b', fg = c.yellow },
  DiagnosticWarn = { fg = c.yellow },
  QuickFixLine = { fg = c.cyan },

  -- Diff
  DiffAdd = { bg = '#283636' },
  DiffChange = { bg = '#3b3c3b' },
  DiffDelete = { bg = '#373138' },
  DiffText = { bg = '#1c3448', fg = 'NONE' },

  -- Redraw
  RedrawDebugClear = { link = 'DiffChange' },
  RedrawDebugComposed = { link = 'DiffAdd' },
  RedrawDebugRecompose = { link = 'DiffDelete' },

  -- Help
  healthHeadingChar = { link = 'Normal' },
  healthSectionDelim = { fg = c.blue },
  helpHeader = { fg = c.blue },
  helpSectionDelim = { fg = c.blue },

  -- Nvim
  NvimInternalError = { fg = c.red },

  -- awk
  autoitBuiltin = { fg = c.orange },
  autoitConst = { fg = c.orange },
  autoitFunction = { link = 'Function' },
  autoitIncluded = { link = 'String' },
  autoitInclude = { link = 'Include' },
  autoitNumber = { link = 'Number' },
  autoitParen = { link = 'Operator' },
  autoitQuote = { link = 'Operator' },
  autoitString = { link = 'String' },
  autoitStyle = { fg = c.orange },
  autoitVariable = { link = 'Identifier' },
  autoitVarSelector = { link = 'Identifier' },

  -- awk
  awkBrktRegExp = { link = 'Number' },
  awkFunction = { link = 'Function' },
  awkParen = { link = 'Operator' },
  awkPatterns = { link = 'Function' },
  awkSearch = { link = 'Normal' },
  awkStatement = { link = 'Function' },
  awkVariables = { link = 'Identifier' },

  -- c
  cBlock = { link = 'Operator' },
  cParen = { link = 'Operator' },

  -- css
  cssSelector = { link = 'Identifier' },
  cssProp = { fg = c.bluel },
  cssValue = { link = 'Normal' },

  cssAnimationProp = { link = 'cssProp' },
  cssAtKeyword = { link = 'cssSelector' },
  cssAtRule = { link = 'cssSelector' },
  cssAtRuleLogical = { link = 'cssValue' },
  cssAttrRegion = { link = 'cssValue' },
  cssAttributeSelector = { link = 'cssProp' },
  cssBackgroundAttr = { link = 'cssValue' },
  cssBackgroundProp = { link = 'cssProp' },
  cssBorderAttr = { link = 'cssValue' },
  cssBorderProp = { link = 'cssProp' },
  cssBoxAttr = { link = 'cssValue' },
  cssBoxProp = { link = 'cssProp' },
  cssBraces = { link = 'Normal' },
  cssClassName = { link = 'cssSelector' },
  cssClassNameDot = { link = 'cssSelector' },
  cssColor = { link = 'cssValue' },
  cssColorProp = { link = 'cssProp' },
  cssCommonAttr = { link = 'cssValue' },
  cssCustomProp = { link = 'cssValue' },
  cssDefinition = { link = 'cssProp' },
  cssFlexibleBoxAttr = { link = 'cssValue' },
  cssFlexibleBoxProp = { link = 'cssProp' },
  cssFontAttr = { link = 'cssValue' },
  cssFontProp = { link = 'cssProp' },
  cssFunction = { link = 'cssValue' },
  cssFunctionComma = { link = 'Normal' },
  cssFunctionName = { link = 'cssValue' },
  cssGridProp = { link = 'cssProp' },
  cssIdentifier = { link = 'cssSelector' },
  cssKeyFrameProp = { link = 'cssProp' },
  cssListProp = { link = 'cssProp' },
  cssMediaProp = { link = 'cssProp' },
  cssNoise = { link = 'Operator' },
  cssPositioningAttr = { link = 'cssValue' },
  cssPositioningProp = { link = 'cssProp' },
  cssPseudoClass = { link = 'cssSelector' },
  cssPseudoClassId = { link = 'cssSelector' },
  cssTagName = { link = 'cssSelector' },
  cssTextAttr = { link = 'cssValue' },
  cssTextProp = { link = 'cssProp' },
  cssTransformProp = { link = 'cssProp' },
  cssTransitionProp = { link = 'cssProp' },
  cssUIAttr = { link = 'cssValue' },
  cssUIProp = { link = 'cssProp' },
  cssUnitDecorators = { link = 'cssValue' },
  cssValueLength = { link = 'cssValue' },
  cssValueNumber = { link = 'cssValue' },
  cssVendor = { link = 'cssSelector' },

  -- django
  djangoFilter = { link = 'Normal' },
  djangoStatement = { link = 'Normal' },
  djangoTagBlock = { link = 'Normal' },
  djangoVarBlock = { link = 'Normal' },

  -- dosini
  dosiniHeader = { link = 'Identifier' },
  dosiniLabel = { link = 'Function' },
  dosiniValue = { link = 'Normal' },

  -- go
  goBlock = { link = 'Normal' },
  goImport = { link = 'Normal' },
  goPackage = { link = 'Normal' },
  goParen = { link = 'Operator' },
  goStatement = { link = 'Normal' },
  goType = { link = 'Normal' },

  -- html
  htmlArg = { link = 'Number' },
  htmlEndTag = { link = 'htmlTag' },
  htmlLink = { link = 'Normal' },
  htmlN = { link = 'Comment' },
  htmlSpecialTagName = { link = 'htmlTagName' },
  htmlTag = { link = 'Normal' },
  htmlTagName = { link = 'Identifier' },
  htmlTagN = { link = 'htmlTag' },
  htmlTitle = { link = 'Normal' },

  -- javascript
  javaScriptBraces = { link = 'Operator' },
  javaScriptException = { link = 'Normal' },
  javaScriptFunction = { link = 'Function' },
  javaScriptIdentifier = { link = 'Normal' },
  javaScriptOperator = { link = 'Normal' },
  javaScriptStatement = { link = 'Normal' },
  javaScriptType = { link = 'Normal' },

  -- json
  jsonBraces = { link = 'Operator' },
  jsonCommentError = { link = 'Comment' },
  jsonFold = { link = 'Normal' },
  jsonKeyword = { link = 'Identifier' },
  jsonKeywordMatch = { link = 'Normal' },
  jsonNoise = { link = 'Operator' },
  jsonQuote = { link = 'Operator' },
  jsonEscape = { link = 'Number' },

  -- kitty
  KittyAction = { link = 'Normal' },
  KittyAlt = { link = 'Normal' },
  KittyOptionName = { link = 'Normal' },
  KittyColor = { link = 'Number' },
  KittyCtrl = { link = 'Normal' },
  KittyKeybind = { link = 'Function' },
  KittyKeyword = { link = 'Definition' },
  KittyMap = { link = 'Keyword' },
  KittyMod = { link = 'Function' },
  KittySt = { link = 'String' },

  -- markdown
  markdownBlockquote = { link = 'Normal' },
  markdownCodeBlock = { link = 'Normal' },
  markdownCodeDelimiter = { fg = c.op },
  markdownH1 = { link = 'Normal' },
  markdownH1Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownH2 = { link = 'markdownH1' },
  markdownH2Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownH3 = { link = 'markdownH1' },
  markdownH3Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownH4 = { link = 'markdownH1' },
  markdownH4Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownH5 = { link = 'markdownH1' },
  markdownH5Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownH6 = { link = 'markdownH1' },
  markdownH6Delimiter = { link = 'markdownHeadingDelimiter' },
  markdownHeadingDelimiter = { fg = c.fd },
  markdownHeadingRule = { link = 'Normal' },
  markdownId = { link = 'Normal' },
  markdownLinkDelimiter = { fg = c.op },
  markdownLinkTextDelimiter = { fg = c.op },
  markdownListMarker = { link = 'Normal' },
  markdownRule = { link = 'Normal' },
  markdownUrl = { link = 'Normal' },

  -- php
  phpDefine = { link = 'Normal' },
  phpMemberSelector = { link = 'Normal' },
  phpVarSelector = { link = 'Identifier' },

  -- sh
  shArithRegion = { link = 'Normal' },
  shCmdSubRegion = { link = 'Normal' },
  shConditional = { link = 'Conditional' },
  shDefref = { link = 'Identifier' },
  shDerefOp = { link = 'Normal' },
  shDerefSimple = { link = 'shDefref' },
  shDerefVarArray = { link = 'Normal' },
  shDerefVar = { link = 'shVariable' },
  shFunctionExpr = { link = 'Function' },
  shIf = { link = 'Normal' },
  shLoop = { link = 'shConditional' },
  shForPP = { link = 'Normal' },
  shOption = { link = 'Normal' },
  shSetList = { link = 'Normal' },
  shSnglCase = { link = 'Normal' },
  shQuote = { link = 'String' },
  shStatement = { link = 'Function' },
  shCommandSub = { link = 'Function' },
  shSet = { link = 'Function' },
  shTestOpr = { link = 'Normal' },
  shTestPattern = { link = 'Normal' },
  shVarAssign = { link = 'Normal' },
  shVariable = { link = 'Identifier' },

  -- str
  srtNumber = { link = 'Function' },
  srtTime = { fg = c.op },

  -- toml
  tomlDate = { link = 'Number' },
  tomlKey = { link = 'Normal' },
  tomlTable = { link = 'Function' },

  -- ubo
  uboSeparator = { link = 'Number' },

  -- vim
  vimAutoEvent = { link = 'Normal' },
  vimCommand = { link = 'Normal' },
  vimFunction = { link = 'Normal' },
  vimFunctionName = { link = 'Function' },
  vimMap = { link = 'Function' },
  vimVarScope = { link = 'Normal' },

  -- xml
  xmlTag = { link = 'htmlTag' },
  xmlTagName = { link = 'htmlTagName' },
  xmlAttrib = { link = 'htmlArg' },
  xmlEqual = { link = 'htmlTag' },

  -- tree-sitter
  ['@attribute.builtin'] = { link = 'Special' },
  ['@attribute'] = { link = 'Macro' },
  ['@boolean'] = { link = 'Boolean' },
  ['@character'] = { link = 'Character' },
  ['@character.special'] = { link = 'SpecialChar' },
  ['@comment'] = { link = 'Comment' },
  ['@comment.todo'] = { link = 'Todo' },
  ['@conditional'] = { link = 'Conditional' },
  ['@constant.builtin'] = { link = 'Special' },
  ['@constant'] = { link = 'Constant' },
  ['@constant.macro'] = { link = 'Define' },
  ['@constructor'] = { link = 'Special' },
  ['@debug'] = { link = 'Debug' },
  ['@define'] = { link = 'Define' },
  ['@exception'] = { link = 'Exception' },
  ['@field'] = { link = 'Identifier' },
  ['@float'] = { link = 'Float' },
  ['@function.builtin'] = { link = 'Special' },
  ['@function.call'] = { link = 'Function' },
  ['@function'] = { link = 'Function' },
  ['@function.macro'] = { link = 'Macro' },
  ['@function.method'] = { link = 'Function' },
  ['@include'] = { link = 'Include' },
  ['@keyword.conditional'] = { link = 'Conditional' },
  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.repeat'] = { link = 'Repeat' },
  ['@keyword.type'] = { link = 'Type' },
  ['@label'] = { link = 'Label' },
  ['@macro'] = { link = 'Macro' },
  ['@method'] = { link = 'Function' },
  ['@namespace'] = { link = 'Identifier' },
  ['@number'] = { link = 'Number' },
  ['@operator'] = { link = 'Operator' },
  ['@parameter'] = { link = 'Identifier' },
  ['@preproc'] = { link = 'PreProc' },
  ['@property'] = { link = 'Identifier' },
  ['@punctuation'] = { link = 'Delimiter' },
  ['@repeat'] = { link = 'Repeat' },
  ['@spell'] = { link = 'Comment' },
  ['@storageclass'] = { link = 'StorageClass' },
  ['@string.escape'] = { link = 'SpecialChar' },
  ['@string'] = { link = 'String' },
  ['@string.special'] = { link = 'SpecialChar' },
  ['@string.special.url'] = { link = 'SpecialChar' },
  ['@tag.attribute'] = { link = 'Number' },
  ['@tag.builtin'] = { link = 'Tag' },
  ['@tag.delimiter'] = { fg = c.op },
  ['@tag'] = { link = 'Tag' },
  ['@type.definition'] = { link = 'Typedef' },
  ['@type'] = { link = 'Type' },
  ['@variable'] = { link = 'Normal' },
  ['@variable.member'] = { link = 'Identifier' },
  ['@variable.parameter.builtin'] = { link = 'Special' },
  ['@variable.parameter'] = { link = 'Identifier' },

  -- Diff
  ['@diff.plus'] = { link = 'DiffAdd' },
  ['@diff.delta'] = { link = 'DiffChange' },
  ['@diff.minus'] = { link = 'DiffDelete' },

  -- lsp
  ['@lsp.type.class'] = { link = 'Structure' },
  ['@lsp.type.comment'] = { link = 'Comment' },
  ['@lsp.type.decorator'] = { link = 'Function' },
  ['@lsp.type.enum'] = { link = 'Structure' },
  ['@lsp.type.enumMember'] = { link = 'Constant' },
  ['@lsp.type.function'] = { link = 'Function' },
  ['@lsp.type.interface'] = { link = 'Structure' },
  ['@lsp.type.macro'] = { link = 'Macro' },
  ['@lsp.type.method'] = { link = 'Function' },
  ['@lsp.type.namespace'] = { link = 'Structure' },
  ['@lsp.type.parameter'] = { link = 'Identifier' },
  ['@lsp.type.property'] = { link = 'Identifier' },
  ['@lsp.type.struct'] = { link = 'Structure' },
  ['@lsp.type.type'] = { link = 'Type' },
  ['@lsp.type.typeParameter'] = { link = 'Normal' },
  ['@lsp.type.variable'] = { link = 'Variable' },

  -- Text
  ['@text.literal'] = { link = 'Comment' },
  ['@text.reference'] = { link = 'Identifier' },
  ['@text.title'] = { link = 'Title' },
  ['@text.todo'] = { link = 'Todo' },
  ['@text.underline'] = { link = 'Underlined' },
  ['@text.uri'] = { fg = c.blue, underline = true },

  -- Languages

  -- bash
  ['@character.special.bash'] = { link = 'Normal' },
  ['@constant.bash'] = { link = 'Normal' },
  ['@function.bash'] = { link = 'Function' },
  ['@function.builtin.bash'] = { link = 'Function' },
  ['@function.call.bash'] = { link = 'Function' },
  ['@keyword.bash'] = { link = 'Keyword' },
  ['@keyword.directive.bash'] = { link = 'Comment' },
  ['@keyword.function.bash'] = { link = 'Keyword' },
  ['@keyword.conditional.bash'] = { link = 'shConditional' },
  ['@punctuation.special.bash'] = { link = 'Normal' },
  ['@string.regexp.bash'] = { link = 'Normal' },
  ['@string.special.path.bash'] = { link = 'Normal' },
  ['@variable.bash'] = { link = 'Identifier' },
  ['@variable.builtin.bash'] = { link = 'Identifier' },
  ['@variable.parameter.bash'] = { link = 'Normal' },

  -- c
  ['@type.builtin.c'] = { fg = c.red },

  -- css
  ['@attribute.css'] = { link = 'cssSelector' },
  ['@character.special.css'] = { link = 'cssBraces' },
  ['@conditional.css'] = { link = 'cssValue' },
  ['@constant.css'] = { link = 'cssValue' },
  ['@function.css'] = { link = 'cssValue' },
  ['@identifier.css'] = { link = 'cssSelector' },
  ['@keyword.css'] = { link = 'cssBraces' },
  ['@keyword.directive.css'] = { link = 'cssSelector' },
  ['@keyword.operator.css'] = { link = 'cssBraces' },
  ['@number.css'] = { link = 'cssValue' },
  ['@number.float.css'] = { link = 'cssValue' },
  ['@property.css'] = { link = 'cssProp' },
  ['@punctuation.bracket.css'] = { link = 'cssBraces' },
  ['@punctuation.delimiter.css'] = { link = 'cssNoise' },
  ['@selector.css'] = { link = 'cssSelector' },
  ['@tag.attribute.css'] = { link = 'cssSelector' },
  ['@tag.css'] = { link = 'cssSelector' },
  ['@type.css'] = { link = 'cssSelector' },
  ['@value.css'] = { link = 'cssValue' },

  -- go
  ['@string.escape.go'] = { link = 'String' },
  ['@function.method.call.go'] = { link = 'Normal' },

  -- html
  ['@constant.html'] = { link = 'Comment' },
  ['@none.html'] = { link = 'Normal' },
  ['@operator.html'] = { link = 'htmlTag' },
  ['@spell.html'] = { link = 'Normal' },
  ['@string.special.url.html'] = { link = 'htmlString' },
  ['@tag.attribute.html'] = { link = 'htmlArg' },
  ['@tag.delimiter.html'] = { link = 'htmlTag' },
  ['@tag.html'] = { link = 'htmlTagName' },

  -- javascript
  ['@function.method.javascript'] = { link = 'javaScriptFunction' },
  ['@function.method.call.javascript'] = { link = 'Normal' },
  ['@keyword.exception.javascript'] = { link = 'Normal' },
  ['@keyword.function.javascript'] = { link = 'Normal' },
  ['@keyword.operator.javascript'] = { link = 'Normal' },
  ['@type.javascript'] = { link = 'Normal' },
  ['@variable.javascript'] = { link = 'Normal' },
  ['@variable.member.javascript'] = { link = 'Normal' },
  ['@variable.parameter.javascript'] = { link = 'Normal' },

  -- json
  ['@conceal.json'] = { link = 'jsonQuote' },
  ['@property.json'] = { link = 'jsonKeyword' },

  -- lua
  ['@constructor.lua'] = { link = 'Normal' },
  ['@function.call.lua'] = { link = 'Function' },
  ['@keyword.function.lua'] = { link = 'Conditional' },
  ['@keyword.lua'] = { link = 'Keyword' },
  ['@keyword.return.lua'] = { link = 'Conditional' },
  ['@lsp.type.parameter.lua'] = { link = 'Normal' },
  ['@lsp.type.property.lua'] = { link = 'Normal' },
  ['@property.lua'] = { link = 'Normal' },
  ['@punctuation.delimiter.lua'] = { link = 'Operator' },
  ['@string.escape.lua'] = { link = 'String' },
  ['@variable.member.lua'] = { link = 'Normal' },
  ['@variable.parameter.lua'] = { link = 'Normal' },

  -- markdown
  ['@label.markdown'] = { fg = c.op },
  ['@markup.heading.1.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading.2.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading.3.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading.4.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading.5.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading.6.markdown'] = { link = 'markdownH1Delimiter' },
  ['@markup.heading'] = { link = 'Normal' },
  ['@markup.link.label'] = { link = 'Normal' },
  ['@markup.link'] = { link = 'Identifier' },
  ['@markup.link.markdown_inline'] = { fg = c.op },
  ['@markup.link.url'] = { link = 'Underlined' },
  ['@markup.link.url.markdown_inline'] = { link = 'Normal' },
  ['@markup.list.markdown'] = { link = 'Normal' },
  ['@markup.raw'] = { link = 'Normal' },
  ['@markup.raw.block.markdown'] = { link = 'Normal' },
  ['@markup.underline'] = { link = 'Normal' },
  ['@nospell.markdown_inline'] = { link = 'Normal' },
  ['@spell.markdown'] = { link = 'Normal' },

  -- python
  ['@variable.member.python'] = { link = 'Normal' },

  -- query
  ['@document.query'] = { link = 'Function' },
  ['@nospell.query'] = { link = 'Comment' },
  ['@punctuation.special.query'] = { link = 'Operator' },
  ['@spell.query'] = { link = 'Comment' },
  ['@type.query'] = { link = 'Identifier' },
  ['@variable.member.query'] = { link = 'Normal' },
  ['@variable.query'] = { link = 'Normal' },

  -- vim
  -- ['@keyword.vim'] = { link = 'Normal' },

  -- vimdoc
  ['@comment.note.vimdoc'] = { link = 'Normal' },
  ['@label.vimdoc'] = { link = 'Keyword' },
  ['@markup.link.vimdoc'] = { link = 'Function' },
  ['@string.special.vimdoc'] = { link = 'Function' },
  ['@string.special.url.vimdoc'] = { link = 'Function' },
  ['@markup.raw.block.vimdoc'] = { link = 'Normal' },
  ['@markup.raw.vimdoc'] = { link = 'Normal' },
  ['@variable.parameter.vimdoc'] = { link = 'Number' },

  -- toml
  ['@key.toml'] = { link = 'tomlTable' },
  ['@number.float.toml'] = { link = 'tomlDate' },
  ['@property.toml'] = { link = 'tomlKey' },
  ['@punctuation.delimiter.toml'] = { link = 'tomlKey' },
  ['@string.number.float.toml'] = { link = 'tomlDate' },
  ['@string.special.toml'] = { link = 'tomlDate' },

  -- sxhkd
  ['@variable.sxhkdrc'] = { link = 'Number' },

  -- tera
  ['@keyword.tera'] = { link = 'Identifier' },
  ['@variable.member.tera'] = { link = 'Normal' },

  -- v
  ['@keyword.type.v'] = { link = 'Keyword' },
  ['@module.v'] = { link = 'String' },
  ['@type.v'] = { link = 'Macro' },
  ['@variable.builtin.v'] = { link = 'Number' },
  ['@variable.member.v'] = { link = 'Normal' },

  -- vim
  ['@function.macro.vim'] = { link = 'Normal' },

  ------------------------------------------------------------
  -- Plugins
  ------------------------------------------------------------

  -- codium
  CodeiumAnnotation = { link = 'Normal' },
  CodeiumSuggestion = { fg = c.fd },

  -- mason
  MasonHeader = { link = 'Normal' },
  MasonMutedBlock = { bg = '#88909c', fg = c.bg },
  MasonBackdrop = { bg = c.bg, blend = 100 },

  -- mini-cursorword
  MiniCursorword = { fg = c.yellow },
  MiniCursorwordCurrent = { fg = c.yellow },

  -- mini-files
  MiniFilesTitle = { fg = c.fd },
  MiniFilesTitleFocused = { link = 'Normal' },

  -- mini-jump2d
  MiniJump2dDim = { link = 'Comment' },
  MiniJump2dSpotAhead = { fg = c.yellow },
  MiniJump2dSpot = { fg = c.red },
  MiniJump2dSpotUnique = { fg = c.red },

  -- mini-statusline
  MiniStatuslineRecording = { fg = c.red },

  -- netrw
  netrwTreeBar = { link = 'Normal' },

  -- snacks
  SnacksBackdrop = { bg = c.bg, blend = 100 },
  SnacksIndent = { fg = c.sel },
  SnacksIndentScope = { link = 'SnacksIndent' },
  SnacksPickerCursorLine = { link = 'Normal' },
  SnacksPickerDir = { link = 'Normal' },
}

-- Clear colors
vim.cmd.hi('clear')

-- Reset syntax
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

-- Set colors
for name, val in pairs(hl_groups) do
  vim.api.nvim_set_hl(0, name, val)
end

-- Load colorscheme
vim.g.colors_name = 'onedarkv'
vim.opt.termguicolors = true
