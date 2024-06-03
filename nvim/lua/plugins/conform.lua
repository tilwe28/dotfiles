return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},

	config = function()
		local conform_status_ok, conform = pcall(require, "conform")
		if not conform_status_ok then
			return
		end

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				cpp = { "clang-format" },

				-- web
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
			},
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set("n", "<Leader>ff", function()
			conform.format({
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			})
		end, { desc = "Format current buffer with conform" })
	end,
}
