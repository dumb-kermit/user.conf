local M = {
	"wfxr/minimap.vim",
	event = "BufReadPost",
}

function M.config()
	vim.g.minimap_width = 10
	vim.g.minimap_auto_start = 1
	vim.g.minimap_auto_start_win_enter = 1
end
return M
