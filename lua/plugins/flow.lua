return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("flow").setup({
      transparent = true,
      mode = "desaturate",
      fluo_color = "pink",
      dark_theme = true,
    })

    vim.cmd("colorscheme flow")
  end,
  enabled = false,
}
