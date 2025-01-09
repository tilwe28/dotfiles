return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "deep",
			transparent = "true",
			lualine = {
				transparent = "true",
			},
		},
		config = function(_, opts)
			local onedark_status_ok, onedark = pcall(require, "onedark")
			if not onedark_status_ok then
				return
			end
			onedark.setup(opts)
			vim.cmd.colorscheme("onedark")

			-- custom colors
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#2c303a" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1e28" })
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1a1e28" })
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
		config = function(_, opts)
			local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")
			if not tokyonight_status_ok then
				return
			end
			tokyonight.setup(opts)
			-- vim.cmd.colorscheme("tokyonight")
		end,
	},
}
