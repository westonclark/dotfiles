return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Get the default keymaps from LazyVim
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- Disable the 'K' keymap set by LazyVim's LSP configuration
    keys[#keys + 1] = { "K", false }

    -- Update the LSP config with the modified keys
    opts.keys = keys

    -- Disable inlay hints
    opts.inlay_hints = { enabled = false }
  end,
}
