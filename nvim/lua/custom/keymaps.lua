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
vim.keymap.set({ 'n', 'v', 'i' }, "<C-e>", ":NvimTreeToggle<CR>", silent)

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
