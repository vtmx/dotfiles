local bd = '#1b1e22'
local bg = '#23272e'
local bl = '#2c313c'

local co = '#6b727e'
local op = '#79818d'

local fg = '#abb2bf'
local fl = '#eeeeee'
local ad = '#938f82'
local ac = '#e6c85b'
local al = '#61afef'

local se = '#3d4556'

local hl_groups = {
	-- General
	Normal = { bg = bg, fg = fg },
	Comment = { fg = co },
	Cursor = { bg = fl, fg = bg },
	CursorLine = { bg = bl },
	EndOfBuffer = { fg = bg },
	TermCursor = { fg = fg },
	Title = { link = 'Normal' },
	Twilight = { link = 'Comment' },
	Visual = { bg = se },

	-- Syntaxy
	Boolean = { fg = ac },
	Character = { fg = ac },
	Conditional = { fg = ac },
	Constant = { fg = fg },
	Define = { fg = ac },
	ErrorMsg = { fg = ac },
	Exception = { fg = ac },
	Float = { fg = ac },
	Function = { fg = ac },
	Identifier = { fg = ac },
	Include = { fg = ac },
	Keyword = { fg = fg },
	Label = { fg = fg },
	Macro = { fg = fg },
	Number = { fg = ac },
	Operator = { fg = op },
	PreCondit = { fg = ac },
	PreProc = { fg = fg },
	Repeat = { fg = ac },
	Statement = { fg = ac },
	StorageClass = { fg = fg },
	String = { fg = ac },
	Structure = { fg = ac },
	Tag = { fg = ac },
	Typedef = { fg = ac },
	Type = { fg = ac },
	Underlined = { fg = ac, underline = true },

	-- Keys [] {} ()
	Delimiter = { link = 'Operator' },
	MatchParen = { fg = ac },

	-- Extras
	Added = { fg = ac },
	Changed = { fg = ac },
	Debug = { fg = ac },
	Directory = { fg = ac },
	NonText = { fg = co },
	SpecialChar = { fg = ac },
	SpecialComment = { fg = co },
	Special = { fg = fg },
	SpecialKey = { fg = ac },

	-- Line number column
	CursorLineFold = { fg = fg },
	CursorLineNr = { fg = fg },
	CursorLineSign = { fg = fg },
	LineNr = { fg = co },
	LineNrAbove = { fg = se },
	LineNrBelow = { fg = se },

	-- ColorColumn
	ColorColumn = { bg = bl },

	-- Search
	Conceal = { bg = se },
	CurSearch = { bg = fg, fg = bg },
	IncSearch = { bg = se },
	Search = { bg = se },
	SnippetTabStop = { link = 'Normal' },

	-- Messages
	ModeMsg = { fg = co },
	MoreMsg = { fg = co },
	Question = { fg = fg },
	WarningMsg = { fg = ac },

	-- Alerts
	Ignore = { fg = fg },
	Error = { fg = ac },
	Todo = { fg = ac },

	-- Pmenu
	Pmenuac = { bg = bl },
	Pmenu = { bg = bg },
	PmenuBorder = { fg = fg },
	PmenuExtra = { link = 'Comment' },
	PmenuKind = { link = 'Comment' },
	PmenuSbar = { bg = bd },
	PmenuSel = { bg = bl },
	PmenuThumb = { bg = fg },

	-- Popup
	NormalFloat = { bg = bg },
	FloatBorder = { bg = bg },
	FloatShadow = { bg = bg },
	FloatShadowThrough = { bg = bg },

	-- Tabbar
	Winbar = { fg = fg },
	WinbarNC = { fg = co },
	WinSeparator = { fg = se },

	-- Line win separator split
	StatusLine = { link = 'Normal' },
	StatusLineNC = { link = 'Normal' },

	-- Spell
	SpellBad = { sp = ac, undercurl = true },
	SpellCap = { sp = ac, undercurl = true },
	SpellRare = { sp = ac, undercurl = true },
	SpellLocal = { sp = ac, undercurl = true },

	-- Diagnostic
	DiagnosticError = { fg = ac },
	DiagnosticFloatingError = { fg = ac },
	DiagnosticFloatingHiting = { fg = ac },
	DiagnosticFloatingInfo = { fg = ac },
	DiagnosticFloatingOk = { fg = ac },
	DiagnosticFloatingWarn = { fg = ac },
	DiagnosticHint = { fg = ac },
	DiagnosticInfo = { fg = ac },
	DiagnosticOk = { fg = ac },
	DiagnosticSignError = { fg = ac },
	DiagnosticSignHint = { fg = ac },
	DiagnosticSignOk = { fg = ac },
	DiagnosticSignWarn = { fg = ac },
	DiagnosticUnnecessary = { fg = co },
	DiagnosticVirtualTextError = { fg = ac },
	DiagnosticVirtualTextHint = { fg = ac },
	DiagnosticVirtualTextInfo = { fg = ac },
	DiagnosticVirtualTextOk = { fg = ac },
	DiagnosticVirtualTextWarn = { fg = ac },
	DiagnosticWarn = { fg = ac },
	QuickFixLine = { fg = ac },

	-- Diff
	DiffAdd = { bg = '#31392b' },
	DiffChange = { bg = '#1c3448' },
	Difcoelete = { bg = '#382b2c' },
	DiffText = { bg = '#2c5372' },

	-- Float
	FoldColumn = { bg = se, fg = ac },
	Folder = { bg = se, fg = ac },

	-- Help
	healthHeadingChar = { fg = fg },
	healthSectionDelim = { fg = ac },
	helpHeader = { fg = ac },
	helpSectionDelim = { fg = ac },

	-- Nvim
	NvimInternalError = { fg = ac },

	-- awk
	awkPatterns = { fg = ac },
	awkVariables = { fg = ac },

	-- css
	cssAtRule = { link = 'Function' },
	cssAttrRegion = { link = 'Normal' },
	cssBackgroundAttr = { link = 'Normal' },
	cssBoxAttr = { link = 'Normal' },
	cssBorderAttr = { link = 'Normal' },
	cssBraces = { link = 'Operator' },
	cssColor = { link = 'Number' },
	cssClassNameDot = { link = 'Function' },
	cssClassName = { link = 'Function' },
	cssCommonAttr = { link = 'Normal' },
	cssDefinition = { link = 'Normal' },
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
	djangoFilter = { link = 'Include' },
	djangoStatement = { link = 'Normal' },
	djangoTagBlock = { link = 'Normal' },
	djangoVarBlock = { link = 'Include' },
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
	['@diff.minus'] = { link = 'Difcoelete' },

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

	-- Markup
	['@label.markdown'] = { link = 'Normal' },
	['@markup.heading.1.markdown'] = { link = 'Normal' },
	['@markup.heading.2.markdown'] = { link = 'Normal' },
	['@markup.heading.3.markdown'] = { link = 'Normal' },
	['@markup.heading.4.markdown'] = { link = 'Normal' },
	['@markup.heading.5.markdown'] = { link = 'Normal' },
	['@markup.heading.6.markdown'] = { link = 'Normal' },
	['@markup.heading'] = { link = 'Title' },
	['@markup.link.label'] = { link = 'Normal' },
	['@markup.link'] = { link = 'Identifier' },
	['@markup.link.url'] = { link = 'Underlined' },
	['@markup.raw'] = { link = 'Normal' },
	['@markup.underline'] = { link = 'Underlined' },

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
	['@property.css'] = { fg = ac },
	['@selectors.css'] = { link = 'Function' },
	['@value.css'] = { link = 'Normal' },

	-- go
	['@string.escape.go'] = { link = 'String' },
	['@function.method.call.go'] = { link = 'Normal' },

	-- html
	['@constant.html'] = { link = 'Comment' },
	['@string.special.url.html'] = { link = 'String' },
	['@tag.attribute.html'] = { link = 'Normal' },
	['@tag.delimiter.html'] = { link = 'Operator' },
	['@tag.html'] = { link = 'Function' },

	-- lua
	['@constructor.lua'] = { link = 'Operator' },
	['@function.call.lua'] = { link = 'Normal' },
	['@lsp.type.function.lua'] = { link = 'Normal' },
	['@lsp.type.method.lua'] = { link = 'Normal' },
	['@lsp.type.parameter.lua'] = { link = 'Normal' },
	['@lsp.type.property.lua'] = { link = 'Normal' },
	['@property.lua'] = { link = 'Normal' },
	['@punctuation.delimiter.lua'] = { link = 'Operator' },
	['@string.escape.lua'] = { link = 'String' },
	['@variable.lua'] = { link = 'Normal' },
	['@variable.member.lua'] = { link = 'Normal' },
	['@variable.parameter.lua'] = { link = 'Normal' },

	-- query
	['@nospell.query'] = { link = 'Comment' },
	['@spell.query'] = { link = 'Comment' },

	-- vimdoc
	['@comment.note.vimdoc'] = { link = 'Normal' },
	['@label.vimdoc'] = { link = 'Keyword' },
	['@markup.link.vimdoc'] = { link = 'Function' },
	['@string.special.vimdoc'] = { link = 'Function' },
	['@string.special.url.vimdoc'] = { link = 'Function' },
	['@markup.raw.block.vimdoc'] = { link = 'Normal' },
	['@markup.raw.vimdoc'] = { link = 'Normal' },
	['@variable.parameter.vimdoc'] = { link = 'Number' },

	--vim
	['@function.macro.vim'] = { link = 'Normal' },

	------------------------------------------------------------
	-- Plugins
	------------------------------------------------------------

	-- codium
	CodeiumAnnotation = { fg = fg },
	CodeiumSuggestion = { fg = co },

	-- mason
	MasonBackdrop = { bg = '#000000', blend = 100 },

	-- mini-cursorword
	MiniCursorword = { fg = ac },
	MiniCursorwordCurrent = { fg = ac },

	-- mini-files
	MiniFilesTitle = { fg = co },
	MiniFilesTitleFocused = { fg = fg },

	-- mini-jump2d
	MiniJump2dDim = { link = 'Comment' },
	MiniJump2dSpotAhead = { fg = ac },
	MiniJump2dSpot = { fg = ac },
	MiniJump2dSpotUnique = { fg = ac },

	-- mini-statusline
	MiniStatuslineRecording = { fg = ac },

	-- netrw
	netrwTreeBar = { link = 'Normal' },

	-- snacks
	SnacksBackdrop = { bg = '#000000', blend = 100 },
	SnacksIndent = { fg = se },
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
vim.g.colors_name = 'accent'
vim.opt.termguicolors = true
