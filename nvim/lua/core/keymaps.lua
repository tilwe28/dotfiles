-------------
-- KEYMAPS --
-------------
local keymap = vim.keymap.set
local silent = { silent = true }

-- Remove Mappings
keymap('n', 'Q', '<Nop>', silent)
keymap({ 'n', 'v' }, '<Space>', '<Nop>', silent)

-- Line Wrapping
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window Navigation
keymap('n', '<C-h>', '<C-w>h', silent)
keymap('n', '<C-j>', '<C-w>j', silent)
keymap('n', '<C-k>', '<C-w>k', silent)
keymap('n', '<C-l>', '<C-w>l', silent)

-- Window Resize
keymap('n', '<M-->', ':vertical resize -2<CR>', silent)
keymap('n', '<M-=>', ':vertical resize +2<CR>', silent)

-- NvimTree
keymap({ 'n', 'v', 'i' }, '<C-e>', '<Esc>:NvimTreeToggle<CR>', silent)

-- Buffer Navigation
keymap('n', '<S-l>', ':bnext<CR>', silent)
keymap('n', '<S-h>', ':bprev<CR>', silent)

-- Indenting
keymap({ 'n', 'v' }, '>', '>gv', silent)
keymap({ 'n', 'v' }, '<', '<gv', silent)

-- Move Lines
keymap({ 'n', 'v' }, '<M-Down>', ':m .+1<CR>', silent)
keymap({ 'n', 'v' }, '<M-Up>', ':m .-2<CR>', silent)
keymap('i', '<M-Down>', '<Esc>:m .+1<CR>i', silent)
keymap('i', '<M-Up>', '<Esc>:m .-2<CR>i', silent)

-- Paste
keymap('v', 'p', '"_dP', silent)

---------------
-- Telescope --
---------------
keymap('n', '<Leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<Leader><Space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<Leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })
keymap('n', '<Leader>s/', function()
    require('telescope.builtin').live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end, { desc = '[S]earch [/] in Open Files' })
keymap('n', '<Leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
keymap('n', '<Leader>gf', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })
keymap('n', '<Leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<Leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<Leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esme' })

---------
-- LSP --
---------
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end

    keymap('n', keys, func, { buffer = 0, desc = desc })
end

nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto Implentation')
nmap('<Leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
nmap('<Leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<Leader>ws',require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
