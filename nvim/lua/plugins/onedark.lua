return {
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
	end,
}
