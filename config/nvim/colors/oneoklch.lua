
local c = {
	bg      = '#22272e', -- oklch(0.27 0.015 260)
	bl      = '#2d333d', -- oklch(0.3 0.02 260)
	fd      = '#768193', -- oklch(0.6 0.03 260)
	fg      = '#b8bec8', -- oklch(0.8 0.015 260)
	sel     = '#384863', -- oklch(0.35 0.02 260)
	nr      = '#3e4858', -- oklch(0.4 0.03 260)
	red     = '#e06c75',
	green   = '#98c379',
	yellow  = '#e6c85b',
	orange  = '#d19a66',
	blue    = '#61afef',
	bluel   = '#84a0c6',
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
	TermCursor = { fg = c.fg },
	Title = { link = 'Normal' },
	Twilight = { link = 'Comment' },
	Visual = { bg = c.sel },

	-- Syntaxy
	Boolean = { fg = c.orange },
	Character = { fg = c.green },
	Conditional = { fg = c.magenta },
	Constant = { fg = c.fg },
	Define = { fg = c.magenta },
	ErrorMsg = { fg = c.red },
	Exception = { fg = c.magenta },
	Float = { fg = c.magenta },
	Function = { fg = c.blue },
	Identifier = { fg = c.red },
	Include = { fg = c.magenta },
	Keyword = { fg = c.fg },
	Label = { fg = c.fg },
	Macro = { fg = c.fg },
	Number = { fg = c.orange },
	Operator = { fg = '#88909c' },
	PreCondit = { fg = c.magenta },
	PreProc = { fg = c.fg },
	Repeat = { fg = c.magenta },
	Statement = { fg = c.magenta },
	StorageClass = { fg = c.fg },
	String = { fg = c.green },
	Structure = { fg = c.magenta },
	Tag = { fg = c.blue },
	Typedef = { fg = c.magenta },
	Type = { fg = c.magenta },
	Underlined = { fg = c.blue, underline = true },

	-- Keys [] {} ()
	Delimiter = { link = 'Operator' },
	MatchParen = { fg = c.yellow },

	-- Extras
	Added = { fg = c.green },
	Changed = { fg = c.blue },
	Debug = { fg = c.yellow },
	Directory = { fg = c.blue },
	NonText = { fg = c.fd },
	SpecialChar = { fg = c.orange },
	SpecialComment = { fg = c.fd },
	Special = { fg = c.fg },
	SpecialKey = { fg = c.cyan },

	-- Line number column
	CursorLineFold = { fg = c.fg },
	CursorLineNr = { fg = c.fg },
	CursorLineSign = { fg = c.fg },
	LineNr = { fg = c.nr },
	LineNrAbove = { fg = c.nr },
	LineNrBelow = { fg = c.nr },

	-- ColorColumn
	ColorColumn = { bg = c.bl },

	-- Search
	Conceal = { bg = c.sel },
	CurSearch = { bg = c.fg, fg = c.bg },
	IncSearch = { bg = c.sel },
	Search = { bg = c.sel },
	SnippetTabStop = { link = 'Normal' },

	-- Messages
	ModeMsg = { fg = c.fd },
	MoreMsg = { fg = c.fd },
	Question = { fg = c.fg },
	WarningMsg = { fg = c.yellow },

	-- Alerts
	Ignore = { fg = c.fg },
	Error = { fg = c.red },
	Todo = { fg = c.magenta },

	-- Pmenu
	Pmenuac = { bg = c.sel },
	Pmenu = { bg = c.bg },
	PmenuBorder = { fg = c.fg },
	PmenuExtra = { link = 'Comment' },
	PmenuKind = { link = 'Comment' },
	PmenuSbar = { bg = c.bg },
	PmenuSel = { bg = c.sel },
	PmenuThumb = { bg = c.fg },

	-- Popup
	NormalFloat = { bg = c.bg },
	FloatBorder = { bg = c.bg },
	FloatShadow = { bg = c.bg },
	FloatShadowThrough = { bg = c.bg },

	-- Tabbar
	Winbar = { fg = c.fg },
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
	DiagnosticUnnecessary = { link = 'Comment' },
	DiagnosticVirtualTextError = { fg = c.red },
	DiagnosticVirtualTextHint = { fg = c.cyan },
	DiagnosticVirtualTextInfo = { fg = c.blue },
	DiagnosticVirtualTextOk = { fg = c.green },
	DiagnosticVirtualTextWarn = { fg = c.yellow },
	DiagnosticWarn = { fg = c.yellow },
	QuickFixLine = { fg = c.cyan },

	-- Diff
	DiffAdd = { bg = '#31392b' },
	DiffChange = { bg = '#1c3448' },
	DiffDelete = { bg = '#382b2c' },
	DiffText = { bg = '#2c5372' },

	-- Float
	FoldColumn = { bg = c.sel, fg = c.cyan },
	Folder = { bg = c.sel, fg = c.cyan },

	-- Help
	healthHeadingChar = { fg = c.fg },
	healthSectionDelim = { fg = c.blue },
	helpHeader = { fg = c.blue },
	helpSectionDelim = { fg = c.blue },

	-- Nvim
	NvimInternalError = { fg = c.red },

	-- awk
	awkPatterns = { fg = c.magenta },
	awkVariables = { fg = c.red },

	-- css
	cssAtRule = { link = 'Function' },
	cssAttrRegion = { link = 'Normal' },
	cssBackgroundAttr = { link = 'Normal' },
	cssBorderAttr = { link = 'Normal' },
	cssBoxAttr = { link = 'Normal' },
	cssBraces = { link = 'Operator' },
	cssClassNameDot = { link = 'Function' },
	cssClassName = { link = 'Function' },
	cssColor = { link = 'Number' },
	cssCommonAttr = { link = 'Normal' },
	cssDefinition = { link = 'Definition' },
	cssFlexibleBoxAttr = { link = 'Normal' },
	cssFontAttr = { link = 'Normal' },
	cssFunction = { link = 'Function' },
	cssFunctionName = { link = 'Function' },
	cssIdentifier = { link = 'Function' },
	cssNoise = { link = 'cssBraces' },
	cssPositioningAttr = { link = 'Normal' },
	cssPseudoClassId = { link = 'Function' },
	cssTagName = { link = 'Function' },
	cssTextAttr = { link = 'Normal' },
	cssUIAttr = { link = 'Normal' },
	cssUnitDecorators = { link = 'Normal' },
	cssValueLength = { link = 'Normal' },
	cssVendor = { link = 'Normal' },

	-- dosini
	dosiniHeader = { link = 'Identifier' },
	dosiniLabel = { link = 'Function' },
	dosiniValue = { link = 'Normal' },

	-- go
	goBlock = { link = 'Operator' },
	goImport = { link = 'Normal' },
	goPackage = { link = 'Normal' },
	goParen = { link = 'Operator' },
	goStatement = { link = 'Normal' },
	goType = { link = 'Normal' },

	-- html
	djangoFilter = { link = 'Normal' },
	djangoStatement = { link = 'Normal' },
	djangoTagBlock = { link = 'Normal' },
	djangoVarBlock = { link = 'Normal' },
	htmlArg = { link = 'Normal' },
	htmlEndTag = { link = 'htmlTag' },
	htmlH1 = { link = 'Normal' },
	htmlH2 = { link = 'Normal' },
	htmlH3 = { link = 'Normal' },
	htmlH4 = { link = 'Normal' },
	htmlH5 = { link = 'Normal' },
	htmlH6 = { link = 'Normal' },
	htmlLink = { link = 'Normal' },
	htmlN = { link = 'Comment' },
	htmlSpecialTagName = { link = 'htmlTagName' },
	htmlTag = { link = 'Operator' },
	htmlTagName = { link = 'Function' },
	htmlTagN = { link = 'htmlTag' },
	htmlTitle = { link = 'Normal' },

	-- js
	javaScriptBraces = { link = 'Operator' },
	javaScriptOperator = { link = 'Normal' },
	javaScriptType = { link = 'Normal' },
	javaScriptStatement = { link = 'Normal' },
	javaScriptIdentifier = { link = 'Normal' },
	javaScriptFunction = { link = 'Function' },

	-- json
	jsonBraces = { link = 'Operator' },
	jsonFold = { link = 'Operator' },
	jsonKeyword = { link = 'Normal' },
	jsonKeywordMatch = { link = 'Operator' },
	jsonNoise = { link = 'Operator' },
	jsonQuote = { link = 'Operator' },
	jsonCommentError = { link = 'Comment' },

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
	markdownCodeDelimiter = { link = 'Normal' },
	markdownH1Delimiter = { link = 'Normal' },
	markdownH1 = { link = 'Normal' },
	markdownH2Delimiter = { link = 'Normal' },
	markdownH2 = { link = 'Normal' },
	markdownH3Delimiter = { link = 'Normal' },
	markdownH3 = { link = 'Normal' },
	markdownH4Delimiter = { link = 'Normal' },
	markdownH4 = { link = 'Normal' },
	markdownH5Delimiter = { link = 'Normal' },
	markdownH5 = { link = 'Normal' },
	markdownH6Delimiter = { link = 'Normal' },
	markdownH6 = { link = 'Normal' },
	markdownHeadingDelimiter = { link = 'Normal' },
	markdownHeadingRule = { link = 'Normal' },
	markdownId = { link = 'Normal' },
	markdownListMarker = { link = 'Normal' },
	markdownRule = { link = 'Normal' },
	markdownUrl = { link = 'Normal' },

	-- sh
	shArithRegion = { link = 'Operator' },
	shCmdSubRegion = { link = 'Operator' },
	shDeref = { link = 'Normal' },
	shDerefOp = { link = 'Normal' },
	shDerefSimple = { link = 'Normal' },
	shDerefVar = { link = 'Normal' },
	shDerefVarArray = { link = 'Normal' },
	shEcho = { link = 'Normal' },
	shLoop = { link = 'shConditional' },
	shQuote = { link = 'String' },
	shStatement = { link = 'Normal' },
	shTestOpr = { link = 'Normal' },
	shVarAssign = { link = 'Operator' },
	shVariable = { link = 'Normal' },

	-- toml
	tomlKey = { link = 'Normal' },
	tomlTable = { link = 'Function' },

	-- vim
	vimAutoEvent = { link = 'Normal' },
	vimCommand = { link = 'Normal' },
	vimFunction = { link = 'Normal' },
	vimFunctionName = { link = 'Function' },
	vimMap = { link = 'Function' },
	vimVarScope = { link = 'Normal' },

	-- tree-sitter

	-- Constants
	['@boolean'] = { link = 'Boolean' },
	['@character'] = { link = 'Character' },
	['@character.special'] = { link = 'SpecialChar' },
	['@constant.builtin'] = { link = 'Special' },
	['@constant'] = { link = 'Constant' },
	['@constant.macro'] = { link = 'Define' },
	['@define'] = { link = 'Define' },
	['@float'] = { link = 'Float' },
	['@macro'] = { link = 'Macro' },
	['@number'] = { link = 'Number' },
	['@string.escape'] = { link = 'SpecialChar' },
	['@string'] = { link = 'String' },
	['@string.special'] = { link = 'SpecialChar' },
	['@string.special.url'] = { link = 'SpecialChar' },

	-- Comments
	['@comment'] = { link = 'Comment' },
	['@comment.todo'] = { link = 'Todo' },
	['@punctuation'] = { link = 'Delimiter' },

	-- Diff
	['@diff.plus'] = { link = 'DiffAdd' },
	['@diff.delta'] = { link = 'DiffChange' },
	['@diff.minus'] = { link = 'DiffDelete' },

	-- Functions
	['@function'] = { link = 'Function' },
	['@function.builtin'] = { link = 'Special' },
	['@function.call'] = { link = 'Function' },
	['@function.macro'] = { link = 'Macro' },
	['@function.method'] = { link = 'Function' },
	['@parameter'] = { link = 'Identifier' },
	['@method'] = { link = 'Function' },
	['@field'] = { link = 'Identifier' },
	['@property'] = { link = 'Identifier' },
	['@constructor'] = { link = 'Special' },
	['@variable.parameter'] = { link = 'Identifier' },
	['@variable.parameter.builtin'] = { link = 'Special' },
	['@variable.member'] = { link = 'Identifier' },
	['@attribute'] = { link = 'Macro' },
	['@attribute.builtin'] = { link = 'Special' },

	-- Keywords
	['@conditional'] = { link = 'Conditional' },
	['@debug'] = { link = 'Debug' },
	['@exception'] = { link = 'Exception' },
	['@include'] = { link = 'Include' },
	['@keyword.conditional'] = { link = 'Conditional' },
	['@keyword'] = { link = 'Keyword' },
	['@keyword.repeat'] = { link = 'Repeat' },
	['@keyword.type'] = { link = 'Structure' },
	['@label'] = { link = 'Label' },
	['@namespace'] = { link = 'Identifier' },
	['@operator'] = { link = 'Operator' },
	['@preproc'] = { link = 'PreProc' },
	['@repeat'] = { link = 'Repeat' },
	['@storageclass'] = { link = 'StorageClass' },
	['@tag'] = { link = 'Tag' },
	['@tag.builtin'] = { link = 'Tag' },
	['@tag.attribute'] = { link = 'Number' },
	['@tag.delimiter'] = { link = 'Normal' },
	['@type.definition'] = { link = 'Typedef' },
	['@type'] = { link = 'Type' },
	['@variable'] = { link = 'Normal' },

	-- LSP semantic tokens
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
	['@lsp.type.typeParameter'] = { link = 'TypeDef' },
	['@lsp.type.variable'] = { link = 'Variable' },

	-- Text
	['@text.literal'] = { link = 'Comment' },
	['@text.reference'] = { link = 'Identifier' },
	['@text.title'] = { link = 'Title' },
	['@text.todo'] = { link = 'Todo' },
	['@text.underline'] = { link = 'Underlined' },
	['@text.uri'] = { link = 'Underlined' },

	-- Languages

	-- bash
	['@constant.bash'] = { link = 'Identifier' },
	['@function.builtin.bash'] = { link = 'Function' },
	['@function.call.bash'] = { link = 'Normal' },
	['@keyword.directive.bash'] = { link = 'Comment' },
	['@punctuation.special.bash'] = { link = 'Identifier' },
	['@string.regexp.bash'] = { link = 'Normal' },
	['@variable.bash'] = { link = 'Identifier' },
	['@variable.builtin.bash'] = { link = 'Identifier' },
	['@variable.parameter.bash'] = { link = 'Normal' },

	-- css
	['@function.css'] = { link = 'Normal' },
	['@property.css'] = { link = 'Normal' },
	['@selectors.css'] = { link = 'Function' },
	['@value.css'] = { fg = c.orange },

	-- go
	['@string.escape.go'] = { link = 'String' },
	['@function.method.call.go'] = { link = 'Normal' },

	-- html
	['@constant.html'] = { link = 'Comment' },
	['@string.special.url.html'] = { link = 'String' },
	['@tag.attribute.html'] = { link = 'Normal' },
	['@tag.delimiter.html'] = { link = 'Operator' },
	['@tag.html'] = { link = 'Function' },

  -- json
	['@property.json'] = { link = 'Normal' },

  -- js
	['@variable.member.javascript'] = { link = 'Normal' },

	-- lua
	['@constructor.lua'] = { link = 'Operator' },
	['@function.call.lua'] = { link = 'Normal' },
	['@lsp.type.parameter.lua'] = { link = 'Normal' },
	['@lsp.type.property.lua'] = { link = 'Normal' },
	['@property.lua'] = { link = 'Normal' },
	['@punctuation.delimiter.lua'] = { link = 'Operator' },
	['@string.escape.lua'] = { link = 'String' },
	['@variable.member.lua'] = { link = 'Normal' },
	['@variable.parameter.lua'] = { link = 'Normal' },

	-- markdown
	['@label.markdown'] = { link = 'Operator' },
	['@markup.heading.1.markdown'] = { link = 'Operator' },
	['@markup.heading.2.markdown'] = { link = 'Normal' },
	['@markup.heading.3.markdown'] = { link = 'Normal' },
	['@markup.heading.4.markdown'] = { link = 'Normal' },
	['@markup.heading.5.markdown'] = { link = 'Normal' },
	['@markup.heading.6.markdown'] = { link = 'Normal' },
	['@markup.heading'] = { link = 'Title' },
	['@markup.link.label'] = { link = 'Normal' },
	['@markup.link'] = { link = 'Identifier' },
	['@markup.link.url'] = { link = 'Underlined' },
	['@markup.raw.block'] = { link = 'Operator' },
	['@markup.raw'] = { link = 'Normal' },
	['@markup.underline'] = { link = 'Underlined' },
	['@spell.markdown'] = { link = 'Normal' },

	-- query
	['@document.query'] = { link = 'Function' },
	['@nospell.query'] = { link = 'Comment' },
	['@spell.query'] = { link = 'Comment' },
	['@variable.member.query'] = { link = 'Normal' },

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
	['@key.toml'] = { link = 'Function' },
	['@number.float.toml'] = { link = 'Number' },
	['@property.toml'] = { link = 'Normal' },
	['@string.number.float.toml'] = { link = 'Number' },
	['@string.special.toml'] = { link = 'Number' },

	-- tera
	['@keyword.tera'] = { link = 'Identifier' },
	['@variable.member.tera'] = { link = 'Normal' },

	--vim
	['@function.macro.vim'] = { link = 'Normal' },

	------------------------------------------------------------
	-- Plugins
	------------------------------------------------------------

	-- codium
	CodeiumAnnotation = { fg = c.fg },
	CodeiumSuggestion = { fg = c.fd },

	-- mason
	MasonBackdrop = { bg = '#000000', blend = 100 },

	-- mini-cursorword
	MiniCursorword = { fg = c.yellow },
	MiniCursorwordCurrent = { fg = c.yellow },

	-- mini-files
	MiniFilesTitle = { fg = c.fd },
	MiniFilesTitleFocused = { fg = c.fg },

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
	SnacksBackdrop = { bg = '#000000', blend = 100 },
	SnacksIndent = { fg = c.nr },
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
vim.g.colors_name = 'oneoklch'
vim.opt.termguicolors = true
