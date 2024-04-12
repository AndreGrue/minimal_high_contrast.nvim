-- language specific higlights
local lush = require("lush")
local colors = require("minimal_high_contrast.colors")

local theme = lush(function()
	return {
		markdownItalic({ fg = colors.light0, gui = "italic" }),
		markdownH1({ fg = colors.orange, bg = colors.dark0, gui = "bold" }),
		markdownH2({ markdownH1 }),
		markdownH3({ markdownH1 }),
		markdownH4({ markdownH1 }),
		markdownH5({ markdownH1 }),
		markdownH6({ markdownH1 }),
		markdownCode({ fg = colors.dark_green }),
		markdownCodeBlock({ fg = colors.dark_green }),
		markdownCodeDelimiter({ fg = colors.dark_green }),
		markdownBlockquote({ fg = colors.gray }),
		markdownListMarker({ fg = colors.gray }),
		markdownOrderedListMarker({ fg = colors.gray }),
		markdownRule({ fg = colors.gray }),
		markdownHeadingRule({ fg = colors.gray }),
		markdownUrlDelimiter({ fg = colors.dark3 }),
		markdownLinkDelimiter({ fg = colors.dark3 }),
		markdownLinkTextDelimiter({ fg = colors.dark3 }),
		markdownHeadingDelimiter({ fg = colors.orange }),
		markdownUrl({ fg = colors.purple }),
		markdownUrlTitleDelimiter({ fg = colors.neutral_blue }),
		markdownLinkText({ fg = colors.gray, gui = "underline" }),
		markdownIdDeclaration({ markdownLinkText }),
	}
end)

return theme
