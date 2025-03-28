-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 在 md，txt 中禁用拼写检查
-- vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- 为 markdown、python 设置默认缩进空格数为 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "python" },
  callback = function()
    vim.opt_local.shiftwidth = 4
  end,
})
