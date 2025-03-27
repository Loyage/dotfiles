--- 自定义 dashboard
return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          -- ASCII WordArt
          -- generate from: https://patorjk.com/software/taag
          -- font: ANSI Shadow
          header = [[

██╗      ██████╗ ███████╗██╗   ██╗ █████╗  ██████╗ ███████╗          Z
██║     ██╔═══██╗╚══███╔╝╚██╗ ██╔╝██╔══██╗██╔════╝ ██╔════╝      Z    
██║     ██║   ██║  ███╔╝  ╚████╔╝ ███████║██║  ███╗█████╗     z       
██║     ██║   ██║ ███╔╝    ╚██╔╝  ██╔══██║██║   ██║██╔══╝   z         
███████╗╚██████╔╝███████╗   ██║   ██║  ██║╚██████╔╝███████╗           
╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝           
]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          -- -- Avater:
          -- {
          --   section = "terminal",
          --   -- https://github.com/TheZoraiz/ascii-image-converter
          --   -- cmd = "ascii-image-converter <img_path> -C -c",
          --   -- https://github.com/hpjansson/chafa
          --   cmd = "chafa <img_path> --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
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
