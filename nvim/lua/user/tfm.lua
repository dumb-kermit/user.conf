local M = {
	"rolv-apneseth/tfm.nvim",
	cmd = "Tfm",
	opts = {
		-- TFM to use
		-- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
		file_manager = "lf",
		-- Replace netrw entirely
		-- Default: false
		replace_netrw = true,
		-- Enable creation of commands
		-- Default: false
		-- Commands:
		--   Tfm: selected file(s) will be opened in the current window
		--   TfmSplit: selected file(s) will be opened in a horizontal split
		--   TfmVsplit: selected file(s) will be opened in a vertical split
		--   TfmTabedit: selected file(s) will be opened in a new tab page
		enable_cmds = true,
		-- Custom keybindings only applied within the TFM buffer
		-- Default: {}
		keybindings = {
			["<ESC>"] = "q",
			-- Override the open mode (i.e. vertical/horizontal split, new tab)
			-- Tip: you can add an extra `<CR>` to the end of these to immediately open the selected file(s) (assuming the TFM uses `enter` to finalise selection)
			["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
			["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
			["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
		},
		-- Customise UI. The below options are the default
		ui = {
			border = "shadow",
			height = 0.65,
			width = 0.65,
			x = 0.5,
			y = 0.5,
		},
	},
	keys = {
		-- Make sure to change these keybindings to your preference,
		-- and remove the ones you won't use
		{
			"<F4>",
			":Tfm<CR>",
			desc = "INIT LF",
		},
		{
			"<leader>lh",
			":TfmSplit<CR>",
			desc = "INIT LF-HSPLIT",
		},
		{
			"<leader>lv",
			":TfmVsplit<CR>",
			desc = "INIT LF-VSPLIT",
		},
		{
			"<leader>lt",
			":TfmTabedit<CR>",
			desc = "INIT LF-NEWTAB",
		},
	},
}

function M.config()
	require("tfm").setup({
		-- TFM to use
		-- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
		file_manager = "yazi",
		-- Replace netrw entirely
		-- Default: false
		replace_netrw = true,
		-- Enable creation of commands
		-- Default: false
		-- Commands:
		--   Tfm: selected file(s) will be opened in the current window
		--   TfmSplit: selected file(s) will be opened in a horizontal split
		--   TfmVsplit: selected file(s) will be opened in a vertical split
		--   TfmTabedit: selected file(s) will be opened in a new tab page
		enable_cmds = true,
		-- Custom keybindings only applied within the TFM buffer
		-- Default: {}
		keybindings = {
			["<ESC>"] = "q",
			-- Override the open mode (i.e. vertical/horizontal split, new tab)
			-- Tip: you can add an extra `<CR>` to the end of these to immediately open the selected file(s) (assuming the TFM uses `enter` to finalise selection)
			["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
			["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
			["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
		},
		-- Customise UI. The below options are the default
		ui = {
			border = "none",
			height = 1.0,
			width = 1.0,
			x = 0.5,
			y = 0.5,
		},
	})

	vim.api.nvim_set_keymap("n", "<F4>", "", {
		noremap = true,
		callback = require("tfm").open,
	})
end
return M
