-- local lush = require("lush")
-- local markdown = require("minimal_high_contrast.languages.markdown")

local M = {}

function M.setup()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"
	vim.g.colors_name = "minimal_high_contrast"

	-- return lush.merge({ theme, markdown })
	local theme = require("minimal_high_contrast.theme")
	return theme
end

return M
