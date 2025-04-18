-- tailwind-tools.lua
return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		conceal = {
			enabled = true,
		},
	}, -- your configuration
}
