-------------
-- Plugins --
-------------
-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- runtime path

-- Configure Plugins
require("lazy").setup({
    -- Colorscheme
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        opts = { style = "deep" },
        config = function(_, opts)
            require("onedark").setup(opts)
            vim.cmd.colorscheme "onedark"
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "onedark",
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_b = { "filename" },
                lualine_c = { "branch", "searchcount", "selectioncount" },
            },
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        build = ":TSUpdate",
    },
})

-- Configure Treesitter
vim.defer_fn(function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "cpp", "python" },
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-Space>",
                node_incremental = "<C-Space>",
                scope_incremental = "<C-s>",
                node_decremental = "<M-Space>",
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = { ["<leader>a"] = "@parameter.inner", },
                swap_previous = { ["<leader>A"] = "@parameter.inner", },
            },
        },
    })
end, 0)
