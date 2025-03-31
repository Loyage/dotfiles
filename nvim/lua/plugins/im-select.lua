return {
  -- macos 下的输入法切换
  {
    "keaising/im-select.nvim",
    lazy = false,
    cond = vim.loop.os_uname().sysname == "Darwin",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "im-select",
    },
  },
}
