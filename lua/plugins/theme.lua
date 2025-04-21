-- return {
--   { "catppuccin/nvim", lazy = false, name = "catppuccin", opts = { transparent_background = true } },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin-mocha",
--     },
--   },
-- }
--
return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    config = function()
      require("vague").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("vague")
    end,
  },
}
