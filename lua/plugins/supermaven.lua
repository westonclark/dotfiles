return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      disable_inline_completion = false, -- Make sure inline completion is enabled
      keymaps = {
        accept_suggestion = nil, -- This will be handled by the inline suggestion system
      },
    },
  },
  -- Disable luasnip tab and shift+tab
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  -- Disable blink.cmp dropdwon menu
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return false
      end,
    },
  },
  {
    "saghen/blink.compat",
    enabled = true,
  },
}
