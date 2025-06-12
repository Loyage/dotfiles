--- snacks: 一个集合了多种小插件的插件，定义项参考：
--- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
--- > tips: "gx" to quicklt open link
--- 为方便查询浏览，将 dashboard 和快捷键设置放入单独文件保存
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          preset = "default",
        },
      },
      bigfile = { enabled = true },
      indent = {
        enabled = true,
        scope = {
          enabled = true,
          underline = true,
        },
        chunk = {
          enabled = true,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
          },
        },
      },
      input = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      -- notifier setting
      notifier = {
        enabled = true,
        timeout = 5000,
      },
      styles = {
        notification = {
          -- 允许换行
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
  { import = "plugins/extras/snacks" },
}
