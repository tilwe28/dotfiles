local config = function()
	local which_key_status_ok, which_key = pcall(require, "which-key")
	if not which_key_status_ok then
		return
	end
	which_key.add({
		{ "<Leader>c", desc = "Code" },
		{ "<Leader>g", desc = "Git" },
		{ "<Leader>r", desc = "Rename" },
		{ "<Leader>s", desc = "Search" },
		{ "<Leader>W", desc = "Workspace" },
		{ "<Leader>x", desc = "Close" },
		{ "<Leader>n", desc = "Noice" },
	})
end

return {
	"folke/which-key.nvim",
	lazy = false,
	opts = {},
	config = config,
}
