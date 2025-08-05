-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.transparent_background = true
if vim.g.neovide then
  require("config.neovide").init()
end

if vim.g.vscode then
  require("config.vscode").init()
end
