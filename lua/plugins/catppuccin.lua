return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  --event = "VimEnter",
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavor = "mocha",
      background = {
        dark = "mocha",
      },
      transparent_background = true,
      cache = true,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
  enabled = true,
}
