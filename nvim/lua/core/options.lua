-------------
-- OPTIONS --
-------------
local opt = vim.o

-- Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.breakindent = true
opt.autoindent = true
opt.smartindent = true

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
opt.virtualedit = 'block'         -- visual block allows selection over entire screen
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.cmd([[set iskeyword+=-]])       -- make '-' part of word (opt.t.iskeyword:append('-'))
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.backspace = 'indent,eol,start'
opt.autochdir = false
