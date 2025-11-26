-- return {
--   {
--     "vague2k/vague.nvim",
--     lazy = false,
--     config = function()
--       -- Optional: configure the colorscheme
--       require("vague").setup({
--         transparent = true,
--         colors = {
--           -- You can override any colors here if needed
--           -- bg = "#000000",  -- Example: custom background
--         },
--         -- Override LSP reference highlighting to be darker
--         on_highlights = function(hl, c)
--           -- Make the LSP reference highlights darker for better readability
--           hl.LspReferenceText = { bg = "#2a2a2a" }
--           hl.LspReferenceRead = { bg = "#2a2a2a" }
--           hl.LspReferenceWrite = { bg = "#2a2a2a" }
--         end,
--       })
--       vim.cmd.colorscheme("vague")
--     end,
--   },
-- }
--
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        transparency = true,
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
