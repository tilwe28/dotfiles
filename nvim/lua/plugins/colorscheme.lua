return {
  -- add onedark
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = { style = "deep" },
  },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
