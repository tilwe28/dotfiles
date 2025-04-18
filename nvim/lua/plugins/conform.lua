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
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				black = {
					prepend_args = { "--line-length=79" },
				},
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
