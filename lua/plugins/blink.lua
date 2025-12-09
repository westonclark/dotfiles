return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = false,
      },
    },
    keymap = {
      preset = "none",
      ["<Tab>"] = { "select_and_accept", "fallback" },
    },
  },
}
