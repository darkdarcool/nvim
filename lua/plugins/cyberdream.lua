return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    theme = {
      overrides = function(colors)
        print("I'm overriding!")
        return {
          BlinkCmpSignatureHelpActiveParameter = { fg = colors.cyan, bg = colors.gray },
        }
      end,
    },
  },
  config = function(_, opts)
    require("cyberdream").setup(opts)

    vim.cmd("colorscheme cyberdream")
  end,
  enabled = false,
}
