-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.ts", "*.md", "*.json", "*.yaml", "*.txt", "*.py", "*.lua", "*.cpp" },
  callback = require("zen-mode").open,
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*.ts", "*.md", "*.json", "*.yaml", "*.txt", "*.py", "*.lua", "*.cpp" },
  callback = require("zen-mode").close,
})
