return {
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
  {
    "bullets-vim/bullets.vim",
    config = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }
    end,
  },
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
  }, --> table mode
}
