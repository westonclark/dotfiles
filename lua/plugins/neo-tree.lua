return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ action = "focus", reveal = true })
      end,
      desc = "Explorer NeoTree (reveal current file)",
    },
  },
  opts = {
    window = { position = "float" },
    popup_border_style = "rounded",
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
}
