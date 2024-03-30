-------------
-- OPTIONS --
-------------
local opt = vim.o

-- Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- sync system clipboard
opt.clipboard = 'unnamedplus'

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.breakindent = true
opt.autoindent = true
opt.smartindent = true

-- Makefiles need tabs not spaces
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'mk.make',
    command = 'set noexpandtab'
})
-- Filetypes with indent size of 2 spaces
vim.api.nvim_create_augroup('setIndent', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'setIndent',
    pattern = {
        'scheme',
        'html',
        'jsx',
        'tsx',
        'javascriptreact',
        'typescriptreact',
    },
    command = 'setlocal tabstop=2 shiftwidth=2 softtabstop=2',
})
-- Filetypes with indent size of 8 spaces
vim.cmd('autocmd BufNewFile,BufRead *.as setfiletype asm')
vim.api.nvim_create_autocmd('FileType', {
    group = 'setIndent',
    pattern = {
        'asm',
    },
    command = 'setlocal tabstop=8 shiftwidth=8 softtabstop=8',
})

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Window
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.inccommand = 'split'          -- shows preview window of search and replace changes
vim.wo.signcolumn = 'yes'           -- keep signcolumn on
opt.showmode = false              -- status line already shows mode
-- opt.showtabline = 2

-- Cursor
opt.scrolloff = 8                   -- keep cursor in middle
opt.sidescrolloff = 8
opt.cursorline = true
opt.mouse = 'a'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Misc
-- opt.clipboard = 'unnamedplus'    -- sync system clipboard
opt.undodir = vim.fn.expand('~/.cache/nvim/undodir')
opt.undofile = true                 -- save undo history
opt.virtualedit = 'block'           -- visual block allows selection over entire screen
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.iskeyword:append('-')           -- make '-' part of word (opt.t.iskeyword:append('-'))
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.backspace = 'indent,eol,start'
opt.autochdir = false
