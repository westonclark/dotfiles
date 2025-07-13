return {
  {
    "westonclark/anysphere.nvim",
    lazy = false,
    config = function()
      require("anysphere").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("anysphere")
    end,
  },
}
