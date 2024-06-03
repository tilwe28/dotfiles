return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,

	config = function(_, _)
		local todo_status_ok, todo = pcall(require, "todo-comments")
		if not todo_status_ok then
			return
		end
		todo.setup()
	end,
}
