--- 自定义 dashboard
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[

██╗      ██████╗ ███████╗██╗   ██╗ █████╗  ██████╗ ███████╗
██║     ██╔═══██╗╚══███╔╝╚██╗ ██╔╝██╔══██╗██╔════╝ ██╔════╝
██║     ██║   ██║  ███╔╝  ╚████╔╝ ███████║██║  ███╗█████╗  
██║     ██║   ██║ ███╔╝    ╚██╔╝  ██╔══██║██║   ██║██╔══╝  
███████╗╚██████╔╝███████╗   ██║   ██║  ██║╚██████╔╝███████╗
╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          ---- Avater, but not properly work by now
          -- {
          --   section = "terminal",
          --   cmd = "ascii-image-converter ~/Pictures/touxiang.png -C -c",
          --   -- random = 10,
          --   pane = 2,
          --   indent = 4,
          --   height = 30,
          -- },
        },
      },
    },
  },
}
