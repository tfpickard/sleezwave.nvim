-- sleezwave.nvim highlights
-- Main highlight groups and plugin integrations

local M = {}

-- Helper function to set highlights
local function highlight(group, opts)
	local cmd = "highlight " .. group
	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end
	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end
	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
		cmd = cmd .. " cterm=" .. opts.style
	end
	if opts.sp then
		cmd = cmd .. " guisp=" .. opts.sp
	end
	if opts.blend then
		cmd = cmd .. " blend=" .. opts.blend
	end
	vim.cmd(cmd)
end

-- Apply transparency if enabled
local function maybe_bg(color, config)
	if config.transparent then
		return "NONE"
	end
	return color
end

-- Main setup function
function M.setup(colors, config)
	local c = colors.colors

	-- Apply base highlights
	M.base(c, config)

	-- Apply plugin integrations based on config
	local integrations = {
		treesitter = function()
			M.treesitter(c, config)
		end,
		lsp = function()
			M.lsp(c, config)
		end,
		telescope = function()
			M.telescope(c, config)
		end,
		lualine = function()
			M.lualine(c, config)
		end,
		nvim_tree = function()
			M.nvim_tree(c, config)
		end,
		which_key = function()
			M.which_key(c, config)
		end,
		gitsigns = function()
			M.gitsigns(c, config)
		end,
		cmp = function()
			M.cmp(c, config)
		end,
		dap = function()
			M.dap(c, config)
		end,
		notify = function()
			M.notify(c, config)
		end,
		noice = function()
			M.noice(c, config)
		end,
		mini = function()
			M.mini(c, config)
		end,
		hop = function()
			M.hop(c, config)
		end,
		leap = function()
			M.leap(c, config)
		end,
		flash = function()
			M.flash(c, config)
		end,
		bufferline = function()
			M.bufferline(c, config)
		end,
		alpha = function()
			M.alpha(c, config)
		end,
		dashboard = function()
			M.dashboard(c, config)
		end,
		indent_blankline = function()
			M.indent_blankline(c, config)
		end,
		neo_tree = function()
			M.neo_tree(c, config)
		end,
		trouble = function()
			M.trouble(c, config)
		end,
		lazy = function()
			M.lazy(c, config)
		end,
		mason = function()
			M.mason(c, config)
		end,
	}

	for integration, func in pairs(integrations) do
		if config.integrations[integration] then
			func()
		end
	end
end

