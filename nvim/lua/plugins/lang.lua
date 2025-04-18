-- 为 nvim 设置不同语言的服务（LSP，lint，等等等等）
-- 各个语言的具体配置放在 ./extras/lang/ 目录下
-- tips: gf 快速打开对应地址
---@diagnostic disable: missing-fields
return {
  -- Customize LSP
  {
    "neovim/nvim-lspconfig",
    -- Add, change or remove keymaps
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end

      --[[Modify LSP keymaps]]
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gD", false } -- used in typescipt.lua
      keys[#keys + 1] = { "<leader>cl", false }
      keys[#keys + 1] = { "<leader>cli", "<cmd>LspInfo<cr>", desc = "LspInfo" }
      keys[#keys + 1] =
        { "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove workspace" }
      keys[#keys + 1] = { "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add workspace" }
      keys[#keys + 1] = {
        "<leader>cll",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        desc = "List workspace",
      }
    end,
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        float = {
          source = true,
        },
        virtual_text = {
          prefix = "icons",
          spacing = 4,
          source = true,
          -- source = "if_many",
        },
        -- virtual_text = false,
      },
      servers = {
        yamlls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Disable",
              },
              diagnostics = {
                -- disable = { "missing-parameter" },
              },
              hint = {
                enable = true,
                setType = true,
                paramType = true,
                paramName = "All",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        -- 设置圆角边框
        border = "rounded",
        -- 设置安装状态的图标
        icons = {
          package_installed = "✅",
          package_pending = "➕",
          package_uninstalled = "⭕",
        },
      },
    },
  },
}
-- 为了方便在不同机器上个性化选择所需语言，避免 mason 安装过多工具，
-- 改为用 gitignore 的文件 land-select.lua 来 import 对应的语言，
-- 请在当前目录自行创建 land-select.lua 文件，并选配所需语言
-- 示例：
-- return {
--   { import = "plugins.extras.lang.python" },
--   { import = "plugins.extras.lang.markdown" },
--   { import = "plugins.extras.lang.typescipt" },
-- }
-- 或者直接导入所有语言的配置：
-- return {
--   { import = "plugins.extras.lang" },
-- }
