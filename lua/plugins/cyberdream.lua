return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
      require("cyberdream").setup({
          -- Recommended - see "Configuring" below for more config options
          transparent = true, --true,
          italic_comments = true,
          hide_fillchars = true,
          borderless_telescope = true,--false,
      })
      -- vim.cmd("colorscheme cyberdream") -- set the colorscheme
  end,
}
