-------------
-- Keymaps --
-------------
local silent = { silent = true }

-- Remove Mappings
vim.keymap.set('n', 'Q', "<Nop>", silent)
vim.keymap.set({ 'n', 'v' }, "<Space>", "<Nop>", silent)

-- Line Wrapping
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window Navigation
vim.keymap.set('n', "<C-h>", "<C-w>h", silent)
vim.keymap.set('n', "<C-j>", "<C-w>j", silent)
vim.keymap.set('n', "<C-k>", "<C-w>k", silent)
vim.keymap.set('n', "<C-l>", "<C-w>l", silent)

-- Window Resize
vim.keymap.set('n', "<M-->", ":vertical resize -2<CR>", silent)
vim.keymap.set('n', "<M-=>", ":vertical resize +2<CR>", silent)

-- NvimTree
vim.keymap.set({ 'n', 'v', 'i' }, "<C-e>", "<Esc>:NvimTreeToggle<CR>", silent)

-- Buffer Navigation
vim.keymap.set('n', "<S-l>", ":bnext<CR>", silent)
vim.keymap.set('n', "<S-h>", ":bprev<CR>", silent)

-- Indenting
vim.keymap.set({ 'n', 'v' }, '>', ">gv", silent)
vim.keymap.set({ 'n', 'v' }, '<', "<gv", silent)

-- Move Lines
vim.keymap.set({ 'n', 'v' }, "<M-Down>", ":m .+1<CR>", silent)
vim.keymap.set({ 'n', 'v' }, "<M-Up>", ":m .-2<CR>", silent)
vim.keymap.set('i', "<M-Down>", "<Esc>:m .+1<CR>i", silent)
vim.keymap.set('i', "<M-Up>", "<Esc>:m .-2<CR>i", silent)

-- Paste
vim.keymap.set('v', 'p', '"_dP', silent)

---------------
-- Telescope --
---------------
vim.keymap.set('n', "<Leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set('n', "<Leader><Space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set('n', "<Leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set('n', "<Leader>s/", function()
    require("telescope.builtin").live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "[S]earch [/] in Open Files" })
vim.keymap.set('n', "<Leader>ss", require("telescope.builtin").builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set('n', "<Leader>gf", require("telescope.builtin").git_files, { desc = "[S]earch [G]it Files" })
vim.keymap.set('n', "<Leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', "<Leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', "<Leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', "<Leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set('n', "<Leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esme" })
