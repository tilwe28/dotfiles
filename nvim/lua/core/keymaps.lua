-------------
-- KEYMAPS --
-------------
local keymap = vim.keymap.set
local silent = { silent = true }

-- Remove Mappings
keymap("n", "Q", "<Nop>", silent)
keymap({ "n", "v" }, "<Space>", "<Nop>", silent)

-- Save file
keymap("n", "<C-s>", "<Esc>:w<CR>", silent)
keymap("i", "<C-s>", "<Esc>:w<CR>", silent)
keymap("v", "<C-s>", "<Esc>:w<CR>gv", silent)

-- Remove highlight
keymap("n", "<Esc>", ":noh<CR>", silent)

-- Line Wrapping
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window Resize
keymap("n", "<M-->", ":vertical resize -2<CR>", silent)
keymap("n", "<M-=>", ":vertical resize +2<CR>", silent)

-- Indenting
keymap("n", ">", ">>", silent)
keymap("n", "<", "<<", silent)
keymap("v", ">", ">gv", silent)
keymap("v", "<", "<gv", silent)

-- Move Lines
keymap("n", "<M-Up>", ":m .-2<CR>", silent)
keymap("n", "<M-Down>", ":m .+1<CR>", silent)
keymap("v", "<M-Up>", ":m .-2<CR>gv", silent)
keymap("v", "<M-Down>", ":m '>+<CR>gv", silent)
keymap("i", "<M-Down>", "<Esc>:m .+1<CR>i", silent)
keymap("i", "<M-Up>", "<Esc>:m .-2<CR>i", silent)

-- Yank
keymap("v", "Y", "ygv")

-- Change Numbers
keymap("n", "<Leader>+", "<C-a>", { desc = "Increment" })
keymap("n", "<Leader>-", "<C-x>", { desc = "Decrement" })

-- Windows and Buffers
keymap("n", "<Leader>xw", ":close<CR>", { silent = true, desc = "Close Window" })
keymap("n", "<Leader>xb", ":bd<CR>", { silent = true, desc = "Close Buffer" })
keymap("n", "<Leader>v", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
keymap("n", "<Leader>h", ":split<CR>", { silent = true, desc = "Horizontal Split" })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "Go to previous [D]iagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "Go to next [D]iagnostic message" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { silent = true, desc = "Show diagnostic [E]rror messages" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "Open diagnostic [Q]uickfix list" })

-------------
-- PLUGINS --
-------------
--------------
-- NvimTree --
--------------
keymap("n", "<C-b>", function()
	if vim.bo.filetype ~= "NvimTree" then
		return "<Esc>:NvimTreeToggle<CR>"
	else
		return "<Esc>:NvimTreeClose<CR>"
	end
end, { expr = true, silent = true, desc = "Toggle NvimTree" })
keymap("i", "<C-b>", function()
	if vim.bo.filetype ~= "NvimTree" then
		return "<Esc>:NvimTreeToggle<CR>i"
	else
		return "<Esc>:NvimTreeClose<CR>i"
	end
end, { expr = true, silent = true, desc = "Toggle NvimTree" })
keymap("v", "<C-b>", function()
	if vim.bo.filetype ~= "NvimTree" then
		return "<Esc>:NvimTreeToggle<CR>gv"
	else
		return "<Esc>:NvimTreeClose<CR>gv"
	end
end, { expr = true, silent = true, desc = "Toggle NvimTree" })

---------------
-- Telescope --
---------------
keymap("n", "<Leader>?", require("telescope.builtin").oldfiles, { desc = "Recent Files" })
keymap("n", "<Leader><Space>", require("telescope.builtin").buffers, { desc = "Existing buffers" })
keymap("n", "<Leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Search Current Buffer" })
keymap("n", "<Leader>s/", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "Search in Open Files" })
keymap("n", "<Leader>ss", require("telescope.builtin").builtin, { desc = "Select Telescope" })
keymap("n", "<Leader>gf", require("telescope.builtin").git_files, { desc = "Search Git Files" })
keymap("n", "<Leader>sf", require("telescope.builtin").find_files, { desc = "Find Files" })
keymap("n", "<Leader>sh", require("telescope.builtin").help_tags, { desc = "Search Help" })
keymap("n", "<Leader>sg", require("telescope.builtin").live_grep, { desc = "Grep Search" })
keymap("n", "<Leader>sd", require("telescope.builtin").diagnostics, { desc = "Diagnostics" })
keymap("n", "<Leader>sr", require("telescope.builtin").resume, { desc = "Resume Last Search" })

---------
-- LSP --
---------
local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end
	keymap("n", keys, func, { buffer = 0, desc = desc })
end

nmap("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
nmap("gr", require("telescope.builtin").lsp_references, "Goto References")
nmap("gi", require("telescope.builtin").lsp_implementations, "Goto Implentation")

-----------
-- Noice --
-----------
keymap("n", "<leader>nn", ":NoiceDismiss<CR>", silent)
