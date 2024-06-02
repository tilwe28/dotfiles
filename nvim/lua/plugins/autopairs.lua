return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			local autotag_status_ok, autotag = pcall(require, "nvim-ts-autotag")
			if not autotag_status_ok then
				return
			end

			autotag.setup({})
		end,
	},
}
