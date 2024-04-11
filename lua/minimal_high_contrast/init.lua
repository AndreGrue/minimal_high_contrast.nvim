local M = {}

function M.setup()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"
	vim.g.colors_name = "minimal_high_contrast"

	local theme = require("minimal_high_contrast.theme")
	return theme
end

return M
