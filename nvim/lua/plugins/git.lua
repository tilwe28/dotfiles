-- Git
return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame = true,
	},

	-- NOTE: May want to add keymaps for extra git functionality
}
