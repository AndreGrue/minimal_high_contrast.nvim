--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl
local colors = require("minimal_high_contrast.colors")

--
--
local error_red = colors.neutral_red
local warn_yellow = colors.neutral_yellow
local info_blue = colors.neutral_blue
local hint_gray = colors.dark2
local ok_green = colors.neutral_green

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--

		SelectionHighlightBackground({ bg = "#343a41" }), -- editor.selectionHighlightBackground
		LightBulb({ fg = "#ffcc00" }), -- editorLightBulb.foreground
		CodeLens({ fg = "#999999" }), -- editorCodeLens.foreground
		GutterGitAdded({ fg = "#2ea043" }), -- editorGutter.addedBackground
		GutterGitDeleted({ fg = "#f85149" }), -- editorGutter.deletedBackground
		GutterGitModified({ fg = "#0078d4" }), -- editorGutter.modifiedBackground
		Breadcrumb({ fg = "#a9a9a9", bg = Normal.bg }), -- breadcrumb.foreground/background
		Title({ fg = colors.dark_blue, gui = "bold" }), -- Titles for output from ":set all", ":autocmd" etc.
		Directory({ fg = colors.light0 }), -- Directory names (and other special names in listings)
		GhostText({ fg = "#6b6b6b" }), -- editorGhostText.foreground
		ProgressBar({ fg = "#0078d4" }), -- progressBar.background
		MatchedCharacters({ fg = hsl("#2aaaff") }), -- editorSuggestWidget.highlightForeground
		Icon({ fg = "#cccccc" }), -- icon.foreground
		Description({ fg = colors.gray3 }), -- descriptionForeground
		Hint({ MatchedCharacters }), -- for the hint letter in options, e.g., the q in [q]uickfix
		Question({ fg = colors.dark_blue }), -- |hit-enter| prompt and yes/no questions
		-- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		-- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		-- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		UnnecessaryCode({ fg = "#729db4" }),

		ScrollbarSlider({ bg = hsl("#434343") }), -- the slider on the scrollbar (scrollbarSlider.activeBackground)
		ScrollbarSliderHover({ bg = hsl("#4f4f4f") }), -- scrollbarSlider.hoverBackground

		--
		--
		--
		PeekViewBorder({ fg = "#3794ff" }),
		PeekViewNormal({ bg = colors.background }), -- peekViewEditor.background
		PeekViewTitle({ fg = colors.white }), -- peekViewTitleLabel.foreground
		PeekViewCursorLine({ bg = colors.black3 }),
		PeekViewMatchHighlight({ bg = "#5d4616" }), -- peekViewEditor.matchHighlightBackground

		--
		-- Git diff
		--
		DiffTextAdded({ bg = hsl("#214d29") }), -- diffEditor.insertedTextBackground (DiffLineAdded as its background)
		DiffTextDeleted({ bg = hsl("#712928") }), -- diffEditor.removedTextBackground (DiffLineDeleted as its background)
		DiffTextChanged({ bg = hsl("#0E2FDC") }),
		DiffLineAdded({ bg = hsl("#203424") }), -- diffEditor.insertedLineBackground
		DiffLineDeleted({ bg = hsl("#442423") }), -- diffEditor.removedLineBackground
		DiffLineChanged({ bg = hsl("#0e2f44") }),
		DiffAdd({ DiffLineAdded }), -- Diff mode: Added line |diff.txt|
		DiffChange({ DiffLineChanged }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ DiffLineDeleted }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ DiffTextChanged }), -- Diff mode: Changed text within a changed line |diff.txt|

		--
		-- Quickfix list (can be used to define qf syntax, e.g.,
		-- ~/.config/nvim/syntax/qf.vim)
		QfFileName({ fg = colors.white }),
		QfSelection({ bg = hsl("#3a3d41") }), -- terminal.inactiveSelectionBackground
		QfText({ fg = hsl("#bbbbbb") }), -- normal text in quickfix list (peekViewResult.lineForeground)
		QuickFixLine({ QfSelection }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

		--
		-- Inline hints
		--
		InlayHint({ fg = hsl("#969696"), bg = hsl("#242424") }), -- editorInlayHint.foreground/background
		InlayHintType({ InlayHint }), -- editorInlayHint.typeBackground/typeForeground

		--
		-- Cursor
		--
		CursorLine({ bg = colors.cursor }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn({ bg = colors.black3 }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		ColorColumn({ bg = colors.black3 }), -- Columns set with 'colorcolumn'
		Conceal({ fg = colors.gray2 }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ fg = colors.background, bg = colors.foreground }), -- Character under the cursor
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal

		--
		-- Search
		--
		Search({ bg = "#623315" }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		IncSearch({ bg = "#9e6a03" }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting

		--
		--
		--
		Normal({ bg = colors.background, fg = colors.foreground }), -- Normal text
		NormalNC({ fg = colors.gray }), -- normal text in non-current windowsversion
		Whitespace({ fg = colors.gray }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		NonText({ fg = colors.gray }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		SpecialKey({ NonText }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		EndOfBuffer({ fg = Normal.bg }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		MatchParen({ bg = colors.gray, gui = "bold, underline" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

		--
		-- Visual
		--
		Visual({ bg = hsl("#353537") }), -- Visual mode selection
		-- VisualNOS({}), -- Visual mode selection when vim is "Not Owning the Selection".

		--
		-- Line numbers
		--
		LineNr({ fg = colors.light2 }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr({ fg = colors.faded_orange }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		LineNrAbove({ fg = colors.dark4 }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = colors.dark4 }), -- Line number for when the 'relativenumber' option is set, below the cursor line

		--
		-- Status line
		--
		StatusLine({ bg = colors.black4 }), -- Status line of current window
		StatusLineNC({ bg = colors.black4, fg = colors.gray }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		--
		-- Tab line
		--
		TabLine({ fg = colors.gray, bg = colors.black4, gui = "underline", sp = colors.dark1 }), -- Tab pages line, not active tab page label
		TabLineFill({ fg = "NONE", bg = colors.black4, gui = "underline", sp = colors.dark1 }), -- Tab pages line, where there are no labels
		TabLineSel({ fg = colors.white, bg = Normal.bg, gui = "bold, underline", sp = colors.dark1 }), -- Tab pages line, active tab page label
		TabBorder({ fg = colors.dark1 }), -- tab.borders

		--
		-- Window [bar]
		--
		WinBar({ bg = Normal.bg, fg = colors.light4 }), -- Window bar of current window
		WinBarNC({ bg = Normal.bg, fg = colors.light4 }), -- Window bar of not-current windows
		WinSeparator({ fg = colors.dark3 }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		VirtSplit({ WinSeparator }), -- deprecated and use WinSeparator instead
		VertSplit({ WinSeparator }), -- Column separating vertically split windows

		--
		-- Popup menu
		--
		Pmenu({ fg = Normal.fg, bg = Normal.bg }), -- Popup menu: Normal item.
		PmenuSel({ fg = colors.light0, bg = colors.bright_blue }), -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = Normal.bg }), -- Popup menu: Scrollbar.
		PmenuThumb({ ScrollbarSlider }), -- Popup menu: Thumb of the scrollbar.
		WildMenu({ PmenuSel }), -- Current match in 'wildmenu' completion

		--
		-- Float
		--
		NormalFloat({ Pmenu }), -- Normal text in floating windows.
		FloatBorder({ fg = colors.dark4 }), -- Border of floating windows.
		FloatTitle({ fg = colors.light4 }), -- Title of floating windows.

		--
		-- Spell
		--
		SpellBad({ gui = "undercurl", sp = error_red }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ gui = "undercurl", sp = warn_yellow }), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ gui = "undercurl", sp = info_blue }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ gui = "undercurl", sp = info_blue }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

		--
		-- Messages
		--
		ErrorMsg({ fg = error_red }), -- Error messages on the command line
		WarningMsg({ fg = warn_yellow }), -- Warning messages
		ModeMsg({ fg = Normal.fg }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = Normal.fg }), -- Area for messages and cmdline
		MoreMsg({ fg = Normal.fg }), -- |more-prompt|
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'

		--
		-- Fold
		--
		Folded({ bg = colors.dark1 }), -- Line used for closed folds
		FoldColumn({ LineNr }), -- 'foldcolumn'
		CursorLineFold({ CursorLineNr }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		SignColumn({ bg = Normal.bg }), -- Column where |signs| are displayed
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line

		--
		--
		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.
		Comment({ fg = colors.comment, gui = "italic" }), -- Any comment

		Constant({ fg = colors.light0 }), -- (*) Any constant
		String({ fg = colors.green }), --   A string constant: "this is a string"
		Character({ fg = colors.green }), --   A character constant: 'c', '\n'
		Number({ fg = colors.neutral_blue }), --   A number constant: 234, 0xff
		Boolean({ fg = colors.neutral_blue }), --   A boolean constant: TRUE, false
		Float({ fg = colors.neutral_blue }), --   A floating point constant: 2.3e10

		Identifier({ fg = colors.light0 }), -- (*) Any variable name
		Function({ fg = colors.light0 }), --   Function name (also: methods for classes)

		Statement({ fg = colors.light0_hard }), -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		-- Operator       { }, --   "sizeof", "+", "*", etc.
		-- Keyword        { }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc({ fg = colors.bright_red }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = colors.bright_red }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ fg = colors.light0 }), -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		-- Delimiter      { }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		--
		-- Diagnostics
		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = error_red }),
		DiagnosticWarn({ fg = warn_yellow }),
		DiagnosticInfo({ fg = info_blue }),
		DiagnosticHint({ fg = hint_gray }),
		DiagnosticOk({ fg = ok_green }),
		DiagnosticVirtualTextError({ DiagnosticError, bg = "#332323" }),
		DiagnosticVirtualTextWarn({ DiagnosticWarn, bg = "#2f2c1b" }),
		DiagnosticVirtualTextInfo({ DiagnosticInfo, bg = "#212a35" }),
		DiagnosticVirtualTextHint({ DiagnosticHint, bg = colors.black }),
		DiagnosticVirtualTextOk({ DiagnosticOk, bg = "#233323" }),
		DiagnosticUnderlineError({ gui = "undercurl", sp = error_red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = warn_yellow }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = info_blue }),
		DiagnosticUnderlineHint({ gui = "undercurl", sp = hint_gray }),
		DiagnosticUnderlineOk({ gui = "undercurl", sp = ok_green }),
		DiagnosticFloatingError({ DiagnosticError }),
		DiagnosticFloatingWarn({ DiagnosticWarn }),
		DiagnosticFloatingInfo({ DiagnosticInfo }),
		DiagnosticFloatingHint({ DiagnosticHint }),
		DiagnosticFloatingOk({ DiagnosticOk }),
		DiagnosticSignError({ DiagnosticError }),
		DiagnosticSignWarn({ DiagnosticWarn }),
		DiagnosticSignInfo({ DiagnosticInfo }),
		DiagnosticSignHint({ DiagnosticHint }),
		DiagnosticSignOk({ DiagnosticOk }),
		DiagnosticUnnecessary({ fg = colors.light_blue, gui = "undercurl" }),
		DiagnosticDeprecated({ fg = colors.dark3, gui = "strikethrough" }),

		--
		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109
		--
		-- Use the capture names directly as the highlight groups.
		-- To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

		-- Identifiers
		sym("@variable")({ fg = colors.light0 }), -- various variable names
		sym("@variable.builtin")({ fg = colors.neutral_purple }), -- built-in variable names (e.g. `this`)
		sym("@variable.parameter")({ fg = colors.light0 }), -- parameters of a function
		sym("@variable.parameter.builtin")({ sym("@variable.parameter") }), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")({ fg = colors.light0 }), -- object and struct fields

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		sym("@keyword")({ fg = colors.bright_purple }), -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		sym("@namespace")({ fg = colors.faded_red }), -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