-- Base Neovim highlights
function M.base(c, config)
	-- Core syntax highlighting
	highlight("Normal", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("Comment", { fg = c.muted_purple, style = config.styles.comments.italic and "italic" or "NONE" })

	-- Constants and literals
	highlight("Constant", { fg = c.electric_cyan })
	highlight("String", { fg = c.hot_pink })
	highlight("Character", { fg = c.hot_pink })
	highlight("Number", { fg = c.electric_cyan })
	highlight("Boolean", { fg = c.electric_cyan })
	highlight("Float", { fg = c.electric_cyan })

	-- Identifiers and functions
	highlight("Identifier", { fg = c.fg })
	highlight("Function", { fg = c.muted_cyan, style = config.styles.functions.bold and "bold" or "NONE" })

	-- Statements and keywords
	highlight("Statement", { fg = c.electric_blue, style = config.styles.keywords.bold and "bold" or "NONE" })
	highlight("Conditional", { fg = c.electric_blue })
	highlight("Repeat", { fg = c.electric_blue })
	highlight("Label", { fg = c.electric_blue })
	highlight("Operator", { fg = c.muted_pink })
	highlight("Keyword", { fg = c.electric_blue })
	highlight("Exception", { fg = c.error })

	-- Preprocessor
	highlight("PreProc", { fg = c.purple })
	highlight("Include", { fg = c.purple })
	highlight("Define", { fg = c.purple })
	highlight("Macro", { fg = c.purple })
	highlight("PreCondit", { fg = c.purple })

	-- Types
	highlight("Type", { fg = c.electric_green })
	highlight("StorageClass", { fg = c.electric_green })
	highlight("Structure", { fg = c.electric_green })
	highlight("Typedef", { fg = c.electric_green })

	-- Special
	highlight("Special", { fg = c.neon_yellow })
	highlight("SpecialChar", { fg = c.neon_yellow })
	highlight("Tag", { fg = c.neon_yellow })
	highlight("Delimiter", { fg = c.fg })
	highlight("SpecialComment", { fg = c.muted_purple, style = "bold" })
	highlight("Debug", { fg = c.error })

	-- UI Elements
	highlight("ColorColumn", { bg = c.darker_purple })
	highlight("Conceal", { fg = c.dark_purple })
	highlight("Cursor", { fg = c.bg, bg = c.cursor })
	highlight("CursorIM", { fg = c.bg, bg = c.cursor })
	highlight("CursorColumn", { bg = c.darker_purple })
	highlight("CursorLine", { bg = maybe_bg(c.darker_purple, config) })
	highlight("Directory", { fg = c.electric_blue })
	highlight("EndOfBuffer", { fg = c.dark_purple })
	highlight("ErrorMsg", { fg = c.error })
	highlight("VertSplit", { fg = c.dark_purple, bg = maybe_bg(c.bg, config) })
	highlight("WinSeparator", { fg = c.dark_purple, bg = maybe_bg(c.bg, config) })
	highlight("Folded", { fg = c.muted_purple, bg = maybe_bg(c.darker_purple, config) })
	highlight("FoldColumn", { fg = c.muted_purple, bg = maybe_bg(c.bg, config) })
	highlight("SignColumn", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("IncSearch", { fg = c.bg, bg = c.neon_yellow })
	highlight("LineNr", { fg = c.line_number, bg = maybe_bg(c.bg, config) })
	highlight("CursorLineNr", { fg = c.cursor_line_nr, bg = maybe_bg(c.bg, config) })
	highlight("MatchParen", { fg = c.neon_yellow, style = "bold" })
	highlight("ModeMsg", { fg = c.fg })
	highlight("MoreMsg", { fg = c.electric_green })
	highlight("NonText", { fg = c.dark_purple })
	highlight("Pmenu", { fg = c.fg, bg = c.darker_purple })
	highlight("PmenuSel", { fg = c.bg, bg = c.electric_cyan })
	highlight("PmenuSbar", { bg = c.dark_purple })
	highlight("PmenuThumb", { bg = c.electric_cyan })
	highlight("Question", { fg = c.electric_green })
	highlight("Search", { fg = c.bg, bg = c.electric_cyan })
	highlight("SpecialKey", { fg = c.dark_purple })
	highlight("StatusLine", { fg = c.fg, bg = c.dark_purple })
	highlight("StatusLineNC", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("TabLine", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("TabLineFill", { bg = c.darker_purple })
	highlight("TabLineSel", { fg = c.fg, bg = c.bg })
	highlight("Title", { fg = c.electric_cyan, style = "bold" })
	highlight("Visual", { bg = c.selection })
	highlight("VisualNOS", { bg = c.selection })
	highlight("WarningMsg", { fg = c.warning })
	highlight("Whitespace", { fg = c.dark_purple })
	highlight("WildMenu", { fg = c.bg, bg = c.electric_cyan })

	-- Spell checking
	highlight("SpellBad", { sp = c.error, style = "undercurl" })
	highlight("SpellCap", { sp = c.warning, style = "undercurl" })
	highlight("SpellLocal", { sp = c.info, style = "undercurl" })
	highlight("SpellRare", { sp = c.hint, style = "undercurl" })

	-- Diff
	highlight("DiffAdd", { fg = c.git_add, bg = maybe_bg(c.diff_add, config) })
	highlight("DiffChange", { fg = c.git_change, bg = maybe_bg(c.diff_change, config) })
	highlight("DiffDelete", { fg = c.git_delete, bg = maybe_bg(c.diff_delete, config) })
	highlight("DiffText", { fg = c.diff_text, bg = maybe_bg(c.diff_change, config) })

	-- Error and diagnostics
	highlight("Error", { fg = c.error, bg = maybe_bg(c.bg, config) })
	highlight("Todo", { fg = c.neon_yellow, bg = maybe_bg(c.bg, config), style = "bold" })
	highlight("Underlined", { fg = c.electric_cyan, style = "underline" })
	highlight("Ignore", { fg = c.dark_purple })
end

-- TreeSitter highlights
function M.treesitter(c, config)
	highlight("@comment", { fg = c.muted_purple, style = config.styles.comments.italic and "italic" or "NONE" })
	highlight("@error", { fg = c.error })
	highlight("@none", { fg = c.fg })
	highlight("@preproc", { fg = c.purple })
	highlight("@define", { fg = c.purple })
	highlight("@operator", { fg = c.muted_pink })

	-- Punctuation
	highlight("@punctuation.delimiter", { fg = c.fg })
	highlight("@punctuation.bracket", { fg = c.fg })
	highlight("@punctuation.special", { fg = c.neon_yellow })

	-- Literals
	highlight("@string", { fg = c.hot_pink })
	highlight("@string.regex", { fg = c.hot_pink })
	highlight("@string.escape", { fg = c.neon_yellow })
	highlight("@character", { fg = c.hot_pink })
	highlight("@character.special", { fg = c.neon_yellow })
	highlight("@boolean", { fg = c.electric_cyan })
	highlight("@number", { fg = c.electric_cyan })
	highlight("@float", { fg = c.electric_cyan })

	-- Functions
	highlight("@function", { fg = c.muted_cyan, style = config.styles.functions.bold and "bold" or "NONE" })
	highlight("@function.call", { fg = c.muted_cyan })
	highlight("@function.builtin", { fg = c.electric_blue })
	highlight("@function.macro", { fg = c.purple })
	highlight("@method", { fg = c.muted_cyan })
	highlight("@method.call", { fg = c.muted_cyan })
	highlight("@constructor", { fg = c.electric_green })
	highlight("@parameter", { fg = c.fg, style = config.styles.variables.bold and "bold" or "NONE" })

	-- Keywords
	highlight("@keyword", { fg = c.electric_blue, style = config.styles.keywords.bold and "bold" or "NONE" })
	highlight("@keyword.function", { fg = c.electric_blue })
	highlight("@keyword.operator", { fg = c.electric_blue })
	highlight("@keyword.return", { fg = c.electric_blue })
	highlight("@conditional", { fg = c.electric_blue })
	highlight("@repeat", { fg = c.electric_blue })
	highlight("@debug", { fg = c.error })
	highlight("@label", { fg = c.electric_blue })
	highlight("@include", { fg = c.purple })
	highlight("@exception", { fg = c.error })

	-- Types
	highlight("@type", { fg = c.electric_green })
	highlight("@type.builtin", { fg = c.electric_green })
	highlight("@type.qualifier", { fg = c.electric_green })
	highlight("@type.definition", { fg = c.electric_green })
	highlight("@storageclass", { fg = c.electric_green })
	highlight("@attribute", { fg = c.purple })
	highlight("@field", { fg = c.fg })
	highlight("@property", { fg = c.fg })

	-- Variables
	highlight("@variable", { fg = c.fg, style = config.styles.variables.bold and "bold" or "NONE" })
	highlight("@variable.builtin", { fg = c.muted_purple })
	highlight("@constant", { fg = c.electric_cyan })
	highlight("@constant.builtin", { fg = c.electric_cyan })
	highlight("@constant.macro", { fg = c.electric_cyan })
	highlight("@namespace", { fg = c.electric_green })
	highlight("@symbol", { fg = c.electric_cyan })

	-- Text
	highlight("@text", { fg = c.fg })
	highlight("@text.strong", { fg = c.fg, style = "bold" })
	highlight("@text.emphasis", { fg = c.fg, style = "italic" })
	highlight("@text.underline", { fg = c.fg, style = "underline" })
	highlight("@text.strike", { fg = c.fg, style = "strikethrough" })
	highlight("@text.title", { fg = c.electric_cyan, style = "bold" })
	highlight("@text.literal", { fg = c.hot_pink })
	highlight("@text.uri", { fg = c.electric_cyan, style = "underline" })
	highlight("@text.math", { fg = c.neon_yellow })
	highlight("@text.environment", { fg = c.purple })
	highlight("@text.environment.name", { fg = c.electric_green })
	highlight("@text.reference", { fg = c.electric_cyan })
	highlight("@text.todo", { fg = c.neon_yellow, style = "bold" })
	highlight("@text.note", { fg = c.info, style = "bold" })
	highlight("@text.warning", { fg = c.warning, style = "bold" })
	highlight("@text.danger", { fg = c.error, style = "bold" })

	-- Tags (HTML/XML)
	highlight("@tag", { fg = c.electric_blue })
	highlight("@tag.attribute", { fg = c.electric_green })
	highlight("@tag.delimiter", { fg = c.fg })
end

-- LSP highlights
function M.lsp(c, config)
	highlight("LspReferenceText", { bg = c.darker_purple })
	highlight("LspReferenceRead", { bg = c.darker_purple })
	highlight("LspReferenceWrite", { bg = c.darker_purple })
	highlight("LspSignatureActiveParameter", { fg = c.neon_yellow, style = "bold" })

	-- Diagnostics
	highlight("DiagnosticError", { fg = c.error })
	highlight("DiagnosticWarn", { fg = c.warning })
	highlight("DiagnosticInfo", { fg = c.info })
	highlight("DiagnosticHint", { fg = c.hint })
	highlight("DiagnosticVirtualTextError", { fg = c.error, bg = maybe_bg(c.bg, config) })
	highlight("DiagnosticVirtualTextWarn", { fg = c.warning, bg = maybe_bg(c.bg, config) })
	highlight("DiagnosticVirtualTextInfo", { fg = c.info, bg = maybe_bg(c.bg, config) })
	highlight("DiagnosticVirtualTextHint", { fg = c.hint, bg = maybe_bg(c.bg, config) })
	highlight("DiagnosticUnderlineError", { sp = c.error, style = "undercurl" })
	highlight("DiagnosticUnderlineWarn", { sp = c.warning, style = "undercurl" })
	highlight("DiagnosticUnderlineInfo", { sp = c.info, style = "undercurl" })
	highlight("DiagnosticUnderlineHint", { sp = c.hint, style = "undercurl" })

	-- Floating windows
	highlight("LspInfoBorder", { fg = c.electric_cyan })
	highlight("LspInfoTitle", { fg = c.electric_cyan, style = "bold" })
end

-- Telescope highlights
function M.telescope(c, config)
	highlight("TelescopeNormal", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("TelescopeBorder", { fg = c.electric_cyan, bg = maybe_bg(c.bg, config) })
	highlight("TelescopePromptBorder", { fg = c.hot_pink, bg = maybe_bg(c.bg, config) })
	highlight("TelescopeResultsBorder", { fg = c.electric_cyan, bg = maybe_bg(c.bg, config) })
	highlight("TelescopePreviewBorder", { fg = c.electric_green, bg = maybe_bg(c.bg, config) })
	highlight("TelescopeMatching", { fg = c.neon_yellow, style = "bold" })
	highlight("TelescopeSelection", { fg = c.fg, bg = c.darker_purple })
	highlight("TelescopeSelectionCaret", { fg = c.hot_pink, bg = c.darker_purple })
	highlight("TelescopeMultiSelection", { fg = c.electric_cyan, bg = c.darker_purple })
	highlight("TelescopePromptPrefix", { fg = c.hot_pink })
	highlight("TelescopePromptCounter", { fg = c.muted_purple })
	highlight("TelescopeTitle", { fg = c.electric_cyan, style = "bold" })
	highlight("TelescopePromptTitle", { fg = c.hot_pink, style = "bold" })
	highlight("TelescopeResultsTitle", { fg = c.electric_cyan, style = "bold" })
	highlight("TelescopePreviewTitle", { fg = c.electric_green, style = "bold" })
end

-- Lualine integration (theme will be in separate file)
function M.lualine(c, config)
	-- These are used by lualine theme
	highlight("StatuslineNormal", { fg = c.bg, bg = c.electric_cyan })
	highlight("StatuslineInsert", { fg = c.bg, bg = c.electric_green })
	highlight("StatuslineVisual", { fg = c.bg, bg = c.hot_pink })
	highlight("StatuslineReplace", { fg = c.bg, bg = c.error })
	highlight("StatuslineCommand", { fg = c.bg, bg = c.neon_yellow })
	highlight("StatuslineInactive", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("StatuslineTerminal", { fg = c.bg, bg = c.purple })
end

-- Continue with more integrations...
function M.nvim_tree(c, config)
	highlight("NvimTreeNormal", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("NvimTreeNormalNC", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("NvimTreeFolderIcon", { fg = c.electric_blue })
	highlight("NvimTreeRootFolder", { fg = c.hot_pink, style = "bold" })
	highlight("NvimTreeSymlink", { fg = c.electric_cyan })
	highlight("NvimTreeExecFile", { fg = c.electric_green })
	highlight("NvimTreeOpenedFile", { fg = c.neon_yellow })
	highlight("NvimTreeSpecialFile", { fg = c.purple })
	highlight("NvimTreeImageFile", { fg = c.muted_pink })
	highlight("NvimTreeIndentMarker", { fg = c.dark_purple })
	highlight("NvimTreeGitDirty", { fg = c.warning })
	highlight("NvimTreeGitNew", { fg = c.success })
	highlight("NvimTreeGitDeleted", { fg = c.error })
	highlight("NvimTreeGitMerge", { fg = c.git_conflict })
	highlight("NvimTreeGitRenamed", { fg = c.muted_cyan })
	highlight("NvimTreeGitStaged", { fg = c.success })
end

function M.which_key(c, config)
	highlight("WhichKey", { fg = c.electric_cyan })
	highlight("WhichKeyGroup", { fg = c.electric_blue })
	highlight("WhichKeyDesc", { fg = c.fg })
	highlight("WhichKeySeparator", { fg = c.dark_purple })
	highlight("WhichKeyFloat", { bg = maybe_bg(c.darker_purple, config) })
	highlight("WhichKeyBorder", { fg = c.electric_cyan })
	highlight("WhichKeyValue", { fg = c.muted_purple })
end

function M.gitsigns(c, config)
	highlight("GitSignsAdd", { fg = c.git_add })
	highlight("GitSignsChange", { fg = c.git_change })
	highlight("GitSignsDelete", { fg = c.git_delete })
	highlight("GitSignsAddNr", { fg = c.git_add })
	highlight("GitSignsChangeNr", { fg = c.git_change })
	highlight("GitSignsDeleteNr", { fg = c.git_delete })
	highlight("GitSignsAddLn", { bg = c.diff_add })
	highlight("GitSignsChangeLn", { bg = c.diff_change })
	highlight("GitSignsDeleteLn", { bg = c.diff_delete })
	highlight("GitSignsCurrentLineBlame", { fg = c.muted_purple, style = "italic" })
end

function M.cmp(c, config)
	highlight("CmpItemAbbr", { fg = c.fg })
	highlight("CmpItemAbbrDeprecated", { fg = c.dark_purple, style = "strikethrough" })
	highlight("CmpItemAbbrMatch", { fg = c.electric_cyan, style = "bold" })
	highlight("CmpItemAbbrMatchFuzzy", { fg = c.electric_cyan, style = "bold" })
	highlight("CmpItemKind", { fg = c.hot_pink })
	highlight("CmpItemMenu", { fg = c.muted_purple })

	-- Kind highlights
	highlight("CmpItemKindText", { fg = c.fg })
	highlight("CmpItemKindMethod", { fg = c.muted_cyan })
	highlight("CmpItemKindFunction", { fg = c.muted_cyan })
	highlight("CmpItemKindConstructor", { fg = c.electric_green })
	highlight("CmpItemKindField", { fg = c.fg })
	highlight("CmpItemKindVariable", { fg = c.fg })
	highlight("CmpItemKindClass", { fg = c.electric_green })
	highlight("CmpItemKindInterface", { fg = c.electric_green })
	highlight("CmpItemKindModule", { fg = c.electric_green })
	highlight("CmpItemKindProperty", { fg = c.fg })
	highlight("CmpItemKindUnit", { fg = c.electric_cyan })
	highlight("CmpItemKindValue", { fg = c.electric_cyan })
	highlight("CmpItemKindEnum", { fg = c.electric_green })
	highlight("CmpItemKindKeyword", { fg = c.electric_blue })
	highlight("CmpItemKindSnippet", { fg = c.neon_yellow })
	highlight("CmpItemKindColor", { fg = c.hot_pink })
	highlight("CmpItemKindFile", { fg = c.fg })
	highlight("CmpItemKindReference", { fg = c.electric_cyan })
	highlight("CmpItemKindFolder", { fg = c.electric_blue })
	highlight("CmpItemKindEnumMember", { fg = c.electric_cyan })
	highlight("CmpItemKindConstant", { fg = c.electric_cyan })
	highlight("CmpItemKindStruct", { fg = c.electric_green })
	highlight("CmpItemKindEvent", { fg = c.neon_yellow })
	highlight("CmpItemKindOperator", { fg = c.muted_pink })
	highlight("CmpItemKindTypeParameter", { fg = c.electric_green })
end

-- Placeholder functions for additional integrations
function M.dap(c, config)
	highlight("DapBreakpoint", { fg = c.error })
	highlight("DapBreakpointCondition", { fg = c.warning })
	highlight("DapLogPoint", { fg = c.info })
	highlight("DapStopped", { fg = c.success })
end

function M.notify(c, config)
	highlight("NotifyERRORBorder", { fg = c.error })
	highlight("NotifyWARNBorder", { fg = c.warning })
	highlight("NotifyINFOBorder", { fg = c.info })
	highlight("NotifyDEBUGBorder", { fg = c.hint })
	highlight("NotifyTRACEBorder", { fg = c.muted_purple })
	highlight("NotifyERRORIcon", { fg = c.error })
	highlight("NotifyWARNIcon", { fg = c.warning })
	highlight("NotifyINFOIcon", { fg = c.info })
	highlight("NotifyDEBUGIcon", { fg = c.hint })
	highlight("NotifyTRACEIcon", { fg = c.muted_purple })
	highlight("NotifyERRORTitle", { fg = c.error, style = "bold" })
	highlight("NotifyWARNTitle", { fg = c.warning, style = "bold" })
	highlight("NotifyINFOTitle", { fg = c.info, style = "bold" })
	highlight("NotifyDEBUGTitle", { fg = c.hint, style = "bold" })
	highlight("NotifyTRACETitle", { fg = c.muted_purple, style = "bold" })
end

function M.noice(c, config)
	highlight("NoiceCmdlineIcon", { fg = c.electric_cyan })
	highlight("NoiceCmdlinePrompt", { fg = c.hot_pink })
	highlight("NoiceCmdlinePopupBorder", { fg = c.electric_cyan })
	highlight("NoiceCmdlinePopupTitle", { fg = c.electric_cyan })
	highlight("NoiceConfirmBorder", { fg = c.electric_green })
	highlight("NoiceFormatProgressDone", { fg = c.success, bg = c.dark_purple })
	highlight("NoiceFormatProgressTodo", { fg = c.dark_purple, bg = c.darker_purple })
end

function M.mini(c, config)
	-- Mini.nvim modules
	highlight("MiniCompletionActiveParameter", { style = "underline" })
	highlight("MiniCursorword", { bg = c.darker_purple })
	highlight("MiniCursorwordCurrent", { bg = c.darker_purple })
	highlight("MiniIndentscopeSymbol", { fg = c.electric_cyan })
	highlight("MiniJump", { fg = c.bg, bg = c.neon_yellow })
	highlight("MiniJump2dSpot", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("MiniStarterCurrent", { style = "underline" })
	highlight("MiniStarterFooter", { fg = c.muted_purple, style = "italic" })
	highlight("MiniStarterHeader", { fg = c.electric_cyan, style = "bold" })
	highlight("MiniStarterInactive", { fg = c.dark_purple })
	highlight("MiniStarterItem", { fg = c.fg })
	highlight("MiniStarterItemBullet", { fg = c.hot_pink })
	highlight("MiniStarterItemPrefix", { fg = c.electric_blue })
	highlight("MiniStarterSection", { fg = c.electric_green, style = "bold" })
	highlight("MiniStarterQuery", { fg = c.neon_yellow })
	highlight("MiniStatuslineDevinfo", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("MiniStatuslineFileinfo", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("MiniStatuslineFilename", { fg = c.fg, bg = c.darker_purple })
	highlight("MiniStatuslineInactive", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("MiniStatuslineModeCommand", { fg = c.bg, bg = c.neon_yellow, style = "bold" })
	highlight("MiniStatuslineModeInsert", { fg = c.bg, bg = c.electric_green, style = "bold" })
	highlight("MiniStatuslineModeNormal", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("MiniStatuslineModeOther", { fg = c.bg, bg = c.purple, style = "bold" })
	highlight("MiniStatuslineModeReplace", { fg = c.bg, bg = c.error, style = "bold" })
	highlight("MiniStatuslineModeVisual", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("MiniSurround", { fg = c.bg, bg = c.electric_cyan })
	highlight("MiniTablineCurrent", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("MiniTablineFill", { bg = c.darker_purple })
	highlight("MiniTablineHidden", { fg = c.fg, bg = c.dark_purple })
	highlight("MiniTablineModifiedCurrent", { fg = c.bg, bg = c.electric_cyan, style = "bold,italic" })
	highlight("MiniTablineModifiedHidden", { fg = c.warning, bg = c.dark_purple, style = "italic" })
	highlight("MiniTablineModifiedVisible", { fg = c.warning, bg = c.darker_purple, style = "italic" })
	highlight("MiniTablineTabpagesection", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("MiniTablineVisible", { fg = c.fg, bg = c.darker_purple })
	highlight("MiniTestEmphasis", { style = "bold" })
	highlight("MiniTestFail", { fg = c.error, style = "bold" })
	highlight("MiniTestPass", { fg = c.success, style = "bold" })
	highlight("MiniTrailspace", { bg = c.error })
end

-- Placeholder implementations for remaining integrations
function M.hop(c, config)
	highlight("HopNextKey", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("HopNextKey1", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("HopNextKey2", { fg = c.bg, bg = c.electric_blue })
	highlight("HopUnmatched", { fg = c.dark_purple })
end

function M.leap(c, config)
	highlight("LeapMatch", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("LeapLabelPrimary", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("LeapLabelSecondary", { fg = c.bg, bg = c.electric_green, style = "bold" })
	highlight("LeapBackdrop", { fg = c.dark_purple })
end

function M.flash(c, config)
	highlight("FlashBackdrop", { fg = c.dark_purple })
	highlight("FlashMatch", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("FlashCurrent", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("FlashLabel", { fg = c.bg, bg = c.neon_yellow, style = "bold" })
end

function M.bufferline(c, config)
	highlight("BufferLineIndicatorSelected", { fg = c.electric_cyan })
	highlight("BufferLineFill", { bg = c.darker_purple })
	highlight("BufferLineBackground", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, style = "bold,italic" })
	highlight("BufferLineBufferVisible", { fg = c.fg, bg = c.darker_purple })
	highlight("BufferLineCloseButton", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("BufferLineCloseButtonSelected", { fg = c.error, bg = c.bg })
	highlight("BufferLineCloseButtonVisible", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("BufferLineSeparator", { fg = c.darker_purple, bg = c.darker_purple })
	highlight("BufferLineSeparatorSelected", { fg = c.darker_purple, bg = c.bg })
	highlight("BufferLineSeparatorVisible", { fg = c.darker_purple, bg = c.darker_purple })
	highlight("BufferLineTab", { fg = c.dark_purple, bg = c.darker_purple })
	highlight("BufferLineTabSelected", { fg = c.electric_cyan, bg = c.bg })
	highlight("BufferLineTabClose", { fg = c.error, bg = c.darker_purple })
	highlight("BufferLineModified", { fg = c.warning, bg = c.darker_purple })
	highlight("BufferLineModifiedSelected", { fg = c.warning, bg = c.bg })
	highlight("BufferLineModifiedVisible", { fg = c.warning, bg = c.darker_purple })
end

function M.alpha(c, config)
	highlight("AlphaShortcut", { fg = c.electric_cyan })
	highlight("AlphaHeader", { fg = c.hot_pink })
	highlight("AlphaHeaderLabel", { fg = c.electric_green })
	highlight("AlphaFooter", { fg = c.muted_purple, style = "italic" })
	highlight("AlphaButtons", { fg = c.electric_blue })
end

function M.dashboard(c, config)
	highlight("DashboardShortCut", { fg = c.electric_cyan })
	highlight("DashboardHeader", { fg = c.hot_pink })
	highlight("DashboardCenter", { fg = c.electric_blue })
	highlight("DashboardFooter", { fg = c.muted_purple, style = "italic" })
end

function M.indent_blankline(c, config)
	highlight("IndentBlanklineChar", { fg = c.dark_purple })
	highlight("IndentBlanklineContextChar", { fg = c.electric_cyan })
	highlight("IndentBlanklineSpaceChar", { fg = c.dark_purple })
	highlight("IndentBlanklineSpaceCharBlankline", { fg = c.dark_purple })

	-- For newer versions
	highlight("IblIndent", { fg = c.dark_purple })
	highlight("IblScope", { fg = c.electric_cyan })
end

function M.neo_tree(c, config)
	highlight("NeoTreeNormal", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("NeoTreeNormalNC", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("NeoTreeDirectoryIcon", { fg = c.electric_blue })
	highlight("NeoTreeDirectoryName", { fg = c.electric_blue })
	highlight("NeoTreeFileName", { fg = c.fg })
	highlight("NeoTreeFileIcon", { fg = c.fg })
	highlight("NeoTreeRootName", { fg = c.hot_pink, style = "bold" })
	highlight("NeoTreeSymbolicLinkTarget", { fg = c.electric_cyan })
	highlight("NeoTreeGitAdded", { fg = c.git_add })
	highlight("NeoTreeGitConflict", { fg = c.git_conflict })
	highlight("NeoTreeGitDeleted", { fg = c.git_delete })
	highlight("NeoTreeGitIgnored", { fg = c.dark_purple })
	highlight("NeoTreeGitModified", { fg = c.git_change })
	highlight("NeoTreeGitUnstaged", { fg = c.warning })
	highlight("NeoTreeGitUntracked", { fg = c.success })
	highlight("NeoTreeGitStaged", { fg = c.success })
	highlight("NeoTreeFloatBorder", { fg = c.electric_cyan })
	highlight("NeoTreeFloatTitle", { fg = c.electric_cyan, style = "bold" })
	highlight("NeoTreeTitleBar", { fg = c.bg, bg = c.electric_cyan })
end

function M.trouble(c, config)
	highlight("TroubleText", { fg = c.fg })
	highlight("TroubleCount", { fg = c.hot_pink, bg = c.darker_purple })
	highlight("TroubleNormal", { fg = c.fg, bg = maybe_bg(c.bg, config) })
	highlight("TroubleSignError", { fg = c.error })
	highlight("TroubleSignWarning", { fg = c.warning })
	highlight("TroubleSignInformation", { fg = c.info })
	highlight("TroubleSignHint", { fg = c.hint })
	highlight("TroubleError", { fg = c.error })
	highlight("TroubleWarning", { fg = c.warning })
	highlight("TroubleInformation", { fg = c.info })
	highlight("TroubleHint", { fg = c.hint })
	highlight("TroubleLocation", { fg = c.dark_purple })
	highlight("TroubleFile", { fg = c.electric_blue })
	highlight("TroubleSource", { fg = c.muted_purple })
	highlight("TroubleCode", { fg = c.dark_purple })
end

function M.lazy(c, config)
	highlight("LazyProgressDone", { fg = c.success, style = "bold" })
	highlight("LazyProgressTodo", { fg = c.dark_purple })
	highlight("LazyCommit", { fg = c.electric_cyan })
	highlight("LazyCommitIssue", { fg = c.hot_pink })
	highlight("LazyCommitType", { fg = c.electric_green })
	highlight("LazyCommitScope", { fg = c.electric_blue })
	highlight("LazyLogTime", { fg = c.muted_purple })
	highlight("LazyButton", { fg = c.fg, bg = c.darker_purple })
	highlight("LazyButtonActive", { fg = c.bg, bg = c.electric_cyan })
	highlight("LazySpecial", { fg = c.neon_yellow })
	highlight("LazyReasonPlugin", { fg = c.hot_pink })
	highlight("LazyReasonRuntime", { fg = c.electric_green })
	highlight("LazyReasonCmd", { fg = c.electric_blue })
	highlight("LazyReasonEvent", { fg = c.purple })
	highlight("LazyReasonKeys", { fg = c.electric_cyan })
	highlight("LazyReasonStart", { fg = c.success })
	highlight("LazyReasonSource", { fg = c.warning })
	highlight("LazyReasonFt", { fg = c.muted_cyan })
	highlight("LazyReasonImport", { fg = c.muted_purple })
	highlight("LazyValue", { fg = c.electric_cyan })
	highlight("LazyDir", { fg = c.electric_blue })
	highlight("LazyUrl", { fg = c.electric_cyan, style = "underline" })
	highlight("LazyTaskOutput", { fg = c.fg })
	highlight("LazyTaskError", { fg = c.error })
	highlight("LazyComment", { fg = c.muted_purple })
	highlight("LazyDimmed", { fg = c.dark_purple })
	highlight("LazyProp", { fg = c.electric_green })
	highlight("LazyH1", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("LazyH2", { fg = c.electric_cyan, style = "bold" })
end

function M.mason(c, config)
	highlight("MasonHeader", { fg = c.bg, bg = c.hot_pink, style = "bold" })
	highlight("MasonHeaderSecondary", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("MasonHighlight", { fg = c.electric_cyan })
	highlight("MasonHighlightBlock", { fg = c.bg, bg = c.electric_cyan })
	highlight("MasonHighlightBlockBold", { fg = c.bg, bg = c.electric_cyan, style = "bold" })
	highlight("MasonHighlightSecondary", { fg = c.electric_green })
	highlight("MasonHighlightBlockSecondary", { fg = c.bg, bg = c.electric_green })
	highlight("MasonHighlightBlockBoldSecondary", { fg = c.bg, bg = c.electric_green, style = "bold" })
	highlight("MasonMuted", { fg = c.muted_purple })
	highlight("MasonMutedBlock", { fg = c.fg, bg = c.dark_purple })
	highlight("MasonMutedBlockBold", { fg = c.fg, bg = c.dark_purple, style = "bold" })
	highlight("MasonError", { fg = c.error })
	highlight("MasonWarning", { fg = c.warning })
end

return M
