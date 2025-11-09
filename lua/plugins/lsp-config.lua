return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Disable inlay hints
    inlay_hints = { enabled = false },
    -- Configure LSP keymaps for all servers
    servers = {
      ["*"] = {
        keys = {
          -- Disable the 'K' keymap set by LazyVim's LSP configuration
          { "K", false },
        },
      },
    },
  },
}
