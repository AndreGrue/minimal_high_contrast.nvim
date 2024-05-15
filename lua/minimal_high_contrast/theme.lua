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
local hint_gray = colors.gray2
local ok_green = colors.neutral_green
local selection_blue = colors.bright_blue

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

		SelectionHighlightBackground({ bg = hsl("#343a41") }), -- editor.selectionHighlightBackground
		LightBulb({ fg = hsl("#ffcc00") }), -- editorLightBulb.foreground
		CodeLens({ fg = hsl("#999999") }), -- editorCodeLens.foreground
		Breadcrumb({ fg = hsl("#a9a9a9"), bg = Normal.bg }), -- breadcrumb.foreground/background
		Directory({ fg = colors.light0 }), -- Directory names (and other special names in listings)
		GhostText({ fg = hsl("#6b6b6b") }), -- editorGhostText.foreground
		ProgressBar({ fg = hsl("#0078d4") }), -- progressBar.background
		MatchedCharacters({ fg = hsl("#2aaaff") }), -- editorSuggestWidget.highlightForeground
		Icon({ fg = hsl("#cccccc") }), -- icon.foreground

		Description({ fg = colors.gray3 }), -- descriptionForeground
		Title({ fg = colors.light0_hard, gui = "bold" }), -- Titles for output from ":set all", ":autocmd" etc.
		Hint({ MatchedCharacters }), -- for the hint letter in options, e.g., the q in [q]uickfix
		Question({ fg = colors.light0_hard }), -- |hit-enter| prompt and yes/no questions
		-- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		-- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		-- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		UnnecessaryCode({ fg = hsl("#729db4") }),

		ScrollbarSlider({ bg = hsl("#434343") }), -- the slider on the scrollbar (scrollbarSlider.activeBackground)
		ScrollbarSliderHover({ bg = hsl("#4f4f4f") }), -- scrollbarSlider.hoverBackground

		--
		--
		--
		PeekViewBorder({ fg = hsl("#3794ff") }),
		PeekViewNormal({ bg = colors.background }), -- peekViewEditor.background
		PeekViewTitle({ fg = colors.white }), -- peekViewTitleLabel.foreground
		PeekViewCursorLine({ bg = colors.black3 }),
		PeekViewMatchHighlight({ bg = hsl("#5d4616") }), -- peekViewEditor.matchHighlightBackground

		--
		-- Git diff
		--
		GutterGitAdded({ fg = hsl("#2ea043") }), -- editorGutter.addedBackground
		GutterGitDeleted({ fg = hsl("#f85149") }), -- editorGutter.deletedBackground
		GutterGitModified({ fg = hsl("#0078d4") }), -- editorGutter.modifiedBackground
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
		diffAdded({ GutterGitAdded }),
		diffRemoved({ GutterGitDeleted }),
		diffChanged({ GutterGitModified }),

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
		Search({ bg = hsl("#623315") }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		IncSearch({ bg = hsl("#9e6a03") }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
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
		Folded({ bg = colors.dark0 }), -- Line used for closed folds
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
		Comment({ fg = colors.comment, gui = "italic" }), -- Any comment

		Constant({ fg = colors.light0 }), -- (*) Any constant
		String({ fg = colors.neutral_green }), --   A string constant: "this is a string"
		Character({ String }), --   A character constant: 'c', '\n'
		Number({ fg = colors.neutral_blue }), --   A number constant: 234, 0xff
		Boolean({ Number }), --   A boolean constant: TRUE, false
		Float({ Number }), --   A floating point constant: 2.3e10

		Identifier({ fg = colors.light0 }), -- (*) Any variable name
		Function({ fg = colors.warm_yellow }), --   Function name (also: methods for classes)

		Statement({ fg = colors.neutral_orange }), -- (*) Any statement
		Conditional({ Statement }), --   if, then, else, endif, switch, etc.
		Repeat({ Statement }), --   for, do, while, etc.
		Label({ Statement }), --   case, default, etc.
		Operator({ fg = colors.light0 }), --   "sizeof", "+", "*", etc.
		Keyword({ Statement }), --   any other keyword
		Exception({ Statement }), --   try, catch, throw

		PreProc({ fg = colors.faded_yellow }), -- (*) Generic Preprocessor
		Include({ PreProc }), --   Preprocessor #include
		Define({ PreProc }), --   Preprocessor #define
		Macro({ PreProc }), --   Same as Define
		PreCondit({ PreProc }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = colors.neutral_orange }), -- (*) int, long, char, etc.
		StorageClass({ Statement }), --   static, register, volatile, etc.
		Structure({ Statement }), --   struct, union, enum, etc.
		Typedef({ Statement }), --   A typedef

		Special({ fg = colors.light0 }), -- (*) Any special symbol
		SpecialChar({ Special }), --   Special character in a constant
		Tag({ Special }), --   You can use CTRL-] on this
		Delimiter({ Special }), --   Character that needs attention
		SpecialComment({ Special }), --   Special things inside a comment (e.g. '\n')
		Debug({ Special }), --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = error_red }), -- Any erroneous construct
		Todo({ fg = colors.background, bg = colors.yellow, gui = "bold" }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		--
		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ SelectionHighlightBackground }), -- Used for highlighting "text" references
		LspReferenceRead({ SelectionHighlightBackground }), -- Used for highlighting "read" references
		LspReferenceWrite({ SelectionHighlightBackground }), -- Used for highlighting "write" references
		LspCodeLens({ CodeLens }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator({}), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ MatchedCharacters }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
		LspInlayHint({ InlayHint }),

		--
		-- Diagnostics
		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = error_red }),
		DiagnosticWarn({ fg = warn_yellow }),
		DiagnosticInfo({ fg = info_blue }),
		DiagnosticHint({ fg = hint_gray }),
		DiagnosticOk({ fg = ok_green }),
		DiagnosticVirtualTextError({ DiagnosticError, bg = hsl("#332323") }),
		DiagnosticVirtualTextWarn({ DiagnosticWarn, bg = hsl("#2f2c1b") }),
		DiagnosticVirtualTextInfo({ DiagnosticInfo, bg = hsl("#212a35") }),
		DiagnosticVirtualTextHint({ DiagnosticHint, bg = colors.black }),
		DiagnosticVirtualTextOk({ DiagnosticOk, bg = hsl("#233323") }),
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
		DiagnosticUnnecessary({ --[[ fg = colors.light_blue, ]]
			gui = "undercurl",
		}),
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
		sym("@variable.builtin")({ fg = colors.faded_purple }), -- built-in variable names (e.g. `this`)
		sym("@variable.parameter")({ fg = colors.light0 }), -- parameters of a function
		sym("@variable.parameter.builtin")({ sym("@variable.parameter") }), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")({ fg = colors.light0 }), -- object and struct fields

		sym("@constant")({ Constant }), -- constant identifiers
		sym("@constant.builtin")({ Constant }), -- built-in constant values
		sym("@constant.macro")({ Constant }), -- constants defined by the preprocessor

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo

		--
		-- Comments
		sym("@comment")({ Comment }), -- line and block comments
		sym("@comment.documentation")({ sym("@comment") }), -- comments documenting code
		sym("@comment.error")({ fg = error_red }), -- error-type comments (e.g., `DEPRECATED:`)
		sym("@comment.warning")({ fg = warn_yellow }), -- warning-type comments (e.g., `WARNING:`, `FIX:`)
		sym("@comment.hint")({ fg = hint_gray }), -- note-type comments (e.g., `NOTE:`)
		sym("@comment.info")({ fg = info_blue }), -- info-type comments
		sym("@comment.todo")({ Todo }), -- todo-type comments (e.g-, `TODO:`, `WIP:`)

		-- modules
		sym("@module")({ fg = colors.light0 }), -- modules or namespaces
		sym("@module.builtin")({ sym("@module") }), -- built-in modules or namespaces
		sym("@module.cpp")({ sym("@module") }), -- built-in modules or namespaces

		-- Literals
		sym("@string")({ String }), -- string literals
		sym("@string.documentation")({ Comment }), -- string documenting code (e.g. Python docstrings)
		sym("@string.regexp")({ String }), -- regular expressions
		sym("@string.escape")({ String }), -- escape sequences
		sym("@string.special")({ SpecialChar }), -- other special strings (e.g. dates)
		sym("@string.special.symbol")({ sym("@string.special") }), -- symbols or atoms
		sym("@string.special.url")({ sym("@string.special") }), -- URIs (e.g. hyperlinks), it's url outside markup
		sym("@string.special.path")({ sym("@string.special") }), -- filenames

		sym("@character")({ Character }), -- character literals
		sym("@character.special")({ SpecialChar }), -- special characters (e.g. wildcards)

		sym("@boolean")({ Boolean }), -- boolean literals
		sym("@number")({ Number }), -- numeric literals
		sym("@number.float")({ Float }), -- floating-point number literals
		sym("@float")({ Float }), -- Floats

		-- Types
		sym("@type")({ fg = colors.light0 }), -- type or class definitions and annotations
		sym("@type.builtin")({ Type }), -- built-in types
		sym("@type.definition")({ fg = colors.light0 }), -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

		sym("@attribute")({ fg = colors.light0 }), -- attribute annotations (e.g. Python decorators)
		sym("@attribute.builtin")({ sym("@attribute") }), -- builtin annotations (e.g. `@property` in Python)
		sym("@property")({ fg = colors.light0 }), -- the key in key/value pairs
		sym("@_parent")({ fg = colors.faded_purple }), -- the key in key/value pairs

		-- Function
		sym("@function")({ Function }), -- function definitions
		sym("@function.builtin")({ Function }), -- built-in functions
		sym("@function.call")({ Function }), -- function calls
		sym("@function.macro")({ Function }), -- preprocessor macros
		sym("@function.method")({ sym("@function") }), -- method definitions
		sym("@function.method.call")({ sym("@function.call") }), -- method calls

		sym("@constructor")({ Function }), -- constructor calls and definitions
		sym("@operator")({ Operator }), -- symbolic operators (e.g. `+` / `*`)

		-- Keyword
		sym("@keyword")({ Keyword }), -- keywords not fitting into specific categories
		sym("@keyword.import")({ Include }), -- keywords for including modules (e.g. `import` / `from` in Python)
		sym("@keyword.directive")({ PreProc }), -- various preprocessor directives & shebangs
		sym("@keyword.directive.define")({ sym("@keyword.directive") }), -- preprocessor definition directives
		sym("@keyword.coroutine")({ Function }), -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function")({ Function }), -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		sym("@keyword.operator")({ sym("@operator") }), -- operators that are English words (e.g. `and` / `or`)
		sym("@keyword.type")({ Structure }), -- keywords describing composite types (e.g. `struct`, `enum`)
		sym("@keyword.modifier")({ StorageClass }), -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
		sym("@keyword.repeat")({ Repeat }), -- keywords related to loops (e.g. `for` / `while`)
		sym("@keyword.return")({ Statement }), --  keywords like `return` and `yield`
		sym("@keyword.debug")({ Debug }), -- keywords related to debugging
		sym("@keyword.exception")({ Exception }), -- keywords related to exceptions (e.g. `throw` / `catch`)
		sym("@keyword.conditional")({ Conditional }), -- keywords related to conditionals (e.g. `if` / `else`)
		sym("@keyword.conditional.ternary")({ sym("@operator") }), -- ternary operator (e.g. `?` / `:`)

		-- Punctuation
		sym("@punctuation")({ fg = colors.light0 }), -- delimiters (e.g. `;` / `.` / `,`)
		sym("@punctuation.delimiter")({ sym("@punctuation") }), -- delimiters (e.g. `;` / `.` / `,`)
		sym("@punctuation.bracket")({ sym("@punctuation") }), -- brackets (e.g. `()` / `{}` / `[]`)
		sym("@punctuation.special")({ sym("@punctuation") }), -- special symbols (e.g. `{}` in string interpolation)

		--
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym("@namespace")({ }), -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
		--

		--
		-- Markup
		--
		sym("@markup.strong")({ fg = colors.foreground, gui = "bold" }), -- bold text
		sym("@markup.italic")({ fg = colors.foreground, gui = "italic" }), -- text with emphasis
		sym("@markup.strikethrough")({ fg = colors.foreground, gui = "strikethrough" }), -- strikethrough text
		sym("@markup.underline")({ fg = colors.foreground, gui = "underline" }), -- underlined text (only for literal underline markup!)

		sym("@markup.heading")({ Title }), -- headings, titles (including markers)
		sym("@markup.heading.1")({ sym("@markup.heading") }),
		sym("@markup.heading.2")({ sym("@markup.heading") }),
		sym("@markup.heading.3")({ sym("@markup.heading") }),
		sym("@markup.heading.4")({ sym("@markup.heading") }),
		sym("@markup.heading.5")({ sym("@markup.heading") }),
		sym("@markup.heading.6")({ sym("@markup.heading") }),

		sym("@markup.quote")({ fg = colors.green }), -- block quotes
		sym("@markup.math")({ fg = colors.blue_green }), -- math environments (e.g. `$ ... $` in LaTeX)

		sym("@markup.link")({ fg = colors.purple }), -- text references, footnotes, citations, etc.
		sym("@markup.link.label")({ sym("@markup.link") }), -- non-url links
		sym("@markup.link.url")({ sym("@markup.link") }), -- url links in markup

		sym("@markup.raw")({ fg = colors.brown }), -- literal or verbatim text (e.g., inline code)
		sym("@markup.raw.block")({ fg = colors.light4 }), -- literal or verbatim text as a stand-alone block

		sym("@markup.list")({ fg = colors.bright_blue }), -- list markers
		-- sym("@markup.list.checked") { }, -- checked todo-style list markers
		-- sym("@markup.list.unchecked") { }, -- unchecked todo-style list markers

		--
		-- LSP semantic tokens
		--
		-- The help page :h lsp-semantic-highlight
		-- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
		-- Token types and modifiers are described here: http://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
		sym("@lsp.type.namespace")({ sym("@module") }),
		sym("@lsp.type.type")({ sym("@type") }),
		sym("@lsp.type.class")({ sym("@type") }),
		sym("@lsp.type.enum")({ sym("@type") }),
		sym("@lsp.type.interface")({ sym("@type") }),
		sym("@lsp.type.struct")({ sym("@type") }),
		sym("@lsp.type.typeParameter")({ sym("@type.definition") }),
		sym("@lsp.type.parameter")({ sym("@variable.parameter") }),
		sym("@lsp.type.variable")({ sym("@variable") }),
		sym("@lsp.type.property")({ sym("@property") }),
		sym("@lsp.type.enumMember")({ fg = colors.light0 }),
		sym("@lsp.type.event")({ sym("@type") }),
		sym("@lsp.type.function")({ sym("@function") }),
		sym("@lsp.type.method")({ sym("@function") }),
		sym("@lsp.type.macro")({ sym("@constant.macro") }),
		sym("@lsp.type.keyword")({ sym("@keyword") }),
		sym("@lsp.type.comment")({ sym("@comment") }),
		sym("@lsp.type.string")({ sym("@string") }),
		sym("@lsp.type.number")({ sym("@number") }),
		sym("@lsp.type.regexp")({ sym("@string.regexp") }),
		sym("@lsp.type.operator")({ sym("@operator") }),
		sym("@lsp.type.decorator")({ sym("@attribute") }),
		sym("@lsp.type.escapeSequence")({ sym("@string.escape") }),
		sym("@lsp.type.formatSpecifier")({ fg = colors.light0 }),
		sym("@lsp.type.builtinType")({ sym("@type.builtin") }),
		sym("@lsp.type.typeAlias")({ sym("@type.definition") }),
		sym("@lsp.type.unresolvedReference")({ gui = "undercurl", sp = error_red }),
		sym("@lsp.type.lifetime")({ sym("@keyword.modifier") }),
		sym("@lsp.type.generic")({ sym("@variable") }),
		sym("@lsp.type.selfKeyword")({ sym("@variable.builtin") }),
		sym("@lsp.type.selfTypeKeyword")({ sym("@variable.builtin") }),
		sym("@lsp.type.deriveHelper")({ sym("@attribute") }),
		sym("@lsp.type.modifier")({ sym("@keyword.modifier") }),
		sym("@lsp.typemod.type.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.typeAlias.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.class.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.variable.defaultLibrary")({ sym("@variable.builtin") }),
		sym("@lsp.typemod.function.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.method.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.macro.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.struct.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.enum.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.enumMember.defaultLibrary")({ sym("@constant.builtin") }),
		sym("@lsp.typemod.variable.readonly")({ sym("@type") }),
		sym("@lsp.typemod.variable.callable")({ sym("@function") }),
		sym("@lsp.typemod.variable.static")({ sym("@constant") }),
		sym("@lsp.typemod.property.readonly")({ sym("@property") }),
		sym("@lsp.typemod.keyword.async")({ sym("@keyword.coroutine") }),
		sym("@lsp.typemod.keyword.injected")({ sym("@keyword") }),
		-- Set injected highlights. Mainly for Rust doc comments and also works for
		-- other lsps that inject tokens in comments.
		-- Ref: https://github.com/folke/tokyonight.nvim/pull/340
		sym("@lsp.typemod.operator.injected")({ sym("@operator") }),
		sym("@lsp.typemod.string.injected")({ sym("@string") }),
		sym("@lsp.typemod.variable.injected")({ sym("@variable") }),

		--
		-- nvim-cmp
		--
		CmpItemAbbrDeprecated({ fg = colors.gray3, bg = "NONE", gui = "strikethrough" }),
		CmpItemAbbrMatch({ MatchedCharacters, bg = "NONE" }),
		CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatch }),
		CmpItemMenu({ Description }),
		CmpItemKindText({ fg = "#cccccc", bg = "NONE" }),
		CmpItemKindMethod({ fg = "#b180d7", bg = "NONE" }),
		CmpItemKindFunction({ CmpItemKindMethod }),
		CmpItemKindConstructor({ CmpItemKindFunction }),
		CmpItemKindField({ fg = "#75beff", bg = "NONE" }),
		CmpItemKindVariable({ CmpItemKindField }),
		CmpItemKindClass({ fg = "#ee9d28", bg = "NONE" }),
		CmpItemKindInterface({ CmpItemKindField }),
		CmpItemKindModule({ CmpItemKindText }),
		CmpItemKindProperty({ CmpItemKindText }),
		CmpItemKindUnit({ CmpItemKindText }),
		CmpItemKindValue({ CmpItemKindText }),
		CmpItemKindEnum({ CmpItemKindClass }),
		CmpItemKindKeyword({ CmpItemKindText }),
		CmpItemKindSnippet({ CmpItemKindText }),
		CmpItemKindColor({ CmpItemKindText }),
		CmpItemKindFile({ CmpItemKindText }),
		CmpItemKindReference({ CmpItemKindText }),
		CmpItemKindFolder({ CmpItemKindText }),
		CmpItemKindEnumMember({ CmpItemKindField }),
		CmpItemKindConstant({ CmpItemKindText }),
		CmpItemKindStruct({ CmpItemKindText }),
		CmpItemKindEvent({ CmpItemKindClass }),
		CmpItemKindOperator({ CmpItemKindText }),
		CmpItemKindTypeParameter({ CmpItemKindText }),
		-- Predefined for the winhighlight config of cmp float window
		SuggestWidgetBorder({ FloatBorder }),
		SuggestWidgetSelect({ bg = selection_blue }),

		--
		-- Gitsigns
		--
		GitSignsAdd({ GutterGitAdded }),
		GitSignsChange({ GutterGitModified }),
		GitSignsDelete({ GutterGitDeleted }),
		GitSignsAddNr({ GitSignsAdd }),
		GitSignsChangeNr({ GitSignsChange }),
		GitSignsDeleteNr({ GitSignsDelete }),
		GitSignsAddLn({ DiffAdd }),
		GitSignsChangeLn({ DiffChange }),
		GitSignsDeleteLn({ DiffDelete }),
		GitSignsAddInline({ DiffTextAdded }),
		GitSignsChangeInline({ DiffTextChanged }),
		GitSignsDeleteInline({ DiffTextDeleted }),

		--
		-- Telescope
		--
		TelescopeBorder({ FloatBorder }),
		TelescopePromptBorder({ TelescopeBorder }),
		TelescopeResultsBorder({ TelescopePromptBorder }),
		TelescopePreviewBorder({ TelescopePromptBorder }),
		TelescopeSelection({ PmenuSel }),
		TelescopeSelectionCaret({ TelescopeSelection }),
		TelescopeMultiIcon({ fg = colors.blue_green }),
		TelescopeMatching({ CmpItemAbbrMatch }),
		TelescopeNormal({ Normal }),
		TelescopePromptPrefix({ Icon }),

		--
		-- nvim-ufo
		--
		UfoFoldedFg({ fg = Normal.foreground }),
		UfoFoldedBg({ bg = Folded.background }),
		UfoPreviewBorder({ PeekViewBorder }),
		UfoPreviewNormal({ PeekViewNormal }),
		UfoPreviewCursorLine({ PeekViewCursorLine }),
		UfoCursorFoldedLine({ bg = "#2F3C48", gui = "bold, italic" }),
		UfoPreviewSbar({ PeekViewNormal }),
		UfoPreviewThumb({ bg = "#394a4b" }),
		UfoFoldedEllipsis({ fg = "#989ca0" }),

		--
		-- nvim-bqf
		--
		BqfPreviewFloat({ PeekViewNormal }),
		BqfPreviewBorder({ PeekViewBorder }),
		BqfPreviewTitle({ PeekViewTitle }),
		BqfPreviewSbar({ PmenuSbar }),
		BqfPreviewThumb({ PmenuThumb }),
		BqfPreviewCursor({ Cursor }),
		BqfPreviewCursorLine({ PeekViewCursorLine }),
		BqfPreviewRange({ PeekViewMatchHighlight }),
		BqfPreviewBufLabel({ Description }),
		BqfSign({ fg = colors.blue_green }),

		--
		-- Harpoon
		--
		HarpoonBorder({ TelescopeBorder }),
		HarpoonWindow({ TelescopeNormal }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
