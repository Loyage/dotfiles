-- 一个让诊断信息更优雅的插件
-- https://github.com/rachartier/tiny-inline-diagnostic.nvim
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        options = {
          multilines = {
            -- Enable multiline diagnostic messages
            enabled = true,

            -- Always show messages on all lines for multiline diagnostics
            always_show = false,
          },
        },
      })
    end,
  },
  -- 要在这里禁用 nvim-lspconfig 的虚拟文本，因为 tiny-inline-diagnostic 会自己显示虚拟文本
  -- 官方教程中的摆放位置对我而言不起作用，必须要在这里声明
  {
    "neovim/nvim-lspconfig",
    opts = { diagnostics = { virtual_text = false } },
  },
}
