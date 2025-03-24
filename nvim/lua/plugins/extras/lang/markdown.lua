return {
  -- TO: 用于在网页中实时渲染
  -- CMDS: MarkdownPreviewToggle, MarkdownPreview, MarkdownPreviewStop
  -- WARNING: yarn needed
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- TO: 用于在nvim中实时预览
  -- CMDS: MarkliveToggle, ..Enable, ..Disable
  {
    "yelog/marklive.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    ft = "markdown",
    opts = {},
  },
  -- TO: 辅助写有序/无序列表
  -- KEYS:
  --- NORMAL mode: <<, >>, 'gN' to restart numbers, <leader>x to toggle checkbox
  --- INSERT mode: <C-t>, <C-d>
  --- VISUAL mode: <, >
  {
    "bullets-vim/bullets.vim",
    config = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }
    end,
  },
  -- TO: 辅助编写表格
  -- CMDS: TableModeToggle, ..Enable, ..Disable
  -- KEYS: <Leader>tm as TableModeToggle
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.cmd(
        [[
        augroup markdown_config
          autocmd!
          autocmd FileType markdown nnoremap <buffer> <M-s> :TableModeRealign<CR>
        augroup END
      ]],
        false
      )
      vim.g.table_mode_sort_map = "<leader>mts"
    end,
  },
}
