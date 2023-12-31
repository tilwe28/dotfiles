-------------
-- KEYMAPS --
-------------
local keymap = vim.keymap.set
local silent = { silent = true }

-- Remove Mappings
keymap('n', 'Q', '<Nop>', silent)
keymap({ 'n', 'v' }, '<Space>', '<Nop>', silent)

-- Save file
keymap('n', '<C-s>', '<Esc>:w<CR>', silent)
keymap('i', '<C-s>', '<Esc>:w<CR>i', silent)
keymap('v', '<C-s>', '<Esc>:w<CR>gv', silent)

-- Remove highlight
keymap('n', '<Esc>', ':noh<CR>', silent)

-- Line Wrapping
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window Navigation
keymap('n', '<C-h>', '<C-w>h', silent)
keymap('n', '<C-j>', '<C-w>j', silent)
keymap('n', '<C-k>', '<C-w>k', silent)
keymap('n', '<C-l>', '<C-w>l', silent)
keymap('i', '<C-h>', '<Esc><C-w>hi', silent)
keymap('i', '<C-j>', '<Esc><C-w>ji', silent)
keymap('i', '<C-k>', '<Esc><C-w>ki', silent)
keymap('i', '<C-l>', '<Esc><C-w>li', silent)

-- Window Resize
keymap('n', '<M-->', ':vertical resize -2<CR>', silent)
keymap('n', '<M-=>', ':vertical resize +2<CR>', silent)

-- Buffer Navigation
keymap('n', '<S-l>', ':bnext<CR>', silent)
keymap('n', '<S-h>', ':bprev<CR>', silent)

-- Indenting
keymap('n', '>', '>>', silent)
keymap('n', '<', '<<', silent)
keymap('v', '>', '>gv', silent)
keymap('v', '<', '<gv', silent)

-- Move Lines
keymap('n', '<M-Up>', ':m .-2<CR>', silent)
keymap('n', '<M-Down>', ':m .+1<CR>', silent)
keymap('v', '<M-Up>', ':m .-2<CR>gv', silent)
keymap('v', '<M-Down>', ":m '>+<CR>gv", silent)
keymap('i', '<M-Down>', '<Esc>:m .+1<CR>i', silent)
keymap('i', '<M-Up>', '<Esc>:m .-2<CR>i', silent)

-- Don't Copy into Register
keymap('v', 'p', '"_dP', silent)
keymap('n', 'x', '"_x', silent)

-- Change Numbers
keymap('n', '<Leader>+', '<C-a>', { desc = 'Increment' })
keymap('n', '<Leader>-', '<C-x>', { desc = 'Decrement' })

-- Windows and Buffers
keymap('n', '<Leader>w', ':close<CR>', { silent = true, desc = 'Close Window' })
keymap('n', '<Leader>q', ':bd<CR>', { silent = true, desc = 'Close Buffer' })

--------------
-- NvimTree --
--------------
keymap('n', '<C-b>', function()
    if vim.bo.filetype ~= 'NvimTree' then
        return '<Esc>:NvimTreeToggle<CR>'
    else
        return '<Esc>:NvimTreeClose<CR>'
    end
end, { expr = true, silent = true, desc = "Toggle NvimTree", })
keymap('i', '<C-b>', function()
    if vim.bo.filetype ~= 'NvimTree' then
        return '<Esc>:NvimTreeToggle<CR>i'
    else
        return '<Esc>:NvimTreeClose<CR>i'
    end
end, { expr = true, silent = true, desc = "Toggle NvimTree", })
keymap('v', '<C-b>', function()
    if vim.bo.filetype ~= 'NvimTree' then
        return '<Esc>:NvimTreeToggle<CR>gv'
    else
        return '<Esc>:NvimTreeClose<CR>gv'
    end
end, { expr = true, silent = true, desc = "Toggle NvimTree", })

---------------
-- Telescope --
---------------
keymap('n', '<Leader>?', require('telescope.builtin').oldfiles, { desc = 'Recent Files' })
keymap('n', '<Leader><Space>', require('telescope.builtin').buffers, { desc = 'Existing buffers' })
keymap('n', '<Leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = 'Search Current Buffer' })
keymap('n', '<Leader>s/', function()
    require('telescope.builtin').live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end, { desc = 'Search in Open Files' })
keymap('n', '<Leader>ss', require('telescope.builtin').builtin, { desc = 'Select Telescope' })
keymap('n', '<Leader>gf', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
keymap('n', '<Leader>sf', require('telescope.builtin').find_files, { desc = 'Find Files' })
keymap('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
keymap('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = 'Grep Search' })
keymap('n', '<Leader>sd', require('telescope.builtin').diagnostics, { desc = 'Diagnostics' })
keymap('n', '<Leader>sr', require('telescope.builtin').resume, { desc = 'Resume Last Search' })

---------
-- LSP --
---------
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    keymap('n', keys, func, { buffer = 0, desc = desc })
end

nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
nmap('gi', require('telescope.builtin').lsp_implementations, 'Goto Implentation')
