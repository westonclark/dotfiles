return {
  { "catppuccin/nvim", lazy = false, name = "catppuccin", opts = { transparent_background = true } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
